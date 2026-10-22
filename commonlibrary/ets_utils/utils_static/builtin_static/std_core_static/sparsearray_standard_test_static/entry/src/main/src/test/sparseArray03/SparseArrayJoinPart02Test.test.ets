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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function sparseArrayJoinTestPart02(): void {
  describe('SparseArrayJoinTestPart02', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_PART02_0100
     * @tc.name sparseArrayJoinTestPart02001
     * @tc.desc join() default separator & typed/empty/sparse-hole (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayJoinTestPart02001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. join() on empty array -> ''
      const arr1 = new SparseArray<int>();
      expect(arr1.join()).assertEqual('');
      // 2. join() on sparse {0:10,3:40} -> '10,,,40'
      const arr2 = new SparseArray<int>(4);
      arr2[0] = 10;
      arr2[3] = 40;
      expect(arr2.join()).assertEqual('10,,,40');
      // 3. join() on ('hello','world') -> 'hello,world'
      const arr3 = new SparseArray<string>('hello', 'world');
      expect(arr3.join()).assertEqual('hello,world');
      // 4. join() on (1,2,3) -> '1,2,3'
      const arr4 = new SparseArray<int>(1, 2, 3);
      expect(arr4.join()).assertEqual('1,2,3');
      // 5. join() on (false,false) -> 'false,false'
      const arr5 = new SparseArray<boolean>(false, false);
      expect(arr5.join()).assertEqual('false,false');
      // 6. join() on (Infinity,5.5) -> 'Infinity,5.5'
      const arr6 = new SparseArray<double>(Double.POSITIVE_INFINITY, 5.5);
      expect(arr6.join()).assertEqual('Infinity,5.5');
      // 7. join('') on sparse {0:1} -> '1'
      const arr7 = new SparseArray<int>(2);
      arr7[0] = 1;
      expect(arr7.join('')).assertEqual('1');
      // 8. join(',') explicit == join() implicit on (4,5) -> '4,5'
      const arr8 = new SparseArray<int>(4, 5);
      expect(arr8.join(',')).assertEqual('4,5');
      expect(arr8.join()).assertEqual('4,5');
      // 9. join('-') leaves source unmodified on (1,2,3) -> '1-2-3' & length 3
      const arr9 = new SparseArray<int>(1, 2, 3);
      expect(arr9.join('-')).assertEqual('1-2-3');
      expect(arr9.length).assertEqual(3);
      expect(arr9[0]).assertEqual(1);
      expect(arr9[1]).assertEqual(2);
      expect(arr9[2]).assertEqual(3);
      // 10. join() trailing hole -> '1,' but explicit undefined element -> '1,undefined'
      const arr10 = new SparseArray<int>(2);
      arr10[0] = 1;
      expect(arr10.join()).assertEqual('1,');
      const arr10u = new SparseArray<int | undefined>(1, undefined);
      expect(arr10u.join()).assertEqual('1,undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_PART02_0200
     * @tc.name sparseArrayJoinTestPart02002
     * @tc.desc join(sep) custom separators & Date/single/length (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayJoinTestPart02002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. join('::') on (5,7) -> '5::7'
      const arr1 = new SparseArray<int>(5, 7);
      expect(arr1.join('::')).assertEqual('5::7');
      // 2. join('::') on (100,20,3) -> '100::20::3'
      const arr2 = new SparseArray<int>(100, 20, 3);
      expect(arr2.join('::')).assertEqual('100::20::3');
      // 3. join('|') on bigints (100n,200n) -> '100|200'
      const arr3 = new SparseArray<bigint>(100n, 200n);
      expect(arr3.join('|')).assertEqual('100|200');
      // 4. join('|') on two Dates -> toString|toString
      const arr4 = new SparseArray<Date>(new Date(0), new Date(1000));
      const exp4 = arr4[0]!.toString() + '|' + arr4[1]!.toString();
      expect(arr4.join('|')).assertEqual(exp4);
      // 5. join('') on (1,2) -> '12'
      const arr5 = new SparseArray<int>(1, 2);
      expect(arr5.join('')).assertEqual('12');
      // 6. join('\t') on (1,2,3) -> '1\t2\t3'
      const arr6 = new SparseArray<int>(1, 2, 3);
      expect(arr6.join('\t')).assertEqual('1\t2\t3');
      // 7. join() on two Dates -> toString,toString
      const arr7 = new SparseArray<Date>(new Date(0), new Date(1000));
      const exp7 = arr7[0]!.toString() + ',' + arr7[1]!.toString();
      expect(arr7.join()).assertEqual(exp7);
      // 8. join('::') on single element (7) -> '7'
      const arr8 = SparseArray.of<int>(7);
      expect(arr8.join('::')).assertEqual('7');
      // 9. join('::') on (10,20,30) -> '10::20::30' & result.length == 10
      const arr9 = new SparseArray<int>(10, 20, 30);
      const res9 = arr9.join('::');
      expect(res9).assertEqual('10::20::30');
      expect(res9.length).assertEqual(10);
    });
  });
}
