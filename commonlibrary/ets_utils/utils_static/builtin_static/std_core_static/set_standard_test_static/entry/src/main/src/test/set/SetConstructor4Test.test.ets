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

export default function SetConstructor4Test(): void {
  describe('SetConstructor4Test', (): void => {
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
     * @tc.name testSetConstructor4001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_0100
     * @tc.desc Verify constructor with one int parameter constructs Set normally
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(32);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetConstructor4002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_0200
     * @tc.desc Verify Set is usable after construction with bucketsCount
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(32);
      set.add("a");
      set.add("b");
      expect(set.size).assertEqual(2);
      expect(set.has("a")).assertTrue();
    });

    /**
     * @tc.name testSetConstructor4003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_0300
     * @tc.desc Verify bucketsCount 1 constructs Set with minimum bucket count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(1);
      expect(set.size).assertEqual(0);
      set.add("a");
      expect(set.has("a")).assertTrue();
    });

    /**
     * @tc.name testSetConstructor4004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_0400
     * @tc.desc Verify bucketsCount 10 constructs Set normally
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(10);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetConstructor4005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_0500
     * @tc.desc Verify bucketsCount 32 constructs common bucket count Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(32);
      set.add("a");
      expect(set.has("a")).assertTrue();
    });

    /**
     * @tc.name testSetConstructor4006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_0600
     * @tc.desc Verify bucketsCount 100 constructs larger bucket count Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(100);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetConstructor4007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_0700
     * @tc.desc Verify bucketsCount 10000 constructs large bucket count Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(10000);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetConstructor4008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_0800
     * @tc.desc Verify bucketsCount 0 boundary minimum value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetConstructor4009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_0900
     * @tc.desc Verify bucketsCount -1 negative boundary value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(-1);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetConstructor4010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_1000
     * @tc.desc Verify memory allocation with extremely large bucketsCount
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(2147483647);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetConstructor4011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_1100
     * @tc.desc Verify bucketsCount as int min value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(-2147483648);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetConstructor4012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_1200
     * @tc.desc Verify bucketsCount as hex value 0x10 (16)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(0x10);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetConstructor4013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_1300
     * @tc.desc Verify bucketsCount as octal value 0o10 (8)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(0o10);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetConstructor4014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_1400
     * @tc.desc Verify bucketsCount as binary value 0b1010 (10)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(0b1010);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetConstructor4015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_1500
     * @tc.desc Verify bucketsCount passing null, type mismatch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>(null as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor4016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_1600
     * @tc.desc Verify bucketsCount passing undefined, type mismatch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>(undefined as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor4017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_1700
     * @tc.desc Verify bucketsCount passing string type, type mismatch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>("32" as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor4018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_1800
     * @tc.desc Verify bucketsCount passing empty string, type mismatch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>("" as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor4019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_1900
     * @tc.desc Verify bucketsCount passing NaN, invalid int value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>(Number.NaN as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor4020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_2000
     * @tc.desc Verify bucketsCount passing float 3.14, int mismatch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Set<string>(3.14 as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor4021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_2100
     * @tc.desc Verify bucketsCount passing boolean true, type mismatch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>(true as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor4022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_2200
     * @tc.desc Verify bucketsCount passing boolean false, type mismatch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>(false as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor4023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_2300
     * @tc.desc Verify bucketsCount passing object type, type mismatch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = Error("non-int object");
        let set = new Set<string>(obj as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor4024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_2400
     * @tc.desc Verify bucketsCount passing array type, type mismatch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>([32] as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor4025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_2500
     * @tc.desc Verify bucketsCount passing extremely large value Number.MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>(Number.MAX_VALUE as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor4026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_2600
     * @tc.desc Verify bucketsCount passing extremely small value Number.MIN_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Set<string>(Number.MIN_VALUE as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor4027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_2700
     * @tc.desc Verify bucketsCount passing Infinity, invalid int
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>(Number.POSITIVE_INFINITY as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor4028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_2800
     * @tc.desc Verify bucketsCount passing -Infinity, invalid int
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>(Number.NEGATIVE_INFINITY as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor4029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_2900
     * @tc.desc Verify constructor with different generic type Set number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>(32);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetConstructor4030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_3000
     * @tc.desc Verify constructor with different generic types all succeed
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let setStr = new Set<string>(16);
      let setNum = new Set<number>(16);
      let setBool = new Set<boolean>(16);
      expect(setStr.size).assertEqual(0);
      expect(setNum.size).assertEqual(0);
      expect(setBool.size).assertEqual(0);
    });

    /**
     * @tc.name testSetConstructor4031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_3100
     * @tc.desc Verify construction result with negative bucketsCount
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(-10);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetConstructor4032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_3200
     * @tc.desc Verify return value type is Set<K>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set: Set<string> = new Set<string>(32);
      expect(set instanceof Set).assertTrue();
    });

    /**
     * @tc.name testSetConstructor4033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_3300
     * @tc.desc Verify return value is not Array, Map or other types
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(32);
      expect(set instanceof Array).assertFalse();
      expect(set instanceof Map).assertFalse();
    });

    /**
     * @tc.name testSetConstructor4034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_3400
     * @tc.desc Verify forEach on empty newly constructed Set iterates zero times
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(32);
      let count: int = 0;
      set.forEach((value: string, key: string): void => {
        count++;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testSetConstructor4035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_3500
     * @tc.desc Verify has returns false for any element in empty Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(32);
      expect(set.has("a")).assertFalse();
    });

    /**
     * @tc.name testSetConstructor4036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_3600
     * @tc.desc Verify passing string type triggers try-catch exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>("abc" as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor4037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_3700
     * @tc.desc Verify specified bucket count and default bucket count Set behave consistently
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set1 = new Set<string>(32);
      let set2 = new Set<string>();
      set1.add("a");
      set2.add("a");
      expect(set1.has("a")).assertTrue();
      expect(set2.has("a")).assertTrue();
      expect(set1.size).assertEqual(set2.size);
    });

    /**
     * @tc.name testSetConstructor4038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_3800
     * @tc.desc Verify larger bucket count Set performs normally with large data
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>(1024);
      for (let i = 0; i < 1000; i++) {
        set.add(i);
      }
      expect(set.size).assertEqual(1000);
      expect(set.has(0)).assertTrue();
      expect(set.has(999)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor4039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_3900
     * @tc.desc Verify continuous add/has/delete operations work after construction
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(32);
      set.add("a");
      set.add("b");
      set.add("c");
      expect(set.size).assertEqual(3);
      set.delete("b");
      expect(set.size).assertEqual(2);
      expect(set.has("b")).assertFalse();
    });

    /**
     * @tc.name testSetConstructor4040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_4_4000
     * @tc.desc Verify clear operation works normally after construction
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor4040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(32);
      set.add("a");
      set.add("b");
      set.clear();
      expect(set.size).assertEqual(0);
    });
  });
}
