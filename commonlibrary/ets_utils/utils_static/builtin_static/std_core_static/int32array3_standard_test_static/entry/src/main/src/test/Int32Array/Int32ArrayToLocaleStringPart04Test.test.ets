'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

class Opts {
  useGrouping: boolean = true;
  minimumIntegerDigits: number = 3;
}

class GroupOff {
  useGrouping: boolean = false;
}

class GroupOn {
  useGrouping: boolean = true;
}

export default function int32ArrayToLocaleStringPart04Test(): void {
  describe('Int32ArrayToLocaleStringPart04Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_0100
     * @tc.name int32ArrayToLocaleStringPart04Test001
     * @tc.desc Verify toLocaleString() length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let lenBefore: number = arr.length;
      arr.toLocaleString();
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_0200
     * @tc.name int32ArrayToLocaleStringPart04Test002
     * @tc.desc Verify toLocaleString('en-US') length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([100, 200, 300, 400]);
      arr.toLocaleString('en-US');
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_0300
     * @tc.name int32ArrayToLocaleStringPart04Test003
     * @tc.desc Verify toLocaleString() BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      arr.toLocaleString('en-US');
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_0400
     * @tc.name int32ArrayToLocaleStringPart04Test004
     * @tc.desc Verify toLocaleString() byteLength 12 3 * 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let bl: number = arr.byteLength;
      arr.toLocaleString();
      expect(arr.byteLength).assertEqual(bl);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_0500
     * @tc.name int32ArrayToLocaleStringPart04Test005
     * @tc.desc Verify toLocaleString() byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 0, 3);
      arr.toLocaleString('en-US');
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_0600
     * @tc.name int32ArrayToLocaleStringPart04Test006
     * @tc.desc Verify byteOffset toLocaleString byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 3);
      let offBefore: number = arr.byteOffset;
      arr.toLocaleString();
      expect(arr.byteOffset).assertEqual(offBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_0700
     * @tc.name int32ArrayToLocaleStringPart04Test007
     * @tc.desc Verify toLocaleString INT_MAX INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, -2147483648, 0, -1]);
      let a: number = arr.$_get(0);
      let b: number = arr.$_get(1);
      let c: number = arr.$_get(2);
      let d: number = arr.$_get(3);
      arr.toLocaleString('en-US');
      expect(arr.$_get(0)).assertEqual(a);
      expect(arr.$_get(1)).assertEqual(b);
      expect(arr.$_get(2)).assertEqual(c);
      expect(arr.$_get(3)).assertEqual(d);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_0800
     * @tc.name int32ArrayToLocaleStringPart04Test008
     * @tc.desc Verify toLocaleString options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let opts: Intl.NumberFormatOptions = { useGrouping: false };
      let arr: Int32Array = new Int32Array([7, 8, 9]);
      arr.toLocaleString('en-US', opts);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(8);
      expect(arr.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_0900
     * @tc.name int32ArrayToLocaleStringPart04Test009
     * @tc.desc Verify toLocaleString buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let bufBefore: ArrayBuffer = arr.buffer;
      arr.toLocaleString();
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_1000
     * @tc.name int32ArrayToLocaleStringPart04Test010
     * @tc.desc Verify toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let s1: string = arr.toLocaleString();
      let s2: string = arr.toLocaleString();
      expect(s1).assertEqual('');
      expect(s2).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_1100
     * @tc.name int32ArrayToLocaleStringPart04Test011
     * @tc.desc Verify toLocaleString formats 9999 with en-US grouping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      arr.toLocaleString();
      arr.$_set(0, 9999);
      let s: string = arr.toLocaleString('en-US');
      expect(s).assertEqual('9,999,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_1200
     * @tc.name int32ArrayToLocaleStringPart04Test012
     * @tc.desc Verify toLocaleString Number.NaN 0 Number.NaN ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      let before: number = arr.$_get(0);
      arr.toLocaleString('en-US');
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_1300
     * @tc.name int32ArrayToLocaleStringPart04Test013
     * @tc.desc Verify toLocaleString(toLocaleString) Int32Array identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let inner: string = arr.toLocaleString('en-US');
      expect(inner.length).assertEqual(2);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_1400
     * @tc.name int32ArrayToLocaleStringPart04Test014
     * @tc.desc Verify locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1234567]);
      let sEn: string = arr.toLocaleString('en-US');
      let sDe: string = arr.toLocaleString('de-DE');
      expect(sEn.length).assertEqual(9);
      expect(sDe.length).assertEqual(9);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_1500
     * @tc.name int32ArrayToLocaleStringPart04Test015
     * @tc.desc Verify locale en-US useGrouping:false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let opts: GroupOff = new GroupOff();
      let arr: Int32Array = new Int32Array([1000]);
      let s1: string = arr.toLocaleString();
      let s2: string = arr.toLocaleString('en-US', opts);
      expect(s1.length).assertEqual(5);
      expect(s2).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_1600
     * @tc.name int32ArrayToLocaleStringPart04Test016
     * @tc.desc Verify subarray toLocaleString toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3, 4]);
      let sub: Int32Array = parent.subarray(1, 3);
      sub.toLocaleString('en-US');
      expect(parent.$_get(0)).assertEqual(1);
      expect(parent.$_get(1)).assertEqual(2);
      expect(parent.$_get(2)).assertEqual(3);
      expect(parent.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_1700
     * @tc.name int32ArrayToLocaleStringPart04Test017
     * @tc.desc Verify from toLocaleString + toString locale vs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.from([1000, 2000]);
      let sLocale: string = arr.toLocaleString('en-US');
      let sPlain: string = arr.toString();
      expect(sLocale).assertEqual('1,000,2,000');
      expect(sPlain).assertEqual('1000,2000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_1800
     * @tc.name int32ArrayToLocaleStringPart04Test018
     * @tc.desc Verify of toLocaleString join 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 10, 15);
      let sLoc: string = arr.toLocaleString('en-US');
      let sJoin: string = arr.join(',');
      expect(sLoc.length).assertEqual(7);
      expect(sJoin.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_1900
     * @tc.name int32ArrayToLocaleStringPart04Test019
     * @tc.desc Verify fill toLocaleString fill fill toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(7);
      let s1: string = arr.toLocaleString('en-US');
      arr.fill(42);
      let s2: string = arr.toLocaleString('en-US');
      expect(s1).assertEqual('7,7,7');
      expect(s2).assertEqual('42,42,42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_2000
     * @tc.name int32ArrayToLocaleStringPart04Test020
     * @tc.desc Verify set(array, offset) toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      let src: Int32Array = new Int32Array([100, 200]);
      arr.set(src, 1);
      let s: string = arr.toLocaleString('en-US');
      expect(s).assertEqual('0,100,200,0');
      expect(arr.$_get(1)).assertEqual(100);
      expect(arr.$_get(2)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_2100
     * @tc.name int32ArrayToLocaleStringPart04Test021
     * @tc.desc Verify reverse toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.reverse();
      let s: string = arr.toLocaleString('en-US');
      expect(arr.$_get(0)).assertEqual(3);
      expect(s).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_2200
     * @tc.name int32ArrayToLocaleStringPart04Test022
     * @tc.desc Verify sort toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      arr.sort();
      let s: string = arr.toLocaleString('en-US');
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
      expect(s).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_2300
     * @tc.name int32ArrayToLocaleStringPart04Test023
     * @tc.desc Verify copyWithin toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.copyWithin(2, 0, 2);
      let s: string = arr.toLocaleString('en-US');
      expect(arr.$_get(2)).assertEqual(1);
      expect(s).assertEqual('1,2,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_2400
     * @tc.name int32ArrayToLocaleStringPart04Test024
     * @tc.desc Verify toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let external: number = 77;
      let snap: number = external;
      arr.toLocaleString('en-US');
      expect(external).assertEqual(snap);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_2500
     * @tc.name int32ArrayToLocaleStringPart04Test025
     * @tc.desc Verify toLocaleString options SDK options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let opts: Opts = new Opts();
      let groupingBefore: boolean = opts.useGrouping;
      let digitsBefore: number = opts.minimumIntegerDigits;
      let arr: Int32Array = new Int32Array([42]);
      arr.toLocaleString('en-US', opts);
      expect(opts.useGrouping).assertEqual(groupingBefore);
      expect(opts.minimumIntegerDigits).assertEqual(digitsBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_2600
     * @tc.name int32ArrayToLocaleStringPart04Test026
     * @tc.desc Verify toLocaleString locales
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let loc: string = 'en-US';
      let snap: string = loc;
      let arr: Int32Array = new Int32Array([1]);
      arr.toLocaleString(loc);
      expect(loc).assertEqual(snap);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_2700
     * @tc.name int32ArrayToLocaleStringPart04Test027
     * @tc.desc Verify toLocaleString locales
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let locs: Array<string> = ['en-US', 'de-DE'];
      let first: string = locs[0];
      let arr: Int32Array = new Int32Array([1]);
      arr.toLocaleString(locs);
      expect(locs[0]).assertEqual(first);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_2800
     * @tc.name int32ArrayToLocaleStringPart04Test028
     * @tc.desc Verify for-of toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let count: number = 0;
      for (let i = 0; i < arr.length; i++) {
        arr.$_get(i);
        arr.toLocaleString();
        count = count + 1;
        if (count > 3) {
          break;
        }
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_2900
     * @tc.name int32ArrayToLocaleStringPart04Test029
     * @tc.desc Verify forEach toLocaleString length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let calls: number = 0;
      arr.forEach((_v: number, _i: int, _a: Int32Array) => {
        arr.toLocaleString('en-US');
        calls = calls + 1;
      });
      expect(calls).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_3000
     * @tc.name int32ArrayToLocaleStringPart04Test030
     * @tc.desc Verify forEach mutation is reflected by toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let seenLast: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array) => {
        if (i === 0) {
          a.$_set(2, 99);
        }
        if (i === 2) {
          seenLast = v;
        }
      });
      expect(seenLast).assertEqual(99);
      expect(arr.toLocaleString('en-US')).assertEqual('1,2,99');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_3100
     * @tc.name int32ArrayToLocaleStringPart04Test031
     * @tc.desc Verify map toLocaleString map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let out: Int32Array = arr.map((v: number, _i: int, a: Int32Array) => {
        a.toLocaleString();
        return Double.toInt(v * 10);
      });
      expect(out.$_get(0)).assertEqual(10);
      expect(out.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_3200
     * @tc.name int32ArrayToLocaleStringPart04Test032
     * @tc.desc Verify every toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let res: boolean = arr.every((v: number, _i: int, a: Int32Array) => {
        a.toLocaleString();
        return v > 0;
      });
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_3300
     * @tc.name int32ArrayToLocaleStringPart04Test033
     * @tc.desc Verify some toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let before0: number = arr.$_get(0);
      let res: boolean = arr.some((v: number, _i: int, a: Int32Array) => {
        a.toLocaleString();
        return v === 2;
      });
      expect(res).assertTrue();
      expect(arr.$_get(0)).assertEqual(before0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_3400
     * @tc.name int32ArrayToLocaleStringPart04Test034
     * @tc.desc Verify filter toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -2, 3]);
      let out: Int32Array = arr.filter((v: number, _i: int, a: Int32Array) => {
        a.toLocaleString();
        return v > 0;
      });
      expect(out.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_3500
     * @tc.name int32ArrayToLocaleStringPart04Test035
     * @tc.desc Verify reduce toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let sum: number = arr.reduce((acc: number, v: number, _i: int, a: Int32Array): number => {
        a.toLocaleString();
        return acc + v;
      });
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_3600
     * @tc.name int32ArrayToLocaleStringPart04Test036
     * @tc.desc Verify find toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let found: number | undefined = arr.find((v: number, _i: int, a: Int32Array) => {
        a.toLocaleString();
        return v === 20;
      });
      expect(found).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_3700
     * @tc.name int32ArrayToLocaleStringPart04Test037
     * @tc.desc Verify INT_MIN -2147483648 toLocaleString('en-US') '-'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648]);
      let s: string = arr.toLocaleString('en-US');
      expect(s.charAt(0).toString()).assertEqual('-');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_3800
     * @tc.name int32ArrayToLocaleStringPart04Test038
     * @tc.desc Verify -0 Int32Array toLocaleString '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      arr.$_set(0, Double.toInt(-0));
      let s: string = arr.toLocaleString('en-US');
      expect(s.charAt(0).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_3900
     * @tc.name int32ArrayToLocaleStringPart04Test039
     * @tc.desc Verify -1 toLocaleString('en-US') '-1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1]);
      let s: string = arr.toLocaleString('en-US');
      expect(s).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_4000
     * @tc.name int32ArrayToLocaleStringPart04Test040
     * @tc.desc Verify 1 toLocaleString('en-US') '1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let s: string = arr.toLocaleString('en-US');
      expect(s).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_4100
     * @tc.name int32ArrayToLocaleStringPart04Test041
     * @tc.desc Verify 1000 toLocaleString('en-US', {useGrouping:false}) '1000'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1000]);
      let options: Intl.NumberFormatOptions = { useGrouping: false };
      let s: string = arr.toLocaleString('en-US', options);
      expect(s).assertEqual('1000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_4200
     * @tc.name int32ArrayToLocaleStringPart04Test042
     * @tc.desc Verify locale en-US
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1000, 2000]);
      let s: string = arr.toLocaleString('en-US');
      expect(s.indexOf(',')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_4300
     * @tc.name int32ArrayToLocaleStringPart04Test043
     * @tc.desc Verify 3.7 Int32Array ToInt32 3 toLocaleString '3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3]);
      arr.$_set(0, Double.toInt(3.7));
      let s: string = arr.toLocaleString('en-US');
      expect(s).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_4400
     * @tc.name int32ArrayToLocaleStringPart04Test044
     * @tc.desc Verify 2147483648 int32 JS ToInt32 -2147483648 toLocaleString '-'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -2147483648);
      let s: string = arr.toLocaleString('en-US');
      expect(s.charAt(0).toString()).assertEqual('-');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_4500
     * @tc.name int32ArrayToLocaleStringPart04Test045
     * @tc.desc Verify 0 toLocaleString "--"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0]);
      let s: string = arr.toLocaleString('en-US');
      expect(s.indexOf('--')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_4600
     * @tc.name int32ArrayToLocaleStringPart04Test046
     * @tc.desc Verify 2147483647 useGrouping:true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let opts: GroupOn = new GroupOn();
      let arr: Int32Array = new Int32Array([2147483647]);
      let s: string = arr.toLocaleString('en-US', opts);
      expect(s.indexOf(',')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_4700
     * @tc.name int32ArrayToLocaleStringPart04Test047
     * @tc.desc Verify toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf, 0, 4);
      parent.$_set(0, 1);
      parent.$_set(1, 2);
      parent.$_set(2, 3);
      parent.$_set(3, 4);
      let child: Int32Array = new Int32Array(buf, 4, 2);
      let child0: number = child.$_get(0);
      let child1: number = child.$_get(1);
      parent.toLocaleString('en-US');
      expect(child.$_get(0)).assertEqual(child0);
      expect(child.$_get(1)).assertEqual(child1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_4800
     * @tc.name int32ArrayToLocaleStringPart04Test048
     * @tc.desc Verify toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf, 0, 4);
      parent.$_set(0, 10);
      parent.$_set(1, 20);
      parent.$_set(2, 30);
      parent.$_set(3, 40);
      let child: Int32Array = new Int32Array(buf, 8, 2);
      child.toLocaleString('en-US');
      expect(parent.$_get(0)).assertEqual(10);
      expect(parent.$_get(1)).assertEqual(20);
      expect(parent.$_get(2)).assertEqual(30);
      expect(parent.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_4900
     * @tc.name int32ArrayToLocaleStringPart04Test049
     * @tc.desc Verify toLocaleString buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let a: Int32Array = new Int32Array(buf, 0, 3);
      let b: Int32Array = new Int32Array(buf, 4, 3);
      a.$_set(0, 11);
      a.$_set(1, 22);
      a.$_set(2, 33);
      b.$_set(0, 44);
      b.$_set(1, 55);
      b.$_set(2, 66);
      a.toLocaleString('en-US');
      b.toLocaleString('en-US');
      expect(a.$_get(0)).assertEqual(11);
      expect(a.$_get(1)).assertEqual(44);
      expect(b.$_get(1)).assertEqual(55);
      expect(b.$_get(2)).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_5000
     * @tc.name int32ArrayToLocaleStringPart04Test050
     * @tc.desc Verify fill toLocaleString fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf, 0, 4);
      let child: Int32Array = new Int32Array(buf, 4, 2);
      parent.fill(7);
      let s: string = child.toLocaleString('en-US');
      expect(child.$_get(0)).assertEqual(7);
      expect(child.$_get(1)).assertEqual(7);
      expect(s).assertEqual('7,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_5100
     * @tc.name int32ArrayToLocaleStringPart04Test051
     * @tc.desc Verify fill toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf, 0, 4);
      let child: Int32Array = new Int32Array(buf, 8, 2);
      child.fill(9);
      let s: string = parent.toLocaleString('en-US');
      expect(parent.$_get(2)).assertEqual(9);
      expect(parent.$_get(3)).assertEqual(9);
      expect(s).assertEqual('0,0,9,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_5200
     * @tc.name int32ArrayToLocaleStringPart04Test052
     * @tc.desc Verify subarray buffer toLocaleString buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let sub: Int32Array = parent.subarray(2, 4);
      let sub0: number = sub.$_get(0);
      let sub1: number = sub.$_get(1);
      parent.toLocaleString('en-US');
      sub.toLocaleString('en-US');
      expect(sub.$_get(0)).assertEqual(sub0);
      expect(sub.$_get(1)).assertEqual(sub1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_5300
     * @tc.name int32ArrayToLocaleStringPart04Test053
     * @tc.desc Verify ArrayBuffer Int32Array Uint8Array Int32Array.toLocaleString Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let i32: Int32Array = new Int32Array(buf, 0, 2);
      let u8: Uint8Array = new Uint8Array(buf, 0, 8);
      i32.$_set(0, 1);
      i32.$_set(1, 2);
      let u8Snap0: number = u8.$_get(0);
      let u8Snap4: number = u8.$_get(4);
      i32.toLocaleString('en-US');
      expect(u8.$_get(0)).assertEqual(u8Snap0);
      expect(u8.$_get(4)).assertEqual(u8Snap4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_5400
     * @tc.name int32ArrayToLocaleStringPart04Test054
     * @tc.desc Verify slice buffer toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1, 2, 3, 4]);
      let cp: Int32Array = src.slice(0);
      cp.$_set(0, 999);
      cp.toLocaleString('en-US');
      expect(src.$_get(0)).assertEqual(1);
      expect(cp.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_5500
     * @tc.name int32ArrayToLocaleStringPart04Test055
     * @tc.desc Verify $_set toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf, 0, 4);
      let child: Int32Array = new Int32Array(buf, 4, 2);
      parent.fill(0);
      child.$_set(0, 1234);
      child.$_set(1, 5678);
      let sParent: string = parent.toLocaleString('en-US');
      expect(parent.$_get(1)).assertEqual(1234);
      expect(parent.$_get(2)).assertEqual(5678);
      expect(sParent).assertEqual('0,1,234,5,678,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_5600
     * @tc.name int32ArrayToLocaleStringPart04Test056
     * @tc.desc Verify set toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let parent: Int32Array = new Int32Array(buf, 0, 5);
      let child: Int32Array = new Int32Array(buf, 8, 2);
      let src: Int32Array = new Int32Array([100, 200]);
      parent.set(src, 2);
      let sChild: string = child.toLocaleString('en-US');
      expect(child.$_get(0)).assertEqual(100);
      expect(child.$_get(1)).assertEqual(200);
      expect(sChild).assertEqual('100,200');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_5700
     * @tc.name int32ArrayToLocaleStringPart04Test057
     * @tc.desc Verify buffer reverse toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf, 0, 4);
      parent.$_set(0, 1);
      parent.$_set(1, 2);
      parent.$_set(2, 3);
      parent.$_set(3, 4);
      let child: Int32Array = new Int32Array(buf, 0, 4);
      parent.reverse();
      let sChild: string = child.toLocaleString('en-US');
      expect(child.$_get(0)).assertEqual(4);
      expect(sChild).assertEqual('4,3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_5800
     * @tc.name int32ArrayToLocaleStringPart04Test058
     * @tc.desc Verify buffer sort toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf, 0, 4);
      parent.$_set(0, 4);
      parent.$_set(1, 1);
      parent.$_set(2, 3);
      parent.$_set(3, 2);
      let child: Int32Array = new Int32Array(buf, 0, 4);
      parent.sort();
      child.toLocaleString('en-US');
      expect(child.$_get(0)).assertEqual(1);
      expect(child.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_5900
     * @tc.name int32ArrayToLocaleStringPart04Test059
     * @tc.desc Verify slice toLocaleString buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: Int32Array = new Int32Array([10, 20, 30]);
      let cloned: Int32Array = original.slice(0);
      cloned.toLocaleString('en-US');
      expect(original.$_get(0)).assertEqual(10);
      expect(original.$_get(1)).assertEqual(20);
      expect(original.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_6000
     * @tc.name int32ArrayToLocaleStringPart04Test060
     * @tc.desc Verify of toLocaleString entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(100, 200, 300);
      arr.toLocaleString('en-US');
      let count: number = 0;
      for (let i = 0; i < arr.length; i++) {
        arr.$_get(i);
        count = count + 1;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_6100
     * @tc.name int32ArrayToLocaleStringPart04Test061
     * @tc.desc Verify from([string-likes]) int toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1, 2, 3];
      let arr: Int32Array = Int32Array.from(src);
      let s: string = arr.toLocaleString('en-US');
      expect(s).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_6200
     * @tc.name int32ArrayToLocaleStringPart04Test062
     * @tc.desc Verify toLocaleString from(mapfn)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1, 2, 3];
      let arr: Int32Array = Int32Array.from(src, (v: number) => Double.toInt(v * 100));
      let s: string = arr.toLocaleString('en-US');
      expect(s).assertEqual('100,200,300');
      expect(arr.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_6300
     * @tc.name int32ArrayToLocaleStringPart04Test063
     * @tc.desc Verify indexOf toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let idx: number = arr.indexOf(99);
      let s: string = arr.toLocaleString('en-US');
      expect(idx).assertEqual(-1);
      expect(s).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_6400
     * @tc.name int32ArrayToLocaleStringPart04Test064
     * @tc.desc Verify includes toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let hit: boolean = arr.includes(2);
      arr.toLocaleString('en-US');
      expect(hit).assertTrue();
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_6500
     * @tc.name int32ArrayToLocaleStringPart04Test065
     * @tc.desc Verify reduceRight toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 4]);
      let sum: number = arr.reduceRight((acc: number, v: number, _i: int, a: Int32Array): number => {
        a.toLocaleString();
        return acc + v;
      });
      expect(sum).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_6600
     * @tc.name int32ArrayToLocaleStringPart04Test066
     * @tc.desc Verify findIndex toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let idx: number = arr.findIndex((v: number, _i: int, _a: Int32Array) => v === 20);
      arr.toLocaleString('en-US');
      expect(idx).assertEqual(1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_6700
     * @tc.name int32ArrayToLocaleStringPart04Test067
     * @tc.desc Verify findLast toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 20, 30]);
      let v: number | undefined = arr.findLast((x: number) => x === 20);
      let s: string = arr.toLocaleString('en-US');
      expect(v).assertEqual(20);
      expect(s).assertEqual('10,20,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_6800
     * @tc.name int32ArrayToLocaleStringPart04Test068
     * @tc.desc Verify findLastIndex toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 6, 7]);
      let idx: number = arr.findLastIndex((v: number) => v === 6);
      arr.toLocaleString('en-US');
      expect(idx).assertEqual(1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_6900
     * @tc.name int32ArrayToLocaleStringPart04Test069
     * @tc.desc Verify keys toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20]);
      let it = arr.keys();
      let first: IteratorResult<int> = it.next();
      arr.toLocaleString('en-US');
      let second: IteratorResult<int> = it.next();
      expect(first.value).assertEqual(0);
      expect(second.value).assertEqual(1);
      expect(second.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_7000
     * @tc.name int32ArrayToLocaleStringPart04Test070
     * @tc.desc Verify values toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([100, 200, 300]);
      let it = arr.values();
      let r1: IteratorResult<number> = it.next();
      arr.toLocaleString();
      let r2: IteratorResult<number> = it.next();
      let r3: IteratorResult<number> = it.next();
      let r4: IteratorResult<number> = it.next();
      expect(r1.value).assertEqual(100);
      expect(r2.value).assertEqual(200);
      expect(r3.value).assertEqual(300);
      expect(r4.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_7100
     * @tc.name int32ArrayToLocaleStringPart04Test071
     * @tc.desc Verify at toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let last: Number | undefined = arr.at(-1);
      arr.toLocaleString('en-US');
      expect(last).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_7200
     * @tc.name int32ArrayToLocaleStringPart04Test072
     * @tc.desc Verify toLocaleString length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let s: string = arr.toLocaleString('en-US');
      expect(s.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_7300
     * @tc.name int32ArrayToLocaleStringPart04Test073
     * @tc.desc Verify unsupported locale 'zz-ZZ' falls back without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      expect(arr.toLocaleString('zz-ZZ')).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_7400
     * @tc.name int32ArrayToLocaleStringPart04Test074
     * @tc.desc Verify locales []
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: Array<string> = [];
      let arr: Int32Array = new Int32Array([1]);
      let s: string = arr.toLocaleString(empty);
      expect(s).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_7500
     * @tc.name int32ArrayToLocaleStringPart04Test075
     * @tc.desc Verify options null undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let s: string = arr.toLocaleString('en-US', undefined);
      expect(s).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_7600
     * @tc.name int32ArrayToLocaleStringPart04Test076
     * @tc.desc Verify subarray buffer detached toLocaleString detach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 0, 4);
      arr.$_set(0, 1);
      let s: string = arr.toLocaleString('en-US');
      expect(s).assertEqual('1,0,0,0');
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART04_TEST_MINDMAP_7700
     * @tc.name int32ArrayToLocaleStringPart04Test077
     * @tc.desc Verify toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart04Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let emptyView: Int32Array = new Int32Array(buf, 0, 0);
      let s: string = emptyView.toLocaleString('en-US');
      expect(s).assertEqual('');
    });
  });
}
