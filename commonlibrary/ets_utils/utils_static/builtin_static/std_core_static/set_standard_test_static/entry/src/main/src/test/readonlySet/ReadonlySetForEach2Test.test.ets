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

class ForEachPerson {
  name: string = "";
  age: int = 0;
}

class ForEachFinal {
  id: int = 0;
}

interface ForEachDrawable {
  draw(): void;
}

class ForEachCircle implements ForEachDrawable {
  draw(): void {
  }
}

enum ForEachColor {
  RED, GREEN, BLUE
}



class Fp2Worker {
  name: string = "";
  salary: int = 0;
}

enum Fp2Status {
  ACTIVE, INACTIVE
}



class Fp3Emp {
  base: int = 0;
  bonus: int = 0;
}

export default function ReadonlySetForEach2Test(): void {
  describe('ReadonlySetForEach2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.name testReadonlySetForEach001
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0010
     * @tc.desc Verify forEach with ReadonlySet<float> traverses all float elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<float> = new Set<float>([-1.5 as float, 0.0 as float, 2.5 as float]);
      let count: int = 0;
      set.forEach((v: float): void => {
        count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetForEach002
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0020
     * @tc.desc Verify forEach with ReadonlySet<double> traverses double boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<double> = new Set<double>([-1.79e308, 0.0, 1.79e308]);
      let sum: double = 0;
      set.forEach((v: double): void => {
        sum += v;
      });
      expect(sum).assertEqual(-1.79e308 + 0.0 + 1.79e308);
    });

    /**
     * @tc.name testReadonlySetForEach003
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0030
     * @tc.desc Verify forEach with ReadonlySet<boolean> traverses true and false in order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<boolean> = new Set<boolean>([true, false]);
      const result: boolean[] = [];
      set.forEach((v: boolean): void => {
        result.push(v);
      });
      expect(result.length).assertEqual(2);
      expect(result[0]).assertTrue();
      expect(result[1]).assertFalse();
    });

    /**
     * @tc.name testReadonlySetForEach004
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0040
     * @tc.desc Verify forEach with 1-parameter callback counts all elements correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([10, 20, 30, 40, 50]);
      let count: int = 0;
      set.forEach((v: int): void => {
        count++;
      });
      expect(count).assertEqual(5);
    });

    /**
     * @tc.name testReadonlySetForEach005
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0050
     * @tc.desc Verify forEach each visited string element exists in the Set via has()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["x", "y", "z"]);
      let count: int = 0;
      set.forEach((v: string, v2: string): void => {
        expect(set.has(v)).assertTrue();
        count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetForEach006
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0060
     * @tc.desc Verify forEach callback receives NaN element correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([Number.NaN, 1.0]);
      let hasNaN: boolean = false;
      set.forEach((v: number): void => {
        if (Number.isNaN(v)) {
          hasNaN = true;
        }
      });
      expect(hasNaN).assertTrue();
    });

    /**
     * @tc.name testReadonlySetForEach007
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0070
     * @tc.desc Verify forEach with -0 element treated as 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([-0]);
      set.forEach((v: number): void => {
        expect(v).assertEqual(0);
      });
    });

    /**
     * @tc.name testReadonlySetForEach008
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0080
     * @tc.desc Verify forEach third parameter equals the Set instance itself
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      set.forEach((v: int, v2: int, s: ReadonlySet<int>): void => {
        expect(s === set).assertTrue();
      });
    });

    /**
     * @tc.name testReadonlySetForEach009
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0090
     * @tc.desc Verify forEach third parameter s.size is always correct
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["a", "b", "c"]);
      set.forEach((v: string, v2: string, s: ReadonlySet<string>): void => {
        expect(s.size).assertEqual(3);
      });
    });

    /**
     * @tc.name testReadonlySetForEach010
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0100
     * @tc.desc Verify two ReadonlySet references to same Set have identical forEach order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([3, 1, 2]);
      const r1: ReadonlySet<int> = ms;
      const r2: ReadonlySet<int> = ms;
      const a1: int[] = [];
      const a2: int[] = [];
      r1.forEach((v: int): void => {
        a1.push(v);
      });
      r2.forEach((v: int): void => {
        a2.push(v);
      });
      for (let i = 0; i < a1.length; i++) {
        expect(a1[i]).assertEqual(a2[i]);
      }
    });

    /**
     * @tc.name testReadonlySetForEach011
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0110
     * @tc.desc Verify underlying Set add during forEach reflects new element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([1, 2]);
      const view: ReadonlySet<int> = ms;
      ms.add(3);
      let count: int = 0;
      view.forEach((v: int): void => {
        count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetForEach012
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0120
     * @tc.desc Verify underlying Set clear during forEach causes early termination
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([1, 2, 3]);
      const view: ReadonlySet<int> = ms;
      ms.clear();
      let count: int = 0;
      view.forEach((v: int): void => {
        count++;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetForEach013
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0130
     * @tc.desc Verify forEach with ReadonlySet<int[]> traverses array reference elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: int[] = [1, 2];
      let a2: int[] = [3, 4];
      const set: ReadonlySet<int[]> = new Set<int[]>([a1, a2]);
      let count: int = 0;
      set.forEach((v: int[]): void => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetForEach014
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0140
     * @tc.desc Verify forEach accumulates int sum correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3, 4, 5]);
      let sum: int = 0;
      set.forEach((v: int): void => {
        sum += v;
      });
      expect(sum).assertEqual(15);
    });

    /**
     * @tc.name testReadonlySetForEach015
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0150
     * @tc.desc Verify forEach concatenates string elements correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["a", "b", "c"]);
      let result: string = "";
      set.forEach((v: string): void => {
        result += v;
      });
      expect(result).assertEqual("abc");
    });

    /**
     * @tc.name testReadonlySetForEach016
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0160
     * @tc.desc Verify forEach filters odd elements by collecting them
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3, 4, 5]);
      const odds: int[] = [];
      set.forEach((v: int): void => {
        if (v % 2 !== 0) {
          odds.push(v);
        }
      });
      expect(odds.length).assertEqual(3);
      expect(odds[0]).assertEqual(1);
      expect(odds[1]).assertEqual(3);
      expect(odds[2]).assertEqual(5);
    });

    /**
     * @tc.name testReadonlySetForEach017
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0170
     * @tc.desc Verify forEach after constructing ReadonlySet from another Set<T>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<int> = new Set<int>([10, 20, 30]);
      const set: ReadonlySet<int> = new Set<int>(src);
      let count: int = 0;
      set.forEach((v: int): void => {
        count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetForEach018
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0180
     * @tc.desc Verify forEach callback throw is caught with correct Error name
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      try {
        set.forEach((v: int): void => {
          if (v === 2) {
            throw new Error("forEach stop");
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
        expect(e.message).assertEqual("forEach stop");
      }
    });

    /**
     * @tc.name testReadonlySetForEach019
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0190
     * @tc.desc Verify object field mutation is visible in forEach callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: ForEachPerson = new ForEachPerson();
      p.name = "Alice";
      p.age = 30;
      const set: ReadonlySet<ForEachPerson> = new Set<ForEachPerson>([p]);
      p.name = "Bob";
      set.forEach((v: ForEachPerson): void => {
        expect(v.name).assertEqual("Bob");
      });
    });

    /**
     * @tc.name testReadonlySetForEach020
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0200
     * @tc.desc Verify forEach with ReadonlySet<ForEachColor> traverses enum values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<ForEachColor> = new Set<ForEachColor>([ForEachColor.RED, ForEachColor.BLUE]);
      let count: int = 0;
      set.forEach((v: ForEachColor): void => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetForEach021
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0210
     * @tc.desc Verify forEach with ReadonlySet<byte> traverses all byte elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<byte> = new Set<byte>([-128, 0, 127]);
      let count: int = 0;
      set.forEach((v: byte): void => {
        count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetForEach022
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0220
     * @tc.desc Verify forEach with ReadonlySet<short> traverses short boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<short> = new Set<short>([-32768, 0, 32767]);
      const result: short[] = [];
      set.forEach((v: short): void => {
        result.push(v);
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(-32768);
      expect(result[2]).assertEqual(32767);
    });

    /**
     * @tc.name testReadonlySetForEach023
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0230
     * @tc.desc Verify forEach with ReadonlySet<char> traverses char elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<char> = new Set<char>([c'X', c'Y', c'Z']);
      let count: int = 0;
      set.forEach((v: char): void => {
        count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetForEach024
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0240
     * @tc.desc Verify forEach with ReadonlySet<bigint> traverses bigint elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<bigint> = new Set<bigint>([10n, 20n, 30n]);
      let count: int = 0;
      set.forEach((v: bigint): void => {
        count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetForEach025
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0250
     * @tc.desc Verify forEach with ReadonlySet<int[]> traverses all array elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: int[] = [1];
      let a2: int[] = [2];
      const set: ReadonlySet<int[]> = new Set<int[]>([a1, a2, a1]);
      let count: int = 0;
      set.forEach((v: int[]): void => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetForEach026
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0260
     * @tc.desc Verify forEach with FixedArray<int> traverses elements with value equal key
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa1: FixedArray<int> = new FixedArray<int>(3, 0);
      fa1[0] = 1;
      fa1[1] = 2;
      fa1[2] = 3;
      const set: ReadonlySet<FixedArray<int>> = new Set<FixedArray<int>>([fa1]);
      let count: int = 0;
      set.forEach((v: FixedArray<int>): void => {
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetForEach027
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0270
     * @tc.desc Verify underlying Set delete during forEach changes what is traversed
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([1, 2, 3, 4]);
      const view: ReadonlySet<int> = ms;
      ms.delete(2);
      let count: int = 0;
      view.forEach((v: int): void => {
        count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetForEach028
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0280
     * @tc.desc Verify forEach with union type Set traverses mixed types correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ms: Set<string | int> = new Set<string | int>();
      ms.add("text");
      ms.add(99);
      const set: ReadonlySet<string | int> = ms;
      let strFound: boolean = false;
      let intFound: boolean = false;
      set.forEach((v: string | int): void => {
        if (v === "text") {
          strFound = true;
        }
        if (v === 99) {
          intFound = true;
        }
      });
      expect(strFound).assertTrue();
      expect(intFound).assertTrue();
    });

    /**
     * @tc.name testReadonlySetForEach029
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0290
     * @tc.desc Verify forEach with final-like class traverses all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f1: ForEachFinal = new ForEachFinal();
      f1.id = 1;
      let f2: ForEachFinal = new ForEachFinal();
      f2.id = 2;
      const set: ReadonlySet<ForEachFinal> = new Set<ForEachFinal>([f1, f2]);
      let count: int = 0;
      set.forEach((v: ForEachFinal): void => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetForEach030
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0300
     * @tc.desc Verify forEach with interface type traverses all implementors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1: ForEachCircle = new ForEachCircle();
      let c2: ForEachCircle = new ForEachCircle();
      const set: ReadonlySet<ForEachDrawable> = new Set<ForEachDrawable>([c1, c2]);
      let count: int = 0;
      set.forEach((v: ForEachDrawable): void => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetForEach031
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0310
     * @tc.desc Verify forEach accumulates product of int elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3, 4]);
      let product: int = 1;
      set.forEach((v: int): void => {
        product *= v;
      });
      expect(product).assertEqual(24);
    });

    /**
     * @tc.name testReadonlySetForEach032
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0320
     * @tc.desc Verify forEach computes average of double elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<double> = new Set<double>([1.0, 2.0, 3.0, 4.0]);
      let sum: double = 0.0;
      let count: int = 0;
      set.forEach((v: double): void => {
        sum += v;
        count++;
      });
      expect(count).assertEqual(4);
      expect(sum).assertEqual(10.0);
    });

    /**
     * @tc.name testReadonlySetForEach033
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0330
     * @tc.desc Verify forEach with ValueArray<int> traverses all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let va1: ValueArray<int> = new ValueArray<int>(2, 0);
      va1[0] = 1;
      va1[1] = 2;
      let va2: ValueArray<int> = new ValueArray<int>(2, 0);
      va2[0] = 3;
      va2[1] = 4;
      const set: ReadonlySet<ValueArray<int>> = new Set<ValueArray<int>>([va1, va2]);
      let count: int = 0;
      set.forEach((v: ValueArray<int>): void => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetForEach034
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0340
     * @tc.desc Verify forEach with long MAX_VALUE boundary elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([9223372036854775807, -9223372036854775808]);
      let count: int = 0;
      set.forEach((v: long): void => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetForEach035
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0350
     * @tc.desc Verify forEach each visited int element exists in the Set via has()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([10, 20, 30]);
      set.forEach((v: int, v2: int, s: ReadonlySet<int>): void => {
        expect(set.has(v)).assertTrue();
      });
    });

    /**
     * @tc.name testReadonlySetForEach036
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0360
     * @tc.desc Verify forEach with surrogate pair string elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["𝄞", "𝕬"]);
      const result: string[] = [];
      set.forEach((v: string): void => {
        result.push(v);
      });
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("𝄞");
      expect(result[1]).assertEqual("𝕬");
    });

    /**
     * @tc.name testReadonlySetForEach037
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0370
     * @tc.desc Verify forEach callback modifying external array collects all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([100, 200, 300]);
      const collected: int[] = [];
      set.forEach((v: int): void => {
        collected.push(v * 2);
      });
      expect(collected.length).assertEqual(3);
      expect(collected.includes(200)).assertTrue();
      expect(collected.includes(400)).assertTrue();
      expect(collected.includes(600)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetForEach038
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0380
     * @tc.desc Verify forEach with nested Set<int[]> traverses each array element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: int[] = [1, 2, 3];
      let a2: int[] = [4, 5, 6];
      const set: ReadonlySet<int[]> = new Set<int[]>([a1, a2]);
      const lens: int[] = [];
      set.forEach((v: int[]): void => {
        lens.push(v.length);
      });
      expect(lens.length).assertEqual(2);
      expect(lens[0]).assertEqual(3);
      expect(lens[1]).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetForEach039
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0390
     * @tc.desc Verify forEach returns undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      const ret = set.forEach((v: int): void => {
      });
      expect(ret).assertUndefined();
    });

    /**
     * @tc.name testReadonlySetForEach040
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0400
     * @tc.desc Verify forEach callback with throw caught by try-catch with finally
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      let finallyExecuted: boolean = false;
      try {
        set.forEach((v: int): void => {
          if (v === 2) {
            throw new Error("forEach abort");
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
        expect(e.message).assertEqual("forEach abort");
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });

    /**
     * @tc.name testReadonlySetForEach041
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0410
     * @tc.desc Verify forEach each visited float element exists in the Set via has()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<float> = new Set<float>([-1.5 as float, 0.0 as float, 3.14 as float]);
      set.forEach((v: float, v2: float, s: ReadonlySet<float>): void => {
        expect(set.has(v)).assertTrue();
      });
    });

    /**
     * @tc.name testReadonlySetForEach042
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0420
     * @tc.desc Verify forEach on Set with long values [0, 1, -1] sums correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([0, 1, -1]);
      let sum: long = 0;
      set.forEach((v: long): void => {
        sum += v;
      });
      expect(sum).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetForEach043
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0430
     * @tc.desc Verify forEach each visited boolean element exists in the Set via has()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<boolean> = new Set<boolean>([true, false]);
      set.forEach((v: boolean, v2: boolean, s: ReadonlySet<boolean>): void => {
        expect(set.has(v)).assertTrue();
      });
    });

    /**
     * @tc.name testReadonlySetForEach044
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0440
     * @tc.desc Verify forEach collects elements in insertion order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["first", "second", "third"]);
      const result: string[] = [];
      set.forEach((v: string): void => {
        result.push(v);
      });
      expect(result[0]).assertEqual("first");
      expect(result[1]).assertEqual("second");
      expect(result[2]).assertEqual("third");
    });

    /**
     * @tc.name testReadonlySetForEach045
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0450
     * @tc.desc Verify forEach with custom object property aggregation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: ForEachPerson = new ForEachPerson();
      p1.name = "A";
      p1.age = 10;
      let p2: ForEachPerson = new ForEachPerson();
      p2.name = "B";
      p2.age = 20;
      const set: ReadonlySet<ForEachPerson> = new Set<ForEachPerson>([p1, p2]);
      let totalAge: int = 0;
      set.forEach((v: ForEachPerson): void => {
        totalAge += v.age;
      });
      expect(totalAge).assertEqual(30);
    });

    /**
     * @tc.name testReadonlySetForEach046
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0460
     * @tc.desc Verify forEach on Set with 1000 elements executes 1000 callbacks
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      for (let i: int = 0; i < 1000; i++) {
        arr.push(i);
      }
      const set: Set<int> = new Set<int>(arr);
      const view: ReadonlySet<int> = set;
      let count: int = 0;
      view.forEach((v: int): void => {
        count++;
      });
      expect(count).assertEqual(1000);
    });

    /**
     * @tc.name testReadonlySetForEach047
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0470
     * @tc.desc Verify forEach with duplicate constructor elements iterates deduplicated count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 1, 2, 2, 3]);
      let count: int = 0;
      set.forEach((v: int): void => {
        count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetForEach048
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0480
     * @tc.desc Verify forEach does not modify original Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3, 4, 5]);
      let originalSize: int = set.size;
      let count: int = 0;
      set.forEach((v: int): void => {
        count++;
      });
      expect(set.size).assertEqual(originalSize);
      expect(count).assertEqual(5);
    });

    /**
     * @tc.name testReadonlySetForEach049
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0490
     * @tc.desc Verify forEach with 2D int[][] array elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m1: int[][] = [[1, 2], [3, 4]];
      let m2: int[][] = [[5, 6]];
      const set: ReadonlySet<int[][]> = new Set<int[][]>([m1, m2]);
      let count: int = 0;
      set.forEach((v: int[][]): void => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetForEach050
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0500
     * @tc.desc Verify forEach third parameter s.size equals set.size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      set.forEach((v: int, v2: int, s: ReadonlySet<int>): void => {
        expect(s.size).assertEqual(set.size);
      });
    });

    /**
     * @tc.name testReadonlySetForEach051
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0510
     * @tc.desc Verify forEach sums long elements [10,20,30]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([10, 20, 30]);
      let sum: long = 0;
      set.forEach((v: long): void => {
        sum += v;
      });
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.name testReadonlySetForEach052
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0520
     * @tc.desc Verify forEach computes int product [2,3,4]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([2, 3, 4]);
      let product: int = 1;
      set.forEach((v: int, v2: int): void => {
        product *= v;
      });
      expect(product).assertEqual(24);
    });

    /**
     * @tc.name testReadonlySetForEach053
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0530
     * @tc.desc Verify forEach concatenates value+key for string Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["a", "b", "c"]);
      let result: string = "";
      set.forEach((v: string, v2: string, s: ReadonlySet<string>): void => {
        result += v + v2;
      });
      expect(result).assertEqual("aabbcc");
    });

    /**
     * @tc.name testReadonlySetForEach054
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0540
     * @tc.desc Verify forEach computes sum of squares [1,2,3,4,5]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3, 4, 5]);
      let sumSq: int = 0;
      set.forEach((v: int): void => {
        sumSq += v * v;
      });
      expect(sumSq).assertEqual(55);
    });

    /**
     * @tc.name testReadonlySetForEach055
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0550
     * @tc.desc Verify forEach sums number elements [1.5,2.5,3.0]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([1.5, 2.5, 3.0]);
      let sum: number = 0;
      set.forEach((v: number): void => {
        sum += v;
      });
      expect(sum).assertEqual(7.0);
    });

    /**
     * @tc.name testReadonlySetForEach056
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0560
     * @tc.desc Verify forEach reflects underlying Set add operations
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([1, 2]);
      const view: ReadonlySet<int> = ms;
      ms.add(3);
      ms.add(4);
      let count: int = 0;
      view.forEach((v: int): void => {
        count++;
      });
      expect(count).assertEqual(4);
    });

    /**
     * @tc.name testReadonlySetForEach057
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0570
     * @tc.desc Verify forEach reflects underlying Set delete operations
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([1, 2, 3]);
      const view: ReadonlySet<int> = ms;
      ms.delete(2);
      let count: int = 0;
      view.forEach((v: int): void => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetForEach058
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0580
     * @tc.desc Verify forEach counts true values in boolean Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<boolean> = new Set<boolean>([true, false]);
      let trueCount: int = 0;
      set.forEach((v: boolean): void => {
        if (v) {
          trueCount++;
        }
      });
      expect(trueCount).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetForEach059
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0590
     * @tc.desc Verify forEach sums short boundary values to -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<short> = new Set<short>([-32768, 0, 32767]);
      let sum: int = 0;
      set.forEach((v: short): void => {
        sum += v;
      });
      expect(sum).assertEqual(-1);
    });

    /**
     * @tc.name testReadonlySetForEach060
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0600
     * @tc.desc Verify forEach counts enum Fp2Status elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Fp2Status> = new Set<Fp2Status>([Fp2Status.ACTIVE, Fp2Status.INACTIVE]);
      let count: int = 0;
      set.forEach((v: Fp2Status): void => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetForEach061
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0610
     * @tc.desc Verify forEach splits traversal into firstHalf and secondHalf
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([5, 10, 15]);
      const firstHalf: int[] = [];
      const secondHalf: int[] = [];
      let callCount: int = 0;
      set.forEach((v: int): void => {
        if (callCount < 2) {
          firstHalf.push(v);
        } else {
          secondHalf.push(v);
        }
        callCount++;
      });
      expect(firstHalf.length).assertEqual(2);
      expect(secondHalf.length).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetForEach062
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0620
     * @tc.desc Verify forEach finds maximum element in int Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3, 4, 5]);
      let max: int = -999999;
      set.forEach((v: int): void => {
        if (v > max) {
          max = v;
        }
      });
      expect(max).assertEqual(5);
    });

    /**
     * @tc.name testReadonlySetForEach063
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0630
     * @tc.desc Verify forEach finds minimum element in int Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3, 4, 5]);
      let min: int = 999999;
      set.forEach((v: int): void => {
        if (v < min) {
          min = v;
        }
      });
      expect(min).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetForEach064
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0640
     * @tc.desc Verify forEach aggregates salary field from custom objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Fp2Worker = new Fp2Worker();
      p1.name = "A";
      p1.salary = 5000;
      let p2: Fp2Worker = new Fp2Worker();
      p2.name = "B";
      p2.salary = 7000;
      const set: ReadonlySet<Fp2Worker> = new Set<Fp2Worker>([p1, p2]);
      let total: int = 0;
      set.forEach((v: Fp2Worker): void => {
        total += v.salary;
      });
      expect(total).assertEqual(12000);
    });

    /**
     * @tc.name testReadonlySetForEach065
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0650
     * @tc.desc Verify forEach counts deduplicated elements [1,2,3,2,1]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3, 2, 1]);
      let count: int = 0;
      set.forEach((v: long): void => {
        count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetForEach066
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0660
     * @tc.desc Verify forEach sums number elements [0.5,1.0,1.5]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([0.5, 1.0, 1.5]);
      let acc: number = 0;
      set.forEach((v: number): void => {
        acc += v;
      });
      expect(acc).assertEqual(3.0);
    });

    /**
     * @tc.name testReadonlySetForEach067
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0670
     * @tc.desc Verify forEach counts Object type elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objects: Object[] = [new Object(), new Object()];
      const set: ReadonlySet<Object> = new Set<Object>(objects);
      let count: int = 0;
      set.forEach((v: Object): void => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetForEach068
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0680
     * @tc.desc Verify forEach reflects multiple underlying delete operations
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([1, 2, 3, 4, 5]);
      const view: ReadonlySet<int> = ms;
      for (let i: int = 0; i < 3; i++) {
        ms.delete(i + 1);
      }
      let count: int = 0;
      view.forEach((v: int): void => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetForEach069
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0690
     * @tc.desc Verify forEach has() consistency for each element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([10, 20, 30, 40, 50]);
      set.forEach((v: int): void => {
        expect(set.has(v)).assertTrue();
      });
    });

    /**
     * @tc.name testReadonlySetForEach070
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0700
     * @tc.desc Verify forEach each visited string element exists in the Set via has()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["x", "y"]);
      set.forEach((v: string, v2: string): void => {
        expect(set.has(v)).assertTrue();
      });
    });

    /**
     * @tc.name testReadonlySetForEach071
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0710
     * @tc.desc Verify forEach key sum equals value sum for int Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([7, 14, 21]);
      let sumKey: int = 0;
      let sumVal: int = 0;
      set.forEach((v: int, v2: int): void => {
        sumVal += v;
        sumKey += v2;
      });
      expect(sumVal).assertEqual(sumKey);
    });

    /**
     * @tc.name testReadonlySetForEach072
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0720
     * @tc.desc Verify forEach sums double elements [-1.0,0.0,1.0]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<double> = new Set<double>([-1.0, 0.0, 1.0]);
      let sum: double = 0;
      set.forEach((v: double): void => {
        sum += v;
      });
      expect(sum).assertEqual(0.0);
    });

    /**
     * @tc.name testReadonlySetForEach073
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0730
     * @tc.desc Verify forEach separates positive and negative long elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([-5, 0, 5]);
      let negCount: int = 0;
      let posCount: int = 0;
      set.forEach((v: long): void => {
        if (v > 0) {
          posCount++;
        } else if (v < 0) {
          negCount++;
        }
      });
      expect(negCount).assertEqual(1);
      expect(posCount).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetForEach074
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0740
     * @tc.desc Verify forEach counts all even elements in int Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([2, 4, 6, 8]);
      let evenCount: int = 0;
      set.forEach((v: int): void => {
        if (v % 2 === 0) {
          evenCount++;
        }
      });
      expect(evenCount).assertEqual(4);
    });

    /**
     * @tc.name testReadonlySetForEach075
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0750
     * @tc.desc Verify forEach sums all elements of ReadonlySet<long>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([2, 4, 6]);
      let s: long = 0;
      set.forEach((v: long): void => {
        s += v;
      });
      expect(s).assertEqual(12);
    });

    /**
     * @tc.name testReadonlySetForEach076
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0760
     * @tc.desc Verify forEach iterates all elements of ReadonlySet<long>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3, 4, 5]);
      let c: int = 0;
      set.forEach((v: long): void => {
        c++;
      });
      expect(c).assertEqual(5);
    });

    /**
     * @tc.name testReadonlySetForEach077
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0770
     * @tc.desc Verify forEach separates positive and negative elements of ReadonlySet<long>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([-2, -1, 0, 1, 2]);
      let ns: long = 0;
      let ps: long = 0;
      set.forEach((v: long): void => {
        if (v > 0) {
          ps += v;
        } else if (v < 0) {
          ns += v;
        }
      });
      expect(ns).assertEqual(-3);
      expect(ps).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetForEach078
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0780
     * @tc.desc Verify forEach sums elements of ReadonlySet<long> with values 3, 6, 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([3, 6, 9]);
      let s: long = 0;
      set.forEach((v: long): void => {
        s += v;
      });
      expect(s).assertEqual(18);
    });

    /**
     * @tc.name testReadonlySetForEach079
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0790
     * @tc.desc Verify forEach pushes elements into an array from ReadonlySet<long>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([10, 20, 30]);
      const a: long[] = [];
      set.forEach((v: long): void => {
        a.push(v);
      });
      expect(a.length).assertEqual(3);
      expect(a[0]).assertEqual(10);
    });

    /**
     * @tc.name testReadonlySetForEach080
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0800
     * @tc.desc Verify forEach sums four elements of ReadonlySet<long>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([5, 10, 15, 20]);
      let s: long = 0;
      set.forEach((v: long): void => {
        s += v;
      });
      expect(s).assertEqual(50);
    });

    /**
     * @tc.name testReadonlySetForEach081
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0810
     * @tc.desc Verify forEach with both value and key parameters on ReadonlySet<long>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([7, 14, 21]);
      let s: long = 0;
      set.forEach((v: long, v2: long): void => {
        s += v;
      });
      expect(s).assertEqual(42);
    });

    /**
     * @tc.name testReadonlySetForEach082
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0820
     * @tc.desc Verify forEach each visited long element exists in the Set via has()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      let c: int = 0;
      set.forEach((v: long, v2: long): void => {
        expect(set.has(v)).assertTrue();
        c++;
      });
      expect(c).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetForEach083
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0830
     * @tc.desc Verify forEach value sum equals key sum in ReadonlySet<long>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([100, 200, 300]);
      let sk: long = 0;
      let sv: long = 0;
      set.forEach((v: long, v2: long): void => {
        sv += v;
        sk += v2;
      });
      expect(sv).assertEqual(sk);
    });

    /**
     * @tc.name testReadonlySetForEach084
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0840
     * @tc.desc Verify forEach finds maximum element in ReadonlySet<long>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([8, 16, 24]);
      let mx: long = -999;
      set.forEach((v: long): void => {
        if (v > mx) {
          mx = v;
        }
      });
      expect(mx).assertEqual(24);
    });

    /**
     * @tc.name testReadonlySetForEach085
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0850
     * @tc.desc Verify forEach finds minimum element in ReadonlySet<long>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([8, 16, 24]);
      let mn: long = 999;
      set.forEach((v: long): void => {
        if (v < mn) {
          mn = v;
        }
      });
      expect(mn).assertEqual(8);
    });

    /**
     * @tc.name testReadonlySetForEach086
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0860
     * @tc.desc Verify forEach deduplicates duplicate elements in ReadonlySet<long>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3, 1, 2]);
      let c: int = 0;
      set.forEach((v: long): void => {
        c++;
      });
      expect(c).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetForEach087
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0870
     * @tc.desc Verify forEach sums object fields in ReadonlySet<Fp3Emp>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: Fp3Emp = new Fp3Emp();
      e1.base = 100;
      e1.bonus = 20;
      let e2: Fp3Emp = new Fp3Emp();
      e2.base = 200;
      e2.bonus = 30;
      const set: ReadonlySet<Fp3Emp> = new Set<Fp3Emp>([e1, e2]);
      let t: int = 0;
      set.forEach((v: Fp3Emp): void => {
        t += v.base + v.bonus;
      });
      expect(t).assertEqual(350);
    });

    /**
     * @tc.name testReadonlySetForEach088
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0880
     * @tc.desc Verify forEach sums elements of ReadonlySet<long> with zero included
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([0, 1, 2]);
      let s: long = 0;
      set.forEach((v: long): void => {
        s += v;
      });
      expect(s).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetForEach089
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0890
     * @tc.desc Verify forEach sums negative elements of ReadonlySet<long>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([-3, -2, -1]);
      let s: long = 0;
      set.forEach((v: long): void => {
        s += v;
      });
      expect(s).assertEqual(-6);
    });

    /**
     * @tc.name testReadonlySetForEach090
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0900
     * @tc.desc Verify forEach returns undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      const ret = set.forEach((v: long): void => {});
      expect(ret).assertUndefined();
    });

    /**
     * @tc.name testReadonlySetForEach091
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0910
     * @tc.desc Verify forEach transforms and collects doubled values from ReadonlySet<long>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([5, 10, 15]);
      const a: long[] = [];
      set.forEach((v: long): void => {
        a.push(v * 2);
      });
      expect(a.length).assertEqual(3);
      expect(a[0]).assertEqual(10);
      expect(a[2]).assertEqual(30);
    });

    /**
     * @tc.name testReadonlySetForEach092
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0920
     * @tc.desc Verify forEach with no-argument callback iterates all elements of ReadonlySet<long>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      let c: int = 0;
      set.forEach((): void => {
        c++;
      });
      expect(c).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetForEach093
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0930
     * @tc.desc Verify forEach computes sum of squares of ReadonlySet<long> elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([4, 8, 12]);
      let s: long = 0;
      set.forEach((v: long): void => {
        s += v * v;
      });
      expect(s).assertEqual(224);
    });

    /**
     * @tc.name testReadonlySetForEach094
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0940
     * @tc.desc Verify forEach computes integer division of ReadonlySet<long> elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3, 4, 5]);
      let s: long = 0;
      let n: int = 0;
      set.forEach((v: long): void => {
        s += v;
        n++;
      });
      expect(s / n).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetForEach095
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0950
     * @tc.desc Verify forEach sums prime number elements of ReadonlySet<long>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([2, 3, 5, 7, 11]);
      let s: long = 0;
      set.forEach((v: long): void => {
        s += v;
      });
      expect(s).assertEqual(28);
    });

    /**
     * @tc.name testReadonlySetForEach096
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0960
     * @tc.desc Verify forEach on ReadonlySet<long> with duplicate initial values counts unique only
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 1, 2, 2, 3]);
      let c: int = 0;
      set.forEach((v: long): void => {
        c++;
      });
      expect(c).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetForEach097
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0970
     * @tc.desc Verify forEach third parameter references the original ReadonlySet<long>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([10, 20, 30]);
      set.forEach((v: long, v2: long, s: ReadonlySet<long>): void => {
        expect(s.size).assertEqual(3);
      });
    });

    /**
     * @tc.name testReadonlySetForEach098
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0980
     * @tc.desc Verify forEach each visited long element exists in the Set via has()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      set.forEach((v: long, v2: long): void => {
        expect(set.has(v)).assertTrue();
      });
    });

    /**
     * @tc.name testReadonlySetForEach099
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0990
     * @tc.desc Verify forEach with cross-method consistency: forEach count equals entries count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([10, 20, 30, 40, 50]);
      let forEachCount: int = 0;
      let entryCount: int = 0;
      set.forEach((): void => {
        forEachCount++;
      });
      for (const _ of set.entries()) {
        entryCount++;
      }
      expect(forEachCount).assertEqual(entryCount);
      expect(forEachCount).assertEqual(set.size);
    });

    /**
     * @tc.name testReadonlySetForEach100
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1000
     * @tc.desc Verify forEach with Object elements traverses all references correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o1: Object = new Object();
      const o2: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([o1, o2]);
      const refs: Object[] = [];
      set.forEach((v: Object): void => {
        refs.push(v);
      });
      expect(refs.length).assertEqual(2);
      expect(refs[0]).assertEqual(o1);
      expect(refs[1]).assertEqual(o2);
    });

    /**
     * @tc.name testReadonlySetForEach101
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1010
     * @tc.desc Verify forEach with large Set of 30000 elements executes all callbacks
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [];
      for (let i: int = 0; i < 30000; i++) {
        arr.push(i);
      }
      const set: ReadonlySet<int> = new Set<int>(arr);
      let count: int = 0;
      set.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(30000);
    });

    /**
     * @tc.name testReadonlySetForEach102
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1020
     * @tc.desc Verify forEach with Object element traverses without error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([obj]);
      let found: boolean = false;
      set.forEach((v: Object): void => {
        if (v === obj) {
          found = true;
        }
      });
      expect(found).assertTrue();
    });

    /**
     * @tc.name testReadonlySetForEach103
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1030
     * @tc.desc Verify forEach with boundary combination Set (NaN, Infinity, -Infinity, +0) counts correct deduplicated elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([Number.NaN, Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY, 0]);
      let count: int = 0;
      set.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(4);
    });

    /**
     * @tc.name testReadonlySetForEach104
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1040
     * @tc.desc Verify forEach with ReadonlySet<Error> traverses Error objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Error> = new Set<Error>([new Error("e1"), new Error("e2")]);
      let count: int = 0;
      set.forEach((v: Error): void => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetForEach105
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1050
     * @tc.desc Verify forEach with ReadonlySet<Date> traverses Date objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Date> = new Set<Date>([new Date(2024), new Date(2025)]);
      let count: int = 0;
      set.forEach((v: Date): void => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetForEach106
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1060
     * @tc.desc Verify forEach with ReadonlySet<RegExp> traverses RegExp objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<RegExp> = new Set<RegExp>([new RegExp("a"), new RegExp("b")]);
      let count: int = 0;
      set.forEach((v: RegExp): void => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetForEach107
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1070
     * @tc.desc Verify forEach with ReadonlySet<Object> traverses Promise objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1: Object = new Object();
      const p2: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([p1, p2]);
      let count: int = 0;
      set.forEach((v: Object): void => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetForEach108
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1080
     * @tc.desc Verify forEach with ReadonlySet<WeakMap<Object, int>> traverses WeakMap objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const wm2: WeakMap<Object, int> = new WeakMap<Object, int>();
      const set: ReadonlySet<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>([wm1, wm2]);
      let count: int = 0;
      set.forEach((v: WeakMap<Object, int>): void => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetForEach109
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1090
     * @tc.desc Verify forEach with ReadonlySet<WeakSet<Object>> traverses WeakSet objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const ws2: WeakSet<Object> = new WeakSet<Object>();
      const set: ReadonlySet<WeakSet<Object>> = new Set<WeakSet<Object>>([ws1, ws2]);
      let count: int = 0;
      set.forEach((v: WeakSet<Object>): void => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetForEach110
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1100
     * @tc.desc Verify underlying Set delete reduces Error forEach count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error("a");
      const e2: Error = new Error("b");
      let ms: Set<Error> = new Set<Error>([e1, e2]);
      const view: ReadonlySet<Error> = ms;
      ms.delete(e1);
      let count: int = 0;
      view.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetForEach111
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1110
     * @tc.desc Verify underlying Set delete reduces Date forEach count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(1);
      const d2: Date = new Date(2);
      let ms: Set<Date> = new Set<Date>([d1, d2]);
      const view: ReadonlySet<Date> = ms;
      ms.delete(d1);
      let count: int = 0;
      view.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetForEach112
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1120
     * @tc.desc Verify underlying Set delete reduces RegExp forEach count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: RegExp = new RegExp("a");
      const r2: RegExp = new RegExp("b");
      let ms: Set<RegExp> = new Set<RegExp>([r1, r2]);
      const view: ReadonlySet<RegExp> = ms;
      ms.delete(r1);
      let count: int = 0;
      view.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetForEach113
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1130
     * @tc.desc Verify underlying Set delete reduces Promise forEach count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1: Object = new Object();
      const p2: Object = new Object();
      let ms: Set<Object> = new Set<Object>([p1, p2]);
      const view: ReadonlySet<Object> = ms;
      ms.delete(p1);
      let count: int = 0;
      view.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetForEach114
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1140
     * @tc.desc Verify underlying Set delete reduces WeakMap forEach count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const wm2: WeakMap<Object, int> = new WeakMap<Object, int>();
      let ms: Set<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>([wm1, wm2]);
      const view: ReadonlySet<WeakMap<Object, int>> = ms;
      ms.delete(wm1);
      let count: int = 0;
      view.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetForEach115
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1150
     * @tc.desc Verify underlying Set delete reduces WeakSet forEach count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const ws2: WeakSet<Object> = new WeakSet<Object>();
      let ms: Set<WeakSet<Object>> = new Set<WeakSet<Object>>([ws1, ws2]);
      const view: ReadonlySet<WeakSet<Object>> = ms;
      ms.delete(ws1);
      let count: int = 0;
      view.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetForEach116
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1160
     * @tc.desc Verify underlying Set clear empties Error forEach traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<Error> = new Set<Error>([new Error("a"), new Error("b")]);
      const view: ReadonlySet<Error> = ms;
      ms.clear();
      let count: int = 0;
      view.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetForEach117
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1170
     * @tc.desc Verify underlying Set clear empties Date forEach traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<Date> = new Set<Date>([new Date(1), new Date(2)]);
      const view: ReadonlySet<Date> = ms;
      ms.clear();
      let count: int = 0;
      view.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetForEach118
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1180
     * @tc.desc Verify underlying Set clear empties RegExp forEach traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<RegExp> = new Set<RegExp>([new RegExp("a"), new RegExp("b")]);
      const view: ReadonlySet<RegExp> = ms;
      ms.clear();
      let count: int = 0;
      view.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetForEach119
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1190
     * @tc.desc Verify underlying Set clear empties Promise forEach traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1: Object = new Object();
      const p2: Object = new Object();
      let ms: Set<Object> = new Set<Object>([p1, p2]);
      const view: ReadonlySet<Object> = ms;
      ms.clear();
      let count: int = 0;
      view.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetForEach120
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1200
     * @tc.desc Verify underlying Set clear empties WeakMap forEach traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const wm2: WeakMap<Object, int> = new WeakMap<Object, int>();
      let ms: Set<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>([wm1, wm2]);
      const view: ReadonlySet<WeakMap<Object, int>> = ms;
      ms.clear();
      let count: int = 0;
      view.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetForEach121
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1210
     * @tc.desc Verify underlying Set clear empties WeakSet forEach traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const ws2: WeakSet<Object> = new WeakSet<Object>();
      let ms: Set<WeakSet<Object>> = new Set<WeakSet<Object>>([ws1, ws2]);
      const view: ReadonlySet<WeakSet<Object>> = ms;
      ms.clear();
      let count: int = 0;
      view.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetForEach122
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1220
     * @tc.desc Verify forEach on empty ReadonlySet<Error> does not invoke callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Error> = new Set<Error>();
      let called: boolean = false;
      set.forEach((): void => {
        called = true;
      });
      expect(called).assertFalse();
    });

    /**
     * @tc.name testReadonlySetForEach123
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1230
     * @tc.desc Verify forEach on empty ReadonlySet<Date> does not invoke callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Date> = new Set<Date>();
      let called: boolean = false;
      set.forEach((): void => {
        called = true;
      });
      expect(called).assertFalse();
    });

    /**
     * @tc.name testReadonlySetForEach124
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1240
     * @tc.desc Verify forEach on empty ReadonlySet<RegExp> does not invoke callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<RegExp> = new Set<RegExp>();
      let called: boolean = false;
      set.forEach((): void => {
        called = true;
      });
      expect(called).assertFalse();
    });

    /**
     * @tc.name testReadonlySetForEach125
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1250
     * @tc.desc Verify forEach on empty ReadonlySet<Object> does not invoke callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Object> = new Set<Object>();
      let called: boolean = false;
      set.forEach((): void => {
        called = true;
      });
      expect(called).assertFalse();
    });

    /**
     * @tc.name testReadonlySetForEach126
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1260
     * @tc.desc Verify forEach on empty ReadonlySet<WeakMap<Object, int>> does not invoke callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>();
      let called: boolean = false;
      set.forEach((): void => {
        called = true;
      });
      expect(called).assertFalse();
    });

    /**
     * @tc.name testReadonlySetForEach127
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1270
     * @tc.desc Verify forEach on empty ReadonlySet<WeakSet<Object>> does not invoke callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<WeakSet<Object>> = new Set<WeakSet<Object>>();
      let called: boolean = false;
      set.forEach((): void => {
        called = true;
      });
      expect(called).assertFalse();
    });

    /**
     * @tc.name testReadonlySetForEach128
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1280
     * @tc.desc Verify single-element Error forEach invokes callback once
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Error> = new Set<Error>([new Error("a")]);
      let count: int = 0;
      set.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetForEach129
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1290
     * @tc.desc Verify single-element Date forEach invokes callback once
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Date> = new Set<Date>([new Date(1)]);
      let count: int = 0;
      set.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetForEach130
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1300
     * @tc.desc Verify single-element RegExp forEach invokes callback once
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<RegExp> = new Set<RegExp>([new RegExp("a")]);
      let count: int = 0;
      set.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetForEach131
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1310
     * @tc.desc Verify single-element Promise forEach invokes callback once
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Object> = new Set<Object>([new Object()]);
      let count: int = 0;
      set.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetForEach132
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1320
     * @tc.desc Verify single-element WeakMap forEach invokes callback once
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>([new WeakMap<Object, int>()]);
      let count: int = 0;
      set.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetForEach133
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1330
     * @tc.desc Verify single-element WeakSet forEach invokes callback once
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<WeakSet<Object>> = new Set<WeakSet<Object>>([new WeakSet<Object>()]);
      let count: int = 0;
      set.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetForEach134
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1340
     * @tc.desc Verify duplicate Error references deduplicate in forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error("a");
      const set: ReadonlySet<Error> = new Set<Error>([e1, e1]);
      let count: int = 0;
      set.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetForEach135
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1350
     * @tc.desc Verify duplicate Date references deduplicate in forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(1);
      const set: ReadonlySet<Date> = new Set<Date>([d1, d1]);
      let count: int = 0;
      set.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetForEach136
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1360
     * @tc.desc Verify duplicate RegExp references deduplicate in forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: RegExp = new RegExp("a");
      const set: ReadonlySet<RegExp> = new Set<RegExp>([r1, r1]);
      let count: int = 0;
      set.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetForEach137
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1370
     * @tc.desc Verify duplicate Promise references deduplicate in forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([p1, p1]);
      let count: int = 0;
      set.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetForEach138
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1380
     * @tc.desc Verify duplicate WeakMap references deduplicate in forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const set: ReadonlySet<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>([wm1, wm1]);
      let count: int = 0;
      set.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetForEach139
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1390
     * @tc.desc Verify duplicate WeakSet references deduplicate in forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const set: ReadonlySet<WeakSet<Object>> = new Set<WeakSet<Object>>([ws1, ws1]);
      let count: int = 0;
      set.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetForEach140
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1400
     * @tc.desc Verify underlying Set add reflected in Error forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<Error> = new Set<Error>([new Error("a")]);
      const view: ReadonlySet<Error> = ms;
      ms.add(new Error("b"));
      let count: int = 0;
      view.forEach((): void => { count++; });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetForEach141
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1410
     * @tc.desc Verify underlying Set add reflected in Date forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<Date> = new Set<Date>([new Date(1)]);
      const view: ReadonlySet<Date> = ms;
      ms.add(new Date(2));
      let count: int = 0;
      view.forEach((): void => { count++; });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetForEach142
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1420
     * @tc.desc Verify underlying Set add reflected in RegExp forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<RegExp> = new Set<RegExp>([new RegExp("a")]);
      const view: ReadonlySet<RegExp> = ms;
      ms.add(new RegExp("b"));
      let count: int = 0;
      view.forEach((): void => { count++; });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetForEach143
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1430
     * @tc.desc Verify underlying Set add reflected in Promise forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1: Object = new Object();
      const p2: Object = new Object();
      let ms: Set<Object> = new Set<Object>([p1]);
      const view: ReadonlySet<Object> = ms;
      ms.add(p2);
      let count: int = 0;
      view.forEach((): void => { count++; });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetForEach144
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1440
     * @tc.desc Verify underlying Set add reflected in WeakMap forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const wm2: WeakMap<Object, int> = new WeakMap<Object, int>();
      let ms: Set<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>([wm1]);
      const view: ReadonlySet<WeakMap<Object, int>> = ms;
      ms.add(wm2);
      let count: int = 0;
      view.forEach((): void => { count++; });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetForEach145
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1450
     * @tc.desc Verify underlying Set add reflected in WeakSet forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const ws2: WeakSet<Object> = new WeakSet<Object>();
      let ms: Set<WeakSet<Object>> = new Set<WeakSet<Object>>([ws1]);
      const view: ReadonlySet<WeakSet<Object>> = ms;
      ms.add(ws2);
      let count: int = 0;
      view.forEach((): void => { count++; });
      expect(count).assertEqual(2);
    });

  });
}
