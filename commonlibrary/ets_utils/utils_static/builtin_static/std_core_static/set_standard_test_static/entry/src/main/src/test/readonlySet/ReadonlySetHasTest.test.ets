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

class Person {
  name: string = "";
  age: int = 0;

  constructor(name: string, age: int) {
    this.name = name;
    this.age = age;
  }
}

class Person064 {
  name: string = "";
  age: int = 0;
}

export default function ReadonlySetHasTest(): void {
  describe('ReadonlySetHasTest', (): void => {
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
     * @tc.name testReadonlySetHas001
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0100
     * @tc.desc Verify has() with one parameter returns result normally
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      expect(set.has(2)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas002
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0200
     * @tc.desc Verify has() does not modify Set after query
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<float> = new Set<float>([1.0, 2.0, 3.0]);
      let sizeBefore: int = set.size;
      let result: boolean = set.has(2.0);
      expect(result).assertTrue();
      expect(set.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.name testReadonlySetHas003
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0300
     * @tc.desc Verify has() returns false for non-existent element in empty Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<double> = new Set<double>();
      expect(set.has(1.0)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas004
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0400
     * @tc.desc Verify has() returns true for existing int element in Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      expect(set.has(1)).assertTrue();
      expect(set.has(2)).assertTrue();
      expect(set.has(3)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas005
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0500
     * @tc.desc Verify has() returns false for nonexistent int element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      expect(set.has(100)).assertFalse();
      expect(set.has(-1)).assertFalse();
      expect(set.has(999)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas006
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0600
     * @tc.desc Verify has() returns true for int max value 2147483647
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([2147483647]);
      expect(set.has(2147483647)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas007
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0700
     * @tc.desc Verify has() returns true for int min value -2147483648
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([-2147483648]);
      expect(set.has(-2147483648)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas008
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0800
     * @tc.desc Verify has() returns true for zero value element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([0]);
      expect(set.has(0)).assertTrue();
      const set2: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      expect(set2.has(0)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas009
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0900
     * @tc.desc Verify has() returns true for negative element value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([-1, -100, -999]);
      expect(set.has(-1)).assertTrue();
      expect(set.has(-100)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas010
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1000
     * @tc.desc Verify has() returns true for hexadecimal int values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([0x10, 0xFF]);
      expect(set.has(0x10)).assertTrue();
      expect(set.has(0xFF)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas011
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1100
     * @tc.desc Verify has() with null for int generic parameter throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      try {
        set.has(null as Object as long);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testReadonlySetHas012
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1200
     * @tc.desc Verify has() with undefined for int generic parameter throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      try {
        set.has(undefined as Object as long);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testReadonlySetHas013
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1300
     * @tc.desc Verify has() with string value for int generic parameter throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      try {
        set.has("abc" as Object as long);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testReadonlySetHas014
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1400
     * @tc.desc Verify has() returns true for existing string element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["hello", "world"]);
      expect(set.has("hello")).assertTrue();
      expect(set.has("world")).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas015
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1500
     * @tc.desc Verify has() returns false for nonexistent string element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["hello", "world"]);
      expect(set.has("test")).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas016
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1600
     * @tc.desc Verify has() returns true for empty string element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>([""]);
      expect(set.has("")).assertTrue();
      const set2: ReadonlySet<string> = new Set<string>(["a", "b"]);
      expect(set2.has("")).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas017
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1700
     * @tc.desc Verify has() returns true for whitespace string element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>([" "]);
      expect(set.has(" ")).assertTrue();
      const set2: ReadonlySet<string> = new Set<string>([""]);
      expect(set2.has("")).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas018
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1800
     * @tc.desc Verify has() returns true for very long string element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = LONG_STR;
      const set: ReadonlySet<string> = new Set<string>([longStr]);
      expect(set.has(longStr)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas019
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1900
     * @tc.desc Verify has() returns true for Unicode string element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["中文", "a"]);
      expect(set.has("中文")).assertTrue();
      expect(set.has("a")).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas020
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_2000
     * @tc.desc Verify has() returns true for special character string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["<script>alert(1)</script>", "!@#$%"]);
      expect(set.has("<script>alert(1)</script>")).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas021
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_2100
     * @tc.desc Verify has() returns true for emoji string element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["😀", "🔥"]);
      expect(set.has("😀")).assertTrue();
      expect(set.has("🔥")).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas022
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_2200
     * @tc.desc Verify has() returns true for zero-width space string element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["​"]);
      expect(set.has("​")).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas023
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_2300
     * @tc.desc Verify has() returns true for multilingual strings
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["テスト", "테스트", "АБВГД", "الاختبار"]);
      expect(set.has("テスト")).assertTrue();
      expect(set.has("테스트")).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas024
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_2400
     * @tc.desc Verify has() with null for string generic parameter throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["hello"]);
      try {
        set.has(null as Object as string);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testReadonlySetHas025
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_2500
     * @tc.desc Verify has() with undefined for string generic parameter throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["hello"]);
      try {
        set.has(undefined as Object as string);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testReadonlySetHas026
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_2600
     * @tc.desc Verify has() returns true for existing number element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([1.5, 2.7, 3.14]);
      expect(set.has(1.5)).assertTrue();
      expect(set.has(3.14)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas027
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_2700
     * @tc.desc Verify has() returns true for Number.MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([Number.MAX_VALUE]);
      expect(set.has(Number.MAX_VALUE)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas028
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_2800
     * @tc.desc Verify has() returns true for Number.MIN_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([Number.MIN_VALUE]);
      expect(set.has(Number.MIN_VALUE)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas029
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_2900
     * @tc.desc Verify has() returns true for NaN value in Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([Number.NaN]);
      expect(set.has(Number.NaN)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas030
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_3000
     * @tc.desc Verify has() treats +0 and -0 as equal values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([0]);
      expect(set.has(0)).assertTrue();
      expect(set.has(-0)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas031
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_3100
     * @tc.desc Verify has() returns true for Infinity and -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY]);
      expect(set.has(Number.POSITIVE_INFINITY)).assertTrue();
      expect(set.has(Number.NEGATIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas032
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_3200
     * @tc.desc Verify has() returns true for scientific notation number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([1.0e6]);
      expect(set.has(1000000)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas033
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_3300
     * @tc.desc Verify has() returns true for boolean true value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<boolean> = new Set<boolean>([true, false]);
      expect(set.has(true)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas034
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_3400
     * @tc.desc Verify has() returns true for existing false boolean value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<boolean> = new Set<boolean>([true, false]);
      expect(set.has(false)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas035
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_3500
     * @tc.desc Verify has() returns false for nonexistent false boolean value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<boolean> = new Set<boolean>([true]);
      expect(set.has(false)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas036
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_3600
     * @tc.desc Verify has() returns true for same object reference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Person = new Person("Alice", 30);
      const set: ReadonlySet<Person> = new Set<Person>([p1]);
      expect(set.has(p1)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas037
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_3700
     * @tc.desc Verify has() returns false for different object with same properties
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Person = new Person("Alice", 30);
      let p2: Person = new Person("Alice", 30);
      const set: ReadonlySet<Person> = new Set<Person>([p1]);
      expect(set.has(p2)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas038
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_3800
     * @tc.desc Verify has() returns false for nonexistent object in Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Person = new Person("Alice", 30);
      let p3: Person = new Person("Bob", 25);
      const set: ReadonlySet<Person> = new Set<Person>([p1]);
      expect(set.has(p3)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas039
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_3900
     * @tc.desc Verify has() with null for object generic parameter throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Person064> = new Set<Person064>([new Person064()]);
      try {
        set.has(null as Object as Person064);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testReadonlySetHas040
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_4000
     * @tc.desc Verify has() returns true when target element exists in Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<short> = new Set<short>([1, 2, 3]);
      let result: boolean = set.has(2);
      expect(result).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas041
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_4100
     * @tc.desc Verify has() returns false when target element does not exist
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<short> = new Set<short>([1, 2, 3]);
      let result: boolean = set.has(5);
      expect(result).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas042
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_4200
     * @tc.desc Verify has() returns true for first element in multi-element Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([10, 20, 30, 40, 50]);
      expect(set.has(10)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas043
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_4300
     * @tc.desc Verify has() returns true for last element in multi-element Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([10, 20, 30, 40, 50]);
      expect(set.has(50)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas044
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_4400
     * @tc.desc Verify has() returns true for middle element in multi-element Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([10, 20, 30, 40, 50]);
      expect(set.has(30)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas045
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_4500
     * @tc.desc Verify has() returns false for any element in empty Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>();
      expect(set.has(1)).assertFalse();
      expect(set.has(0)).assertFalse();
      expect(set.has(-1)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas046
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_4600
     * @tc.desc Verify has() returns true for zero when Set contains 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([0]);
      expect(set.has(0)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas047
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_4700
     * @tc.desc Verify has() returns true for false when Set contains false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<boolean> = new Set<boolean>([false]);
      expect(set.has(false)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas048
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_4800
     * @tc.desc Verify has() returns true for element and false for others in single-element Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([42]);
      expect(set.has(42)).assertTrue();
      expect(set.has(41)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas049
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_4900
     * @tc.desc Verify has() works correctly for large Set element queries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      for (let i: int = 0; i < 1000; i++) {
        arr.push(i);
      }
      const set: ReadonlySet<int> = new Set<int>(arr);
      expect(set.has(0)).assertTrue();
      expect(set.has(999)).assertTrue();
      expect(set.has(500)).assertTrue();
      expect(set.has(1000)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas050
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_5000
     * @tc.desc Verify has() works with deduplicated Set constructed from duplicates
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 1, 2, 2, 3, 3]);
      expect(set.has(1)).assertTrue();
      expect(set.has(2)).assertTrue();
      expect(set.has(3)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas051
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_5100
     * @tc.desc Verify has() return value type is boolean
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      let result: boolean = set.has(1);
      let type: string = typeof result;
      expect(type).assertEqual("boolean");
    });

    /**
     * @tc.name testReadonlySetHas052
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_5200
     * @tc.desc Verify has() return value strictly equals true for existing element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      let result: boolean = set.has(1);
      expect(result).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas053
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_5300
     * @tc.desc Verify has() return value strictly equals false for nonexistent element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      let result: boolean = set.has(99);
      expect(result).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas054
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_5400
     * @tc.desc Verify has() returns consistent results for consecutive calls
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      expect(set.has(1)).assertTrue();
      expect(set.has(100)).assertFalse();
      expect(set.has(2)).assertTrue();
      expect(set.has(200)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas055
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_5500
     * @tc.desc Verify has() correctly alternates between existing and nonexistent queries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      let r1: boolean = set.has(1);
      let r2: boolean = set.has(99);
      expect(r1).assertTrue();
      expect(r2).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas056
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_5600
     * @tc.desc Verify has() returns same result on repeated queries (read-only)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      let r1: boolean = set.has(2);
      let r2: boolean = set.has(2);
      let r3: boolean = set.has(2);
      expect(r1 === r2).assertTrue();
      expect(r2 === r3).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas057
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_5700
     * @tc.desc Verify has() with null parameter catches Error object with instanceof check
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      let catchExecuted: boolean = false;
      try {
        set.has(null as Object as int);
      } catch (error) {
        catchExecuted = true;
        expect(error.name).assertEqual("ClassCastError");
      }
      expect(catchExecuted).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas058
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_5800
     * @tc.desc Verify has() with type mismatch enters catch block
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      let catchFlag: boolean = false;
      let finallyFlag: boolean = false;
      try {
        set.has(undefined as Object as int);
      } catch (error) {
        catchFlag = true;
        expect(error.name).assertEqual("ClassCastError");
      } finally {
        finallyFlag = true;
      }
      expect(catchFlag).assertTrue();
      expect(finallyFlag).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas059
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_5900
     * @tc.desc Verify has() with mismatched generic type catches Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      try {
        let obj: Object = Error("non-int object");
        set.has(obj as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testReadonlySetHas060
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_6000
     * @tc.desc Verify has() with string value for int generic catches Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      try {
        set.has("string" as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testReadonlySetHas061
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_6100
     * @tc.desc Verify has() with object value for int generic catches Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      try {
        let obj: Object = new Object();
        set.has(obj as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testReadonlySetHas062
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_6200
     * @tc.desc Verify ReadonlySet.has reflects new element after underlying Set add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mutableSet: Set<int> = new Set<int>([1, 2, 3]);
      const view: ReadonlySet<int> = mutableSet;
      expect(view.has(1)).assertTrue();
      mutableSet.add(4);
      expect(view.has(4)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas063
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_6300
     * @tc.desc Verify ReadonlySet.has reflects deletion after underlying Set delete
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mutableSet: Set<int> = new Set<int>([1, 2, 3]);
      const view: ReadonlySet<int> = mutableSet;
      mutableSet.delete(2);
      expect(view.has(2)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas064
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_6400
     * @tc.desc Verify ReadonlySet.has returns false for all after underlying Set clear
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mutableSet: Set<int> = new Set<int>([1, 2, 3]);
      const view: ReadonlySet<int> = mutableSet;
      mutableSet.clear();
      expect(view.has(1)).assertFalse();
      expect(view.has(3)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas065
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_6500
     * @tc.desc Verify ReadonlySet.has without parameter throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2]);
      try {
        let hasFn = (set as Record<string, Object>)["has"];
        (hasFn as Object as () => void)();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testReadonlySetHas066
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_6600
     * @tc.desc Verify ReadonlySet.has still returns true after mutating field of stored Person object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Person = new Person("Alice", 30);
      let mutableSet: Set<Person> = new Set<Person>([p1]);
      const view: ReadonlySet<Person> = mutableSet;
      p1.name = "ChangedName";
      p1.age = 999;
      expect(view.has(p1)).assertTrue();
    });
  });
}
