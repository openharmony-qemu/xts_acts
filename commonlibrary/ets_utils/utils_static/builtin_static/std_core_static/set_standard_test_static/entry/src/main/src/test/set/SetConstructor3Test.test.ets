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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
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
    beforeAll((): void => { });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => { });
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
     * @tc.desc Verify constructor without arguments creates empty Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetConstructor3003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_0300
     * @tc.desc Verify constructor with single-element array creates Set with that element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["a"]);
      expect(set.size).assertEqual(1);
      expect(set.has("a")).assertTrue();

    });

    /**
     * @tc.name testSetConstructor3004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_0400
     * @tc.desc Verify constructor with non-empty string array, Set contains all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["a", "b", "c"]);
      expect(set.size).assertEqual(3);
      expect(set.has("a")).assertTrue();
      expect(set.has("b")).assertTrue();
      expect(set.has("c")).assertTrue();
    });

    /**
     * @tc.name testSetConstructor3005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_0500
     * @tc.desc Verify constructor with non-empty number array, Set contains all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([1, 2, 3]);
      expect(set.size).assertEqual(3);
      expect(set.has(1)).assertTrue();
      expect(set.has(2)).assertTrue();
      expect(set.has(3)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor3006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_0600
     * @tc.desc Verify constructor with non-empty boolean array, Set contains true and false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<boolean>([true, false]);
      expect(set.size).assertEqual(2);
      expect(set.has(true)).assertTrue();
      expect(set.has(false)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor3007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_0700
     * @tc.desc Verify constructor with object reference array, Set contains all references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item1 = new Item007(1);
      let item2 = new Item007(2);
      let set = new Set<Item007>([item1, item2]);
      expect(set.size).assertEqual(2);
      expect(set.has(item1)).assertTrue();
      expect(set.has(item2)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor3008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_0800
     * @tc.desc Verify constructor with single-element array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([42]);
      expect(set.size).assertEqual(1);
      expect(set.has(42)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor3009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_0900
     * @tc.desc Verify constructor with large array, validate performance and correctness
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = [];
      for (let i = 0; i < 10000; i++) {
        arr.push("item_" + i.toString());
      }
      let set = new Set<string>(arr);
      expect(set.size).assertEqual(10000);
    });

    /**
     * @tc.name testSetConstructor3010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_1000
     * @tc.desc Verify constructor with duplicate string array, Set deduplicates
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["a", "b", "a", "c", "b"]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testSetConstructor3011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_1100
     * @tc.desc Verify constructor with duplicate number array, Set deduplicates
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([1, 2, 2, 3, 3, 3]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testSetConstructor3012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_1200
     * @tc.desc Verify constructor with duplicate boolean array, validate deduplication
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<boolean>([true, true, false, false, true]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetConstructor3013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_1300
     * @tc.desc Verify constructor with same object reference array, validate reference deduplication
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new Ref014(1);
      let set = new Set<Ref014>([r, r, r]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetConstructor3014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_1400
     * @tc.desc Verify constructor with array containing NaN, NaN treated as valid element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([Number.NaN, 1, 2]);
      expect(set.size).assertEqual(3);
      expect(set.has(Number.NaN)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor3015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_1500
     * @tc.desc Verify 0 and -0 are treated as same value and deduplicated to 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([0, -0]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetConstructor3016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_1600
     * @tc.desc Verify constructor with array containing number boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([0, -1, Number.MAX_VALUE, Number.MIN_VALUE, -Number.MAX_VALUE]);
      expect(set.size).assertEqual(5);
      expect(set.has(0)).assertTrue();
      expect(set.has(-1)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor3017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_1700
     * @tc.desc Verify constructor with array containing empty strings and whitespace
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["", " ", "a", "\t", "\n"]);
      expect(set.size).assertEqual(5);
      expect(set.has("")).assertTrue();
      expect(set.has(" ")).assertTrue();
    });

    /**
     * @tc.name testSetConstructor3018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_1800
     * @tc.desc Verify constructor with array containing Unicode/multi-language chars
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["中文", "日本語", "한국어", "테스트", "Test"]);
      expect(set.size).assertEqual(5);
      expect(set.has("中文")).assertTrue();
    });

    /**
     * @tc.name testSetConstructor3019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_1900
     * @tc.desc Verify constructor with array containing special chars and XSS strings
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["<script>alert(1)</script>", "​", "!@#$%^&*()", "test\0null"]);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testSetConstructor3020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_2000
     * @tc.desc Verify constructor with very long string element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr = LONG_STR;
      let set = new Set<string>([longStr]);
      expect(set.size).assertEqual(1);
      expect(set.has(longStr)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor3021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_2100
     * @tc.desc Verify constructor with array containing null elements (union type)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string | null>(["a", null, "b"]);
      expect(set.size).assertEqual(3);
      expect(set.has(null)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor3022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_2200
     * @tc.desc Verify constructor with array containing undefined elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string | undefined>(["a", undefined, "b"]);
      expect(set.size).assertEqual(3);
      expect(set.has(undefined)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor3023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_2300
     * @tc.desc Verify multiple null elements deduplication
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string | null>([null, null, "a", null]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetConstructor3024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_2400
     * @tc.desc Verify multiple undefined elements deduplication
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string | undefined>([undefined, undefined, "a", undefined]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetConstructor3025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_2500
     * @tc.desc Verify constructor with union type generic passing multiple element types
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string | number>(["a", 1, "b", 2]);
      expect(set.size).assertEqual(4);
      expect(set.has("a")).assertTrue();
      expect(set.has(1)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor3026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_2600
     * @tc.desc Verify passing null instead of array, validate type check
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>(null as Object as string[]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor3027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_2700
     * @tc.desc Verify passing undefined instead of array, validate type check
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>(undefined as Object as string[]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor3028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_2800
     * @tc.desc Verify passing number type instead of array, validate type error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>(42 as Object as string[]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor3029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_2900
     * @tc.desc Verify passing string type instead of array, validate type error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>("abc" as Object as string[]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor3030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_3000
     * @tc.desc Verify passing boolean type instead of array, validate type error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>(true as Object as string[]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor3031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_3100
     * @tc.desc Verify passing plain object instead of array, validate type error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = Error("non-array object");
        let set = new Set<string>(obj as Object as string[]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor3032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_3200
     * @tc.desc Verify passing Set instance instead of array, validate type error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set1 = new Set<string>(["a"]);
        let set2 = new Set<string>(set1 as Object as string[]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor3033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_3300
     * @tc.desc Verify constructor with array returns new Set instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["x", "y"]);
      expect(set.size).assertEqual(2);
      expect(set.has("x")).assertTrue();
      expect(set.has("y")).assertTrue();
    });

    /**
     * @tc.name testSetConstructor3034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_3400
     * @tc.desc Verify returned Set contains all array elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([10, 20, 30]);
      expect(set.size).assertEqual(3);
      expect(set.has(10)).assertTrue();
      expect(set.has(20)).assertTrue();
      expect(set.has(30)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor3035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_3500
     * @tc.desc Verify multiple constructor calls return different Set instances
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set1 = new Set<string>(["a", "b"]);
      let set2 = new Set<string>(["a", "b"]);
      expect(set1 === set2).assertFalse();
      expect(set1.size).assertEqual(set2.size);
    });

    /**
     * @tc.name testSetConstructor3036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_3600
     * @tc.desc Verify duplicate elements in array deduplicated, returned Set size is deduplicated count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([1, 1, 2, 2, 3, 3]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testSetConstructor3037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_3700
     * @tc.desc Verify multiple NaN elements only keep one in Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([Number.NaN, Number.NaN, Number.NaN]);
      expect(set.size).assertEqual(1);
      expect(set.has(Number.NaN)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor3038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_3800
     * @tc.desc Verify constructor return value is Set instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["a"]);
      expect(set.has("a")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetConstructor3039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_3900
     * @tc.desc Verify Set<string> element type is string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["hello"]);
      set.forEach((value: string): void => {
        let t: string = typeof value;
        expect(t).assertEqual("string");
      });
    });

    /**
     * @tc.name testSetConstructor3040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_4000
     * @tc.desc Verify Set<number> element type is number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([42]);
      set.forEach((value: number): void => {
        let t: string = typeof value;
        expect(t).assertEqual("number");
      });
    });

    /**
     * @tc.name testSetConstructor3041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_4100
     * @tc.desc Verify Set<boolean> element type is boolean
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<boolean>([true, false]);
      set.forEach((value: boolean): void => {
        let t: string = typeof value;
        expect(t).assertEqual("boolean");
      });
    });

    /**
     * @tc.name testSetConstructor3042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_4200
     * @tc.desc Verify Set<Object> element is object type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new Obj045();
      let set = new Set<Object>([obj]);
      set.forEach((value: Object): void => {
        expect(value instanceof Obj045).assertTrue();
      });
    });

    /**
     * @tc.name testSetConstructor3043
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_4300
     * @tc.desc Verify returned Set size property type is int
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["a", "b"]);
      let sizeType: string = typeof set.size;
      expect(sizeType).assertEqual("int");
    });

    /**
     * @tc.name testSetConstructor3044
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_4400
     * @tc.desc Verify large array with many duplicates, validate deduplicated size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [];
      for (let i = 0; i < 10000; i++) {
        arr.push(i % 100);
      }
      let set = new Set<number>(arr);
      expect(set.size).assertEqual(100);
    });

    /**
     * @tc.name testSetConstructor3045
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_4500
     * @tc.desc Verify constructor with all identical elements, Set size is 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = [];
      for (let i = 0; i < 1000; i++) {
        arr.push("same");
      }
      let set = new Set<string>(arr);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetConstructor3046
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_4600
     * @tc.desc Verify constructor with union type generic passing multiple element types
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string | number | boolean>(["a", 1, true, "b", 2, false]);
      expect(set.size).assertEqual(6);
      expect(set.has("a")).assertTrue();
      expect(set.has(1)).assertTrue();
      expect(set.has(true)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor3047
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_4700
     * @tc.desc Verify passing number type instead of array, catch exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>(123 as Object as string[]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor3048
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_4800
     * @tc.desc Verify passing string type instead of array, catch exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>("not_array" as Object as string[]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor3049
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_4900
     * @tc.desc Verify try-catch catches constructor exception with illegal parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>(-1 as Object as string[]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor3050
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_5000
     * @tc.desc Verify finally block executes after catching exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        let obj: Object = Error("empty object");
        let set = new Set<string>(obj as Object as string[]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });

    /**
     * @tc.name testSetConstructor3051
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_5100
     * @tc.desc Verify caught error object has Error properties
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>(false as Object as string[]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor3052
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_5200
     * @tc.desc Verify no residual Set instance after construction failure
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testSetConstructor3053
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_3_5300
     * @tc.desc Verify multiple consecutive try-catch exception captures are independent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor3053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
  });
}
