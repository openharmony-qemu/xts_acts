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

class Person007 {
  name: string = "";
  age: int = 0;
}

export default function ReadonlySetSizeTest(): void {
  describe('ReadonlySetSizeTest', (): void => {
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
     * @tc.name testReadonlySetSize001
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_SIZE_0100
     * @tc.desc Verify empty Set size property returns 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetSize002
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_SIZE_0200
     * @tc.desc Verify single-element Set size returns 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<float> = new Set<float>([10.0]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize003
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_SIZE_0300
     * @tc.desc Verify multi-element Set returns correct size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3, 4, 5]);
      expect(set.size).assertEqual(5);
    });

    /**
     * @tc.name testReadonlySetSize004
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_SIZE_0400
     * @tc.desc Verify duplicate add does not increase Set size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>();
      set.add(1);
      set.add(1);
      set.add(2);
      const readonlySet: ReadonlySet<int> = set;
      expect(readonlySet.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize005
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_SIZE_0500
     * @tc.desc Verify int type Set returns correct size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize006
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_SIZE_0600
     * @tc.desc Verify string type Set returns correct size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["a", "b", "c"]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize007
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_SIZE_0700
     * @tc.desc Verify number type Set returns correct size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([1.1, 2.2, 3.3]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize008
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_SIZE_0800
     * @tc.desc Verify Object type Set returns correct size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1 = new Person007();
      const p2 = new Person007();
      const set: ReadonlySet<Person007> = new Set<Person007>([p1, p2]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize009
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_SIZE_0900
     * @tc.desc Verify multiple reads of size return consistent value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<double> = new Set<double>([1.0, 2.0, 3.0]);
      expect(set.size).assertEqual(3);
      expect(set.size).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize010
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_SIZE_1000
     * @tc.desc Verify different references to same Set return consistent size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([1, 2, 3]);
      const ref1: ReadonlySet<int> = set;
      const ref2: ReadonlySet<int> = set;
      expect(ref1.size).assertEqual(ref2.size);
      expect(ref1.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize011
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_SIZE_1100
     * @tc.desc Verify size property return value type is int
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      const s: int = set.size;
      let t: string = typeof s;
      expect(t).assertEqual("int");
    });

    /**
     * @tc.name testReadonlySetSize012
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_SIZE_1200
     * @tc.desc Verify size always returns non-negative integer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptySet: ReadonlySet<long> = new Set<long>();
      expect(emptySet.size).assertEqual(0);
      const set: ReadonlySet<long> = new Set<long>([1]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize013
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_SIZE_1300
     * @tc.desc Verify size exactly matches unique element count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>();
      set.add("hello");
      set.add("world");
      set.add("hello");
      const readonlySet: ReadonlySet<string> = set;
      expect(readonlySet.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize014
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_SIZE_1400
     * @tc.desc Verify size accurate with large number of elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>();
      for (let i = 0; i < 1000; i++) {
        set.add(i);
      }
      const readonlySet: ReadonlySet<int> = set;
      expect(readonlySet.size).assertEqual(1000);
    });

    /**
     * @tc.name testReadonlySetSize015
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_SIZE_1500
     * @tc.desc Verify size property type is int
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>();
      let s = set.size;
      let sizeType: string = typeof s;
      expect(sizeType).assertEqual("int");
    });

    /**
     * @tc.name testReadonlySetSize016
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_SIZE_1600
     * @tc.desc Verify single-element Set returns 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([42]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize017
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_SIZE_1700
     * @tc.desc Verify size is read-only and cannot be modified via cast
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      let originalSize: int = set.size;
      try {
        (set as Record<string, Object>)["size"] = 100;
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
      expect(set.size).assertEqual(originalSize);
    });

    /**
     * @tc.name testReadonlySetSize018
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_SIZE_1800
     * @tc.desc Verify ReadonlySet size syncs with underlying Set modifications
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([1, 2, 3]);
      const readonlySet: ReadonlySet<int> = set;
      expect(readonlySet.size).assertEqual(3);
      set.add(4);
      expect(readonlySet.size).assertEqual(4);
      set.delete(1);
      expect(readonlySet.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize019
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_SIZE_1900
     * @tc.desc Verify empty Set size is not negative
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>();
      expect(set.size < 0).assertFalse();
    });

    /**
     * @tc.name testReadonlySetSize020
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_SIZE_2000
     * @tc.desc Verify 100 elements Set returns correct size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>();
      for (let i = 0; i < 100; i++) {
        set.add(i);
      }
      const readonlySet: ReadonlySet<int> = set;
      expect(readonlySet.size).assertEqual(100);
    });

    /**
     * @tc.name testReadonlySetSize021
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_SIZE_2100
     * @tc.desc Verify 10000 elements Set returns correct size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>();
      for (let i = 0; i < 10000; i++) {
        set.add(i);
      }
      const readonlySet: ReadonlySet<int> = set;
      expect(readonlySet.size).assertEqual(10000);
    });

    /**
     * @tc.name testReadonlySetSize022
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_SIZE_2200
     * @tc.desc Verify multiple NaN elements deduplicated to one in Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(Number.NaN);
      set.add(Number.NaN);
      set.add(Number.NaN);
      const readonlySet: ReadonlySet<number> = set;
      expect(readonlySet.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize023
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_SIZE_2300
     * @tc.desc Verify undefined and null as Set elements correctly counted in size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string | null | undefined> = new Set<string | null | undefined>();
      set.add("a");
      set.add(null);
      set.add(undefined);
      const readonlySet: ReadonlySet<string | null | undefined> = set;
      expect(readonlySet.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize024
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_SIZE_2400
     * @tc.desc Verify empty string counted as valid element in size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>();
      set.add("");
      set.add("a");
      const readonlySet: ReadonlySet<string> = set;
      expect(readonlySet.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize025
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_SIZE_2500
     * @tc.desc Verify 0 and -0 treated as same element in Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(0);
      set.add(-0);
      const readonlySet: ReadonlySet<number> = set;
      expect(readonlySet.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize026
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_SIZE_2600
     * @tc.desc Verify Set from array size equals deduplicated array length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 2, 3, 3, 3]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize027
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_SIZE_2700
     * @tc.desc Verify Set from empty array size is 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([]);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetSize028
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_SIZE_2800
     * @tc.desc Verify Set from other Set size equals source size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Set<int> = new Set<int>([1, 2, 3]);
      const set: ReadonlySet<int> = new Set<int>(source);
      expect(set.size).assertEqual(source.size);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize029
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_SIZE_2900
     * @tc.desc Verify ReadonlySet<boolean> returns correct size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<boolean> = new Set<boolean>([true, false]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize030
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_SIZE_3000
     * @tc.desc Verify ReadonlySet<int[]> returns correct size with distinct array instances
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: int[] = [1, 2];
      const arr2: int[] = [3, 4];
      const set: ReadonlySet<int[]> = new Set<int[]>([arr1, arr2]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize031
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_SIZE_3100
     * @tc.desc Verify ReadonlySet<Object> returns correct size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: Object = new Object();
      const obj2: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([obj1, obj2]);
      expect(set.size).assertEqual(2);
    });
  });
}
