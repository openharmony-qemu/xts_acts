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
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

// Merged from SparseArrayFlatPart01Test (27 scenarios -> 3 cases, each <=10)
export default function sparseArrayFlatPart01Test(): void {
  describe('SparseArrayFlatPart01Test', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_PART01_0100
     * @tc.name sparseArrayFlatPart01Test001
     * @tc.desc flat() default depth 1, deep/empty/matrix & sparse-outer flatten (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFlatPart01Test001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. flat outer sparse@{0} -> length 1, result[0]=42
      const outer1 = new SparseArray<int>();
      outer1[0] = 42;
      const result1 = outer1.flat<int>();
      expect(result1.length).assertEqual(1);
      expect(result1[0]).assertEqual(42);
      // 2. flat outer(inner 10,20,30) -> length 3 [10,20,30]
      const inner2 = new SparseArray<int>(10, 20, 30);
      const outer2 = new SparseArray<SparseArray<int>>(inner2);
      const result2 = outer2.flat<int>();
      expect(result2.length).assertEqual(3);
      expect(result2[0]).assertEqual(10);
      expect(result2[1]).assertEqual(20);
      expect(result2[2]).assertEqual(30);
      // 3. flat pushed(1; 2,3; inner) -> length 6
      const inner3 = new SparseArray<int>(44, 55, 66);
      const outer3 = new SparseArray<int | SparseArray<int>>();
      outer3.push(1);
      outer3.push(2, 3);
      outer3.push(inner3);
      const result3 = outer3.flat();
      expect(result3.length).assertEqual(6);
      // 4. flat deep outer(inner(inner)) -> length 1, keeps innerInner ref
      const leaf4 = new SparseArray<int>(10, 20);
      const mid4 = new SparseArray<SparseArray<int>>(leaf4);
      const outer4 = new SparseArray<SparseArray<SparseArray<int>>>(mid4);
      const result4 = outer4.flat<SparseArray<int>>();
      expect(result4.length).assertEqual(1);
      expect(result4.at(0)! === leaf4).assertTrue();
      // 5. flat 3-level matrix outer(l1(l2(l3))) -> length 1, keeps leaf ref
      const leaf5 = new SparseArray<int>(1);
      const mid5 = new SparseArray<SparseArray<int>>(leaf5);
      const outer5 = new SparseArray<SparseArray<SparseArray<int>>>(mid5);
      const result5 = outer5.flat();
      expect(result5.length).assertEqual(1);
      expect(result5[0]! === leaf5).assertTrue();
      // 6. flat pushed(shallow; deep) -> length 3
      const shallow6 = new SparseArray<int>(5, 6);
      const deepInner6 = new SparseArray<int>(7);
      const deep6 = new SparseArray<SparseArray<int>>(deepInner6);
      const outer6 = new SparseArray<SparseArray<int> | SparseArray<SparseArray<int>>>(shallow6);
      outer6.push(deep6);
      const result6 = outer6.flat();
      expect(result6.length).assertEqual(3);
      // 7. flat outer(inner1, inner2, inner3) -> length 3
      const inA7 = new SparseArray<int>(1, 2);
      const inB7 = new SparseArray<int>();
      const inC7 = new SparseArray<int>();
      inC7[0] = 3;
      const outer7 = new SparseArray<SparseArray<int>>(inA7, inB7, inC7);
      const result7 = outer7.flat<int>();
      expect(result7.length).assertEqual(3);
      // 8. flat outer(3 sparse inners) -> [1,2,3]
      const inA8 = new SparseArray<int>();
      inA8[0] = 1;
      const inB8 = new SparseArray<int>();
      inB8[0] = 2;
      const inC8 = new SparseArray<int>();
      inC8[0] = 3;
      const outer8 = new SparseArray<SparseArray<int>>(inA8, inB8, inC8);
      const result8 = outer8.flat<int>();
      expect(result8[0]).assertEqual(1);
      expect(result8[1]).assertEqual(2);
      expect(result8[2]).assertEqual(3);
      // 9. flat outer(sparse inner {0:10,2:30}) -> length 2 [10,30]
      const inner9 = new SparseArray<int>(3);
      inner9[0] = 10;
      inner9[2] = 30;
      const outer9 = new SparseArray<SparseArray<int>>(inner9);
      const result9 = outer9.flat<int>();
      expect(result9.length).assertEqual(2);
      expect(result9[0]).assertEqual(10);
      expect(result9[1]).assertEqual(30);
      // 10. flat outer sparse@{2}=inner -> length 2 [1,2]
      const inner10 = new SparseArray<int>(1, 2);
      const outer10 = new SparseArray<SparseArray<int>>(3);
      outer10[2] = inner10;
      const result10 = outer10.flat<int>();
      expect(result10.length).assertEqual(2);
      expect(result10[0]).assertEqual(1);
      expect(result10[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_PART01_0200
     * @tc.name sparseArrayFlatPart01Test002
     * @tc.desc flat() typed & special elements (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFlatPart01Test002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. flat string inner ('a','b') -> ['a','b']
      const inner1 = new SparseArray<string>('a', 'b');
      const outer1 = new SparseArray<SparseArray<string>>(inner1);
      const result1 = outer1.flat<string>();
      expect(result1[0]).assertEqual('a');
      expect(result1[1]).assertEqual('b');
      // 2. flat double NaN -> isNaN(result[0])
      const inner2 = new SparseArray<double>(Number.NaN);
      const outer2 = new SparseArray<SparseArray<double>>(inner2);
      const result2 = outer2.flat<double>();
      expect(isNaN(result2[0] as number)).assertTrue();
      // 3. flat double Infinity -> result[0]=Infinity
      const inner3 = new SparseArray<double>(Number.POSITIVE_INFINITY);
      const outer3 = new SparseArray<SparseArray<double>>(inner3);
      const result3 = outer3.flat<double>();
      expect(result3[0]).assertEqual(Number.POSITIVE_INFINITY);
      // 4. flat bigint (0n,100n) -> [0n,100n]
      const inner4 = new SparseArray<bigint>(0n, 100n);
      const outer4 = new SparseArray<SparseArray<bigint>>(inner4);
      const result4 = outer4.flat<bigint>();
      expect(result4[0]).assertEqual(0n);
      expect(result4[1]).assertEqual(100n);
      // 5. flat boolean (true,false,true) -> [true,false,...]
      const inner5 = new SparseArray<boolean>(true, false, true);
      const outer5 = new SparseArray<SparseArray<boolean>>(inner5);
      const result5 = outer5.flat<boolean>();
      expect(result5[0]).assertTrue();
      expect(result5[1]).assertFalse();
      // 6. flat double (-0.0, 0.0) -> sign-distinct
      const inner6 = new SparseArray<double>(-0.0, 0.0);
      const outer6 = new SparseArray<SparseArray<double>>(inner6);
      const result6 = outer6.flat<double>();
      expect(1.0 / result6[0]!).assertEqual(-Number.POSITIVE_INFINITY);
      expect(1.0 / result6[1]!).assertEqual(Number.POSITIVE_INFINITY);
      // 7. flat bigint MAX (9223372036854775807n)
      const inner7 = new SparseArray<bigint>(9223372036854775807n);
      const outer7 = new SparseArray<SparseArray<bigint>>(inner7);
      const result7 = outer7.flat<bigint>();
      expect(result7[0]).assertEqual(9223372036854775807n);
      // 8. flat string Unicode ('中文','😀')
      const inner8 = new SparseArray<string>('中文', '😀');
      const outer8 = new SparseArray<SparseArray<string>>(inner8);
      const result8 = outer8.flat<string>();
      expect(result8[0]).assertEqual('中文');
      expect(result8[1]).assertEqual('😀');
      // 9. flat string escapes ('\n','\t')
      const inner9 = new SparseArray<string>('\n', '\t');
      const outer9 = new SparseArray<SparseArray<string>>(inner9);
      const result9 = outer9.flat<string>();
      expect(result9[0]).assertEqual('\n');
      expect(result9[1]).assertEqual('\t');
      // 10. flat Date (d1, d2) -> identity preserved
      const dateA10 = new Date(0);
      const dateB10 = new Date(1000);
      const inner10 = new SparseArray<Date>(dateA10, dateB10);
      const outer10 = new SparseArray<SparseArray<Date>>(inner10);
      const result10 = outer10.flat<Date>();
      expect(result10[0] === dateA10).assertTrue();
      expect(result10[1] === dateB10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_PART01_0300
     * @tc.name sparseArrayFlatPart01Test003
     * @tc.desc flat() sparse-outer values, large iteration & independence/snapshot (7 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFlatPart01Test003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. flat pushed(1; 3; inner; 7) -> [1,3,44,55,7]
      const inner1 = new SparseArray<int>(44, 55);
      const outer1 = new SparseArray<int | SparseArray<int>>();
      outer1.push(1);
      outer1.push(3);
      outer1.push(inner1);
      outer1.push(7);
      const result1 = outer1.flat<int>();
      expect(result1[0]).assertEqual(1);
      expect(result1[1]).assertEqual(3);
      expect(result1[2]).assertEqual(44);
      expect(result1[3]).assertEqual(55);
      expect(result1[4]).assertEqual(7);
      // 2. flat outer sparse@{0,4}=inners -> length 2 [1,2]
      const inA2 = new SparseArray<int>();
      inA2[0] = 1;
      const inB2 = new SparseArray<int>();
      inB2[0] = 2;
      const outer2 = new SparseArray<SparseArray<int>>(5);
      outer2[0] = inA2;
      outer2[4] = inB2;
      const result2 = outer2.flat<int>();
      expect(result2.length).assertEqual(2);
      expect(result2[0]).assertEqual(1);
      expect(result2[1]).assertEqual(2);
      // 3. flat pushed(innerStr; innerInt) -> length 4
      const innerStr3 = new SparseArray<string>('a', 'b');
      const innerInt3 = new SparseArray<int>(1, 2);
      let outer3: SparseArray<SparseArray<string> | SparseArray<int>> = new SparseArray<SparseArray<string> | SparseArray<int>>();
      outer3.push(innerStr3);
      outer3.push(innerInt3);
      const result3 = outer3.flat();
      expect(result3.length).assertEqual(4);
      // 4. flat iteration: outer(inner 0..99) -> length 100 [0..99]
      const inner4 = new SparseArray<int>();
      for (let i = 0; i < 100; i++) {
        inner4.push(i);
      }
      const outer4 = new SparseArray<SparseArray<int>>(inner4);
      const result4 = outer4.flat<int>();
      expect(result4.length).assertEqual(100);
      expect(result4[0]).assertEqual(0);
      expect(result4[99]).assertEqual(99);
      // 5. flat independence: result[0]=77 does not mutate inner
      const inner5 = new SparseArray<int>(5, 10);
      const outer5 = new SparseArray<SparseArray<int>>(inner5);
      const result5 = outer5.flat<int>();
      result5[0] = 77;
      expect(inner5[0]).assertEqual(5);
      // 6. flat independence: r1[0]=999 does not affect r2
      const inner6 = new SparseArray<int>(1, 2);
      const outer6 = new SparseArray<SparseArray<int>>(inner6);
      const r16 = outer6.flat<int>();
      const r26 = outer6.flat<int>();
      r16[0] = 999;
      expect(r26[0]).assertEqual(1);
      expect(r16.length).assertEqual(r26.length);
      // 7. flat snapshot: push after flat does not change result
      const inner7 = new SparseArray<int>();
      inner7[0] = 1;
      const outer7 = new SparseArray<SparseArray<int>>(inner7);
      const result7 = outer7.flat<int>();
      const added7 = new SparseArray<int>(2);
      outer7.push(added7);
      expect(result7.length).assertEqual(1);
    });
  });
}
