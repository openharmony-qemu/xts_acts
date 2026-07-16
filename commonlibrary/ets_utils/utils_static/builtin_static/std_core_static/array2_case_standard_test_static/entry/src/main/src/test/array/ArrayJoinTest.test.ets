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
} from '../../../../hypium/index';
import Utils from '../Util.test';

class Item022 {
  value: number = 0;

  toString(): string {
    return 'Item';
  }
}

class JoinItem046 {
  label: string = '';

  toString(): string {
    return this.label;
  }
}

function processJoinedString044(s: string): number {
  return s.length;
}

function createLargeStringArray045(size: int): Array<string> {
  let arr = new Array<string>();
  for (let i: int = 0; i < size; i++) {
    arr.push('item' + i);
  }
  return arr;
}

function joinAnyNumberArray(value: Any, separator: string): string {
  const arr = value as Array<number>;
  return arr.join(separator);
}

export default function ArrayJoinTest(): void {
  describe('ArrayJoinTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0010
     * @tc.name testArrayJoin001
     * @tc.desc Verify join uses the default comma separator when sep is omitted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b', 'c');
      let result = arr.join();
      expect(result).assertEqual('a,b,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0020
     * @tc.name testArrayJoin002
     * @tc.desc Verify join supports a custom separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b', 'c');
      let result = arr.join('-');
      expect(result).assertEqual('a-b-c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0030
     * @tc.name testArrayJoin003
     * @tc.desc Verify the separator parameter is optional
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result1 = arr.join();
      let result2 = arr.join(',');
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0040
     * @tc.name testArrayJoin004
     * @tc.desc Verify the separator parameter accepts the String type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let sep: String = '|';
      let result = arr.join(sep);
      expect(result).assertEqual('1|2|3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0050
     * @tc.name testArrayJoin005
     * @tc.desc Verify an empty separator concatenates elements directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b', 'c');
      let result = arr.join('');
      expect(result).assertEqual('abc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0060
     * @tc.name testArrayJoin006
     * @tc.desc Verify single character separators produce the expected output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      expect(arr.join(',')).assertEqual('1,2,3');
      expect(arr.join('|')).assertEqual('1|2|3');
      expect(arr.join('-')).assertEqual('1-2-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0070
     * @tc.name testArrayJoin007
     * @tc.desc Verify multiple character separators are preserved in the result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b', 'c');
      let result = arr.join('->');
      expect(result).assertEqual('a->b->c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0080
     * @tc.name testArrayJoin008
     * @tc.desc Verify special character separators are preserved in the result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      expect(arr.join('\n')).assertEqual('1\n2\n3');
      expect(arr.join('\t')).assertEqual('1\t2\t3');
      expect(arr.join(' ')).assertEqual('1 2 3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0090
     * @tc.name testArrayJoin009
     * @tc.desc Verify unicode separators participate in the joined string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('hello', 'world');
      let result = arr.join('\u200B');
      expect(result.length).assertEqual(11);
      expect(result === 'helloworld').assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0100
     * @tc.name testArrayJoin010
     * @tc.desc Verify join returns a string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.join(',');
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0110
     * @tc.name testArrayJoin011
     * @tc.desc Verify number elements are converted to strings before joining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.join('-');
      expect(result).assertEqual('1-2-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0120
     * @tc.name testArrayJoin012
     * @tc.desc Verify string elements are joined without extra conversion changes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('x', 'y', 'z');
      let result = arr.join(',');
      expect(result).assertEqual('x,y,z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0130
     * @tc.name testArrayJoin013
     * @tc.desc Verify empty arrays join to an empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let result = arr.join(',');
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0140
     * @tc.name testArrayJoin014
     * @tc.desc Verify single element arrays do not insert separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.create<number>(1, 42);
      let result = arr.join(',');
      expect(result).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0150
     * @tc.name testArrayJoin015
     * @tc.desc Verify two element arrays use one separator between values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2);
      let result = arr.join('-');
      expect(result).assertEqual('1-2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0160
     * @tc.name testArrayJoin016
     * @tc.desc Verify large arrays can be joined into a non empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      for (let i: int = 0; i < 1000; i++) {
        arr.push(i);
      }
      let result = arr.join(',');
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('999') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0170
     * @tc.name testArrayJoin017
     * @tc.desc Verify null elements produce empty fields in the joined string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | null>(1, null, 3);
      let result = arr.join(',');
      expect(result).assertEqual('1,,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0180
     * @tc.name testArrayJoin018
     * @tc.desc Verify undefined elements produce empty fields in the joined string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | undefined>(1, undefined, 3);
      let result = arr.join(',');
      expect(result).assertEqual('1,,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0190
     * @tc.name testArrayJoin019
     * @tc.desc Verify explicit undefined elements produce empty fields in the joined string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const result = arr.join(',');
      expect(result).assertEqual('1,,3');
      expect(arr.indexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0200
     * @tc.name testArrayJoin020
     * @tc.desc Verify zero values are preserved in the joined string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(0, 1, 0);
      let result = arr.join(',');
      expect(result).assertEqual('0,1,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0210
     * @tc.name testArrayJoin021
     * @tc.desc Verify empty string elements keep their position in the result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', '', 'c');
      let result = arr.join(',');
      expect(result).assertEqual('a,,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0220
     * @tc.name testArrayJoin022
     * @tc.desc Verify boolean values are converted to their string forms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<boolean>(true, false, true);
      let result = arr.join(',');
      expect(result).assertEqual('true,false,true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0230
     * @tc.name testArrayJoin023
     * @tc.desc Verify object elements use their string representation when joined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.create<Item022>(1, new Item022());
      let result = arr.join(',');
      expect(result).assertEqual('Item');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0240
     * @tc.name testArrayJoin024
     * @tc.desc Verify omitted separator uses a comma between object string representations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<Item022>(new Item022(), new Item022());
      let result = arr.join();
      expect(result).assertEqual('Item,Item');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0250
     * @tc.name testArrayJoin025
     * @tc.desc Verify empty separators can build compact strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('h', 'e', 'l', 'l', 'o');
      let result = arr.join('');
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0260
     * @tc.name testArrayJoin026
     * @tc.desc Verify spaces can be used as separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('hello', 'world');
      let result = arr.join(' ');
      expect(result).assertEqual('hello world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0270
     * @tc.name testArrayJoin027
     * @tc.desc Verify newline separators are preserved in the joined string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.join('\n');
      expect(result).assertEqual('1\n2\n3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0280
     * @tc.name testArrayJoin028
     * @tc.desc Verify html like separators are preserved in the joined string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b', 'c');
      let result = arr.join('<br>');
      expect(result).assertEqual('a<br>b<br>c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0290
     * @tc.name testArrayJoin029
     * @tc.desc Verify join without a separator matches toString output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let joinResult = arr.join();
      let toStringResult = arr.toString();
      expect(joinResult).assertEqual(toStringResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0300
     * @tc.name testArrayJoin030
     * @tc.desc Verify custom separators produce results different from toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let joinResult = arr.join('|');
      let toStringResult = arr.toString();
      expect(joinResult === toStringResult).assertFalse();
      expect(toStringResult).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0310
     * @tc.name testArrayJoin031
     * @tc.desc Verify integer arrays join into comma separated strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(10, 20, 30);
      let result = arr.join(',');
      expect(result).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0320
     * @tc.name testArrayJoin032
     * @tc.desc Verify floating point arrays join into comma separated strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1.5, 2.5, 3.5);
      let result = arr.join(',');
      expect(result).assertEqual('1.5,2.5,3.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0330
     * @tc.name testArrayJoin033
     * @tc.desc Verify negative numbers are preserved in joined strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(-1, -2, -3);
      let result = arr.join(',');
      expect(result).assertEqual('-1,-2,-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0340
     * @tc.name testArrayJoin034
     * @tc.desc Verify positive zero and negative values retain their order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(-1, 0, 1);
      let result = arr.join(',');
      expect(result).assertEqual('-1,0,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0350
     * @tc.name testArrayJoin035
     * @tc.desc Verify nested arrays are stringified through their own toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nested = new Array<string>('1', '2');
      let arr = new Array<Object | string>('0', nested, '3');
      let result = arr.join(',');
      expect(result.indexOf('1,2') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0360
     * @tc.name testArrayJoin036
     * @tc.desc Verify multi level nested arrays still produce a string result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = Array.create<string>(1, '3');
      let middle = new Array<Object | string>('2', inner);
      let arr = new Array<Object | string>('1', middle);
      let result = arr.join(',');
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0370
     * @tc.name testArrayJoin037
     * @tc.desc Verify join does not modify the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let originalLength = arr.length;
      let originalFirst = arr[0];
      arr.join(',');
      expect(arr.length).assertEqual(originalLength);
      expect(arr[0]).assertEqual(originalFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0380
     * @tc.name testArrayJoin038
     * @tc.desc Verify repeated join calls return the same result for unchanged arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b');
      let result1 = arr.join(',');
      let result2 = arr.join(',');
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0390
     * @tc.name testArrayJoin039
     * @tc.desc Verify join can build a csv header line
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let headers = new Array<string>('name', 'age', 'city');
      let csv = headers.join(',');
      expect(csv).assertEqual('name,age,city');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0400
     * @tc.name testArrayJoin040
     * @tc.desc Verify join can build slash separated paths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pathParts = new Array<string>('home', 'user', 'docs');
      let path = pathParts.join('/');
      expect(path).assertEqual('home/user/docs');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0410
     * @tc.name testArrayJoin041
     * @tc.desc Verify join can build query parameter strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let params = new Array<string>('key1=value1', 'key2=value2');
      let query = params.join('&');
      expect(query).assertEqual('key1=value1&key2=value2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0420
     * @tc.name testArrayJoin042
     * @tc.desc Verify join can build spaced sentences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let words = new Array<string>('Hello', 'world', '!');
      let sentence = words.join(' ');
      expect(sentence).assertEqual('Hello world !');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0430
     * @tc.name testArrayJoin043
     * @tc.desc Verify join can build css class name strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let classes = new Array<string>('btn', 'btn-primary', 'active');
      let className = classes.join(' ');
      expect(className).assertEqual('btn btn-primary active');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0440
     * @tc.name testArrayJoin044
     * @tc.desc Verify the joined string can be chained with string methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b', 'c');
      let result = arr.join('-').toUpperCase();
      expect(result).assertEqual('A-B-C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0450
     * @tc.name testArrayJoin045
     * @tc.desc Verify joined strings can be passed as function arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let len = processJoinedString044(arr.join(','));
      expect(len).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0460
     * @tc.name testArrayJoin046
     * @tc.desc Verify large string arrays can be joined successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createLargeStringArray045(10000);
      let result = arr.join(',');
      expect(result.indexOf('item0,item1,item2')).assertEqual(0);
      const suffix = 'item9997,item9998,item9999';
      expect(result.lastIndexOf(suffix)).assertEqual(result.length - suffix.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0470
     * @tc.name testArrayJoin047
     * @tc.desc Verify different separators produce different result lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let r1 = arr.join(',');
      let r2 = arr.join('###');
      expect(r1.length === r2.length).assertFalse();
      expect(r2).assertEqual('1###2###3###4###5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0480
     * @tc.name testArrayJoin048
     * @tc.desc Verify generic arrays of different element types still return strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Array<number>(1, 2, 3);
      let result1 = arr1.join(',');
      let arr2 = new Array<string>('a', 'b', 'c');
      let result2 = arr2.join('-');
      expect(typeof result1).assertEqual('string');
      expect(typeof result2).assertEqual('string');
      expect(result2).assertEqual('a-b-c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0490
     * @tc.name testArrayJoin049
     * @tc.desc Verify union typed arrays join all elements in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | string>(1, 'two', 3);
      let result = arr.join(',');
      expect(result).assertEqual('1,two,3');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0500
     * @tc.name testArrayJoin050
     * @tc.desc Verify join preserves empty string elements at every position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('', '');
      const result = arr.join(',');
      expect(result).assertEqual(',');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0510
     * @tc.name testArrayJoin051
     * @tc.desc Verify join converts NaN elements to the string NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Double.NaN, 1);
      const result = arr.join('-');
      expect(result).assertEqual('NaN-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0520
     * @tc.name testArrayJoin052
     * @tc.desc Verify join converts Infinity elements to their string form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Double.POSITIVE_INFINITY, 1);
      const result = arr.join('-');
      expect(result).assertEqual('Infinity-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0530
     * @tc.name testArrayJoin053
     * @tc.desc Verify join stringifies negative zero as plain zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0, -0);
      const result = arr.join(',');
      expect(result).assertEqual('0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0540
     * @tc.name testArrayJoin054
     * @tc.desc Verify a single null element joins into an empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>();
      arr.push(null);
      const result = arr.join();
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0550
     * @tc.name testArrayJoin055
     * @tc.desc Verify a single undefined element joins into an empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>();
      arr.push(undefined);
      const result = arr.join();
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0560
     * @tc.name testArrayJoin056
     * @tc.desc Verify null and undefined both become empty fields during join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null | undefined>();
      arr.push(null);
      arr.push(undefined);
      const result = arr.join(',');
      expect(result).assertEqual(',');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0570
     * @tc.name testArrayJoin057
     * @tc.desc Verify explicitly passing undefined uses the default comma separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.join(undefined);
      expect(result).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0580
     * @tc.name testArrayJoin058
     * @tc.desc Verify ordinary separator text is preserved literally during join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.join('undefined');
      expect(result).assertEqual('1undefined2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0590
     * @tc.name testArrayJoin059
     * @tc.desc Verify emoji elements remain intact after join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('🌍', '👩‍');
      const result = arr.join('-');
      expect(result).assertEqual('🌍-👩‍');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0600
     * @tc.name testArrayJoin060
     * @tc.desc Verify emoji separators remain intact after join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b');
      const result = arr.join('\u0041');
      expect(result).assertEqual('a\u0041b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0610
     * @tc.name testArrayJoin061
     * @tc.desc Verify unicode escape sequences are joined as decoded characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('\u0041', '\u0042');
      const result = arr.join(',');
      expect(result).assertEqual('A,B');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0620
     * @tc.name testArrayJoin062
     * @tc.desc Verify join uses the default comma separator for positive numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      expect(arr.join()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0630
     * @tc.name testArrayJoin063
     * @tc.desc Verify join supports slash separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 5, 6);
      expect(arr.join('/')).assertEqual('4/5/6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0640
     * @tc.name testArrayJoin064
     * @tc.desc Verify join supports empty string separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      expect(arr.join('')).assertEqual('abc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0650
     * @tc.name testArrayJoin065
     * @tc.desc Verify join preserves empty string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('left', '', 'right');
      expect(arr.join('|')).assertEqual('left||right');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0660
     * @tc.name testArrayJoin066
     * @tc.desc Verify join supports boolean arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      expect(arr.join('&')).assertEqual('true&false&true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0670
     * @tc.name testArrayJoin067
     * @tc.desc Verify join supports bigint arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(2n, 4n, 6n);
      expect(arr.join('-')).assertEqual('2-4-6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0680
     * @tc.name testArrayJoin068
     * @tc.desc Verify join on a single-element array returns that element text only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 99);
      expect(arr.join('|')).assertEqual('99');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0690
     * @tc.name testArrayJoin069
     * @tc.desc Verify join on an empty array returns an empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      expect(arr.join(',')).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0700
     * @tc.name testArrayJoin070
     * @tc.desc Verify join reads arrays returned by slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0, 1, 2, 3).slice(1, 3);
      expect(arr.join(':')).assertEqual('1:2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0710
     * @tc.name testArrayJoin071
     * @tc.desc Verify join reads arrays returned by map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).map((value: number): number => value * 10);
      expect(arr.join(';')).assertEqual('10;20;30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0720
     * @tc.name testArrayJoin072
     * @tc.desc Verify join leaves the source array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(7, 8, 9);
      const before = arr.toString();
      const text = arr.join('-');
      expect(text).assertEqual('7-8-9');
      expect(arr.toString()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0730
     * @tc.name testArrayJoin073
     * @tc.desc Verify join supports object arrays through element toString conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new JoinItem046();
      first.label = 'A';
      const second = new JoinItem046();
      second.label = 'B';
      const arr = new Array<JoinItem046>(first, second);
      expect(arr.join('+')).assertEqual('A+B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0740
     * @tc.name testArrayJoin074
     * @tc.desc Verify join supports Unicode string content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('x', 'y', 'z');
      expect(arr.join('')).assertEqual('xyz');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0750
     * @tc.name testArrayJoin075
     * @tc.desc Verify join supports separators containing spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 3, 5);
      expect(arr.join(' | ')).assertEqual('1 | 3 | 5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0760
     * @tc.name testArrayJoin076
     * @tc.desc Verify join can serialize repeated values distinctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 2, 2, 2);
      expect(arr.join(',')).assertEqual('2,2,2,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0770
     * @tc.name testArrayJoin077
     * @tc.desc Verify join can serialize negative values and zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-1, 0, 1);
      expect(arr.join('/')).assertEqual('-1/0/1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0780
     * @tc.name testArrayJoin078
     * @tc.desc Verify join can be used after reverse mutates the source order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.reverse();
      expect(arr.join('>')).assertEqual('4>3>2>1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0790
     * @tc.name testArrayJoin079
     * @tc.desc Verify join can be compared with toString using the default separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(6, 7, 8);
      expect(arr.join()).assertEqual(arr.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0800
     * @tc.name testArrayJoin080
     * @tc.desc Verify join can serialize arrays after shift removes the head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 4, 5, 6);
      arr.shift();
      expect(arr.join(',')).assertEqual('4,5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0810
     * @tc.name testArrayJoin081
     * @tc.desc Verify join can serialize arrays after pop removes the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 4, 5, 6);
      arr.pop();
      expect(arr.join(',')).assertEqual('3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0820
     * @tc.name testArrayJoin082
     * @tc.desc Verify join can serialize arrays after unshift prepends values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3);
      arr.unshift(1);
      expect(arr.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0830
     * @tc.name testArrayJoin083
     * @tc.desc Verify join can serialize arrays after push appends values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      arr.push(3);
      expect(arr.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0840
     * @tc.name testArrayJoin084
     * @tc.desc Verify join can serialize arrays after splice replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.splice(1, 1, 20, 30);
      expect(arr.join(',')).assertEqual('1,20,30,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0850
     * @tc.name testArrayJoin085
     * @tc.desc Verify join can serialize arrays after toReversed creates a copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).toReversed();
      expect(arr.join(',')).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0860
     * @tc.name testArrayJoin086
     * @tc.desc Verify join can serialize arrays after toSorted creates an ordered copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2).toSorted((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      expect(arr.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0870
     * @tc.name testArrayJoin087
     * @tc.desc Verify join can serialize arrays after toSpliced removal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4).toSpliced(1, 2);
      expect(arr.join(',')).assertEqual('1,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0880
     * @tc.name testArrayJoin088
     * @tc.desc Verify join can serialize arrays after with replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).with(1, 99);
      expect(arr.join(',')).assertEqual('1,99,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0890
     * @tc.name testArrayJoin089
     * @tc.desc Verify join can serialize long numeric arrays with a custom separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6);
      expect(arr.join(':')).assertEqual('1:2:3:4:5:6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0900
     * @tc.name testArrayJoin090
     * @tc.desc Verify join can serialize arrays containing boundary-style magnitudes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 0, -1000);
      expect(arr.join('|')).assertEqual('1000|0|-1000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0910
     * @tc.name testArrayJoin091
     * @tc.desc Verify join can serialize arrays produced by filter with no skipped matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5).filter((value: number): boolean => value > 2);
      expect(arr.join(',')).assertEqual('3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0920
     * @tc.name testArrayJoin092
     * @tc.desc Verify join can serialize arrays produced by concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Array<number>(1, 2);
      const right = new Array<number>(3, 4);
      expect(left.concat(right).join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0930
     * @tc.name testArrayJoin093
     * @tc.desc Verify join can serialize arrays after length truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.length = 2;
      expect(arr.join(',')).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0940
     * @tc.name testArrayJoin094
     * @tc.desc Verify join can serialize arrays after shrinkTo truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 6, 7, 8);
      arr.shrinkTo(3);
      expect(arr.join(',')).assertEqual('5,6,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0950
     * @tc.name testArrayJoin095
     * @tc.desc Verify join can serialize arrays after slice with an omitted end parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(9, 10, 11, 12).slice(2);
      expect(arr.join(',')).assertEqual('11,12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0960
     * @tc.name testArrayJoin096
     * @tc.desc Verify join can serialize arrays containing duplicate strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('aa', 'aa', 'bb');
      expect(arr.join('-')).assertEqual('aa-aa-bb');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0970
     * @tc.name testArrayJoin097
     * @tc.desc Verify join can serialize arrays containing booleans after map string conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false).map((value: boolean): string => value ? 'T' : 'F');
      expect(arr.join('')).assertEqual('TF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0980
     * @tc.name testArrayJoin098
     * @tc.desc Verify join can serialize arrays containing bigint values after slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(1n, 2n, 3n, 4n).slice(1, 3);
      expect(arr.join(',')).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_0990
     * @tc.name testArrayJoin099
     * @tc.desc Verify join can serialize arrays after sorting strings lexicographically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('c', 'a', 'b');
      arr.sort();
      expect(arr.join('')).assertEqual('abc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_1000
     * @tc.name testArrayJoin100
     * @tc.desc Verify join can serialize arrays after nested pipeline operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 4, 3, 2, 1).filter((value: number): boolean => value % 2 !== 0).toReversed();
      expect(arr.join(',')).assertEqual('1,3,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_1010
     * @tc.name testArrayJoin101
     * @tc.desc Verify join can serialize arrays built from Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(7, 8, 9);
      expect(arr.join('.')).assertEqual('7.8.9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_1020
     * @tc.name testArrayJoin102
     * @tc.desc Verify join preserves Chinese string elements and punctuation separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('\u4e2d\u6587', '\u6d4b\u8bd5', '\u6570\u7ec4');
      expect(arr.join('\u3001')).assertEqual('\u4e2d\u6587\u3001\u6d4b\u8bd5\u3001\u6570\u7ec4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_1030
     * @tc.name testArrayJoin103
     * @tc.desc Verify join preserves string elements containing whitespace and invisible characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('', ' ', '\t', '\n', '\r', '\u200B');
      const result = arr.join('|');
      expect(result).assertEqual('| |\t|\n|\r|\u200B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_1040
     * @tc.name testArrayJoin104
     * @tc.desc Verify join preserves string elements containing special characters and script-like text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('!@#$%^&*()', '<script>alert(1)</script>', 'line\\ntext');
      expect(arr.join('~')).assertEqual('!@#$%^&*()~<script>alert(1)</script>~line\\ntext');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_1050
     * @tc.name testArrayJoin105
     * @tc.desc Verify join preserves business style string formats such as phone email and date text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('13800138000', 'test@example.com', '2026-03-05');
      expect(arr.join(',')).assertEqual('13800138000,test@example.com,2026-03-05');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_1060
     * @tc.name testArrayJoin106
     * @tc.desc Verify join preserves multilingual string elements in source order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('\u65e5\u672c\u8a9e', '\ud55c\uad6d\uc5b4', 'Test\u6df7\u6392');
      expect(arr.join('/')).assertEqual('\u65e5\u672c\u8a9e/\ud55c\uad6d\uc5b4/Test\u6df7\u6392');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_1070
     * @tc.name testArrayJoin107
     * @tc.desc Verify join can preserve long string elements without truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longText = 'very-long-string-value-for-join-boundary-check';
      const arr = new Array<string>('prefix', longText, 'suffix');
      expect(arr.join('|')).assertEqual('prefix|very-long-string-value-for-join-boundary-check|suffix');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_1080
     * @tc.name testArrayJoin108
     * @tc.desc Verify join works after narrowing an Any value back to Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyValue: Any = new Array<number>(1, 2, 3);
      expect(joinAnyNumberArray(anyValue, '-')).assertEqual('1-2-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_JOIN_1090
     * @tc.name testArrayJoin109
     * @tc.desc Verify join supports arrays whose element type is Any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayJoin109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyArr = new Array<Any>(1, 'two', true);
      expect(anyArr.join('|')).assertEqual('1|two|true');
    });

  });
}

