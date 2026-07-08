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
import Utils from './../Util.test';

const LONG_STR = "a".repeat(10000);

class Item017 {
  id: int = 0;

  constructor(id: int) {
    this.id = id;
  }
}

export default function SetAddTest(): void {
  describe('SetAddTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.name testSetAdd001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_0100
     * @tc.desc Verify add with one parameter normally adds element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      set.add(10);
      expect(set.size).assertEqual(1);
      expect(set.has(10)).assertTrue();
    });

    /**
     * @tc.name testSetAdd002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_0200
     * @tc.desc Verify add throws error when no parameter is passed
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      try {
        (set.add as Object as () => void)();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetAdd003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_0300
     * @tc.desc Verify add single element increases size and element is retrievable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<long>();
      set.add(1);
      expect(set.size).assertEqual(1);
      expect(set.has(1)).assertTrue();
    });

    /**
     * @tc.name testSetAdd004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_0400
     * @tc.desc Verify add with int normal value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<double>();
      set.add(1.0);
      expect(set.has(1.0)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_0500
     * @tc.desc Verify add with int zero value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      set.add(0);
      expect(set.has(0)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_0600
     * @tc.desc Verify add with int negative value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<float>();
      set.add(1.0);
      expect(set.has(1.0)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_0700
     * @tc.desc Verify add with int max value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      set.add(2147483647);
      expect(set.has(2147483647)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_0800
     * @tc.desc Verify add with int min value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      set.add(-2147483648);
      expect(set.has(-2147483648)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_0900
     * @tc.desc Verify add with string normal value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>();
      set.add("hello");
      expect(set.has("hello")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_1000
     * @tc.desc Verify add with empty string as element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>();
      set.add("");
      expect(set.has("")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_1100
     * @tc.desc Verify add with Unicode string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>();
      set.add("你好世界🌍");
      expect(set.has("你好世界🌍")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_1200
     * @tc.desc Verify add with very long string as element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>();
      let longStr = LONG_STR;
      set.add(longStr);
      expect(set.has(longStr)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_1300
     * @tc.desc Verify add with special character string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>();
      set.add("\t\n\r");
      expect(set.has("\t\n\r")).assertTrue();
    });

    /**
     * @tc.name testSetAdd014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_1400
     * @tc.desc Verify add with boolean value true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<boolean>();
      set.add(true);
      expect(set.has(true)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_1500
     * @tc.desc Verify add with boolean value false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<boolean>();
      set.add(false);
      expect(set.has(false)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_1600
     * @tc.desc Verify true and false are treated as distinct elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<boolean>();
      set.add(true);
      set.add(false);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_1700
     * @tc.desc Verify add with Object type normal object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<Object>();
      let obj = new Item017(1);
      set.add(obj);
      expect(set.has(obj)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_1800
     * @tc.desc Verify duplicate add of same object reference does not increase size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<Object>();
      let obj: Object = {};
      set.add(obj);
      set.add(obj);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_1900
     * @tc.desc Verify different object references with same content are treated as distinct
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<Object>();
      set.add({});
      set.add({});
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_2000
     * @tc.desc Verify add null as element with Set<Object | null>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<Object | null>();
      set.add(null);
      expect(set.has(null)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_2100
     * @tc.desc Verify add undefined as element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<Object | undefined>();
      set.add(undefined);
      expect(set.has(undefined)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_2200
     * @tc.desc Verify add NaN value to number type Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(Number.NaN);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_2300
     * @tc.desc Verify add Number.MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(Number.MAX_VALUE);
      expect(set.has(Number.MAX_VALUE)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_2400
     * @tc.desc Verify add Number.MIN_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(Number.MIN_VALUE);
      expect(set.has(Number.MIN_VALUE)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_2500
     * @tc.desc Verify add floating-point precision value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(0.1 + 0.2);
      expect(set.has(0.30000000000000004)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_2600
     * @tc.desc Verify duplicate add of same int value, Set deduplicates
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<long>();
      set.add(42);
      set.add(42);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_2700
     * @tc.desc Verify duplicate add of same string value, Set deduplicates
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>();
      set.add("test");
      set.add("test");
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_2800
     * @tc.desc Verify multiple duplicate adds of same value keeps size at 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      for (let i = 0; i < 100; i++) {
        set.add(1);
      }
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_2900
     * @tc.desc Verify add method returns this (current Set object)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      let result = set.add(10);
      expect(result === set).assertTrue();
    });

    /**
     * @tc.name testSetAdd030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_3000
     * @tc.desc Verify return value is still this after adding new element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      let returned = set.add(1);
      expect(returned === set).assertTrue();
      expect(returned.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_3100
     * @tc.desc Verify return value is still this after adding duplicate element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      set.add(1);
      let returned = set.add(1);
      expect(returned === set).assertTrue();
      expect(returned.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_3200
     * @tc.desc Verify two consecutive chained add calls
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      set.add(10).add(20);
      expect(set.size).assertEqual(2);
      expect(set.has(10)).assertTrue();
      expect(set.has(20)).assertTrue();
    });

    /**
     * @tc.name testSetAdd033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_3300
     * @tc.desc Verify multiple consecutive chained add calls
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      set.add(1)
        .add(2)
        .add(3)
        .add(4)
        .add(5);
      expect(set.size).assertEqual(5);
    });

    /**
     * @tc.name testSetAdd034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_3400
     * @tc.desc Verify duplicate value in chain does not affect subsequent chained calls
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      set.add(1).add(2).add(1).add(3);
      expect(set.size).assertEqual(3);
      expect(set.has(1)).assertTrue();
      expect(set.has(2)).assertTrue();
      expect(set.has(3)).assertTrue();
    });

    /**
     * @tc.name testSetAdd035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_3500
     * @tc.desc Verify every step of chained call returns the same Set instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      let r1 = set.add(1);
      let r2 = r1.add(2);
      let r3 = r2.add(3);
      expect(r1 === set).assertTrue();
      expect(r2 === set).assertTrue();
      expect(r3 === set).assertTrue();
    });

    /**
     * @tc.name testSetAdd036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_3600
     * @tc.desc Verify add return value type is Set<K>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      let result: Set<int> = set.add(10);
      expect(result instanceof Set).assertTrue();
    });

    /**
     * @tc.name testSetAdd037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_3700
     * @tc.desc Verify return value can call has, delete and other Set methods
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      let returned = set.add(10);
      expect(returned.has(10)).assertTrue();
      expect(returned.size).assertEqual(1);
      let wasDeleted = returned.delete(10);
      expect(wasDeleted).assertTrue();
      expect(returned.size).assertEqual(0);
      returned.add(20);
      expect(returned.has(20)).assertTrue();
    });

    /**
     * @tc.name testSetAdd038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_3800
     * @tc.desc Verify adding element through return value affects original Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      let returned = set.add(1);
      returned.add(2);
      expect(set.size).assertEqual(2);
      expect(set.has(2)).assertTrue();
    });

    /**
     * @tc.name testSetAdd039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_3900
     * @tc.desc Verify passing incompatible type to Set<int> throws error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      try {
        (set.add as Object as (val: string) => void)("not_an_int");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetAdd040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_4000
     * @tc.desc Verify passing incompatible type to Set<string> throws error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>();
      try {
        (set.add as Object as (val: int) => void)(12345);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetAdd041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_4100
     * @tc.desc Verify add duplicate element does not change size and returns this
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      set.add(1);
      let sizeBefore: int = set.size;
      set.add(1);
      expect(set.size).assertEqual(sizeBefore);
      let returned = set.add(2);
      expect(returned === set).assertTrue();
    });

    /**
     * @tc.name testSetAdd042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_4200
     * @tc.desc Verify Set<string | number> add union type elements of different types
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string | number>();
      set.add("hello");
      set.add(42);
      set.add("world");
      set.add(99);
      expect(set.size).assertEqual(4);
      expect(set.has("hello")).assertTrue();
      expect(set.has(42)).assertTrue();
    });

    /**
     * @tc.name testSetAdd043
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_4300
     * @tc.desc Verify chained add with Set<string | number | boolean> union type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string | number | boolean>();
      set.add("a").add(1).add(true);
      expect(set.size).assertEqual(3);
      expect(set.has("a")).assertTrue();
      expect(set.has(1)).assertTrue();
      expect(set.has(true)).assertTrue();
    });

    /**
     * @tc.name testSetAdd044
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_4400
     * @tc.desc Verify union type Set deduplicates repeated elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string | number>();
      set.add("dup");
      set.add(42);
      set.add(42);
      set.add("dup");
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd045
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_4500
     * @tc.desc Verify add with custom class instance to Set of Item017 strongly typed
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item = new Item017(1);
      let set = new Set<Item017>();
      set.add(item);
      expect(set.size).assertEqual(1);
      expect(set.has(item)).assertTrue();
    });

    /**
     * @tc.name testSetAdd046
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_4600
     * @tc.desc Verify duplicate add of same custom class reference to Set of Item017 does not increase size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item = new Item017(1);
      let set = new Set<Item017>();
      set.add(item);
      set.add(item);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd047
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_4700
     * @tc.desc Verify add of different custom class instances with same field values treated as distinct in Set of Item017
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<Item017>();
      set.add(new Item017(1));
      set.add(new Item017(1));
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd048
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_4800
     * @tc.desc Verify add return value is this for Set of Item017 custom class typed
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<Item017>();
      let item = new Item017(1);
      let returned = set.add(item);
      expect(returned === set).assertTrue();
    });

    /**
     * @tc.name testSetAdd049
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_4900
     * @tc.desc Verify chained add with custom class instances on Set of Item017
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<Item017>();
      set.add(new Item017(1)).add(new Item017(2)).add(new Item017(3));
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testSetAdd050
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_5000
     * @tc.desc Verify has returns true for existing instance and false for different instance with same fields in Set of Item017
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<Item017>();
      let item = new Item017(1);
      set.add(item);
      expect(set.has(item)).assertTrue();
      expect(set.has(new Item017(1))).assertFalse();
    });

    /**
     * @tc.name testSetAdd051
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_5100
     * @tc.desc Verify Set of Item017 reuses Object-based add for backward verification
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<Object>();
      let obj = new Item017(100);
      set.add(obj);
      set.add(obj);
      expect(set.size).assertEqual(1);
      expect(set.has(obj)).assertTrue();
    });

    /**
     * @tc.name testSetAdd052
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_5200
     * @tc.desc Verify add Item017 instance and null to Set of Item017 pipe null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<Item017 | null>();
      let item = new Item017(1);
      set.add(item);
      set.add(null);
      expect(set.size).assertEqual(2);
      expect(set.has(item)).assertTrue();
      expect(set.has(null)).assertTrue();
    });

    /**
     * @tc.name testSetAdd053
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_5300
     * @tc.desc Verify add Item017 instance and undefined to Set of Item017 pipe undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<Item017 | undefined>();
      let item = new Item017(1);
      set.add(item);
      set.add(undefined);
      expect(set.size).assertEqual(2);
      expect(set.has(item)).assertTrue();
      expect(set.has(undefined)).assertTrue();
    });

    /**
     * @tc.name testSetAdd054
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_5400
     * @tc.desc Verify add Item017 null and undefined all three types to Set at once
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<Item017 | null | undefined>();
      let item = new Item017(1);
      set.add(item);
      set.add(null);
      set.add(undefined);
      expect(set.size).assertEqual(3);
      set.add(null);
      set.add(undefined);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testSetAdd055
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_5500
     * @tc.desc Verify delete from Set of Item017 pipe null removes null correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<Item017 | null>();
      let item = new Item017(1);
      set.add(item);
      set.add(null);
      set.delete(null);
      expect(set.size).assertEqual(1);
      expect(set.has(null)).assertFalse();
      expect(set.has(item)).assertTrue();
    });
	
	 /**
     * @tc.name testSetAdd056
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_5600
     * @tc.desc Verify add array type element to Set of int array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: int[] = [1, 2];
      let arr2: int[] = [3, 4];
      let set = new Set<int[]>([arr1, arr2]);
      expect(set.size).assertEqual(2);
      expect(set.has(arr1)).assertTrue();
    });

    /**
     * @tc.name testSetAdd057
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_5700
     * @tc.desc Verify add string array type element to Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: string[] = ["a", "b"];
      let arr2: string[] = ["c", "d"];
      let set = new Set<string[]>([arr1, arr2]);
      expect(set.size).assertEqual(2);
      expect(set.has(arr1)).assertTrue();
    });

    /**
     * @tc.name testSetAdd058
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ADD_5800
     * @tc.desc Verify add boolean array type element to Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: boolean[] = [true, false];
      let arr2: boolean[] = [false, true];
      let set = new Set<boolean[]>([arr1, arr2]);
      expect(set.size).assertEqual(2);
    });
  });
}
