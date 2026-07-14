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
import Utils from '../Util.test';
import { SLEEP_MS } from './LongTestConstants';

export default function LongConstructor2Test(): void {
  describe('LongConstructor2Test', () => {

    const CON2_NEG_922337203685477580: long = -922337203685477580;
    const CON2_NEG_100: long = -100;
    const CON2_NEG_1: long = -1;
    const CON2_0: long = 0;
    const CON2_1: long = 1;
    const CON2_42: long = 42;
    const CON2_100: long = 100;
    const CON2_200: long = 200;
    const CON2_256: long = 256;
    const CON2_922337203685477580: long = 922337203685477580;
    const CON2_3: long = 3;
    const CON2_NEG_3: long = -3;
    const CON2_9: long = 9;
    const CON2_NEG_9: long = -9;
    const CON2_65: long = 65;
    const CON2_48: long = 48;
    const CON2_LARGE_DOUBLE_AS_LONG: long = 1000000000000000;
    const CON2_STR_42: string = "42";
    const CON2_STR_NEG_100: string = "-100";
    const CON2_INT_10: int = 10;

    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(SLEEP_MS);
    });

    afterEach(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_0100
     * @tc.name testLongConstructor2001
     * @tc.desc Verify Long constructor with value 42 preserves value via toLong()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(CON2_42);
      expect(value.toLong()).assertEqual(CON2_42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_0200
     * @tc.name testLongConstructor2002
     * @tc.desc Verify Long constructor with value 100 creates non-null Long instance preserving value via equals()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(CON2_100);
      expect(value.equals(new Long(CON2_100))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_0300
     * @tc.name testLongConstructor2003
     * @tc.desc Verify Long constructor with negative value -100 preserves value via toLong()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(CON2_NEG_100);
      expect(value.toLong()).assertEqual(CON2_NEG_100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_0400
     * @tc.name testLongConstructor2004
     * @tc.desc Verify Long constructor with value 0 creates instance equal to default constructor via equals()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(CON2_0);
      expect(value.equals(new Long())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_0500
     * @tc.name testLongConstructor2005
     * @tc.desc Verify Long constructor with value 1 preserves value via toLong()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(CON2_1);
      expect(value.toLong()).assertEqual(CON2_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_0600
     * @tc.name testLongConstructor2006
     * @tc.desc Verify Long constructor with negative value -1 preserves value via toLong()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(CON2_NEG_1);
      expect(value.toLong()).assertEqual(CON2_NEG_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_0700
     * @tc.name testLongConstructor2007
     * @tc.desc Verify Long constructor with large positive value creates valid instance preserving value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(CON2_922337203685477580);
      expect(value.toLong()).assertEqual(CON2_922337203685477580);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_0800
     * @tc.name testLongConstructor2008
     * @tc.desc Verify Long constructor with large negative value creates valid instance preserving value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(CON2_NEG_922337203685477580);
      expect(value.toLong()).assertEqual(CON2_NEG_922337203685477580);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_0900
     * @tc.name testLongConstructor2009
     * @tc.desc Verify Long constructor with value 256 creates non-null instance preserving value via toLong()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(CON2_256);
      expect(value.toLong()).assertEqual(CON2_256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_1000
     * @tc.name testLongConstructor2010
     * @tc.desc Verify multiple independent Long instances with different values are distinct objects
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: Long = new Long(CON2_100);
      const v2: Long = new Long(CON2_200);
      expect(v1 !== v2).assertTrue();
      expect(v1.toLong()).assertEqual(CON2_100);
      expect(v2.toLong()).assertEqual(CON2_200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_1100
     * @tc.name testLongConstructor2011
     * @tc.desc Verify Long constructor with value 42 does not throw exception
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(CON2_42);
      expect(value.toLong()).assertEqual(CON2_42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_1200
     * @tc.name testLongConstructor2012
     * @tc.desc Verify Long constructor with Long.MAX_VALUE creates valid instance preserving identity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(Long.MAX_VALUE);
      expect(value.toLong()).assertEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_1300
     * @tc.name testLongConstructor2013
     * @tc.desc Verify Long constructor with Long.MIN_VALUE creates valid instance preserving identity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(Long.MIN_VALUE);
      expect(value.toLong()).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_1400
     * @tc.name testLongConstructor2014
     * @tc.desc Verify Long constructor with int parameter 42 preserves value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(42 as int);
      expect(value.toLong()).assertEqual(42 as long);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_1500
     * @tc.name testLongConstructor2015
     * @tc.desc Verify Long constructor with byte parameter 42 preserves value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(42 as byte);
      expect(value.toLong()).assertEqual(42 as long);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_1600
     * @tc.name testLongConstructor2016
     * @tc.desc Verify Long constructor with short parameter 42 preserves value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(42 as short);
      expect(value.toLong()).assertEqual(42 as long);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_1700
     * @tc.name testLongConstructor2017
     * @tc.desc Verify Long constructor with long parameter equal to MAX_VALUE preserves the boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(Long.MAX_VALUE as long);
      expect(value.toLong()).assertEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_1800
     * @tc.name testLongConstructor2018
     * @tc.desc Verify Long constructor with long parameter equal to MIN_VALUE preserves the boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(Long.MIN_VALUE as long);
      expect(value.toLong()).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_1900
     * @tc.name testLongConstructor2019
     * @tc.desc Verify Long constructor with char parameter c'A' (code 65) widens to long preserving code point
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(c'A'.toLong());
      expect(value.toLong()).assertEqual(CON2_65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_2000
     * @tc.name testLongConstructor2020
     * @tc.desc Verify Long constructor with char parameter c'0' (code 48) widens to long preserving code point
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(c'0'.toLong());
      expect(value.toLong()).assertEqual(CON2_48);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_2100
     * @tc.name testLongConstructor2021
     * @tc.desc Verify Long constructor with float parameter (3.7 as float).toLong() truncates toward zero to 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: float = 3.7 as float;
      const value: Long = new Long(f.toLong());
      expect(value.toLong()).assertEqual(CON2_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_2200
     * @tc.name testLongConstructor2022
     * @tc.desc Verify Long constructor with negative float parameter (-3.7 as float).toLong() truncates toward zero to -3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: float = -3.7 as float;
      const value: Long = new Long(f.toLong());
      expect(value.toLong()).assertEqual(CON2_NEG_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_2300
     * @tc.name testLongConstructor2023
     * @tc.desc Verify Long constructor with double parameter (9.99 as double).toLong() truncates toward zero to 9
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: double = 9.99 as double;
      const value: Long = new Long(d.toLong());
      expect(value.toLong()).assertEqual(CON2_9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_2400
     * @tc.name testLongConstructor2024
     * @tc.desc Verify Long constructor with negative double parameter (-9.99 as double).toLong() truncates toward zero to -9
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: double = -9.99 as double;
      const value: Long = new Long(d.toLong());
      expect(value.toLong()).assertEqual(CON2_NEG_9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_2500
     * @tc.name testLongConstructor2025
     * @tc.desc Verify Long constructor with double zero (0.0 as double).toLong() yields 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: double = 0.0 as double;
      const value: Long = new Long(d.toLong());
      expect(value.toLong()).assertEqual(CON2_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_2600
     * @tc.name testLongConstructor2026
     * @tc.desc Verify Long constructor with large finite double (1e15 as double).toLong() preserves integer value within precision range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: double = 1e15 as double;
      const value: Long = new Long(d.toLong());
      expect(value.toLong()).assertEqual(CON2_LARGE_DOUBLE_AS_LONG);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_2700
     * @tc.name testLongConstructor2027
     * @tc.desc Verify Long constructor with number parameter (42.0 as number).toLong() preserves whole-number value 42
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n: number = 42.0 as number;
      const value: Long = new Long(n.toLong());
      expect(value.toLong()).assertEqual(CON2_42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_2800
     * @tc.name testLongConstructor2028
     * @tc.desc Verify Long constructor accepts long parsed from string "42" via Long.parseInt indirect construction
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: long = Long.parseInt(CON2_STR_42, CON2_INT_10);
      const value: Long = new Long(parsed);
      expect(value.toLong()).assertEqual(CON2_42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_2900
     * @tc.name testLongConstructor2029
     * @tc.desc Verify Long constructor accepts long parsed from negative string "-100" via Long.parseInt indirect construction
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: long = Long.parseInt(CON2_STR_NEG_100, CON2_INT_10);
      const value: Long = new Long(parsed);
      expect(value.toLong()).assertEqual(CON2_NEG_100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_3000
     * @tc.name testLongConstructor2030
     * @tc.desc Verify Long constructor with another Long instance's toLong() value preserves identity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Long = new Long(CON2_42);
      const value: Long = new Long(source.toLong());
      expect(value.toLong()).assertEqual(CON2_42);
    });
  });
}
