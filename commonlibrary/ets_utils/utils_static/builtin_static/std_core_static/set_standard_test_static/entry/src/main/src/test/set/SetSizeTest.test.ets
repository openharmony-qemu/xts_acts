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
import Utils from './../Util.test';

class Item028 {
  id: number = 0;

  constructor(id: number) {
    this.id = id;
  }
}

export default function SetSizeTest(): void {
  describe('SetSizeTest', (): void => {
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
     * @tc.name testSetSize001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_0100
     * @tc.desc Verify empty Set size property returns 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetSize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetSize002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_0200
     * @tc.desc Verify single-element Set size returns 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetSize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(1);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetSize003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_0300
     * @tc.desc Verify multi-element Set size returns correct count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetSize003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(1);
      set.add(2);
      set.add(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testSetSize004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_0400
     * @tc.desc Verify duplicate add does not change size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetSize004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(1);
      set.add(1);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetSize005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_0500
     * @tc.desc Verify multiple reads of size return consistent value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetSize005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(10);
      let size1 = set.size;
      let size2 = set.size;
      expect(size1).assertEqual(size2);
      expect(size1).assertEqual(1);
    });

    /**
     * @tc.name testSetSize006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_0600
     * @tc.desc Verify size property return value type is int
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetSize006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(1);
      let size: int = set.size;
      let type: string = typeof size;
      expect(type).assertEqual("int");
    });

    /**
     * @tc.name testSetSize007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_0700
     * @tc.desc Verify size return value is non-negative integer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetSize007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      let size = set.size;
      expect(size >= 0).assertTrue();
      expect(Number.isInteger(size)).assertTrue();
    });

    /**
     * @tc.name testSetSize008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_0800
     * @tc.desc Verify size return value equals actual element count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetSize008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>();
      set.add("a");
      set.add("b");
      set.add("c");
      let count = 0;
      set.forEach((): void => {
        count++;
      });
      expect(set.size).assertEqual(count);
    });

    /**
     * @tc.name testSetSize009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_0900
     * @tc.desc Verify size property returns consistent value after multiple reads
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetSize009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(1);
      set.add(2);
      let originalSize = set.size;
      expect(set.size).assertEqual(originalSize);
    });

    /**
     * @tc.name testSetSize010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_1000
     * @tc.desc Verify after add operation size increases by 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetSize010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      let sizeBefore = set.size;
      set.add(42);
      expect(set.size).assertEqual(sizeBefore + 1);
    });

    /**
     * @tc.name testSetSize011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_1100
     * @tc.desc Verify after duplicate add size unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetSize011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(1);
      let sizeBefore = set.size;
      set.add(1);
      expect(set.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.name testSetSize012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_1200
     * @tc.desc Verify after delete existing element size decreases by 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetSize012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(1);
      set.add(2);
      let sizeBefore = set.size;
      set.delete(1);
      expect(set.size).assertEqual(sizeBefore - 1);
    });

    /**
     * @tc.name testSetSize013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_1300
     * @tc.desc Verify after delete nonexistent element size unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetSize013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(1);
      let sizeBefore = set.size;
      set.delete(999);
      expect(set.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.name testSetSize014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_1400
     * @tc.desc Verify after clear operation size becomes 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetSize014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(1);
      set.add(2);
      set.add(3);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetSize015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_1500
     * @tc.desc Verify after clear on empty Set size still 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetSize015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetSize016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_1600
     * @tc.desc Verify after adding many elements size returns correct value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetSize016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      let count = 10000;
      for (let i = 0; i < count; i++) {
        set.add(i);
      }
      expect(set.size).assertEqual(count);
    });

    /**
     * @tc.name testSetSize017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_1700
     * @tc.desc Verify after mixed add delete clear operations size is correct
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetSize017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(1);
      set.add(2);
      set.add(3);
      expect(set.size).assertEqual(3);
      set.delete(2);
      expect(set.size).assertEqual(2);
      set.add(4);
      set.add(5);
      expect(set.size).assertEqual(4);
      set.clear();
      expect(set.size).assertEqual(0);
      set.add(10);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetSize018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_1800
     * @tc.desc Verify after adding null and undefined size is correct
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetSize018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<Object | null | undefined>();
      set.add(null);
      expect(set.size).assertEqual(1);
      set.add(undefined);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetSize019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_1900
     * @tc.desc Verify Set int size is correct
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetSize019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      set.add(1);
      set.add(2);
      set.add(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testSetSize020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_2000
     * @tc.desc Verify Set string size is correct
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetSize020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>();
      set.add("hello");
      set.add("world");
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetSize021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_2100
     * @tc.desc Verify Set boolean duplicate add size unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetSize021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<boolean>();
      set.add(true);
      set.add(true);
      set.add(true);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetSize022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_2200
     * @tc.desc Verify Set Object size is correct
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetSize022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<Object>();
      set.add(new Item028(1));
      set.add(new Item028(2));
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetSize023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_2300
     * @tc.desc Verify add same reference object size unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetSize023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let set = new Set<Object>();
      set.add(obj);
      set.add(obj);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetSize024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_2400
     * @tc.desc Verify different references with same content treated as distinct
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetSize024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number[]>();
      set.add([1, 2]);
      set.add([1, 2]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetSize025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_2500
     * @tc.desc Verify chained add calls size is correct
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetSize025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(1).add(2).add(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testSetSize026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_2600
     * @tc.desc Verify forEach traversal size unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetSize026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(1);
      set.add(2);
      set.add(3);
      let sizeInForEach: int = -1;
      set.forEach((): void => {
        sizeInForEach = set.size;
      });
      expect(sizeInForEach).assertEqual(3);
    });

    /**
     * @tc.name testSetSize027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_2700
     * @tc.desc Verify has operation does not affect size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetSize027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(1);
      let sizeBefore = set.size;
      set.has(1);
      set.has(999);
      expect(set.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.name testSetSize028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_2800
     * @tc.desc Verify Set constructed from array size equals deduplicated count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetSize028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 2, 3, 3, 3];
      let set = new Set<number>(arr);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testSetSize029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_2900
     * @tc.desc Verify size property used in conditional expressions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetSize029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      expect(set.size === 0).assertTrue();
      set.add(1);
      expect(set.size > 0).assertTrue();
      expect(set.size !== 0).assertTrue();
    });

    /**
     * @tc.name testSetSize030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_3000
     * @tc.desc Verify size property is read-only and cannot be modified via cast
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetSize030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      let originalSize: int = set.size;
      try {
        (set as Record<string, Object>)["size"] = 100;
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
      expect(set.size).assertEqual(originalSize);
    });
  });
}
