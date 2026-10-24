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

// Merged from SparseArrayJoinPart01Test (43 scenarios -> 5 cases, each <=10)
export default function sparseArrayJoinPart01Test(): void {
  describe('SparseArrayJoinPart01Test', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_PART01_0100
     * @tc.name sparseArrayJoinPart01Test001
     * @tc.desc join() default comma separator (3 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayJoinPart01Test001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. join() on int (101,202,303) default comma -> '101,202,303'
      const arr1 = new SparseArray<int>(101, 202, 303);
      expect(arr1.join()).assertEqual('101,202,303');
      // 2. join() on string ('alpha','beta','gamma') default comma -> 'alpha,beta,gamma'
      const arr2 = new SparseArray<string>('alpha', 'beta', 'gamma');
      expect(arr2.join()).assertEqual('alpha,beta,gamma');
      // 3. join() on int (3) all-hole default comma -> ',,'
      const arr3 = new SparseArray<int>(3);
      expect(arr3.join()).assertEqual(',,');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_PART01_0200
     * @tc.name sparseArrayJoinPart01Test002
     * @tc.desc join() simple ASCII custom separators (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayJoinPart01Test002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. join('-') on int (101,202,303) -> '101-202-303'
      const arr1 = new SparseArray<int>(101, 202, 303);
      expect(arr1.join('-')).assertEqual('101-202-303');
      // 2. join('') on string ('alpha','beta') -> 'alphabeta'
      const arr2 = new SparseArray<string>('alpha', 'beta');
      expect(arr2.join('')).assertEqual('alphabeta');
      // 3. join('') on int (101,202,303) -> '101202303'
      const arr3 = new SparseArray<int>(101, 202, 303);
      expect(arr3.join('')).assertEqual('101202303');
      // 4. join('') on boolean (true,false,true) -> 'truefalsetrue'
      const arr4 = new SparseArray<boolean>(true, false, true);
      expect(arr4.join('')).assertEqual('truefalsetrue');
      // 5. join('') on bigint (50n,100n,150n) -> '50100150'
      const arr5 = new SparseArray<bigint>(50n, 100n, 150n);
      expect(arr5.join('')).assertEqual('50100150');
      // 6. join('|') on int (101,202,303) -> '101|202|303'
      const arr6 = new SparseArray<int>(101, 202, 303);
      expect(arr6.join('|')).assertEqual('101|202|303');
      // 7. join(' ') on int (101,202,303) -> '101 202 303'
      const arr7 = new SparseArray<int>(101, 202, 303);
      expect(arr7.join(' ')).assertEqual('101 202 303');
      // 8. join('::') on int (101,202,303) -> '101::202::303'
      const arr8 = new SparseArray<int>(101, 202, 303);
      expect(arr8.join('::')).assertEqual('101::202::303');
      // 9. join('\t') on int (101,202,303) -> '101\t202\t303'
      const arr9 = new SparseArray<int>(101, 202, 303);
      expect(arr9.join('\t')).assertEqual('101\t202\t303');
      // 10. join('\t \n') on int (101,202,303) -> '101\t \n202\t \n303'
      const arr10 = new SparseArray<int>(101, 202, 303);
      expect(arr10.join('\t \n')).assertEqual('101\t \n202\t \n303');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_PART01_0300
     * @tc.name sparseArrayJoinPart01Test003
     * @tc.desc join() special/unicode/long separators (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayJoinPart01Test003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. join('\0') on int (101,202,303) -> '101\0' + '202\0' + '303'
      const arr1 = new SparseArray<int>(101, 202, 303);
      expect(arr1.join('\0')).assertEqual('101' + '\0' + '202' + '\0' + '303');
      // 2. join('中文') on int (101,202,303) -> '101中文202中文303'
      const arr2 = new SparseArray<int>(101, 202, 303);
      expect(arr2.join('中文')).assertEqual('101中文202中文303');
      // 3. join('⭐') on int (101,202,303) -> '101⭐202⭐303'
      const arr3 = new SparseArray<int>(101, 202, 303);
      expect(arr3.join('⭐')).assertEqual('101⭐202⭐303');
      // 4. join('分隔符') on int (101,202,303) -> '101分隔符202分隔符303'
      const arr4 = new SparseArray<int>(101, 202, 303);
      expect(arr4.join('分隔符')).assertEqual('101分隔符202分隔符303');
      // 5. join('😀') on int (101,202,303) -> '101😀202😀303'
      const arr5 = new SparseArray<int>(101, 202, 303);
      expect(arr5.join('😀')).assertEqual('101😀202😀303');
      // 6. join('<script>alert(1)</script>') on int (101,202,303) -> '101<script>alert(1)</script>202<script>alert(1)</script>303'
      const arr6 = new SparseArray<int>(101, 202, 303);
      expect(arr6.join('<script>alert(1)</script>')).assertEqual('101<script>alert(1)</script>202<script>alert(1)</script>303');
      // 7. join(longSep) on int (101,202) -> '101' + longSep + '202'
      const longSep7: string =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
      const arr7 = new SparseArray<int>(101, 202);
      expect(arr7.join(longSep7)).assertEqual('101' + longSep7 + '202');
      // 8. join('0') on int (101,202,303) -> '10102020303'
      const arr8 = new SparseArray<int>(101, 202, 303);
      expect(arr8.join('0')).assertEqual('10102020303');
      // 9. join('$.^') on int (101,202,303) -> '101$.^202$.^303'
      const arr9 = new SparseArray<int>(101, 202, 303);
      expect(arr9.join('$.^')).assertEqual('101$.^202$.^303');
      // 10. join('\\d\\w') on int (101,202,303) -> '101\\d\\w202\\d\\w303'
      const arr10 = new SparseArray<int>(101, 202, 303);
      expect(arr10.join('\\d\\w')).assertEqual('101\\d\\w202\\d\\w303');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_PART01_0400
     * @tc.name sparseArrayJoinPart01Test004
     * @tc.desc join() sparse-hole & typed-element arrays (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayJoinPart01Test004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. join('-') on int 4 sparse@{2,3} -> '--303-404'
      const arr1 = new SparseArray<int>(4);
      arr1[2] = 303;
      arr1[3] = 404;
      expect(arr1.join('-')).assertEqual('--303-404');
      // 2. join('') on int 4 sparse@{2,3} -> '303404'
      const arr2 = new SparseArray<int>(4);
      arr2[2] = 303;
      arr2[3] = 404;
      expect(arr2.join('')).assertEqual('303404');
      // 3. join('|') on int 3 sparse@{0,2} -> '101||303'
      const arr3 = new SparseArray<int>(3);
      arr3[0] = 101;
      arr3[2] = 303;
      expect(arr3.join('|')).assertEqual('101||303');
      // 4. join('::') on int 4 sparse@{1,3} -> '::202::::404'
      const arr4 = new SparseArray<int>(4);
      arr4[1] = 202;
      arr4[3] = 404;
      expect(arr4.join('::')).assertEqual('::202::::404');
      // 5. join('\n') on int 3 sparse@{1} -> '\n202\n'
      const arr5 = new SparseArray<int>(3);
      arr5[1] = 202;
      expect(arr5.join('\n')).assertEqual('\n202\n');
      // 6. join(zero-width) on int 3 sparse@{0,2} -> '101' + '​' + '​' + '303'
      const arr6 = new SparseArray<int>(3);
      arr6[0] = 101;
      arr6[2] = 303;
      expect(arr6.join('​')).assertEqual('101' + '​' + '​' + '303');
      // 7. join('\0') on int 3 sparse@{0,2} -> '101' + '\0' + '\0' + '303'
      const arr7 = new SparseArray<int>(3);
      arr7[0] = 101;
      arr7[2] = 303;
      expect(arr7.join('\0')).assertEqual('101' + '\0' + '\0' + '303');
      // 8. join('⭐') on int 4 sparse@{2,3} -> '⭐⭐303⭐404'
      const arr8 = new SparseArray<int>(4);
      arr8[2] = 303;
      arr8[3] = 404;
      expect(arr8.join('⭐')).assertEqual('⭐⭐303⭐404');
      // 9. join('-') on string ('alpha','beta','gamma') -> 'alpha-beta-gamma'
      const arr9 = new SparseArray<string>('alpha', 'beta', 'gamma');
      expect(arr9.join('-')).assertEqual('alpha-beta-gamma');
      // 10. join('::') on bigint (50n,100n,150n) -> '50::100::150'
      const arr10 = new SparseArray<bigint>(50n, 100n, 150n);
      expect(arr10.join('::')).assertEqual('50::100::150');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_PART01_0500
     * @tc.name sparseArrayJoinPart01Test005
     * @tc.desc join() typed/single/empty/value-with-sep arrays (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayJoinPart01Test005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. join('|') on number (1.5,2.5,3.5) -> '1.5|2.5|3.5'
      const arr1 = new SparseArray<number>(1.5, 2.5, 3.5);
      expect(arr1.join('|')).assertEqual('1.5|2.5|3.5');
      // 2. join('\t') on boolean (true,false) -> 'true\tfalse'
      const arr2 = new SparseArray<boolean>(true, false);
      expect(arr2.join('\t')).assertEqual('true\tfalse');
      // 3. join('---') on int single (77) -> '77'
      const arr3 = SparseArray.of<int>(77);
      expect(arr3.join('---')).assertEqual('77');
      // 4. join('') on string single ('solo') -> 'solo'
      const arr4 = new SparseArray<string>('solo');
      expect(arr4.join('')).assertEqual('solo');
      // 5. join('-') on int empty -> ''
      const arr5 = new SparseArray<int>();
      expect(arr5.join('-')).assertEqual('');
      // 6. join('') on int empty -> ''
      const arr6 = new SparseArray<int>();
      expect(arr6.join('')).assertEqual('');
      // 7. join('-') on string ('ab-cd','ef-gh') -> 'ab-cd-ef-gh'
      const arr7 = new SparseArray<string>('ab-cd', 'ef-gh');
      expect(arr7.join('-')).assertEqual('ab-cd-ef-gh');
      // 8. join('|') on string ('a|b','c|d') -> 'a|b|c|d'
      const arr8 = new SparseArray<string>('a|b', 'c|d');
      expect(arr8.join('|')).assertEqual('a|b|c|d');
      // 9. join('::') on string ('a::b','c::d') -> 'a::b::c::d'
      const arr9 = new SparseArray<string>('a::b', 'c::d');
      expect(arr9.join('::')).assertEqual('a::b::c::d');
      // 10. join(',') on string ('x,y','z,w') -> 'x,y,z,w'
      const arr10 = new SparseArray<string>('x,y', 'z,w');
      expect(arr10.join(',')).assertEqual('x,y,z,w');
    });
  });
}
