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

class MyObj021 {
  id: int = 0;

  constructor(id: int) {
    this.id = id;
  }
}

class MyObj022 {
  id: int = 0;

  constructor(id: int) {
    this.id = id;
  }
}

export default function SetDeleteTest(): void {
  describe('SetDeleteTest', (): void => {
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
     * @tc.name testSetDelete001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_0100
     * @tc.desc Verify delete with one parameter deletes existing element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<long>([1, 2, 3]);
      let result = set.delete(2);
      expect(result).assertTrue();
    });

    /**
     * @tc.name testSetDelete002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_0200
     * @tc.desc Verify delete without parameter throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      try {
        (set.delete as Object as () => void)();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetDelete003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_0300
     * @tc.desc Verify delete existing element returns true and reduces size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      let result = set.delete(2);
      expect(result).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetDelete004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_0400
     * @tc.desc Verify delete existing int element from Set<int>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      let result = set.delete(2);
      expect(result).assertTrue();
      expect(set.has(2)).assertFalse();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetDelete005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_0500
     * @tc.desc Verify delete nonexistent int element from Set<int>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      let result = set.delete(999);
      expect(result).assertFalse();
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testSetDelete006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_0600
     * @tc.desc Verify delete element with value 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([0, 1, 2]);
      let result = set.delete(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.name testSetDelete007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_0700
     * @tc.desc Verify delete element with value -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([-1, 0, 1]);
      let result = set.delete(-1);
      expect(result).assertTrue();
    });

    /**
     * @tc.name testSetDelete008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_0800
     * @tc.desc Verify delete int max value 2147483647 and min value -2147483648
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([2147483647, 1, 2]);
      let result = set.delete(2147483647);
      expect(result).assertTrue();

      let set2 = new Set<int>([-2147483648, 0, 1]);
      let result2 = set2.delete(-2147483648);
      expect(result2).assertTrue();

    });

    /**
     * @tc.name testSetDelete009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_0900
     * @tc.desc Verify passing string parameter to Set<int> delete, type mismatch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      try {
        set.delete("abc" as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetDelete010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_1000
     * @tc.desc Verify delete existing string element from Set<string>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["a", "b", "c"]);
      let result = set.delete("b");
      expect(result).assertTrue();
      expect(set.has("b")).assertFalse();
    });

    /**
     * @tc.name testSetDelete011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_1100
     * @tc.desc Verify delete nonexistent string element from Set<string>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["a", "b", "c"]);
      let result = set.delete("z");
      expect(result).assertFalse();
    });

    /**
     * @tc.name testSetDelete012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_1200
     * @tc.desc Verify delete empty string element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["", "a", "b"]);
      let result = set.delete("");
      expect(result).assertTrue();
    });

    /**
     * @tc.name testSetDelete013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_1300
     * @tc.desc Verify delete Unicode string element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["中文", "abc"]);
      let result = set.delete("中文");
      expect(result).assertTrue();
    });

    /**
     * @tc.name testSetDelete014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_1400
     * @tc.desc Verify delete string element with special characters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["<script>alert(1)</script>", "a"]);
      let result = set.delete("<script>alert(1)</script>");
      expect(result).assertTrue();
    });

    /**
     * @tc.name testSetDelete015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_1500
     * @tc.desc Verify delete zero-width space string element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["​", "a"]);
      let result = set.delete("​");
      expect(result).assertTrue();
    });

    /**
     * @tc.name testSetDelete016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_1600
     * @tc.desc Verify delete null value from Set<string> throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["a", "b"]);
      try {
        set.delete(null as Object as string);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetDelete017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_1700
     * @tc.desc Verify delete true from Set<boolean>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<boolean>([true, false]);
      let result = set.delete(true);
      expect(result).assertTrue();
      expect(set.has(true)).assertFalse();
    });

    /**
     * @tc.name testSetDelete018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_1800
     * @tc.desc Verify delete false from Set<boolean>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<boolean>([true, false]);
      let result = set.delete(false);
      expect(result).assertTrue();
      expect(set.has(false)).assertFalse();
    });

    /**
     * @tc.name testSetDelete019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_1900
     * @tc.desc Verify delete nonexistent boolean value from Set<boolean>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<boolean>([true]);
      let result = set.delete(false);
      expect(result).assertFalse();
    });

    /**
     * @tc.name testSetDelete020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_2000
     * @tc.desc Verify delete existing object reference from Set<Object>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new MyObj021(1);
      let obj2 = new MyObj021(2);
      let set = new Set<Object>([obj1, obj2]);
      let result = set.delete(obj1);
      expect(result).assertTrue();
      expect(set.has(obj1)).assertFalse();
    });

    /**
     * @tc.name testSetDelete021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_2100
     * @tc.desc Verify delete nonexistent object from Set<Object>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new MyObj022(1);
      let obj3 = new MyObj022(3);
      let set = new Set<Object>([obj1]);
      let result = set.delete(obj3);
      expect(result).assertFalse();
    });

    /**
     * @tc.name testSetDelete022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_2200
     * @tc.desc Verify delete null from Set<Object>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<Object>([new Object()]);
      try {
        set.delete(null as Object as Object);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetDelete023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_2300
     * @tc.desc Verify delete first and last element, remaining elements unaffected
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<long>([1, 2, 3, 4, 5]);
      let r1 = set.delete(1);
      expect(r1).assertTrue();
      let r2 = set.delete(5);
      expect(r2).assertTrue();
      expect(set.size).assertEqual(3);
      expect(set.has(2)).assertTrue();
      expect(set.has(3)).assertTrue();
      expect(set.has(4)).assertTrue();
    });

    /**
     * @tc.name testSetDelete024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_2400
     * @tc.desc Verify delete nonexistent element returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      let result = set.delete(999);
      expect(result).assertFalse();
    });

    /**
     * @tc.name testSetDelete025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_2500
     * @tc.desc Verify delete from empty Set returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<long>();
      let result = set.delete(1);
      expect(result).assertFalse();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetDelete026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_2600
     * @tc.desc Verify first delete succeeds returning true, second delete of same element returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<double>([1.0, 2.0, 3.0]);
      let result1 = set.delete(2.0);
      expect(result1).assertTrue();
      let result2 = set.delete(2.0);
      expect(result2).assertFalse();
    });

    /**
     * @tc.name testSetDelete027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_2700
     * @tc.desc Verify single-element Set size becomes 0 after delete
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<double>([42.0]);
      let result = set.delete(42.0);
      expect(result).assertTrue();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetDelete028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_2800
     * @tc.desc Verify delete then re-add same element, Set content correct
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<double>([1.0, 2.0]);
      set.delete(1.0);
      set.add(1.0);
      expect(set.size).assertEqual(2);
      expect(set.has(1.0)).assertTrue();
      expect(set.has(2)).assertTrue();
    });

    /**
     * @tc.name testSetDelete029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_2900
     * @tc.desc Verify delete method return value type is boolean
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<long>([1, 2, 3]);
      let result = set.delete(2);
      let type: string = typeof result;
      expect(type).assertEqual("boolean");
    });

    /**
     * @tc.name testSetDelete030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_3000
     * @tc.desc Verify return value strictly equals true when deleting existing element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      let result = set.delete(1);
      expect(result).assertTrue();
    });

    /**
     * @tc.name testSetDelete031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_3100
     * @tc.desc Verify return value strictly equals false when deleting nonexistent element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      let result = set.delete(999);
      expect(result === false).assertTrue();
    });

    /**
     * @tc.name testSetDelete032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_3200
     * @tc.desc Verify size decreases by 1 after successful delete
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<long>([1, 2, 3]);
      let oldSize = set.size;
      let result = set.delete(2);
      expect(result).assertTrue();
      expect(set.size).assertEqual(oldSize - 1);
    });

    /**
     * @tc.name testSetDelete033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_3300
     * @tc.desc Verify has returns false for deleted element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<float>([1.0, 2.0, 3.0]);
      set.delete(2.0);
      expect(set.has(2.0)).assertFalse();
    });

    /**
     * @tc.name testSetDelete034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_3400
     * @tc.desc Verify other elements are unaffected after deleting one element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      set.delete(2);
      expect(set.has(1)).assertTrue();
      expect(set.has(3)).assertTrue();
    });

    /**
     * @tc.name testSetDelete035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_3500
     * @tc.desc Verify forEach iteration does not include deleted element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<long>([1, 2, 3]);
      set.delete(2);
      let arr: long[] = [];
      set.forEach((value: long): void => {
        arr.push(value);
      });
      expect(arr.indexOf(2)).assertEqual(-1);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.name testSetDelete036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_3600
     * @tc.desc Verify consecutive delete of multiple elements, size and content correct
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<long>([1, 2, 3, 4]);
      expect(set.delete(1)).assertTrue();
      expect(set.delete(3)).assertTrue();
      expect(set.size).assertEqual(2);
      expect(set.has(2)).assertTrue();
      expect(set.has(4)).assertTrue();
    });

    /**
     * @tc.name testSetDelete037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_3700
     * @tc.desc Verify Set<string> delete with number parameter catches type mismatch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["a", "b"]);
      try {
        set.delete(123 as Object as string);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetDelete038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_3800
     * @tc.desc Verify normal delete of existing element does not throw exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["a", "d", "g"]);
      let result = set.delete("d");
      expect(result).assertTrue();
    });

    /**
     * @tc.name testSetDelete039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_3900
     * @tc.desc Verify delete with extra parameter deletes first argument only
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      let result = (set.delete as Object as (a: int, b: int) => boolean)(2, 999);
      expect(result).assertTrue();
      expect(set.size).assertEqual(2);
      expect(set.has(2)).assertFalse();
      expect(set.has(3)).assertTrue();
    });

    /**
     * @tc.name testSetDelete040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_4000
     * @tc.desc Verify delete existing custom class instance from Set of MyObj021 returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new MyObj021(1);
      let obj2 = new MyObj021(2);
      let set = new Set<MyObj021>([obj1, obj2]);
      let result = set.delete(obj1);
      expect(result).assertTrue();
      expect(set.size).assertEqual(1);
      expect(set.has(obj1)).assertFalse();
    });

    /**
     * @tc.name testSetDelete041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_4100
     * @tc.desc Verify delete nonexistent custom class instance from Set of MyObj021 returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new MyObj021(1);
      let set = new Set<MyObj021>([obj1]);
      let result = set.delete(new MyObj021(99));
      expect(result).assertFalse();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetDelete042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_4200
     * @tc.desc Verify delete from empty Set of MyObj021 returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<MyObj021>();
      let result = set.delete(new MyObj021(1));
      expect(result).assertFalse();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetDelete043
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_4300
     * @tc.desc Verify delete then re-add same custom class instance to Set of MyObj021
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new MyObj021(1);
      let obj2 = new MyObj021(2);
      let set = new Set<MyObj021>([obj1, obj2]);
      set.delete(obj1);
      set.add(obj1);
      expect(set.size).assertEqual(2);
      expect(set.has(obj1)).assertTrue();
    });

    /**
     * @tc.name testSetDelete044
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_4400
     * @tc.desc Verify other elements unaffected after deleting one custom class instance from Set of MyObj021
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new MyObj021(1);
      let obj2 = new MyObj021(2);
      let obj3 = new MyObj021(3);
      let set = new Set<MyObj021>([obj1, obj2, obj3]);
      set.delete(obj2);
      expect(set.has(obj1)).assertTrue();
      expect(set.has(obj3)).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetDelete045
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_4500
     * @tc.desc Verify delete MyObj021 instance and null independently from Set of MyObj021 pipe null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new MyObj021(1);
      let set = new Set<MyObj021 | null>([obj1, null]);
      let r1 = set.delete(obj1);
      expect(r1).assertTrue();
      expect(set.size).assertEqual(1);
      expect(set.has(obj1)).assertFalse();
      expect(set.has(null)).assertTrue();
    });

    /**
     * @tc.name testSetDelete046
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_4600
     * @tc.desc Verify delete MyObj021 instance and undefined independently from Set of MyObj021 pipe undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetDelete046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new MyObj021(1);
      let set = new Set<MyObj021 | undefined>([obj1, undefined]);
      let r1 = set.delete(undefined);
      expect(r1).assertTrue();
      expect(set.size).assertEqual(1);
      expect(set.has(undefined)).assertFalse();
      expect(set.has(obj1)).assertTrue();
    });
  });
}


