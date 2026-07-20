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

class SizePerson {
  name: string = "";
}

class SizeFinal {
  id: int = 0;
}

interface SizeDrawable {
  paint(): void;
}

class SizeCircle implements SizeDrawable {
  paint(): void {
  }
}

enum SizeColor {
  RED, GREEN, BLUE
}



class Sp2Box {
  id: int = 0;
}

enum Sp2Rank {
  LOW, MEDIUM, HIGH
}

export default function ReadonlySetSize2Test(): void {
  describe('ReadonlySetSize2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0010
     * @tc.desc Verify ReadonlySet<float> size returns correct element count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<float> = new Set<float>([-1.5 as float, 0.0 as float, 2.5 as float]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize002
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0020
     * @tc.desc Verify ReadonlySet<double> size returns correct count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<double> = new Set<double>([-1.79e308, 0.0, 1.79e308]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize003
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0030
     * @tc.desc Verify ReadonlySet<boolean> size is 2 for both true and false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<boolean> = new Set<boolean>([true, false]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize004
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0040
     * @tc.desc Verify ReadonlySet<char> size returns correct count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<char> = new Set<char>([c'A', c'B', c'C']);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize005
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0050
     * @tc.desc Verify ReadonlySet<bigint> size returns correct count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<bigint> = new Set<bigint>([10n, 20n, 30n, 40n]);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testReadonlySetSize006
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0060
     * @tc.desc Verify size property type is int
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      const t: string = typeof set.size;
      expect(t).assertEqual("int");
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize007
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0070
     * @tc.desc Verify Set with duplicate NaN elements has size 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(Number.NaN);
      set.add(Number.NaN);
      set.add(Number.NaN);
      const readonlySet: ReadonlySet<number> = set;
      expect(readonlySet.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize008
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0080
     * @tc.desc Verify Set with +0 and -0 has size 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(0);
      set.add(-0);
      const readonlySet: ReadonlySet<number> = set;
      expect(readonlySet.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize009
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0090
     * @tc.desc Verify size matches entries() traversal count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3, 4, 5]);
      let count: int = 0;
      for (const entry of set.entries()) {
        count++;
      }
      expect(set.size).assertEqual(count);
    });

    /**
     * @tc.name testReadonlySetSize010
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0100
     * @tc.desc Verify size matches values() traversal count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["a", "b", "c", "d"]);
      let count: int = 0;
      for (const v of set.values()) {
        count++;
      }
      expect(set.size).assertEqual(count);
    });

    /**
     * @tc.name testReadonlySetSize011
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0110
     * @tc.desc Verify size matches keys() traversal count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([10, 20, 30]);
      let count: int = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(set.size).assertEqual(count);
    });

    /**
     * @tc.name testReadonlySetSize012
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0120
     * @tc.desc Verify multiple ReadonlySet references share same size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([1, 2, 3]);
      const r1: ReadonlySet<int> = ms;
      const r2: ReadonlySet<int> = ms;
      expect(r1.size).assertEqual(r2.size);
      expect(r1.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize013
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0130
     * @tc.desc Verify underlying Set add increases size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([1, 2]);
      const view: ReadonlySet<int> = ms;
      ms.add(3);
      expect(view.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize014
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0140
     * @tc.desc Verify underlying Set delete decreases size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([1, 2, 3]);
      const view: ReadonlySet<int> = ms;
      ms.delete(2);
      expect(view.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize015
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0150
     * @tc.desc Verify underlying Set clear sets size to 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([1, 2, 3]);
      const view: ReadonlySet<int> = ms;
      ms.clear();
      expect(view.size).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetSize016
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0160
     * @tc.desc Verify ReadonlySet<int[]> size returns array element count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: int[] = [1, 2];
      let a2: int[] = [3, 4];
      const set: ReadonlySet<int[]> = new Set<int[]>([a1, a2, a1]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize017
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0170
     * @tc.desc Verify Set<Set<int>> size returns nested Set reference count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Set<int> = new Set<int>([1]);
      let s2: Set<int> = new Set<int>([2]);
      const set: ReadonlySet<Set<int>> = new Set<Set<int>>([s1, s2, s1]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize018
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0180
     * @tc.desc Verify size cannot be modified via cast (readonly enforcement)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      const originalSize: int = set.size;
      try {
        (set as Record<string, Object>)["size"] = 100;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(set.size).assertEqual(originalSize);
    });

    /**
     * @tc.name testReadonlySetSize019
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0190
     * @tc.desc Verify empty Set from constructor has size 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetSize020
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0200
     * @tc.desc Verify size after constructing from Set<T> matches source
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<int> = new Set<int>([1, 2, 3]);
      const set: ReadonlySet<int> = new Set<int>(src);
      expect(set.size).assertEqual(src.size);
    });

    /**
     * @tc.name testReadonlySetSize021
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0210
     * @tc.desc Verify object field mutation does not affect size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: SizePerson = new SizePerson();
      p.name = "Alice";
      const set: ReadonlySet<SizePerson> = new Set<SizePerson>([p]);
      p.name = "Bob";
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize022
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0220
     * @tc.desc Verify ReadonlySet<SizeColor> enum type size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<SizeColor> = new Set<SizeColor>([SizeColor.RED, SizeColor.GREEN, SizeColor.BLUE]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize023
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0230
     * @tc.desc Verify ReadonlySet<byte> size returns correct count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<byte> = new Set<byte>([-128, 0, 127]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize024
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0240
     * @tc.desc Verify ReadonlySet<short> size returns correct count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<short> = new Set<short>([-32768, 0, 32767]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize025
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0250
     * @tc.desc Verify size with 1000 elements returns 1000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      for (let i = 0; i < 1000; i++) {
        arr.push(i);
      }
      const set: Set<int> = new Set<int>(arr);
      const readonlySet: ReadonlySet<int> = set;
      expect(readonlySet.size).assertEqual(1000);
    });

    /**
     * @tc.name testReadonlySetSize026
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0260
     * @tc.desc Verify size with FixedArray<int> elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa1: FixedArray<int> = new FixedArray<int>(2);
      let fa2: FixedArray<int> = new FixedArray<int>(2);
      const set: ReadonlySet<FixedArray<int>> = new Set<FixedArray<int>>([fa1, fa2]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize027
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0270
     * @tc.desc Verify size is not negative for any Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>();
      expect(set.size < 0).assertFalse();
      const set2: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      expect(set2.size < 0).assertFalse();
    });

    /**
     * @tc.name testReadonlySetSize028
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0280
     * @tc.desc Verify ReadonlySet<SizeFinal> size for final class instances
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f1: SizeFinal = new SizeFinal();
      let f2: SizeFinal = new SizeFinal();
      const set: ReadonlySet<SizeFinal> = new Set<SizeFinal>([f1, f2]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize029
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0290
     * @tc.desc Verify ReadonlySet<SizeDrawable> size for interface implementors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1: SizeCircle = new SizeCircle();
      let c2: SizeCircle = new SizeCircle();
      const set: ReadonlySet<SizeDrawable> = new Set<SizeDrawable>([c1, c2]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize030
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0300
     * @tc.desc Verify size of ReadonlySet constructed from array with all duplicates
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 1, 1, 1]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize031
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0310
     * @tc.desc Verify size of ReadonlySet with union string|int type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string | int> = new Set<string | int>();
      (set as Set<string | int>).add("a");
      (set as Set<string | int>).add(1);
      (set as Set<string | int>).add("a");
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize032
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0320
     * @tc.desc Verify size correctly counts string with zero-width space
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["a", "\u200B", "b"]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize033
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0330
     * @tc.desc Verify size after add then delete same element returns 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>();
      ms.add(42);
      ms.delete(42);
      const view: ReadonlySet<int> = ms;
      expect(view.size).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetSize034
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0340
     * @tc.desc Verify size of Set with Object type elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o1: Object = new Object();
      let o2: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([o1, o2]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize035
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0350
     * @tc.desc Verify size for Set with emoji and multilingual strings
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["😀", "테스트", "中文"]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize036
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0360
     * @tc.desc Verify size for ValueArray<int> Set counts references correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let va1: ValueArray<int> = new ValueArray<int>(2);
      let va2: ValueArray<int> = new ValueArray<int>(2);
      const set: ReadonlySet<ValueArray<int>> = new Set<ValueArray<int>>([va1, va2, va1]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize037
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0370
     * @tc.desc Verify size for Set<long> with MIN and MAX boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([9223372036854775807, -9223372036854775808, 0, 1, -1]);
      expect(set.size).assertEqual(5);
    });

    /**
     * @tc.name testReadonlySetSize038
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0380
     * @tc.desc Verify size for Set with surrogate pair strings
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["𝄞", "𝕬", "𝐀", "a"]);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testReadonlySetSize039
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0390
     * @tc.desc Verify size for Set<Set<int>> counts nested set references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Set<int> = new Set<int>([1]);
      let s2: Set<int> = new Set<int>([2]);
      let s3: Set<int> = new Set<int>([3]);
      const set: ReadonlySet<Set<int>> = new Set<Set<int>>([s1, s2, s3, s1]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize040
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0400
     * @tc.desc Verify size after high-frequency add and delete operations
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>();
      for (let i: int = 0; i < 100; i++) {
        ms.add(i);
      }
      for (let i: int = 0; i < 50; i++) {
        ms.delete(i);
      }
      const view: ReadonlySet<int> = ms;
      expect(view.size).assertEqual(50);
    });

    /**
     * @tc.name testReadonlySetSize041
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0410
     * @tc.desc Verify size for 2D int[][] array Set counts by reference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m1: int[][] = [[1, 2], [3, 4]];
      let m2: int[][] = [[5, 6]];
      const set: ReadonlySet<int[][]> = new Set<int[][]>([m1, m2, m1]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize042
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0420
     * @tc.desc Verify size remains correct after entries traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([10, 20, 30, 40, 50]);
      for (const entry of set.entries()) {
        expect(set.size).assertEqual(5);
      }
    });

    /**
     * @tc.name testReadonlySetSize043
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0430
     * @tc.desc Verify size for Set with double precision boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([9007199254740992, 9007199254740994, 1.5]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize044
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0440
     * @tc.desc Verify size for ReadonlySet<char> with char type elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<char> = new Set<char>([c'A', c'B', c'C', c'A']);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize045
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0450
     * @tc.desc Verify size for ReadonlySet<bigint> with duplicate values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<bigint> = new Set<bigint>([1n, 2n, 3n, 2n, 1n]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize046
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0460
     * @tc.desc Verify size for ReadonlySet<SizeDrawable> interface references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1: SizeCircle = new SizeCircle();
      let c2: SizeCircle = new SizeCircle();
      const set: ReadonlySet<SizeDrawable> = new Set<SizeDrawable>([c1, c2, c1]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize047
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0470
     * @tc.desc Verify size for Set with Number.EPSILON and adjacent values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([Number.EPSILON, Number.EPSILON * 2, 0.0]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize048
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0480
     * @tc.desc Verify size for Set with duplicate strings of mixed case
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["A", "B", "A", "C", "B"]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize049
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0490
     * @tc.desc Verify size for Set constructed with union string|int|boolean type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string | int | boolean> = new Set<string | int | boolean>();
      (set as Set<string | int | boolean>).add("x");
      (set as Set<string | int | boolean>).add(1);
      (set as Set<string | int | boolean>).add(true);
      (set as Set<string | int | boolean>).add("x");
      expect(set.size).assertEqual(3);
    });

/**
     * @tc.name testReadonlySetSize050
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0500
     * @tc.desc Verify size of int Set [1,2,3]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize051
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0510
     * @tc.desc Verify size of long Set [10,20,30]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([10, 20, 30]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize052
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0520
     * @tc.desc Verify size deduplicates string [a,b,c,a]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["a", "b", "c", "a"]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize053
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0530
     * @tc.desc Verify size of all-duplicate Set [1,1,1,1]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 1, 1, 1]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize054
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0540
     * @tc.desc Verify size of empty Set from []
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([]);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetSize055
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0550
     * @tc.desc Verify size of enum Sp2Rank Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Sp2Rank> = new Set<Sp2Rank>([Sp2Rank.LOW, Sp2Rank.MEDIUM, Sp2Rank.HIGH]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize056
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0560
     * @tc.desc Verify size reflects duplicate add via underlying Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>();
      ms.add(1);
      ms.add(2);
      ms.add(2);
      const view: ReadonlySet<int> = ms;
      expect(view.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize057
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0570
     * @tc.desc Verify size of Set constructed from another Set<T>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<long> = new Set<long>([1, 2, 3, 4, 5]);
      const set: ReadonlySet<long> = new Set<long>(src);
      expect(set.size).assertEqual(5);
    });

    /**
     * @tc.name testReadonlySetSize058
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0580
     * @tc.desc Verify size of Set with negative and positive long values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([-100, -50, 0, 50, 100]);
      expect(set.size).assertEqual(5);
    });

    /**
     * @tc.name testReadonlySetSize059
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0590
     * @tc.desc Verify size increases after underlying Set add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([1, 2, 3]);
      const view: ReadonlySet<int> = ms;
      ms.add(4);
      expect(view.size).assertEqual(4);
      ms.add(5);
      expect(view.size).assertEqual(5);
    });

    /**
     * @tc.name testReadonlySetSize060
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0600
     * @tc.desc Verify size decreases after underlying Set delete
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([1, 2, 3, 4, 5]);
      const view: ReadonlySet<int> = ms;
      ms.delete(1);
      ms.delete(3);
      ms.delete(5);
      expect(view.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize061
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0610
     * @tc.desc Verify size of single-element Set [0]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([0]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize062
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0620
     * @tc.desc Verify size of long Set [-1,0,1]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([-1, 0, 1]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize063
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0630
     * @tc.desc Verify size of single-element Set [100]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([100]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize064
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0640
     * @tc.desc Verify size dynamically grows from 5 to 20 via add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([1, 2, 3, 4, 5]);
      const view: ReadonlySet<int> = ms;
      let expectedSize: int = 5;
      expect(view.size).assertEqual(expectedSize);
      for (let i: int = 6; i <= 20; i++) {
        ms.add(i);
        expectedSize++;
      }
      expect(view.size).assertEqual(20);
    });

    /**
     * @tc.name testReadonlySetSize065
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0650
     * @tc.desc Verify size of single Object element Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Object> = new Set<Object>([new Object()]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize066
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0660
     * @tc.desc Verify size deduplicates repeated constructor elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 2, 3, 3, 3]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize067
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0670
     * @tc.desc Verify size accessible outside block scope
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: int = 0;
      {
        const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
        s = set.size;
      }
      expect(s).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize068
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0680
     * @tc.desc Verify size with NaN and Infinity elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([Number.NaN, Number.POSITIVE_INFINITY]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize069
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0690
     * @tc.desc Verify size of custom Sp2Box class instances
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Sp2Box> = new Set<Sp2Box>([new Sp2Box(), new Sp2Box()]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize070
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0700
     * @tc.desc Verify size of long Set [5,10,15,20]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([5, 10, 15, 20]);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testReadonlySetSize071
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0710
     * @tc.desc Verify size of long Set [1..10]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      expect(set.size).assertEqual(10);
    });

    /**
     * @tc.name testReadonlySetSize072
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0720
     * @tc.desc Verify size with duplicate Sp2Box reference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b1: Sp2Box = new Sp2Box();
      let b2: Sp2Box = new Sp2Box();
      const set: ReadonlySet<Sp2Box> = new Set<Sp2Box>([b1, b2, b1]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize073
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0730
     * @tc.desc Verify size of long Set [100..600]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([100, 200, 300, 400, 500, 600]);
      expect(set.size).assertEqual(6);
    });

/**
     * @tc.name testReadonlySetSize074
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0740
     * @tc.desc Verify size of long Set [10,20,30,40,50]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: ReadonlySet<long> = new Set<long>([10, 20, 30, 40, 50]);
      expect(s.size).assertEqual(5);
    });

    /**
     * @tc.name testReadonlySetSize075
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0750
     * @tc.desc Verify size of long Set [11,22,33]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: ReadonlySet<long> = new Set<long>([11, 22, 33]);
      expect(s.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize076
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0760
     * @tc.desc Verify size dedup [1,1,2,2,3]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: ReadonlySet<long> = new Set<long>([1, 1, 2, 2, 3]);
      expect(s.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize077
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0770
     * @tc.desc Verify size increases after underlying add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<long> = new Set<long>([1, 2, 3]);
      const v: ReadonlySet<long> = ms;
      expect(v.size).assertEqual(3);
      ms.add(4);
      expect(v.size).assertEqual(4);
    });

    /**
     * @tc.name testReadonlySetSize078
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0780
     * @tc.desc Verify size decreases after underlying delete
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<long> = new Set<long>([1, 2, 3, 4, 5]);
      const v: ReadonlySet<long> = ms;
      ms.delete(2);
      ms.delete(4);
      expect(v.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize079
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0790
     * @tc.desc Verify size becomes 0 after underlying clear
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<long> = new Set<long>([1, 2, 3]);
      const v: ReadonlySet<long> = ms;
      ms.clear();
      expect(v.size).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetSize080
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0800
     * @tc.desc Verify size return type is int
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      expect(typeof s.size).assertEqual("int");
    });

    /**
     * @tc.name testReadonlySetSize081
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0810
     * @tc.desc Verify size of long Set [-5,-3,-1,0,1,3,5]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: ReadonlySet<long> = new Set<long>([-5, -3, -1, 0, 1, 3, 5]);
      expect(s.size).assertEqual(7);
    });

    /**
     * @tc.name testReadonlySetSize082
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0820
     * @tc.desc Verify size of long Set [2,4,6,8]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: ReadonlySet<long> = new Set<long>([2, 4, 6, 8]);
      expect(s.size).assertEqual(4);
    });

    /**
     * @tc.name testReadonlySetSize083
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0830
     * @tc.desc Verify size of long Set [7,14,21,28,35]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: ReadonlySet<long> = new Set<long>([7, 14, 21, 28, 35]);
      expect(s.size).assertEqual(5);
    });

    /**
     * @tc.name testReadonlySetSize084
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0840
     * @tc.desc Verify size starts at 0, grows with add, dedup by add(1)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<long> = new Set<long>();
      const v: ReadonlySet<long> = ms;
      expect(v.size).assertEqual(0);
      ms.add(1);
      expect(v.size).assertEqual(1);
      ms.add(1);
      expect(v.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize085
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0850
     * @tc.desc Verify size dedup [3,6,9,3,6]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: ReadonlySet<long> = new Set<long>([3, 6, 9, 3, 6]);
      expect(s.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize086
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0860
     * @tc.desc Verify size equals entries() traversal count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: ReadonlySet<long> = new Set<long>([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let c: int = 0;
      for (const e of s.entries()) {
        c++;
      }
      expect(s.size).assertEqual(c);
    });

    /**
     * @tc.name testReadonlySetSize087
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0870
     * @tc.desc Verify two identical Sets have equal size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s1: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      const s2: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      expect(s1.size).assertEqual(s2.size);
    });

    /**
     * @tc.name testReadonlySetSize088
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0880
     * @tc.desc Verify size of long Set [100,200,300,400]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: ReadonlySet<long> = new Set<long>([100, 200, 300, 400]);
      expect(s.size).assertEqual(4);
    });

    /**
     * @tc.name testReadonlySetSize089
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0890
     * @tc.desc Verify size grows from 5 to 7 via underlying add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<long> = new Set<long>([1, 2, 3, 4, 5]);
      const v: ReadonlySet<long> = ms;
      ms.add(6);
      ms.add(7);
      expect(v.size).assertEqual(7);
    });

    /**
     * @tc.name testReadonlySetSize090
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0900
     * @tc.desc Verify size of long Set [15,30,45,60]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: ReadonlySet<long> = new Set<long>([15, 30, 45, 60]);
      expect(s.size).assertEqual(4);
    });

    /**
     * @tc.name testReadonlySetSize091
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0910
     * @tc.desc Verify size is 3 for Set [5, 10, 15]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<long> = new Set<long>([5, 10, 15]);
      const v: ReadonlySet<long> = ms;
      expect(v.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize092
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0920
     * @tc.desc Verify size consistently returns 3 on repeated access
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      expect(s.size).assertEqual(3);
      expect(s.size).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetSize093
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0930
     * @tc.desc Verify size of long Set [12,24,36,48,60]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: ReadonlySet<long> = new Set<long>([12, 24, 36, 48, 60]);
      expect(s.size).assertEqual(5);
    });

    /**
     * @tc.name testReadonlySetSize094
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0940
     * @tc.desc Verify size grows from 3 to 6 via multiple adds
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<long> = new Set<long>([1, 2, 3]);
      const v: ReadonlySet<long> = ms;
      ms.add(4);
      ms.add(5);
      ms.add(6);
      expect(v.size).assertEqual(6);
    });

    /**
     * @tc.name testReadonlySetSize095
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0950
     * @tc.desc Verify size of long Set [9,18,27,36]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: ReadonlySet<long> = new Set<long>([9, 18, 27, 36]);
      expect(s.size).assertEqual(4);
    });

    /**
     * @tc.name testReadonlySetSize096
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0960
     * @tc.desc Verify size decreases after multiple deletes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<long> = new Set<long>([10, 20, 30]);
      const v: ReadonlySet<long> = ms;
      ms.delete(10);
      ms.delete(30);
      expect(v.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize097
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0970
     * @tc.desc Verify size matches entries(), keys(), values() and forEach count for the same Set (cross-method consistency)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["a", "b", "c", "d", "e"]);
      let entCount: int = 0;
      for (const _ of set.entries()) {
        entCount++;
      }
      let keyCount: int = 0;
      for (const _ of set.keys()) {
        keyCount++;
      }
      let valCount: int = 0;
      for (const _ of set.values()) {
        valCount++;
      }
      let forEachCount: int = 0;
      set.forEach((): void => {
        forEachCount++;
      });
      expect(set.size).assertEqual(5);
      expect(entCount).assertEqual(set.size);
      expect(keyCount).assertEqual(set.size);
      expect(valCount).assertEqual(set.size);
      expect(forEachCount).assertEqual(set.size);
    });

    /**
     * @tc.name testReadonlySetSize098
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0980
     * @tc.desc Verify size with Object elements returns correct element count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o1: Object = new Object();
      const o2: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([o1, o2]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize099
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_0990
     * @tc.desc Verify size with 100000 elements returns correct count (large capacity test)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [];
      for (let i: int = 0; i < 100000; i++) {
        arr.push(i);
      }
      const set: ReadonlySet<int> = new Set<int>(arr);
      expect(set.size).assertEqual(100000);
    });

    /**
     * @tc.name testReadonlySetSize100
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1000
     * @tc.desc Verify size with boundary combination Set (NaN, Infinity, -Infinity, +0, -0) deduplicates correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([Number.NaN, Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY, 0, -0]);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testReadonlySetSize101
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1010
     * @tc.desc Verify size with Object element returns 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([obj]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize102
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1020
     * @tc.desc Verify size after underlying Set full replacement (clear + add new) reflects new count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ms: Set<int> = new Set<int>([1, 2, 3, 4, 5]);
      const view: ReadonlySet<int> = ms;
      expect(view.size).assertEqual(5);
      ms.clear();
      expect(view.size).assertEqual(0);
      ms.add(10);
      ms.add(20);
      expect(view.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize103
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1030
     * @tc.desc Verify size with Object objects counts unique references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o1: Object = new Object();
      const o2: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([o1, o2, o1]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize104
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1040
     * @tc.desc Verify ReadonlySet<Error> size counts unique Error references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error("a");
      const e2: Error = new Error("b");
      const set: ReadonlySet<Error> = new Set<Error>([e1, e2, e1]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize105
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1050
     * @tc.desc Verify ReadonlySet<Date> size counts unique Date references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(2024);
      const d2: Date = new Date(2025);
      const set: ReadonlySet<Date> = new Set<Date>([d1, d2]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize106
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1060
     * @tc.desc Verify ReadonlySet<RegExp> size counts unique RegExp references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: RegExp = new RegExp("a");
      const r2: RegExp = new RegExp("b");
      const set: ReadonlySet<RegExp> = new Set<RegExp>([r1, r2, r1]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize107
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1070
     * @tc.desc Verify ReadonlySet<Object> size counts unique Object references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: Object = new Object();
      const obj2: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([obj1, obj2, obj1]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize108
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1080
     * @tc.desc Verify ReadonlySet<WeakMap<Object, int>> size counts unique WeakMap references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const wm2: WeakMap<Object, int> = new WeakMap<Object, int>();
      const set: ReadonlySet<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>([wm1, wm2]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize109
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1090
     * @tc.desc Verify ReadonlySet<WeakSet<Object>> size counts unique WeakSet references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const ws2: WeakSet<Object> = new WeakSet<Object>();
      const set: ReadonlySet<WeakSet<Object>> = new Set<WeakSet<Object>>([ws1, ws2]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize110
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1100
     * @tc.desc Verify underlying Set delete decreases Error size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error("a");
      const e2: Error = new Error("b");
      let ms: Set<Error> = new Set<Error>([e1, e2]);
      const view: ReadonlySet<Error> = ms;
      ms.delete(e1);
      expect(view.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize111
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1110
     * @tc.desc Verify underlying Set delete decreases Date size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(1);
      const d2: Date = new Date(2);
      let ms: Set<Date> = new Set<Date>([d1, d2]);
      const view: ReadonlySet<Date> = ms;
      ms.delete(d1);
      expect(view.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize112
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1120
     * @tc.desc Verify underlying Set delete decreases RegExp size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: RegExp = new RegExp("a");
      const r2: RegExp = new RegExp("b");
      let ms: Set<RegExp> = new Set<RegExp>([r1, r2]);
      const view: ReadonlySet<RegExp> = ms;
      ms.delete(r1);
      expect(view.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize113
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1130
     * @tc.desc Verify underlying Set delete decreases Object size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: Object = new Object();
      const obj2: Object = new Object();
      let ms: Set<Object> = new Set<Object>([obj1, obj2]);
      const view: ReadonlySet<Object> = ms;
      ms.delete(obj1);
      expect(view.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize114
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1140
     * @tc.desc Verify underlying Set delete decreases WeakMap size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const wm2: WeakMap<Object, int> = new WeakMap<Object, int>();
      let ms: Set<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>([wm1, wm2]);
      const view: ReadonlySet<WeakMap<Object, int>> = ms;
      ms.delete(wm1);
      expect(view.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize115
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1150
     * @tc.desc Verify underlying Set delete decreases WeakSet size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const ws2: WeakSet<Object> = new WeakSet<Object>();
      let ms: Set<WeakSet<Object>> = new Set<WeakSet<Object>>([ws1, ws2]);
      const view: ReadonlySet<WeakSet<Object>> = ms;
      ms.delete(ws1);
      expect(view.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize116
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1160
     * @tc.desc Verify underlying Set clear sets Error size to 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<Error> = new Set<Error>([new Error("a"), new Error("b")]);
      const view: ReadonlySet<Error> = ms;
      ms.clear();
      expect(view.size).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetSize117
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1170
     * @tc.desc Verify underlying Set clear sets Date size to 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<Date> = new Set<Date>([new Date(1), new Date(2)]);
      const view: ReadonlySet<Date> = ms;
      ms.clear();
      expect(view.size).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetSize118
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1180
     * @tc.desc Verify underlying Set clear sets RegExp size to 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<RegExp> = new Set<RegExp>([new RegExp("a"), new RegExp("b")]);
      const view: ReadonlySet<RegExp> = ms;
      ms.clear();
      expect(view.size).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetSize119
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1190
     * @tc.desc Verify underlying Set clear sets Object size to 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: Object = new Object();
      const obj2: Object = new Object();
      let ms: Set<Object> = new Set<Object>([obj1, obj2]);
      const view: ReadonlySet<Object> = ms;
      ms.clear();
      expect(view.size).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetSize120
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1200
     * @tc.desc Verify underlying Set clear sets WeakMap size to 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const wm2: WeakMap<Object, int> = new WeakMap<Object, int>();
      let ms: Set<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>([wm1, wm2]);
      const view: ReadonlySet<WeakMap<Object, int>> = ms;
      ms.clear();
      expect(view.size).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetSize121
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1210
     * @tc.desc Verify underlying Set clear sets WeakSet size to 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const ws2: WeakSet<Object> = new WeakSet<Object>();
      let ms: Set<WeakSet<Object>> = new Set<WeakSet<Object>>([ws1, ws2]);
      const view: ReadonlySet<WeakSet<Object>> = ms;
      ms.clear();
      expect(view.size).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetSize122
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1220
     * @tc.desc Verify empty Error Set size is 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Error> = new Set<Error>();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetSize123
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1230
     * @tc.desc Verify empty Date Set size is 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Date> = new Set<Date>();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetSize124
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1240
     * @tc.desc Verify empty RegExp Set size is 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<RegExp> = new Set<RegExp>();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetSize125
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1250
     * @tc.desc Verify empty Object Set size is 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Object> = new Set<Object>();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetSize126
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1260
     * @tc.desc Verify empty WeakMap Set size is 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetSize127
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1270
     * @tc.desc Verify empty WeakSet Set size is 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<WeakSet<Object>> = new Set<WeakSet<Object>>();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetSize128
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1280
     * @tc.desc Verify single-element Error Set size is 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Error> = new Set<Error>([new Error("a")]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize129
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1290
     * @tc.desc Verify single-element Date Set size is 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Date> = new Set<Date>([new Date(1)]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize130
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1300
     * @tc.desc Verify single-element RegExp Set size is 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<RegExp> = new Set<RegExp>([new RegExp("a")]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize131
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1310
     * @tc.desc Verify single-element Object Set size is 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Object> = new Set<Object>([new Object()]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize132
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1320
     * @tc.desc Verify single-element WeakMap Set size is 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>([new WeakMap<Object, int>()]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize133
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1330
     * @tc.desc Verify single-element WeakSet Set size is 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<WeakSet<Object>> = new Set<WeakSet<Object>>([new WeakSet<Object>()]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize134
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1340
     * @tc.desc Verify duplicate Error refs count as size 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error("a");
      const set: ReadonlySet<Error> = new Set<Error>([e1, e1]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize135
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1350
     * @tc.desc Verify duplicate Date refs count as size 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(1);
      const set: ReadonlySet<Date> = new Set<Date>([d1, d1]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize136
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1360
     * @tc.desc Verify duplicate RegExp refs count as size 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: RegExp = new RegExp("a");
      const set: ReadonlySet<RegExp> = new Set<RegExp>([r1, r1]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize137
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1370
     * @tc.desc Verify duplicate Object refs count as size 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([obj1, obj1]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize138
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1380
     * @tc.desc Verify duplicate WeakMap refs count as size 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const set: ReadonlySet<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>([wm1, wm1]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize139
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1390
     * @tc.desc Verify duplicate WeakSet refs count as size 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const set: ReadonlySet<WeakSet<Object>> = new Set<WeakSet<Object>>([ws1, ws1]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetSize140
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1400
     * @tc.desc Verify underlying Set add increases Error size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<Error> = new Set<Error>([new Error("a")]);
      const view: ReadonlySet<Error> = ms;
      ms.add(new Error("b"));
      expect(view.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize141
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1410
     * @tc.desc Verify underlying Set add increases Date size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<Date> = new Set<Date>([new Date(1)]);
      const view: ReadonlySet<Date> = ms;
      ms.add(new Date(2));
      expect(view.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize142
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1420
     * @tc.desc Verify underlying Set add increases RegExp size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<RegExp> = new Set<RegExp>([new RegExp("a")]);
      const view: ReadonlySet<RegExp> = ms;
      ms.add(new RegExp("b"));
      expect(view.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize143
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1430
     * @tc.desc Verify underlying Set add increases Object size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: Object = new Object();
      const obj2: Object = new Object();
      let ms: Set<Object> = new Set<Object>([obj1]);
      const view: ReadonlySet<Object> = ms;
      ms.add(obj2);
      expect(view.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize144
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1440
     * @tc.desc Verify underlying Set add increases WeakMap size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const wm2: WeakMap<Object, int> = new WeakMap<Object, int>();
      let ms: Set<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>([wm1]);
      const view: ReadonlySet<WeakMap<Object, int>> = ms;
      ms.add(wm2);
      expect(view.size).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetSize145
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETSIZE_1450
     * @tc.desc Verify underlying Set add increases WeakSet size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetSize145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const ws2: WeakSet<Object> = new WeakSet<Object>();
      let ms: Set<WeakSet<Object>> = new Set<WeakSet<Object>>([ws1]);
      const view: ReadonlySet<WeakSet<Object>> = ms;
      ms.add(ws2);
      expect(view.size).assertEqual(2);
    });

  });
}
