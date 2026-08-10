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
import Utils from '../Util.test';

export default function longAdd1Test(): void {
  describe('LongAdd1Test', (): void => {

    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD1_0100
     * @tc.name testLongAdd1_001
     * @tc.desc Verify multi-term positive Long add chain equals expected sum via compareTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongAdd1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(10).add(new Long(20)).add(new Long(30)).add(new Long(40)).add(new Long(50));
      expect(result.compareTo(new Long(150))).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD1_0200
     * @tc.name testLongAdd1_002
     * @tc.desc Verify multi-digit positive Long add chain with large values equals expected sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongAdd1_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(1000000).add(new Long(2000000)).add(new Long(3000000));
      expect(result.equals(new Long(6000000))).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD1_0300
     * @tc.name testLongAdd1_003
     * @tc.desc Verify add does not mutate original Long.MIN_VALUE and -1 operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongAdd1_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(Long.MIN_VALUE);
      const b: Long = new Long(-1);
      const c: Long = a.add(b);
      expect(a.toLong()).assertEqual(Long.MIN_VALUE);
      expect(b.toLong()).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD1_0400
     * @tc.name testLongAdd1_004
     * @tc.desc Verify add with hex literal operands does not mutate original Long values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongAdd1_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(0xA);
      const b: Long = new Long(0x14);
      const c: Long = a.add(b);
      expect(a.toLong()).assertEqual(0xA);
      expect(b.toLong()).assertEqual(0x14);
      expect(c.toLong()).assertEqual(0x1E);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD1_0500
     * @tc.name testLongAdd1_005
     * @tc.desc Verify multi-term negative Long add chain equals expected negative sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongAdd1_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(-1).add(new Long(-2)).add(new Long(-3)).add(new Long(-4)).add(new Long(-5));
      expect(result.toLong()).assertEqual(-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD1_0600
     * @tc.name testLongAdd1_006
     * @tc.desc Verify chained add reusing intermediate Long result equals expected sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongAdd1_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(5);
      const b: Long = new Long(10);
      const mid: Long = a.add(b);
      const result: Long = mid.add(mid);
      expect(mid.toLong()).assertEqual(15);
      expect(result.toLong()).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD1_0700
     * @tc.name testLongAdd1_007
     * @tc.desc Verify repeated identical add calls produce equal results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongAdd1_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Long = new Long(25).add(new Long(75));
      const r2: Long = new Long(25).add(new Long(75));
      expect(r1.equals(r2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD1_0800
     * @tc.name testLongAdd1_008
     * @tc.desc Verify decimal and hex add expressions produce equal results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongAdd1_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Long = new Long(15).add(new Long(25));
      const r2: Long = new Long(0xF).add(new Long(0x19));
      expect(r1.equals(r2)).assertTrue();
    });
  });
}
