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

class GroupOff {
  useGrouping: boolean = false;
}

class GroupOn {
  useGrouping: boolean = true;
}

class Empty {
}

export default function int32ArrayToLocaleStringPart02Test(): void {
  describe('int32ArrayToLocaleStringPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_0100
     * @tc.name int32ArrayToLocaleStringPart02Test001
     * @tc.desc Verify default locale formats [1] as '1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let r: string = arr.toLocaleString();
      expect(r).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_0200
     * @tc.name int32ArrayToLocaleStringPart02Test002
     * @tc.desc Verify en-US formats 9999 as '9,999'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([9999]);
      let r: string = arr.toLocaleString('en-US');
      expect(r).assertEqual('9,999');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_0300
     * @tc.name int32ArrayToLocaleStringPart02Test003
     * @tc.desc Verify locales and useGrouping:false format 123 as '123'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([123]);
      let r: string = arr.toLocaleString(['en-US'], new GroupOff());
      expect(r).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_0400
     * @tc.name int32ArrayToLocaleStringPart02Test004
     * @tc.desc Verify String String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7]);
      let r: string = arr.toLocaleString();
      expect(r).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_0500
     * @tc.name int32ArrayToLocaleStringPart02Test005
     * @tc.desc Verify zero output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      let r: string = arr.toLocaleString();
      expect(r).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_0600
     * @tc.name int32ArrayToLocaleStringPart02Test006
     * @tc.desc Verify repeated calls return the same string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r1: string = arr.toLocaleString();
      let r2: string = arr.toLocaleString();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_0700
     * @tc.name int32ArrayToLocaleStringPart02Test007
     * @tc.desc Verify -1 '-'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1]);
      let r: string = arr.toLocaleString();
      expect(r.charAt(0).toString()).assertEqual('-');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_0800
     * @tc.name int32ArrayToLocaleStringPart02Test008
     * @tc.desc Verify INT_MAX 2147483647 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647]);
      let r: string = arr.toLocaleString();
      expect(r.replace(new RegExp('[,\\s]', 'g'), '')).assertEqual('2147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_0900
     * @tc.name int32ArrayToLocaleStringPart02Test009
     * @tc.desc Verify INT_MIN -2147483648 '-'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648]);
      let r: string = arr.toLocaleString();
      expect(r.charAt(0).toString()).assertEqual('-');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_1000
     * @tc.name int32ArrayToLocaleStringPart02Test010
     * @tc.desc Verify [1,2] locale '1,2'.length; Also verify verify [1,2] length '1,2'.length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let r: string = arr.toLocaleString();
      expect(r.length).assertEqual('1,2'.length);

      {
      let arr: Int32Array = new Int32Array([1, 2]);
      let r: string = arr.toLocaleString();
      expect(r.length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_1100
     * @tc.name int32ArrayToLocaleStringPart02Test011
     * @tc.desc Verify [0,0,0] locale '0,0,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: string = arr.toLocaleString();
      expect(r).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_1200
     * @tc.name int32ArrayToLocaleStringPart02Test012
     * @tc.desc Verify en-US 1000 '1,000'; Also verify verify en-US 1000 length '1,000'.length=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1000]);
      let r: string = arr.toLocaleString('en-US');
      expect(r).assertEqual('1,000');

      {
      let arr: Int32Array = new Int32Array([1000]);
      let r: string = arr.toLocaleString('en-US');
      expect(r.length).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_1300
     * @tc.name int32ArrayToLocaleStringPart02Test013
     * @tc.desc Verify en-US 1000000 '1,000,000'; Also verify verify en-US 1000000 length '1,000,000'.length=9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1000000]);
      let r: string = arr.toLocaleString('en-US');
      expect(r).assertEqual('1,000,000');

      {
      let arr: Int32Array = new Int32Array([1000000]);
      let r: string = arr.toLocaleString('en-US');
      expect(r.length).assertEqual(9);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_1400
     * @tc.name int32ArrayToLocaleStringPart02Test014
     * @tc.desc Verify en-US 999 '999'; Also verify verify en-US 999 length toString length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([999]);
      let r: string = arr.toLocaleString('en-US');
      expect(r).assertEqual('999');

      {
      let arr: Int32Array = new Int32Array([999]);
      let r: string = arr.toLocaleString('en-US');
      expect(r.length).assertEqual(arr.toString().length);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_1500
     * @tc.name int32ArrayToLocaleStringPart02Test015
     * @tc.desc Verify en-US -1000 '-1,000'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1000]);
      let r: string = arr.toLocaleString('en-US');
      expect(r).assertEqual('-1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_1600
     * @tc.name int32ArrayToLocaleStringPart02Test016
     * @tc.desc Verify en-US 0 '0'; Also verify verify 0 en-US
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      let r: string = arr.toLocaleString('en-US');
      expect(r).assertEqual('0');

      {
      let arr: Int32Array = new Int32Array([0]);
      let r: string = arr.toLocaleString('en-US');
      expect(r.indexOf(',') < 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_1700
     * @tc.name int32ArrayToLocaleStringPart02Test017
     * @tc.desc Verify en-US [1000,2000] 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1000, 2000]);
      let r: string = arr.toLocaleString('en-US');
      expect(r.split(',').length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_1800
     * @tc.name int32ArrayToLocaleStringPart02Test018
     * @tc.desc Verify en-US [1,2] '1,2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let r: string = arr.toLocaleString('en-US');
      expect(r).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_1900
     * @tc.name int32ArrayToLocaleStringPart02Test019
     * @tc.desc Verify en-US 2147483647; Also verify verify en-US 2147483647 '-'; Also verify verify 2147483647 'e'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647]);
      let r: string = arr.toLocaleString('en-US');
      expect(r).assertEqual('2,147,483,647');

      {
      let arr: Int32Array = new Int32Array([2147483647]);
      let r: string = arr.toLocaleString('en-US');
      expect(r.startsWith('-')).assertFalse();
      }

      {
      let arr: Int32Array = new Int32Array([2147483647]);
      let r: string = arr.toLocaleString('en-US');
      expect(r.indexOf('e') < 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_2000
     * @tc.name int32ArrayToLocaleStringPart02Test020
     * @tc.desc Verify ['en-US'] 'en-US' 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1000]);
      let locales: string[] = ['en-US'];
      let r: string = arr.toLocaleString(locales);
      expect(r).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_2100
     * @tc.name int32ArrayToLocaleStringPart02Test021
     * @tc.desc Verify locales locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r1: string = arr.toLocaleString();
      let r2: string = arr.toLocaleString(new Array<string>());
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_2200
     * @tc.name int32ArrayToLocaleStringPart02Test022
     * @tc.desc Verify ['en-US','zh-CN']
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1000]);
      let r: string = arr.toLocaleString(['en-US', 'zh-CN']);
      expect(r).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_2300
     * @tc.name int32ArrayToLocaleStringPart02Test023
     * @tc.desc Verify de-DE 1000 en-US
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1000]);
      let r: string = arr.toLocaleString('de-DE');
      expect(r.indexOf(',') < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_2400
     * @tc.name int32ArrayToLocaleStringPart02Test024
     * @tc.desc Verify fr-FR en-US 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1000]);
      let rUs: string = arr.toLocaleString('en-US');
      let rFr: string = arr.toLocaleString('fr-FR');
      expect(rUs).assertEqual('1,000');
      expect(rFr).assertEqual('1\u202F000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_2500
     * @tc.name int32ArrayToLocaleStringPart02Test025
     * @tc.desc Verify length 0 length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: string = arr.toLocaleString();
      expect(arr.length).assertEqual(0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_2600
     * @tc.name int32ArrayToLocaleStringPart02Test026
     * @tc.desc Verify 42 length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r: string = arr.toLocaleString();
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_2700
     * @tc.name int32ArrayToLocaleStringPart02Test027
     * @tc.desc Verify [1,2,3] length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: string = arr.toLocaleString();
      expect(r.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_2800
     * @tc.name int32ArrayToLocaleStringPart02Test028
     * @tc.desc Verify toLocaleString byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let before: int = arr.byteLength;
      arr.toLocaleString();
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_2900
     * @tc.name int32ArrayToLocaleStringPart02Test029
     * @tc.desc Verify toLocaleString byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      arr.toLocaleString();
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_3000
     * @tc.name int32ArrayToLocaleStringPart02Test030
     * @tc.desc Verify 0; Also verify verify 1; Also verify verify 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42, 99, -7]);
      arr.toLocaleString('en-US');
      expect(arr.$_get(0)).assertEqual(42);

      {
      let arr: Int32Array = new Int32Array([42, 99, -7]);
      arr.toLocaleString('en-US');
      expect(arr.$_get(1)).assertEqual(99);
      }

      {
      let arr: Int32Array = new Int32Array([42, 99, -7]);
      arr.toLocaleString('en-US');
      expect(arr.$_get(2)).assertEqual(-7);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_3100
     * @tc.name int32ArrayToLocaleStringPart02Test031
     * @tc.desc Verify INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647]);
      arr.toLocaleString('de-DE');
      expect(arr.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_3200
     * @tc.name int32ArrayToLocaleStringPart02Test032
     * @tc.desc Verify INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648]);
      arr.toLocaleString('fr-FR');
      expect(arr.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_3300
     * @tc.name int32ArrayToLocaleStringPart02Test033
     * @tc.desc Verify ArrayBuffer byteLength 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 1000);
      arr.$_set(1, 2000);
      arr.$_set(2, 3000);
      arr.toLocaleString('en-US');
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_3400
     * @tc.name int32ArrayToLocaleStringPart02Test034
     * @tc.desc Verify ArrayBuffer DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 12345);
      arr.$_set(1, -6789);
      arr.toLocaleString();
      let dv: DataView = new DataView(buf);
      expect(dv.getInt32(0, true)).assertEqual(12345);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_3500
     * @tc.name int32ArrayToLocaleStringPart02Test035
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = new Int32Array(buf);
      a.$_set(0, 111);
      a.$_set(1, 222);
      a.$_set(2, 333);
      a.$_set(3, 444);
      a.toLocaleString('en-US');
      expect(b.$_get(0)).assertEqual(111);
      expect(b.$_get(3)).assertEqual(444);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_3600
     * @tc.name int32ArrayToLocaleStringPart02Test036
     * @tc.desc Verify length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.toLocaleString();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_3700
     * @tc.name int32ArrayToLocaleStringPart02Test037
     * @tc.desc Verify byteOffset offset/length/
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      arr.$_set(0, 5000);
      arr.$_set(1, 6000);
      arr.toLocaleString('en-US');
      expect(arr.byteOffset).assertEqual(4);
      expect(arr.length).assertEqual(2);
      expect(arr.$_get(0)).assertEqual(5000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_3800
     * @tc.name int32ArrayToLocaleStringPart02Test038
     * @tc.desc Verify toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1234, 5678]);
      let r1: string = arr.toLocaleString('en-US');
      let r2: string = arr.toLocaleString('en-US');
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_3900
     * @tc.name int32ArrayToLocaleStringPart02Test039
     * @tc.desc Verify repeated default toLocaleString calls return the same result for a negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-99]);
      let r1: string = arr.toLocaleString();
      let r2: string = arr.toLocaleString();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_4000
     * @tc.name int32ArrayToLocaleStringPart02Test040
     * @tc.desc Verify repeated en-US toLocaleString calls return the same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, -1, 2147483647]);
      let r1: string = arr.toLocaleString('en-US');
      arr.toLocaleString('en-US');
      let r3: string = arr.toLocaleString('en-US');
      expect(r1).assertEqual(r3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_4100
     * @tc.name int32ArrayToLocaleStringPart02Test041
     * @tc.desc Verify locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1000, 2000]);
      let b: Int32Array = new Int32Array([1000, 2000]);
      expect(a.toLocaleString('en-US')).assertEqual(b.toLocaleString('en-US'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_4200
     * @tc.name int32ArrayToLocaleStringPart02Test042
     * @tc.desc Verify different single-element arrays produce different locale strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1]);
      let b: Int32Array = new Int32Array([2]);
      let diff: boolean = (a.toLocaleString() !== b.toLocaleString());
      expect(diff).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_4300
     * @tc.name int32ArrayToLocaleStringPart02Test043
     * @tc.desc Verify arr.buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let buf: ArrayBuffer = arr.buffer;
      arr.toLocaleString();
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_4400
     * @tc.name int32ArrayToLocaleStringPart02Test044
     * @tc.desc Verify BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7]);
      arr.toLocaleString();
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_4500
     * @tc.name int32ArrayToLocaleStringPart02Test045
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let sub: Int32Array = arr.subarray(1, 3);
      sub.toLocaleString('en-US');
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_4600
     * @tc.name int32ArrayToLocaleStringPart02Test046
     * @tc.desc Verify subarray length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let sub: Int32Array = arr.subarray(1, 3);
      sub.toLocaleString();
      expect(sub.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_4700
     * @tc.name int32ArrayToLocaleStringPart02Test047
     * @tc.desc Verify subarray [20,30] en-US '20,30'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let sub: Int32Array = arr.subarray(1, 3);
      let r: string = sub.toLocaleString('en-US');
      expect(r).assertEqual('20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_4800
     * @tc.name int32ArrayToLocaleStringPart02Test048
     * @tc.desc Verify -0 '0' '-0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-0]);
      let r: string = arr.toLocaleString();
      expect(r).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_4900
     * @tc.name int32ArrayToLocaleStringPart02Test049
     * @tc.desc Verify en-US 100 '100'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([100]);
      let r: string = arr.toLocaleString('en-US');
      expect(r).assertEqual('100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_5000
     * @tc.name int32ArrayToLocaleStringPart02Test050
     * @tc.desc Verify en-US -1000000 '-1,000,000'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1000000]);
      let r: string = arr.toLocaleString('en-US');
      expect(r).assertEqual('-1,000,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_5100
     * @tc.name int32ArrayToLocaleStringPart02Test051
     * @tc.desc Verify [1000,-2000] en-US '-'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1000, -2000]);
      let r: string = arr.toLocaleString('en-US');
      expect(r).assertEqual('1,000,-2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_5200
     * @tc.name int32ArrayToLocaleStringPart02Test052
     * @tc.desc Verify useGrouping:false en-US 1000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1000000]);
      let options: Intl.NumberFormatOptions = { useGrouping: false };
      let r: string = arr.toLocaleString('en-US', options);
      expect(r).assertEqual('1000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_5300
     * @tc.name int32ArrayToLocaleStringPart02Test053
     * @tc.desc Verify useGrouping:true en-US 1000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1000000]);
      let r: string = arr.toLocaleString('en-US', new GroupOn());
      expect(r).assertEqual('1,000,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_5400
     * @tc.name int32ArrayToLocaleStringPart02Test054
     * @tc.desc Verify useGrouping:true returns '1,000,000' and useGrouping:false returns '1000000'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1000000]);
      let groupOn: Intl.NumberFormatOptions = { useGrouping: true };
      let groupOff: Intl.NumberFormatOptions = { useGrouping: false };
      let rT: string = arr.toLocaleString('en-US', groupOn);
      let rF: string = arr.toLocaleString('en-US', groupOff);
      expect(rT).assertEqual('1,000,000');
      expect(rF).assertEqual('1000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_5500
     * @tc.name int32ArrayToLocaleStringPart02Test055
     * @tc.desc Verify options options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1000000]);
      let r1: string = arr.toLocaleString('en-US');
      let r2: string = arr.toLocaleString('en-US', new Empty());
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_5600
     * @tc.name int32ArrayToLocaleStringPart02Test056
     * @tc.desc Verify en-US
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r: string = arr.toLocaleString('en-US');
      expect(r).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_5700
     * @tc.name int32ArrayToLocaleStringPart02Test057
     * @tc.desc Verify en-US 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: string = arr.toLocaleString('en-US');
      let count: int = 0;
      for (let i: int = 0; i < r.length; i++) {
        if (r.substring(i, i + 1) === ',') {
          count++;
        }
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_5800
     * @tc.name int32ArrayToLocaleStringPart02Test058
     * @tc.desc Verify locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1000000]);
      let a: string = arr.toLocaleString('en-US');
      let b: string = arr.toLocaleString('de-DE');
      expect(a).assertEqual('1,000,000');
      expect(b).assertEqual('1.000.000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_5900
     * @tc.name int32ArrayToLocaleStringPart02Test059
     * @tc.desc Verify en-US [1000,1000] 3 +
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1000, 1000]);
      let r: string = arr.toLocaleString('en-US');
      let count: int = 0;
      for (let i: int = 0; i < r.length; i++) {
        if (r.substring(i, i + 1) === ',') {
          count++;
        }
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_6000
     * @tc.name int32ArrayToLocaleStringPart02Test060
     * @tc.desc Verify byteOffset=8 [300,400] '300,400'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let full: Int32Array = new Int32Array(buf);
      full.$_set(0, 100);
      full.$_set(1, 200);
      full.$_set(2, 300);
      full.$_set(3, 400);
      let view: Int32Array = new Int32Array(buf, 8, 2);
      let r: string = view.toLocaleString();
      expect(r).assertEqual('300,400');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_6100
     * @tc.name int32ArrayToLocaleStringPart02Test061
     * @tc.desc Verify an offset buffer view formats only its selected elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let full: Int32Array = new Int32Array(buf);
      full.$_set(0, 9999);
      full.$_set(1, 8888);
      full.$_set(2, 1);
      full.$_set(3, 2);
      let view: Int32Array = new Int32Array(buf, 8, 2);
      let r: string = view.toLocaleString('en-US');
      expect(r.indexOf('9') < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_6200
     * @tc.name int32ArrayToLocaleStringPart02Test062
     * @tc.desc Verify length=1 offset=4 6000 '6,000'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let full: Int32Array = new Int32Array(buf);
      full.$_set(0, 5000);
      full.$_set(1, 6000);
      let view: Int32Array = new Int32Array(buf, 4, 1);
      let r: string = view.toLocaleString('en-US');
      expect(r).assertEqual('6,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_6300
     * @tc.name int32ArrayToLocaleStringPart02Test063
     * @tc.desc Verify formatting an offset buffer view does not mutate preceding buffer elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let full: Int32Array = new Int32Array(buf);
      full.$_set(0, 111);
      full.$_set(1, 222);
      full.$_set(2, 333);
      full.$_set(3, 444);
      let view: Int32Array = new Int32Array(buf, 8, 2);
      view.toLocaleString('en-US');
      expect(full.$_get(0)).assertEqual(111);
      expect(full.$_get(1)).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_6400
     * @tc.name int32ArrayToLocaleStringPart02Test064
     * @tc.desc Verify toUpperCase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1234]);
      let s: string = arr.toLocaleString('en-US');
      let t: string = s.toUpperCase();
      expect(arr.$_get(0)).assertEqual(1234);
      expect(t).assertEqual(s);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_6500
     * @tc.name int32ArrayToLocaleStringPart02Test065
     * @tc.desc Verify toLocaleString toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1000, 2000]);
      let r1: string = arr.toLocaleString('en-US');
      let r2: string = arr.toString();
      expect(arr.$_get(0)).assertEqual(1000);
      expect(r1).assertEqual('1,000,2,000');
      expect(r2).assertEqual('1000,2000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_6600
     * @tc.name int32ArrayToLocaleStringPart02Test066
     * @tc.desc Verify string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r: string = arr.toLocaleString() + '!';
      expect(r).assertEqual('42!');
      expect(r.charAt(r.length - 1).toString()).assertEqual('!');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_6700
     * @tc.name int32ArrayToLocaleStringPart02Test067
     * @tc.desc Verify 10 length 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      arr.toLocaleString('en-US');
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART02_TEST_MINDMAP_6800
     * @tc.name int32ArrayToLocaleStringPart02Test068
     * @tc.desc Verify 5 [1,2,3,4,5] en-US 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let r: string = arr.toLocaleString('en-US');
      let count: int = 0;
      for (let i: int = 0; i < r.length; i++) {
        if (r.substring(i, i + 1) === ',') {
          count++;
        }
      }
      expect(count).assertEqual(4);
    });
  });
}
