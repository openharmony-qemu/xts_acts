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

class HasPerson {
  name: string = "";
  age: int = 0;
}

class HasFinal {
  id: int = 0;
}

interface HasDrawable {
  draw(): void;
}

class HasCircle implements HasDrawable {
  draw(): void {
  }
}

enum HasColor {
  RED, GREEN, BLUE
}



class Hp2Node {
  key: int = 0;
}

enum Hp2Mode {
  ON, OFF
}

export default function ReadonlySetHas2Test(): void {
  describe('ReadonlySetHas2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0010
     * @tc.desc Verify has() with ReadonlySet<float> for float values -1.5, 0.0, 2.5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<float> = new Set<float>([-1.5 as float, 0.0 as float, 2.5 as float]);
      expect(set.has(-1.5 as float)).assertTrue();
      expect(set.has(0.0 as float)).assertTrue();
      expect(set.has(2.5 as float)).assertTrue();
      expect(set.has(99.9 as float)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas002
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0020
     * @tc.desc Verify has() with ReadonlySet<double> for double boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<double> = new Set<double>([-1.79e308, 0.0, 1.79e308]);
      expect(set.has(-1.79e308)).assertTrue();
      expect(set.has(0.0)).assertTrue();
      expect(set.has(1.79e308)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas003
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0030
     * @tc.desc Verify has() with ReadonlySet<boolean> for true and false values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<boolean> = new Set<boolean>([true, false]);
      expect(set.has(true)).assertTrue();
      expect(set.has(false)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas004
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0040
     * @tc.desc Verify has() with Object references returns true for same reference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([obj]);
      expect(set.has(obj)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas005
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0050
     * @tc.desc Verify has() return value type is boolean
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      const r: boolean = set.has(1);
      const t: string = typeof r;
      expect(t).assertEqual("boolean");
      expect(r).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas006
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0060
     * @tc.desc Verify has() returns true for NaN element in Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([Number.NaN, 1.0]);
      expect(set.has(Number.NaN)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas007
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0070
     * @tc.desc Verify has() treats -0 and +0 as the same value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([0]);
      expect(set.has(-0)).assertTrue();
      const set2: ReadonlySet<number> = new Set<number>([-0]);
      expect(set2.has(0)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas008
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0080
     * @tc.desc Verify has() treats 1.0 as equal to 1 in Set<number>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([1, 2]);
      expect(set.has(1.0)).assertTrue();
      expect(set.has(2.0)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas009
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0090
     * @tc.desc Verify has() returns true for all elements and false for non-elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([10, 20, 30]);
      expect(set.has(10)).assertTrue();
      expect(set.has(20)).assertTrue();
      expect(set.has(30)).assertTrue();
      expect(set.has(40)).assertFalse();
      expect(set.has(0)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas010
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0100
     * @tc.desc Verify has() returns true for members and false for non-members
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([5, 6, 7]);
      expect(set.has(5)).assertTrue();
      expect(set.has(99)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas011
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0110
     * @tc.desc Verify multiple ReadonlySet references return same has result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([1, 2, 3]);
      const r1: ReadonlySet<int> = ms;
      const r2: ReadonlySet<int> = ms;
      expect(r1.has(2)).assertTrue();
      expect(r2.has(2)).assertTrue();


    });

    /**
     * @tc.name testReadonlySetHas012
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0120
     * @tc.desc Verify underlying Set add is reflected in has() result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([1, 2]);
      const view: ReadonlySet<int> = ms;
      ms.add(3);
      expect(view.has(3)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas013
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0130
     * @tc.desc Verify underlying Set clear makes has() return false for all
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([1, 2, 3]);
      const view: ReadonlySet<int> = ms;
      ms.clear();
      expect(view.has(1)).assertFalse();
      expect(view.has(2)).assertFalse();
      expect(view.has(3)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas014
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0140
     * @tc.desc Verify has() with int[] array reference returns true for same reference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [1, 2, 3];
      const set: ReadonlySet<int[]> = new Set<int[]>([arr]);
      expect(set.has(arr)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas015
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0150
     * @tc.desc Verify has() with nested Set reference returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Set<int> = new Set<int>([1, 2]);
      const set: ReadonlySet<Set<int>> = new Set<Set<int>>([inner]);
      expect(set.has(inner)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas016
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0160
     * @tc.desc Verify has() is unaffected by failed modification attempt via cast
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      try {
        (set as Record<string, Object>)["size"] = 100;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(set.has(1)).assertTrue();
      expect(set.has(4)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas017
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0170
     * @tc.desc Verify has() after constructing ReadonlySet from array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      expect(set.has(1)).assertTrue();
      expect(set.has(3)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas018
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0180
     * @tc.desc Verify has() still true after mutating stored object fields
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: HasPerson = new HasPerson();
      p.name = "Alice";
      const set: ReadonlySet<HasPerson> = new Set<HasPerson>([p]);
      p.name = "Changed";
      expect(set.has(p)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas019
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0190
     * @tc.desc Verify has() with ReadonlySet<HasColor> for enum values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<HasColor> = new Set<HasColor>([HasColor.RED, HasColor.GREEN]);
      expect(set.has(HasColor.RED)).assertTrue();
      expect(set.has(HasColor.BLUE)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas020
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0200
     * @tc.desc Verify has() with ReadonlySet<byte> for byte boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<byte> = new Set<byte>([-128, 0, 127]);
      expect(set.has(-128)).assertTrue();
      expect(set.has(0)).assertTrue();
      expect(set.has(127)).assertTrue();
      expect(set.has(100)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas021
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0210
     * @tc.desc Verify has() with ReadonlySet<short> for short boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<short> = new Set<short>([-32768, 0, 32767]);
      expect(set.has(-32768)).assertTrue();
      expect(set.has(32767)).assertTrue();
      expect(set.has(1 as short)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas022
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0220
     * @tc.desc Verify has() with ReadonlySet<char> for char elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<char> = new Set<char>([c'A', c'B']);
      expect(set.has(c'A')).assertTrue();
      expect(set.has(c'C')).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas023
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0230
     * @tc.desc Verify has() with ReadonlySet<bigint> for bigint elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<bigint> = new Set<bigint>([100n, 200n]);
      expect(set.has(100n)).assertTrue();
      expect(set.has(300n)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas024
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0240
     * @tc.desc Verify has() with FixedArray<int> returns true for same reference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = new FixedArray<int>(2, 0);
      fa[0] = 10;
      fa[1] = 20;
      const set: ReadonlySet<FixedArray<int>> = new Set<FixedArray<int>>([fa]);
      expect(set.has(fa)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas025
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0250
     * @tc.desc Verify has() with Set<long> for large and small int values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([2147483647, -2147483648, 0]);
      expect(set.has(2147483647)).assertTrue();
      expect(set.has(-2147483648)).assertTrue();
      expect(set.has(0)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas026
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0260
     * @tc.desc Verify has() with union string|int type Set queries correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string | int> = new Set<string | int>();
      (set as Set<string | int>).add("key");
      (set as Set<string | int>).add(42);
      expect(set.has("key")).assertTrue();
      expect(set.has(42)).assertTrue();
      expect(set.has(99)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas027
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0270
     * @tc.desc Verify has() with null cast to int generic throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      try {
        set.has(null as Object as int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testReadonlySetHas028
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0280
     * @tc.desc Verify has() with undefined cast to int generic throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      try {
        set.has(undefined as Object as int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testReadonlySetHas029
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0290
     * @tc.desc Verify has() with string cast to int generic throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      try {
        set.has("str" as Object as int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testReadonlySetHas030
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0300
     * @tc.desc Verify has() with ReadonlySet<HasFinal> for final class objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: HasFinal = new HasFinal();
      f.id = 1;
      const set: ReadonlySet<HasFinal> = new Set<HasFinal>([f]);
      expect(set.has(f)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas031
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0310
     * @tc.desc Verify has() with interface type Set for implementor references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: HasCircle = new HasCircle();
      const set: ReadonlySet<HasDrawable> = new Set<HasDrawable>([c]);
      expect(set.has(c)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas032
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0320
     * @tc.desc Verify has() on deduplicated Set with duplicate constructor elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 1, 2, 2, 3, 3]);
      expect(set.has(1)).assertTrue();
      expect(set.has(2)).assertTrue();
      expect(set.has(3)).assertTrue();
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetHas033
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0330
     * @tc.desc Verify has() returns false for different object with same properties
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: HasPerson = new HasPerson();
      p1.name = "Alice";
      let p2: HasPerson = new HasPerson();
      p2.name = "Alice";
      const set: ReadonlySet<HasPerson> = new Set<HasPerson>([p1]);
      expect(set.has(p2)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas034
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0340
     * @tc.desc Verify has() with ValueArray<int> reference returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let va: ValueArray<int> = new ValueArray<int>(3, 0);
      va[0] = 1;
      va[1] = 2;
      va[2] = 3;
      const set: ReadonlySet<ValueArray<int>> = new Set<ValueArray<int>>([va]);
      expect(set.has(va)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas035
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0350
     * @tc.desc Verify has() with 2D int[][] array same reference returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mat: int[][] = [[1, 2], [3, 4]];
      const set: ReadonlySet<int[][]> = new Set<int[][]>([mat]);
      expect(set.has(mat)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas036
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0360
     * @tc.desc Verify has() with surrogate pair string element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["𝄞", "abc"]);
      expect(set.has("𝄞")).assertTrue();
      expect(set.has("xyz")).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas037
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0370
     * @tc.desc Verify has() for matching element in Set<number> with precision boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([9007199254740992]);
      expect(set.has(9007199254740992)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas038
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0380
     * @tc.desc Verify has() with 10000-item Set finds first, middle, last correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      for (let i: int = 0; i < 10000; i++) {
        arr.push(i);
      }
      const set: ReadonlySet<int> = new Set<int>(arr);
      expect(set.has(0)).assertTrue();
      expect(set.has(5000)).assertTrue();
      expect(set.has(9999)).assertTrue();
      expect(set.has(-1)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas039
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0390
     * @tc.desc Verify has() with Set containing only different objects returns false for new object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Object> = new Set<Object>([new Object()]);
      expect(set.has(new Object())).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas040
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0400
     * @tc.desc Verify has() with forEach then has consistency
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3, 4, 5]);
      set.forEach((v: int): void => {
        expect(set.has(v)).assertTrue();
      });
    });

    /**
     * @tc.name testReadonlySetHas041
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0410
     * @tc.desc Verify has() with entries traversal then all has true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["a", "b", "c"]);
      for (const entry of set.entries()) {
        expect(set.has(entry[0])).assertTrue();
      }
    });

    /**
     * @tc.name testReadonlySetHas042
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0420
     * @tc.desc Verify has() for long max minus 1 and min plus 1 boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([9223372036854775806, -9223372036854775807]);
      expect(set.has(9223372036854775806)).assertTrue();
      expect(set.has(-9223372036854775807)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas043
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0430
     * @tc.desc Verify has() with enum const reference returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<HasColor> = new Set<HasColor>([HasColor.RED, HasColor.GREEN, HasColor.BLUE]);
      expect(set.has(HasColor.RED)).assertTrue();
      expect(set.has(HasColor.GREEN)).assertTrue();
      expect(set.has(HasColor.BLUE)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas044
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0440
     * @tc.desc Verify underlying Set add then delete then has false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>();
      ms.add(99);
      const view: ReadonlySet<int> = ms;
      expect(view.has(99)).assertTrue();
      ms.delete(99);
      expect(view.has(99)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas045
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0450
     * @tc.desc Verify has with undefined string and empty string counted differently
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["", "a"]);
      expect(set.has("")).assertTrue();
      expect(set.has("a")).assertTrue();
      expect(set.has(" ")).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas046
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0460
     * @tc.desc Verify has with bigint returns false for out-of-range value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<bigint> = new Set<bigint>([10n, 20n]);
      expect(set.has(10n)).assertTrue();
      expect(set.has(30n)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas047
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0470
     * @tc.desc Verify has with Set<number> containing both integer and floating values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([1, 2.5, 3.14]);
      expect(set.has(1)).assertTrue();
      expect(set.has(2.5)).assertTrue();
      expect(set.has(3.14)).assertTrue();
      expect(set.has(2)).assertFalse();
    });

/**
     * @tc.name testReadonlySetHas048
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0480
     * @tc.desc Verify has() returns true for 1 and false for 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      expect(set.has(1)).assertTrue();
      expect(set.has(4)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas049
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0490
     * @tc.desc Verify has() returns true for -1, 0, 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([-1, 0, 1]);
      expect(set.has(-1)).assertTrue();
      expect(set.has(0)).assertTrue();
      expect(set.has(1)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas050
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0500
     * @tc.desc Verify has() for string elements "a" and "b", returns false for "c"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["a", "b"]);
      expect(set.has("a")).assertTrue();
      expect(set.has("c")).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas051
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0510
     * @tc.desc Verify has() returns true for true, false for false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<boolean> = new Set<boolean>([true]);
      expect(set.has(true)).assertTrue();
      expect(set.has(false)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas052
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0520
     * @tc.desc Verify has() with number elements 3.14 and 2.71
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([3.14, 2.71]);
      expect(set.has(3.14)).assertTrue();
      expect(set.has(2.71)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas053
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0530
     * @tc.desc Verify has() with custom class Hp2Node references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n1: Hp2Node = new Hp2Node();
      n1.key = 1;
      let n2: Hp2Node = new Hp2Node();
      n2.key = 2;
      const set: ReadonlySet<Hp2Node> = new Set<Hp2Node>([n1, n2]);
      expect(set.has(n1)).assertTrue();
      expect(set.has(n2)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas054
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0540
     * @tc.desc Verify has() reflects underlying add then delete
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([1, 2, 3]);
      const view: ReadonlySet<int> = ms;
      ms.add(4);
      expect(view.has(4)).assertTrue();
      ms.delete(1);
      expect(view.has(1)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas055
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0550
     * @tc.desc Verify has() with enum Hp2Mode ON/OFF
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Hp2Mode> = new Set<Hp2Mode>([Hp2Mode.ON]);
      expect(set.has(Hp2Mode.ON)).assertTrue();
      expect(set.has(Hp2Mode.OFF)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas056
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0560
     * @tc.desc Verify has() with bigint elements 1n and 2n
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<bigint> = new Set<bigint>([1n, 2n]);
      expect(set.has(1n)).assertTrue();
      expect(set.has(3n)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas057
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0570
     * @tc.desc Verify has() throws ClassCastError for null parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([100]);
      expect(set.has(100)).assertTrue();
      try {
        set.has(null as Object as long);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testReadonlySetHas058
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0580
     * @tc.desc Verify has() throws ClassCastError for undefined parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([100]);
      try {
        set.has(undefined as Object as long);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testReadonlySetHas059
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0590
     * @tc.desc Verify has() throws ClassCastError for string parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([100]);
      try {
        set.has("abc" as Object as long);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testReadonlySetHas060
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0600
     * @tc.desc Verify has() returns true for all three elements via variables
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      let r1: boolean = set.has(1);
      let r2: boolean = set.has(2);
      let r3: boolean = set.has(3);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
      expect(r3).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas061
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0610
     * @tc.desc Verify has() return value type is boolean
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["hello"]);
      let r: boolean = set.has("hello");
      expect(r).assertTrue();
      let t: string = typeof r;
      expect(t).assertEqual("boolean");
    });

    /**
     * @tc.name testReadonlySetHas062
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0620
     * @tc.desc Verify has() on single-element Set with adjacent values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([42]);
      expect(set.has(42)).assertTrue();
      expect(set.has(41)).assertFalse();
      expect(set.has(43)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas063
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0630
     * @tc.desc Verify has() for first, middle, last and non-existent elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([10, 20, 30, 40, 50]);
      expect(set.has(10)).assertTrue();
      expect(set.has(30)).assertTrue();
      expect(set.has(50)).assertTrue();
      expect(set.has(60)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas064
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0640
     * @tc.desc Verify has() consistency with entries() traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3, 4, 5]);
      let allFound: boolean = true;
      for (const entry of set.entries()) {
        if (!set.has(entry[0])) {
          allFound = false;
        }
      }
      expect(allFound).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas065
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0650
     * @tc.desc Verify has() with single zero element and size check
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([0]);
      expect(set.has(0)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetHas066
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0660
     * @tc.desc Verify has() with logical AND combination of elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([100, 200, 300]);
      expect(set.has(100) && set.has(200)).assertTrue();
      expect(set.has(100) && set.has(400)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas067
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0670
     * @tc.desc Verify has() consistency with values() traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["a", "b", "c"]);
      for (const v of set.values()) {
        expect(set.has(v)).assertTrue();
      }
    });

    /**
     * @tc.name testReadonlySetHas068
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0680
     * @tc.desc Verify has() returns true for 20 and false for 40 in Set<long> [10,20,30]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([10, 20, 30]);
      expect(set.has(20)).assertTrue();
      expect(set.has(40)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas069
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0690
     * @tc.desc Verify has() returns true for all elements in Set<long> [-5,0,5]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([-5, 0, 5]);
      expect(set.has(-5)).assertTrue();
      expect(set.has(0)).assertTrue();
      expect(set.has(5)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas070
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0700
     * @tc.desc Verify has() returns true for 100 and false for 0 in single-element Set<long> [100]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([100]);
      expect(set.has(100)).assertTrue();
      expect(set.has(0)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas071
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0710
     * @tc.desc Verify has() returns true for all three elements via && composition
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      expect(set.has(1) && set.has(2) && set.has(3)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas072
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0720
     * @tc.desc Verify has() returns true for each entry key extracted from entries()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([50, 100, 150]);
      let foundAll: boolean = true;
      for (const entry of set.entries()) {
        if (!set.has(entry[0])) {
          foundAll = false;
        }
      }
      expect(foundAll).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas073
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0730
     * @tc.desc Verify has() returns true for first and last element in Set<long> [1,2,3,4,5]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3, 4, 5]);
      expect(set.has(1)).assertTrue();
      expect(set.has(5)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas074
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0740
     * @tc.desc Verify has() return value type is boolean
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([7, 14, 21]);
      let type: string = typeof set.has(7);
      expect(type).assertEqual("boolean");
    });

    /**
     * @tc.name testReadonlySetHas075
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0750
     * @tc.desc Verify has() returns true for 0, -1, 1 in Set<long> [-1,0,1]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([-1, 0, 1]);
      expect(set.has(0)).assertTrue();
      expect(set.has(-1)).assertTrue();
      expect(set.has(1)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas076
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0760
     * @tc.desc Verify has() returns true for 2 and 8, false for 10 in Set<long> [2,4,6,8]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([2, 4, 6, 8]);
      expect(set.has(2)).assertTrue();
      expect(set.has(8)).assertTrue();
      expect(set.has(10)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas077
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0770
     * @tc.desc Verify has() returns consistent true on repeated calls for same value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      expect(set.has(1)).assertTrue();
      expect(set.has(1)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas078
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0780
     * @tc.desc Verify has() returns true for all three elements 7,8,9 in reverse order Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([9, 8, 7]);
      expect(set.has(7)).assertTrue();
      expect(set.has(8)).assertTrue();
      expect(set.has(9)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas079
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0790
     * @tc.desc Verify has() returns true for all elements in Set<long> [3,6,9]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([3, 6, 9]);
      expect(set.has(3)).assertTrue();
      expect(set.has(6)).assertTrue();
      expect(set.has(9)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas080
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0800
     * @tc.desc Verify has() returns true for all elements in Set<long> [5,10,15]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([5, 10, 15]);
      expect(set.has(5)).assertTrue();
      expect(set.has(10)).assertTrue();
      expect(set.has(15)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas081
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0810
     * @tc.desc Verify has() returns true for 25 and 75, false for 100 in Set<long> [25,50,75]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([25, 50, 75]);
      expect(set.has(25)).assertTrue();
      expect(set.has(75)).assertTrue();
      expect(set.has(100)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas082
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0820
     * @tc.desc Verify has() returns true via boolean variable r for element 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      let r: boolean = set.has(1);
      expect(r).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas083
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0830
     * @tc.desc Verify has() via conjunction returns true for all three elements 4,8,12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([4, 8, 12]);
      expect(set.has(4) && set.has(8) && set.has(12)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas084
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0840
     * @tc.desc Verify has() returns true for first and last element 10 and 30
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([10, 20, 30]);
      expect(set.has(10)).assertTrue();
      expect(set.has(30)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas085
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0850
     * @tc.desc Verify has() returns true for both elements 100 and 200
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([100, 200]);
      expect(set.has(100)).assertTrue();
      expect(set.has(200)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas086
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0860
     * @tc.desc Verify has() returns true for all elements in Set<long> [30,60,90]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([30, 60, 90]);
      expect(set.has(30)).assertTrue();
      expect(set.has(60)).assertTrue();
      expect(set.has(90)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas087
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0870
     * @tc.desc Verify has() returns true for all elements in Set<long> [2,3,5]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([2, 3, 5]);
      expect(set.has(2)).assertTrue();
      expect(set.has(3)).assertTrue();
      expect(set.has(5)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas088
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0880
     * @tc.desc Verify has() returns true for 1,2,3 and false for 4 in Set<long> [1,2,3]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      expect(set.has(1)).assertTrue();
      expect(set.has(2)).assertTrue();
      expect(set.has(3)).assertTrue();
      expect(set.has(4)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas089
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0890
     * @tc.desc Verify has() returns true for first and last element 15 and 45
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([15, 30, 45]);
      expect(set.has(15)).assertTrue();
      expect(set.has(45)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas090
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0900
     * @tc.desc Verify has() returns true for first and last element 6 and 18
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([6, 12, 18]);
      expect(set.has(6)).assertTrue();
      expect(set.has(18)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas091
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0910
     * @tc.desc Verify has() returns true for all elements in Set<long> [-10,0,10]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([-10, 0, 10]);
      expect(set.has(-10)).assertTrue();
      expect(set.has(0)).assertTrue();
      expect(set.has(10)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas092
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0920
     * @tc.desc Verify has() returns true for all three elements via separate boolean variables
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      let a: boolean = set.has(1);
      let b: boolean = set.has(2);
      let c: boolean = set.has(3);
      expect(a).assertTrue();
      expect(b).assertTrue();
      expect(c).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas093
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0930
     * @tc.desc Verify has() returns true for first and last element 11 and 33
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([11, 22, 33]);
      expect(set.has(11)).assertTrue();
      expect(set.has(33)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas094
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0940
     * @tc.desc Verify has() via values() iteration confirms has() true for each visited value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3, 4, 5]);
      for (const v of set.values()) {
        expect(set.has(v)).assertTrue();
      }
    });

    /**
     * @tc.name testReadonlySetHas095
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0950
     * @tc.desc Verify has() returns true for first and last element 40 and 60
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([40, 50, 60]);
      expect(set.has(40)).assertTrue();
      expect(set.has(60)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas096
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0960
     * @tc.desc Verify has() returns true for 1 and verifies deduplicated size is 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3, 1, 2]);
      expect(set.has(1)).assertTrue();
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetHas097
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0970
     * @tc.desc Verify has() with Object reference returns true for same Object instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o1: Object = new Object();
      const o2: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([o1, o2]);
      expect(set.has(o1)).assertTrue();
      expect(set.has(o2)).assertTrue();
      expect(set.has(new Object())).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas098
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0980
     * @tc.desc Verify has() with large Set of 50000 elements finds first, middle, last and returns false for missing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [];
      for (let i: int = 0; i < 50000; i++) {
        arr.push(i);
      }
      const set: ReadonlySet<int> = new Set<int>(arr);
      expect(set.has(0)).assertTrue();
      expect(set.has(24999)).assertTrue();
      expect(set.has(49999)).assertTrue();
      expect(set.has(50000)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas099
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_0990
     * @tc.desc Verify has() with Object element returns true for same reference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([obj]);
      expect(set.has(obj)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas100
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1000
     * @tc.desc Verify has() cross-method consistency: every element from entries() holds true for has()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["alpha", "beta", "gamma"]);
      for (const entry of set.entries()) {
        expect(set.has(entry[0])).assertTrue();
      }
    });

    /**
     * @tc.name testReadonlySetHas101
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1010
     * @tc.desc Verify has() with boundary combination Set (NaN, +Infinity, -Infinity, +0, -0) returns correct results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([Number.NaN, Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY, 0, -0]);
      expect(set.has(Number.NaN)).assertTrue();
      expect(set.has(Number.POSITIVE_INFINITY)).assertTrue();
      expect(set.has(Number.NEGATIVE_INFINITY)).assertTrue();
      expect(set.has(0)).assertTrue();
      expect(set.has(-0)).assertTrue();
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testReadonlySetHas102
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1020
     * @tc.desc Verify has() after underlying Set full replacement (clear + add new) reflects new elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ms: Set<int> = new Set<int>([1, 2, 3]);
      const view: ReadonlySet<int> = ms;
      ms.clear();
      ms.add(10);
      ms.add(20);
      expect(view.has(1)).assertFalse();
      expect(view.has(10)).assertTrue();
      expect(view.has(20)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas103
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1030
     * @tc.desc Verify has() with ReadonlySet<Error> for Error objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error("test");
      const set: ReadonlySet<Error> = new Set<Error>([e1]);
      expect(set.has(e1)).assertTrue();
      expect(set.has(new Error("other"))).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas104
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1040
     * @tc.desc Verify has() with ReadonlySet<Date> for Date objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(2024);
      const set: ReadonlySet<Date> = new Set<Date>([d1]);
      expect(set.has(d1)).assertTrue();
      expect(set.has(new Date(2024))).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas105
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1050
     * @tc.desc Verify has() with ReadonlySet<RegExp> for RegExp objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: RegExp = new RegExp("abc");
      const set: ReadonlySet<RegExp> = new Set<RegExp>([r1]);
      expect(set.has(r1)).assertTrue();
      expect(set.has(new RegExp("abc"))).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas106
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1060
     * @tc.desc Verify has() with ReadonlySet<Object> for Object references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([obj1]);
      expect(set.has(obj1)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas107
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1070
     * @tc.desc Verify has() with ReadonlySet<WeakMap<Object, int>> for WeakMap objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const set: ReadonlySet<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>([wm1]);
      expect(set.has(wm1)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas108
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1080
     * @tc.desc Verify has() with ReadonlySet<WeakSet<Object>> for WeakSet objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const set: ReadonlySet<WeakSet<Object>> = new Set<WeakSet<Object>>([ws1]);
      expect(set.has(ws1)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas109
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1090
     * @tc.desc Verify underlying Set delete makes Error has return false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error("a");
      let ms: Set<Error> = new Set<Error>([e1]);
      const view: ReadonlySet<Error> = ms;
      ms.delete(e1);
      expect(view.has(e1)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas110
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1100
     * @tc.desc Verify underlying Set delete makes Date has return false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(1);
      let ms: Set<Date> = new Set<Date>([d1]);
      const view: ReadonlySet<Date> = ms;
      ms.delete(d1);
      expect(view.has(d1)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas111
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1110
     * @tc.desc Verify underlying Set delete makes RegExp has return false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: RegExp = new RegExp("a");
      let ms: Set<RegExp> = new Set<RegExp>([r1]);
      const view: ReadonlySet<RegExp> = ms;
      ms.delete(r1);
      expect(view.has(r1)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas112
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1120
     * @tc.desc Verify underlying Set delete makes Promise has return false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1: Object = new Object();
      let ms: Set<Object> = new Set<Object>([p1]);
      const view: ReadonlySet<Object> = ms;
      ms.delete(p1);
      expect(view.has(p1)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas113
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1130
     * @tc.desc Verify underlying Set delete makes WeakMap has return false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      let ms: Set<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>([wm1]);
      const view: ReadonlySet<WeakMap<Object, int>> = ms;
      ms.delete(wm1);
      expect(view.has(wm1)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas114
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1140
     * @tc.desc Verify underlying Set delete makes WeakSet has return false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      let ms: Set<WeakSet<Object>> = new Set<WeakSet<Object>>([ws1]);
      const view: ReadonlySet<WeakSet<Object>> = ms;
      ms.delete(ws1);
      expect(view.has(ws1)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas115
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1150
     * @tc.desc Verify underlying Set clear makes Error has return false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error("a");
      let ms: Set<Error> = new Set<Error>([e1]);
      const view: ReadonlySet<Error> = ms;
      ms.clear();
      expect(view.has(e1)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas116
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1160
     * @tc.desc Verify underlying Set clear makes Date has return false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(1);
      let ms: Set<Date> = new Set<Date>([d1]);
      const view: ReadonlySet<Date> = ms;
      ms.clear();
      expect(view.has(d1)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas117
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1170
     * @tc.desc Verify underlying Set clear makes RegExp has return false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: RegExp = new RegExp("a");
      let ms: Set<RegExp> = new Set<RegExp>([r1]);
      const view: ReadonlySet<RegExp> = ms;
      ms.clear();
      expect(view.has(r1)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas118
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1180
     * @tc.desc Verify underlying Set clear makes Promise has return false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1: Object = new Object();
      let ms: Set<Object> = new Set<Object>([p1]);
      const view: ReadonlySet<Object> = ms;
      ms.clear();
      expect(view.has(p1)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas119
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1190
     * @tc.desc Verify underlying Set clear makes WeakMap has return false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      let ms: Set<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>([wm1]);
      const view: ReadonlySet<WeakMap<Object, int>> = ms;
      ms.clear();
      expect(view.has(wm1)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas120
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1200
     * @tc.desc Verify underlying Set clear makes WeakSet has return false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      let ms: Set<WeakSet<Object>> = new Set<WeakSet<Object>>([ws1]);
      const view: ReadonlySet<WeakSet<Object>> = ms;
      ms.clear();
      expect(view.has(ws1)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas121
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1210
     * @tc.desc Verify has() on empty ReadonlySet<Error> returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error("a");
      const set: ReadonlySet<Error> = new Set<Error>();
      expect(set.has(e1)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas122
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1220
     * @tc.desc Verify has() on empty ReadonlySet<Date> returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(1);
      const set: ReadonlySet<Date> = new Set<Date>();
      expect(set.has(d1)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas123
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1230
     * @tc.desc Verify has() on empty ReadonlySet<RegExp> returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: RegExp = new RegExp("a");
      const set: ReadonlySet<RegExp> = new Set<RegExp>();
      expect(set.has(r1)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas124
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1240
     * @tc.desc Verify has() on empty ReadonlySet<Object> returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>();
      expect(set.has(p1)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas125
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1250
     * @tc.desc Verify has() on empty ReadonlySet<WeakMap<Object, int>> returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const set: ReadonlySet<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>();
      expect(set.has(wm1)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas126
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1260
     * @tc.desc Verify has() on empty ReadonlySet<WeakSet<Object>> returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const set: ReadonlySet<WeakSet<Object>> = new Set<WeakSet<Object>>();
      expect(set.has(ws1)).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas127
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1270
     * @tc.desc Verify has() on single-element Error Set returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error("a");
      const set: ReadonlySet<Error> = new Set<Error>([e1]);
      expect(set.has(e1)).assertTrue();
      expect(set.has(new Error("b"))).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas128
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1280
     * @tc.desc Verify has() on single-element Date Set returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(1);
      const set: ReadonlySet<Date> = new Set<Date>([d1]);
      expect(set.has(d1)).assertTrue();
      expect(set.has(new Date(2))).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas129
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1290
     * @tc.desc Verify has() on single-element RegExp Set returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: RegExp = new RegExp("a");
      const set: ReadonlySet<RegExp> = new Set<RegExp>([r1]);
      expect(set.has(r1)).assertTrue();
      expect(set.has(new RegExp("b"))).assertFalse();
    });

    /**
     * @tc.name testReadonlySetHas130
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1300
     * @tc.desc Verify has() on single-element Promise Set returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([p1]);
      expect(set.has(p1)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas131
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1310
     * @tc.desc Verify has() on single-element WeakMap Set returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const set: ReadonlySet<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>([wm1]);
      expect(set.has(wm1)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas132
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1320
     * @tc.desc Verify has() on single-element WeakSet Set returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const set: ReadonlySet<WeakSet<Object>> = new Set<WeakSet<Object>>([ws1]);
      expect(set.has(ws1)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas133
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1330
     * @tc.desc Verify duplicate Error reference does not affect has
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error("a");
      const set: ReadonlySet<Error> = new Set<Error>([e1, e1]);
      expect(set.has(e1)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetHas134
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1340
     * @tc.desc Verify duplicate Date reference does not affect has
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(1);
      const set: ReadonlySet<Date> = new Set<Date>([d1, d1]);
      expect(set.has(d1)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetHas135
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1350
     * @tc.desc Verify duplicate RegExp reference does not affect has
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: RegExp = new RegExp("a");
      const set: ReadonlySet<RegExp> = new Set<RegExp>([r1, r1]);
      expect(set.has(r1)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetHas136
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1360
     * @tc.desc Verify duplicate Promise reference does not affect has
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([p1, p1]);
      expect(set.has(p1)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetHas137
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1370
     * @tc.desc Verify duplicate WeakMap reference does not affect has
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const set: ReadonlySet<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>([wm1, wm1]);
      expect(set.has(wm1)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetHas138
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1380
     * @tc.desc Verify duplicate WeakSet reference does not affect has
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const set: ReadonlySet<WeakSet<Object>> = new Set<WeakSet<Object>>([ws1, ws1]);
      expect(set.has(ws1)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetHas139
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1390
     * @tc.desc Verify has() still true after mutating Error.message
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error("original");
      const set: ReadonlySet<Error> = new Set<Error>([e1]);
      e1.message = "mutated";
      expect(set.has(e1)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas140
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1400
     * @tc.desc Verify has() still true after mutating Date via setTime
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(100);
      const set: ReadonlySet<Date> = new Set<Date>([d1]);
      d1.setTime(999);
      expect(set.has(d1)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas141
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1410
     * @tc.desc Verify has() still true after WeakMap internal mutation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const set: ReadonlySet<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>([wm1]);
      const key: Object = new Object();
      wm1.set(key, 42);
      expect(set.has(wm1)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas142
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1420
     * @tc.desc Verify has() still true after WeakSet internal mutation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const set: ReadonlySet<WeakSet<Object>> = new Set<WeakSet<Object>>([ws1]);
      ws1.add(new Object());
      expect(set.has(ws1)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas143
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1430
     * @tc.desc Verify underlying Set add reflected in Error has
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<Error> = new Set<Error>();
      const view: ReadonlySet<Error> = ms;
      const e1: Error = new Error("a");
      ms.add(e1);
      expect(view.has(e1)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas144
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1440
     * @tc.desc Verify underlying Set add reflected in Date has
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<Date> = new Set<Date>();
      const view: ReadonlySet<Date> = ms;
      const d1: Date = new Date(1);
      ms.add(d1);
      expect(view.has(d1)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas145
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1450
     * @tc.desc Verify underlying Set add reflected in RegExp has
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<RegExp> = new Set<RegExp>();
      const view: ReadonlySet<RegExp> = ms;
      const r1: RegExp = new RegExp("a");
      ms.add(r1);
      expect(view.has(r1)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas146
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1460
     * @tc.desc Verify underlying Set add reflected in Promise has
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<Object> = new Set<Object>();
      const view: ReadonlySet<Object> = ms;
      const p1: Object = new Object();
      ms.add(p1);
      expect(view.has(p1)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas147
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1470
     * @tc.desc Verify underlying Set add reflected in WeakMap has
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>();
      const view: ReadonlySet<WeakMap<Object, int>> = ms;
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      ms.add(wm1);
      expect(view.has(wm1)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetHas148
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_HAS_1480
     * @tc.desc Verify underlying Set add reflected in WeakSet has
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetHas148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<WeakSet<Object>> = new Set<WeakSet<Object>>();
      const view: ReadonlySet<WeakSet<Object>> = ms;
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      ms.add(ws1);
      expect(view.has(ws1)).assertTrue();
    });

  });
}
