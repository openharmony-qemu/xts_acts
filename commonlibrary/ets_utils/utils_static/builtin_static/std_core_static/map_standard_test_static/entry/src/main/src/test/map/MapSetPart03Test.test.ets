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

interface ObjKey {
  id: int;
}

export default function mapSetPart03TestTest(): void {
  describe('MapSetPart03TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_0100
     * @tc.name mapSetPart03Test001
     * @tc.desc Verify set key val
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('key', 100);
      expect(m.get('key')).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_0200
     * @tc.name mapSetPart03Test002
     * @tc.desc Verify key 0xFFFFFFFF int key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(-1, 99);
      expect(m.get(-1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_0300
     * @tc.name mapSetPart03Test003
     * @tc.desc Verify key 2147483647 int set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(2147483647, 888);
      expect(m.get(2147483647)).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_0400
     * @tc.name mapSetPart03Test004
     * @tc.desc Verify key (-2147483647 - 1) int set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(-2147483648, 777);
      expect(m.get(-2147483648)).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_0500
     * @tc.name mapSetPart03Test005
     * @tc.desc Verify key 0 int set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(0, 555);
      expect(m.get(0)).assertEqual(555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_0600
     * @tc.name mapSetPart03Test006
     * @tc.desc Verify key -1 int set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(-1, 444);
      expect(m.get(-1)).assertEqual(444);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_0700
     * @tc.name mapSetPart03Test007
     * @tc.desc Verify key set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('', 111);
      m.set('other', 222);
      expect(m.get('')).assertEqual(111);
      expect(m.get('other')).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_0800
     * @tc.name mapSetPart03Test008
     * @tc.desc Verify key set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('​', 333);
      expect(m.get('​')).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_0900
     * @tc.name mapSetPart03Test009
     * @tc.desc Verify key Unicode emoji emoji set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('😀', 444);
      expect(m.get('😀')).assertEqual(444);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_1000
     * @tc.name mapSetPart03Test010
     * @tc.desc Verify key XSS set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('<script>alert(1)</script>', 555);
      expect(m.get('<script>alert(1)</script>')).assertEqual(555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_1100
     * @tc.name mapSetPart03Test011
     * @tc.desc Verify key 10000 set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let longKey: string = '';
      for (let i = 0; i < 10000; i++) {
        longKey = longKey + 'a';
      }
      m.set(longKey, 999);
      expect(m.get(longKey)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_1200
     * @tc.name mapSetPart03Test012
     * @tc.desc Verify key null Map K null null set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string | null, int> = new Map<string | null, int>();
      m.set(null, 777);
      expect(m.get(null)).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_1300
     * @tc.name mapSetPart03Test013
     * @tc.desc Verify key undefined Map K undefined undefined set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string | undefined, int> = new Map<string | undefined, int>();
      m.set(undefined, 666);
      expect(m.get(undefined)).assertEqual(666);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_1400
     * @tc.name mapSetPart03Test014
     * @tc.desc Verify key boolean true true set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, int> = new Map<boolean, int>();
      m.set(true, 111);
      expect(m.get(true)).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_1500
     * @tc.name mapSetPart03Test015
     * @tc.desc Verify key boolean false false set get true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, int> = new Map<boolean, int>();
      m.set(false, 222);
      m.set(true, 333);
      expect(m.get(false)).assertEqual(222);
      expect(m.get(true)).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_1600
     * @tc.name mapSetPart03Test016
     * @tc.desc Verify key Date Date set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<Date, int> = new Map<Date, int>();
      let d: Date = new Date(2024, 0, 1);
      m.set(d, 888);
      expect(m.get(d)).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_1700
     * @tc.name mapSetPart03Test017
     * @tc.desc Verify key Date Date equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<Date, int> = new Map<Date, int>();
      let d1: Date = new Date(2024, 0, 1, 0, 0, 0, 0);
      let d2: Date = new Date(2024, 0, 1, 0, 0, 0, 0);
      m.set(d1, 100);
      m.set(d2, 200);
      expect(m.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_1800
     * @tc.name mapSetPart03Test018
     * @tc.desc Verify key RegExp RegExp set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<RegExp, int> = new Map<RegExp, int>();
      let r: RegExp = new RegExp('abc', 'g');
      m.set(r, 555);
      expect(m.get(r)).assertEqual(555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_1900
     * @tc.name mapSetPart03Test019
     * @tc.desc Verify key pattern RegExp RegExp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<RegExp, int> = new Map<RegExp, int>();
      let r1: RegExp = new RegExp('abc', 'g');
      let r2: RegExp = new RegExp('abc', 'g');
      m.set(r1, 100);
      m.set(r2, 200);
      expect(m.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_2000
     * @tc.name mapSetPart03Test020
     * @tc.desc Verify key object set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<ObjKey, int> = new Map<ObjKey, int>();
      let o: ObjKey = { id: 1 } as ObjKey;
      m.set(o, 777);
      expect(m.get(o)).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_2100
     * @tc.name mapSetPart03Test021
     * @tc.desc Verify key object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<ObjKey, int> = new Map<ObjKey, int>();
      let o1: ObjKey = { id: 1 } as ObjKey;
      let o2: ObjKey = { id: 1 } as ObjKey;
      m.set(o1, 100);
      m.set(o2, 200);
      expect(m.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_2200
     * @tc.name mapSetPart03Test022
     * @tc.desc Verify int 0 -0 0 int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(0, 100);
      m.set(-0 as int, 200);
      expect(m.get(0)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_2300
     * @tc.name mapSetPart03Test023
     * @tc.desc Verify val 2147483647 int get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('max', 2147483647);
      expect(m.get('max')).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_2400
     * @tc.name mapSetPart03Test024
     * @tc.desc Verify val (-2147483647 - 1) int get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('min', -2147483648);
      expect(m.get('min')).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_2500
     * @tc.name mapSetPart03Test025
     * @tc.desc Verify val 0xFFFFFFFF int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('overflow', -1);
      expect(m.get('overflow')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_2600
     * @tc.name mapSetPart03Test026
     * @tc.desc Verify val int 0 get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('zero', 0);
      expect(m.get('zero')).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_2700
     * @tc.name mapSetPart03Test027
     * @tc.desc Verify val int -1 get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('neg', -1);
      expect(m.get('neg')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_2800
     * @tc.name mapSetPart03Test028
     * @tc.desc Verify val null Map V null null set get null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int | null> = new Map<string, int | null>();
      m.set('nullVal', null);
      expect(m.get('nullVal')).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_2900
     * @tc.name mapSetPart03Test029
     * @tc.desc Verify val undefined Map V undefined undefined set get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int | undefined> = new Map<string, int | undefined>();
      m.set('undefVal', undefined);
      expect(m.get('undefVal')).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_3000
     * @tc.name mapSetPart03Test030
     * @tc.desc Verify val boolean true get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, boolean> = new Map<string, boolean>();
      m.set('boolTrue', true);
      expect(m.get('boolTrue')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_3100
     * @tc.name mapSetPart03Test031
     * @tc.desc Verify val boolean false false get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, boolean> = new Map<string, boolean>();
      m.set('boolFalse', false);
      expect(m.get('boolFalse')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_3200
     * @tc.name mapSetPart03Test032
     * @tc.desc Verify val Date Date set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, Date> = new Map<string, Date>();
      let d: Date = new Date(2024, 5, 15);
      m.set('dateVal', d);
      expect(m.get('dateVal')).assertEqual(d);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_3300
     * @tc.name mapSetPart03Test033
     * @tc.desc Verify val string set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>();
      m.set('strVal', 'hello');
      expect(m.get('strVal')).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_3400
     * @tc.name mapSetPart03Test034
     * @tc.desc Verify set this set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      const ret: Map<string, int> = m.set('a', 1);
      expect(ret).assertEqual(m);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_3500
     * @tc.name mapSetPart03Test035
     * @tc.desc Verify set key this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      const ret: Map<string, int> = m.set('a', 2);
      expect(ret).assertEqual(m);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_3600
     * @tc.name mapSetPart03Test036
     * @tc.desc Verify set this set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      const ret: Map<string, int> = m.set('a', 1).set('b', 2).set('c', 3);
      expect(ret).assertEqual(m);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_3700
     * @tc.name mapSetPart03Test037
     * @tc.desc Verify set key size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('dup', 1);
      m.set('dup', 2);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_3800
     * @tc.name mapSetPart03Test038
     * @tc.desc Verify set key 3 set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('x', 1);
      m.set('x', 2);
      m.set('x', 3);
      expect(m.get('x')).assertEqual(3);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_3900
     * @tc.name mapSetPart03Test039
     * @tc.desc Verify set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('key1', 100);
      m.set('key1', 200);
      expect(m.get('key1')).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_4000
     * @tc.name mapSetPart03Test040
     * @tc.desc Verify set get == 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('abc', 1);
      m.set('', 2);
      expect(m.size).assertEqual(2);
      expect(m.get('abc')).assertEqual(1);
      expect(m.get('')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_4100
     * @tc.name mapSetPart03Test041
     * @tc.desc Verify set get == 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('key', 1);
      m.set('​', 2);
      expect(m.size).assertEqual(2);
      expect(m.get('​')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_4200
     * @tc.name mapSetPart03Test042
     * @tc.desc Verify set emoji emoji emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('normal', 1);
      m.set('😀', 2);
      expect(m.size).assertEqual(2);
      expect(m.get('😀')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_4300
     * @tc.name mapSetPart03Test043
     * @tc.desc Verify set has set has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('present', 100);
      expect(m.has('present')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_4400
     * @tc.name mapSetPart03Test044
     * @tc.desc Verify keys iterator == 'a'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.set('c', 3);
      m.set('b', 999);
      let keys: string[] = [];
      let iter: IterableIterator<string> = m.keys();
      keys.push(iter.next().value! as string);
      keys.push(iter.next().value! as string);
      keys.push(iter.next().value! as string);
      expect(keys[0]).assertEqual('a');
      expect(keys[1]).assertEqual('b');
      expect(keys[2]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_4500
     * @tc.name mapSetPart03Test045
     * @tc.desc Verify set values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('x', 1);
      m.set('y', 2);
      m.set('x', 100);
      let vals: int[] = [];
      let vIter: IterableIterator<int> = m.values();
      vals.push(vIter.next().value! as int);
      vals.push(vIter.next().value! as int);
      expect(vals[0]).assertEqual(100);
      expect(vals[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_4600
     * @tc.name mapSetPart03Test046
     * @tc.desc Verify set get == 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let longKey: string = '';
      for (let i = 0; i < 10000; i++) {
        longKey = longKey + 'x';
      }
      m.set(longKey, 1);
      m.set(longKey, 2);
      expect(m.get(longKey)).assertEqual(2);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_4700
     * @tc.name mapSetPart03Test047
     * @tc.desc Verify set null null null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int | null> = new Map<string, int | null>();
      m.set('a', null);
      m.set('a', 999);
      expect(m.get('a')).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_4800
     * @tc.name mapSetPart03Test048
     * @tc.desc Verify set undefined undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int | undefined> = new Map<string, int | undefined>();
      m.set('a', undefined);
      m.set('a', 888);
      expect(m.get('a')).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_4900
     * @tc.name mapSetPart03Test049
     * @tc.desc Verify set delete key key set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('reAdd', 1);
      m.delete('reAdd');
      m.set('reAdd', 2);
      expect(m.get('reAdd')).assertEqual(2);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_5000
     * @tc.name mapSetPart03Test050
     * @tc.desc Verify set clear set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.clear();
      m.set('c', 3);
      expect(m.get('c')).assertEqual(3);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_5100
     * @tc.name mapSetPart03Test051
     * @tc.desc Verify set null null null size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string | null, int> = new Map<string | null, int>();
      m.set(null, 100);
      m.set(null, 200);
      expect(m.get(null)).assertEqual(200);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_5200
     * @tc.name mapSetPart03Test052
     * @tc.desc Verify set undefined undefined undefined size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string | undefined, int> = new Map<string | undefined, int>();
      m.set(undefined, 100);
      m.set(undefined, 200);
      expect(m.get(undefined)).assertEqual(200);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_5300
     * @tc.name mapSetPart03Test053
     * @tc.desc Verify set boolean true size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, int> = new Map<boolean, int>();
      m.set(true, 1);
      m.set(true, 2);
      expect(m.get(true)).assertEqual(2);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_5400
     * @tc.name mapSetPart03Test054
     * @tc.desc Verify float NaN set NaN get NaN NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, float> = new Map<string, float>();
      m.set('nanVal', Float.NaN);
      let v = m.get('nanVal')!;
      expect(v).not().assertEqual(v);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_5500
     * @tc.name mapSetPart03Test055
     * @tc.desc Verify float Infinity set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, float> = new Map<string, float>();
      m.set('infVal', Float.POSITIVE_INFINITY);
      expect(m.get('infVal')).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_5600
     * @tc.name mapSetPart03Test056
     * @tc.desc Verify float -Infinity set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, float> = new Map<string, float>();
      m.set('negInfVal', -Float.POSITIVE_INFINITY);
      expect(m.get('negInfVal')).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_5700
     * @tc.name mapSetPart03Test057
     * @tc.desc Verify float -0.0 set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, float> = new Map<string, float>();
      m.set('negZero', Double.toFloat(-0.0));
      expect(m.get('negZero')).assertEqual(-0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_5800
     * @tc.name mapSetPart03Test058
     * @tc.desc Verify double NaN set NaN get NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, double> = new Map<string, double>();
      m.set('dNan', Number.NaN);
      let v = m.get('dNan')!;
      expect(v).not().assertEqual(v);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_5900
     * @tc.name mapSetPart03Test059
     * @tc.desc Verify double Infinity set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, double> = new Map<string, double>();
      m.set('dInf', Number.POSITIVE_INFINITY);
      expect(m.get('dInf')).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_6000
     * @tc.name mapSetPart03Test060
     * @tc.desc Verify double -Infinity set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, double> = new Map<string, double>();
      m.set('dNegInf', -Number.POSITIVE_INFINITY);
      expect(m.get('dNegInf')).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_6100
     * @tc.name mapSetPart03Test061
     * @tc.desc Verify double Number.EPSILON set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, double> = new Map<string, double>();
      m.set('eps', Number.EPSILON);
      expect(m.get('eps')).assertEqual(Number.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_6200
     * @tc.name mapSetPart03Test062
     * @tc.desc Verify number NaN set number NaN get NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>();
      m.set('nNan', Number.NaN);
      let v = m.get('nNan')!;
      expect(v).not().assertEqual(v);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_6300
     * @tc.name mapSetPart03Test063
     * @tc.desc Verify number Number.POSITIVE_INFINITY set number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>();
      m.set('nPosInf', Number.POSITIVE_INFINITY);
      expect(m.get('nPosInf')).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_6400
     * @tc.name mapSetPart03Test064
     * @tc.desc Verify number Number.NEGATIVE_INFINITY set number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>();
      m.set('nNegInf', Number.NEGATIVE_INFINITY);
      expect(m.get('nNegInf')).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_6500
     * @tc.name mapSetPart03Test065
     * @tc.desc Verify long.MAX set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, long> = new Map<string, long>();
      m.set('longMax', 9223372036854775807);
      expect(m.get('longMax')).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_6600
     * @tc.name mapSetPart03Test066
     * @tc.desc Verify long.MIN set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, long> = new Map<string, long>();
      m.set('longMin', (-9223372036854775807 - 1));
      expect(m.get('longMin')).assertEqual((-9223372036854775807 - 1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_6700
     * @tc.name mapSetPart03Test067
     * @tc.desc Verify byte.MAX set byte 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, byte> = new Map<string, byte>();
      m.set('byteMax', 127 as byte);
      expect(m.get('byteMax')).assertEqual(127 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_6800
     * @tc.name mapSetPart03Test068
     * @tc.desc Verify byte.MIN set byte -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, byte> = new Map<string, byte>();
      m.set('byteMin', -128 as byte);
      expect(m.get('byteMin')).assertEqual(-128 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_6900
     * @tc.name mapSetPart03Test069
     * @tc.desc Verify short.MAX set short 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, short> = new Map<string, short>();
      m.set('shortMax', 32767 as short);
      expect(m.get('shortMax')).assertEqual(32767 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_7000
     * @tc.name mapSetPart03Test070
     * @tc.desc Verify short.MIN set short -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, short> = new Map<string, short>();
      m.set('shortMin', -32768 as short);
      expect(m.get('shortMin')).assertEqual(-32768 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_7100
     * @tc.name mapSetPart03Test071
     * @tc.desc Verify int key set 2147483647 set (-2147483647 - 1) (-2147483647 - 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('flip', 2147483647);
      m.set('flip', -2147483648);
      expect(m.get('flip')).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_7200
     * @tc.name mapSetPart03Test072
     * @tc.desc Verify float NaN NaN get float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, float> = new Map<string, float>();
      m.set('fn', Float.NaN);
      m.set('fn', Double.toFloat(3.14));
      expect(m.get('fn')).assertEqual(Double.toFloat(3.14));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_7300
     * @tc.name mapSetPart03Test073
     * @tc.desc Verify double Infinity Number.EPSILON get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, double> = new Map<string, double>();
      m.set('swap', Number.POSITIVE_INFINITY);
      m.set('swap', Number.EPSILON);
      expect(m.get('swap')).assertEqual(Number.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_7400
     * @tc.name mapSetPart03Test074
     * @tc.desc Verify number Number.NEGATIVE_INFINITY get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>();
      m.set('nVal', Number.NEGATIVE_INFINITY);
      m.set('nVal', 42.5);
      expect(m.get('nVal')).assertEqual(42.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_7500
     * @tc.name mapSetPart03Test075
     * @tc.desc Verify 2147483647 value set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 2147483647).set('b', -2147483648);
      expect(m.get('a')).assertEqual(2147483647);
      expect(m.get('b')).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_7600
     * @tc.name mapSetPart03Test076
     * @tc.desc Verify Map<int, string> set int string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      m.set(42, 'answer');
      expect(m.get(42)).assertEqual('answer');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_7700
     * @tc.name mapSetPart03Test077
     * @tc.desc Verify Map<string, number> set string number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>();
      m.set('nVal', 3.14159);
      expect(m.get('nVal')).assertEqual(3.14159);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_7800
     * @tc.name mapSetPart03Test078
     * @tc.desc Verify Map<string, bigint> set string long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, bigint> = new Map<string, bigint>();
      m.set('lVal', 10000000000n);
      expect(m.get('lVal')).assertEqual(10000000000n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_7900
     * @tc.name mapSetPart03Test079
     * @tc.desc Verify Map<string, Date> set string Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, Date> = new Map<string, Date>();
      let dt: Date = new Date(2024, 11, 31);
      m.set('yearEnd', dt);
      expect(m.get('yearEnd')).assertEqual(dt);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_8000
     * @tc.name mapSetPart03Test080
     * @tc.desc Verify Map<int, float> set int float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, float> = new Map<int, float>();
      m.set(1, Float.POSITIVE_INFINITY);
      expect(m.get(1)).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_8100
     * @tc.name mapSetPart03Test081
     * @tc.desc Verify Map<int, double> set int double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, double> = new Map<int, double>();
      m.set(1, Number.NaN);
      let v = m.get(1)!;
      expect(v).not().assertEqual(v);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_8200
     * @tc.name mapSetPart03Test082
     * @tc.desc Verify Map<boolean, string> set boolean string 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, string> = new Map<boolean, string>();
      m.set(true, 'yes');
      m.set(false, 'no');
      expect(m.get(true)).assertEqual('yes');
      expect(m.get(false)).assertEqual('no');
      expect(m.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_8300
     * @tc.name mapSetPart03Test083
     * @tc.desc Verify Map<Date, string> set Date string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<Date, string> = new Map<Date, string>();
      let d1: Date = new Date(2025, 0, 1);
      let d2: Date = new Date(2025, 6, 1);
      m.set(d1, 'jan');
      m.set(d2, 'jul');
      expect(m.get(d1)).assertEqual('jan');
      expect(m.get(d2)).assertEqual('jul');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_8400
     * @tc.name mapSetPart03Test084
     * @tc.desc Verify Map<RegExp, boolean> set RegExp boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<RegExp, boolean> = new Map<RegExp, boolean>();
      let r: RegExp = new RegExp('test', 'i');
      m.set(r, true);
      expect(m.get(r)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART03_TEST_8500
     * @tc.name mapSetPart03Test085
     * @tc.desc Verify Map<string | null, int> set null null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart03Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string | null, int> = new Map<string | null, int>();
      m.set(null, 999);
      m.set('normal', 111);
      expect(m.get(null)).assertEqual(999);
      expect(m.get('normal')).assertEqual(111);
    });

  });
}
