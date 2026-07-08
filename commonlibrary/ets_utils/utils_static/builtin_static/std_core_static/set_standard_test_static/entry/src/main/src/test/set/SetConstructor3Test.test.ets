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

class Item007 {
  id: number;

  constructor(id: number) {
    this.id = id;
  }
}

class Ref014 {
  val: number;

  constructor(val: number) {
    this.val = val;
  }
}

class Obj045 {
  key: string = "value";
}

export default function SetConstructor3Test(): void {
  describe('SetConstructor3Test', (): void => {
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
     * @tc.name testSetConstructor3001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_0100
     * @tc.desc Verify constructor with one K[] array parameter constructs Set instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["x", "y"]);
      expect(set.size).assertEqual(2);
      expect(set.has("y")).assertTrue();
    });

    /**
     * @tc.name testSetConstructor3002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_0200
     * @tc.desc Verify constructor with single-element array creates Set with that element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["a"]);
      expect(set.size).assertEqual(1);
      expect(set.has("a")).assertTrue();

    });

    /**
     * @tc.name testSetConstructor3003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_0300
     * @tc.desc Verify constructor with object reference array, Set contains all references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item1 = new Item007(1);
      let item2 = new Item007(2);
      let set = new Set<Item007>([item1, item2]);
      expect(set.size).assertEqual(2);
      expect(set.has(item1)).assertTrue();
      expect(set.has(item2)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor3004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_0400
     * @tc.desc Verify array constructor with single-element number array creates one-element Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([42]);
      expect(set.size).assertEqual(1);
      expect(set.has(42)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor3005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_0500
     * @tc.desc Verify constructor with duplicate string array, Set deduplicates
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["a", "b", "a", "c", "b"]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testSetConstructor3006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_0600
     * @tc.desc Verify constructor with duplicate boolean array, validate deduplication
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<boolean>([true, true, false, false, true]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetConstructor3007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_0700
     * @tc.desc Verify constructor with same object reference array, validate reference deduplication
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new Ref014(1);
      let set = new Set<Ref014>([r, r, r]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetConstructor3008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_0800
     * @tc.desc Verify constructor with array containing number boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([0, -1, Number.MAX_VALUE, Number.MIN_VALUE, -Number.MAX_VALUE]);
      expect(set.size).assertEqual(5);
      expect(set.has(0)).assertTrue();
      expect(set.has(-1)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor3009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_0900
     * @tc.desc Verify constructor with array containing empty strings and whitespace
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["", " ", "a", "\t", "\n"]);
      expect(set.size).assertEqual(5);
      expect(set.has("")).assertTrue();
      expect(set.has(" ")).assertTrue();
    });

    /**
     * @tc.name testSetConstructor3010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_1000
     * @tc.desc Verify constructor with array containing Unicode/multi-language chars
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["中文", "日本語", "한국어", "테스트", "Test"]);
      expect(set.size).assertEqual(5);
      expect(set.has("中文")).assertTrue();
    });

    /**
     * @tc.name testSetConstructor3011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_1100
     * @tc.desc Verify constructor with array containing special chars and XSS strings
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["<script>alert(1)</script>", "​", "!@#$%^&*()", "test\0null"]);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testSetConstructor3012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_1200
     * @tc.desc Verify multiple null elements deduplication
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string | null>([null, null, "a", null]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetConstructor3013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_1300
     * @tc.desc Verify multiple undefined elements deduplication
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string | undefined>([undefined, undefined, "a", undefined]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetConstructor3014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_1400
     * @tc.desc Verify passing null instead of array, validate type check
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>(null as Object as string[]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor3015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_1500
     * @tc.desc Verify passing undefined instead of array, validate type check
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>(undefined as Object as string[]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor3016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_1600
     * @tc.desc Verify passing number type instead of array, validate type error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>(42 as Object as string[]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor3017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_1700
     * @tc.desc Verify passing string type instead of array, validate type error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>("abc" as Object as string[]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor3018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_1800
     * @tc.desc Verify passing boolean type instead of array, validate type error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>(true as Object as string[]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor3019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_1900
     * @tc.desc Verify passing plain object instead of array, validate type error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = Error("non-array object");
        let set = new Set<string>(obj as Object as string[]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor3020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_2000
     * @tc.desc Verify passing Set instance instead of array, validate type error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set1 = new Set<string>(["a"]);
        let set2 = new Set<string>(set1 as Object as string[]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor3021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_2100
     * @tc.desc Verify constructor with array returns new Set instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["x", "y"]);
      expect(set.size).assertEqual(2);
      expect(set.has("x")).assertTrue();
      expect(set.has("y")).assertTrue();
    });

    /**
     * @tc.name testSetConstructor3022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_2200
     * @tc.desc Verify returned Set contains all array elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([10, 20, 30]);
      expect(set.size).assertEqual(3);
      expect(set.has(10)).assertTrue();
      expect(set.has(20)).assertTrue();
      expect(set.has(30)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor3023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_2300
     * @tc.desc Verify multiple constructor calls return different Set instances
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set1 = new Set<string>(["a", "b"]);
      let set2 = new Set<string>(["a", "b"]);
      expect(set1 === set2).assertFalse();
      expect(set1.size).assertEqual(set2.size);
    });

    /**
     * @tc.name testSetConstructor3024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_2400
     * @tc.desc Verify duplicate elements in array deduplicated, returned Set size is deduplicated count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([1, 1, 2, 2, 3, 3]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testSetConstructor3025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_2500
     * @tc.desc Verify multiple NaN elements only keep one in Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([Number.NaN, Number.NaN, Number.NaN]);
      expect(set.size).assertEqual(1);
      expect(set.has(Number.NaN)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor3026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_2600
     * @tc.desc Verify constructor return value is Set instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["a"]);
      expect(set.has("a")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetConstructor3027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_2700
     * @tc.desc Verify Set<boolean> element type is boolean
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<boolean>([true, false]);
      set.forEach((value: boolean): void => {
        let t: string = typeof value;
        expect(t).assertEqual("boolean");
      });
    });

    /**
     * @tc.name testSetConstructor3028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_2800
     * @tc.desc Verify Set<Object> element is object type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new Obj045();
      let set = new Set<Object>([obj]);
      set.forEach((value: Object): void => {
        expect(value instanceof Obj045).assertTrue();
      });
    });

    /**
     * @tc.name testSetConstructor3029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_2900
     * @tc.desc Verify array constructor with union type Set<string | number | boolean> combining three element types
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string | number | boolean>(["a", 1, true, "b", 2, false]);
      expect(set.size).assertEqual(6);
      expect(set.has("a")).assertTrue();
      expect(set.has(1)).assertTrue();
      expect(set.has(true)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor3030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_3000
     * @tc.desc Verify passing number type instead of array, catch exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>(123 as Object as string[]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor3031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_3100
     * @tc.desc Verify passing string type instead of array, catch exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>("not_array" as Object as string[]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor3032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_3200
     * @tc.desc Verify try-catch catches constructor exception with illegal parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>(-1 as Object as string[]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor3033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_3300
     * @tc.desc Verify array constructor type mismatch caught error has ClassCastError name
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>(false as Object as string[]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor3034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_3400
     * @tc.desc Verify no residual Set instance after construction failure
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set: Set<string> | null = null;
      try {
        let err: Object = Error("symbol not available");
        set = new Set<string>(err as Object as string[]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
      expect(set).assertNull();
    });

    /**
     * @tc.name testSetConstructor3035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_3500
     * @tc.desc Verify multiple consecutive try-catch exception captures are independent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errorCount = 0;
      try {
        let s1 = new Set<string>(null as Object as string[]);
        expect().assertFail();
      } catch (error) {
        errorCount++;
      }
      try {
        let s2 = new Set<string>(42 as Object as string[]);
        expect().assertFail();
      } catch (error) {
        errorCount++;
      }
      expect(errorCount).assertEqual(2);
    });

    /**
     * @tc.name testSetConstructor3036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_3600
     * @tc.desc Verify array constructor deduplicates duplicate int elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 2, 3, 3, 3]);
      expect(set.size).assertEqual(3);
      expect(set.has(1)).assertTrue();
      expect(set.has(2)).assertTrue();
      expect(set.has(3)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor3037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_3700
     * @tc.desc Verify array constructor with 10000 elements creates Set of correct size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      for (let i = 0; i < 10000; i++) {
        arr.push(i);
      }
      let set = new Set<int>(arr);
      expect(set.size).assertEqual(10000);
      expect(set.has(0)).assertTrue();
      expect(set.has(9999)).assertTrue();
      expect(set.has(10000)).assertFalse();
    });

    /**
     * @tc.name testSetConstructor3038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_3800
     * @tc.desc Verify constructor with Item007 array initializes Set of Item007
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item1 = new Item007(1);
      let item2 = new Item007(2);
      let set = new Set<Item007>([item1, item2]);
      expect(set.size).assertEqual(2);
      expect(set.has(item1)).assertTrue();
      expect(set.has(item2)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor3039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_3900
     * @tc.desc Verify constructor with duplicate Ref014 references deduplication in Set of Ref014
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new Ref014(1);
      let set = new Set<Ref014>([r, r, r]);
      expect(set.size).assertEqual(1);
      expect(set.has(r)).assertTrue();
    });
  });
}
