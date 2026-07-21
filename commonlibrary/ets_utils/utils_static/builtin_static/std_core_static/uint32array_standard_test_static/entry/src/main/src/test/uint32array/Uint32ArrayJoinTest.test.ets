'use static'
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

export default function uint32ArrayJoinTest(): void {
  describe('Uint32ArrayJoinTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_0100
     * @tc.name testUint32ArrayJoinPartOne001
     * @tc.desc Verify arity=0 separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array();
      expect(arr.join()).assertEqual('');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_0200
     * @tc.name testUint32ArrayJoinPartOne002
     * @tc.desc Verify arity=0 separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(42);
      expect(arr.join()).assertEqual('42');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_0300
     * @tc.name testUint32ArrayJoinPartOne003
     * @tc.desc Verify arity=0 separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join()).assertEqual('10,20,30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_0400
     * @tc.name testUint32ArrayJoinPartOne004
     * @tc.desc Verify arity=1 undefined separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join(undefined)).assertEqual('10,20,30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_0500
     * @tc.name testUint32ArrayJoinPartOne005
     * @tc.desc Verify arity=1 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7);
      expect(arr.join(undefined)).assertEqual('7');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_0600
     * @tc.name testUint32ArrayJoinPartOne006
     * @tc.desc Verify arity=0 arity=1(undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      expect(arr.join()).assertEqual(arr.join(undefined));
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_0700
     * @tc.name testUint32ArrayJoinPartOne007
     * @tc.desc Verify arity=0 arity=1(',')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 6, 7);
      expect(arr.join()).assertEqual(arr.join(','));
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_0800
     * @tc.name testUint32ArrayJoinPartOne008
     * @tc.desc Verify arity=1 separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(9);
      expect(arr.join('')).assertEqual('9');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_0900
     * @tc.name testUint32ArrayJoinPartOne009
     * @tc.desc Verify separator=''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('')).assertEqual('102030');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_1000
     * @tc.name testUint32ArrayJoinPartOne010
     * @tc.desc Verify separator=','
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join(',')).assertEqual('10,20,30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_1100
     * @tc.name testUint32ArrayJoinPartOne011
     * @tc.desc Verify separator='|'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('|')).assertEqual('10|20|30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_1200
     * @tc.name testUint32ArrayJoinPartOne012
     * @tc.desc Verify separator='-'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('-')).assertEqual('10-20-30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_1300
     * @tc.name testUint32ArrayJoinPartOne013
     * @tc.desc Verify separator='/'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('/')).assertEqual('10/20/30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_1400
     * @tc.name testUint32ArrayJoinPartOne014
     * @tc.desc Verify separator=':'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join(':')).assertEqual('10:20:30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_1500
     * @tc.name testUint32ArrayJoinPartOne015
     * @tc.desc Verify separator=';'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join(';')).assertEqual('10;20;30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_1600
     * @tc.name testUint32ArrayJoinPartOne016
     * @tc.desc Verify separator='.'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('.')).assertEqual('10.20.30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_1700
     * @tc.name testUint32ArrayJoinPartOne017
     * @tc.desc Verify separator='_'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('_')).assertEqual('10_20_30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_1800
     * @tc.name testUint32ArrayJoinPartOne018
     * @tc.desc Verify separator=' '
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join(' ')).assertEqual('10 20 30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_1900
     * @tc.name testUint32ArrayJoinPartOne019
     * @tc.desc Verify separator='\t'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('\t')).assertEqual('10\t20\t30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_2000
     * @tc.name testUint32ArrayJoinPartOne020
     * @tc.desc Verify separator='\n'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('\n')).assertEqual('10\n20\n30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_2100
     * @tc.name testUint32ArrayJoinPartOne021
     * @tc.desc Verify separator='\r'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('\r')).assertEqual('10\r20\r30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_2200
     * @tc.name testUint32ArrayJoinPartOne022
     * @tc.desc Verify separator='\0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('\0').length).assertEqual(8);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_2300
     * @tc.name testUint32ArrayJoinPartOne023
     * @tc.desc Verify separator=U+200B zero-width space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('​')).assertEqual('10​20​30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_2400
     * @tc.name testUint32ArrayJoinPartOne024
     * @tc.desc Verify separator with CJK multi-byte string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('测试')).assertEqual('10测试20测试30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_2500
     * @tc.name testUint32ArrayJoinPartOne025
     * @tc.desc Verify separator='hello'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('hello')).assertEqual('10hello20hello30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_2600
     * @tc.name testUint32ArrayJoinPartOne026
     * @tc.desc Verify separator='123'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('123')).assertEqual('101232012330');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_2700
     * @tc.name testUint32ArrayJoinPartOne027
     * @tc.desc Verify separator='0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('0')).assertEqual('10020030');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_2800
     * @tc.name testUint32ArrayJoinPartOne028
     * @tc.desc Verify separator='0xFF'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('0xFF')).assertEqual('100xFF200xFF30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_2900
     * @tc.name testUint32ArrayJoinPartOne029
     * @tc.desc Verify separator='😀' emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('😀')).assertEqual('10😀20😀30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_3000
     * @tc.name testUint32ArrayJoinPartOne030
     * @tc.desc Verify separator='🎉' emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('🎉')).assertEqual('10🎉20🎉30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_3100
     * @tc.name testUint32ArrayJoinPartOne031
     * @tc.desc Verify separator=', '
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join(', ')).assertEqual('10, 20, 30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_3200
     * @tc.name testUint32ArrayJoinPartOne032
     * @tc.desc Verify separator=' , '
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join(' , ')).assertEqual('10 , 20 , 30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_3300
     * @tc.name testUint32ArrayJoinPartOne033
     * @tc.desc Verify separator='null' null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('null')).assertEqual('10null20null30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_3400
     * @tc.name testUint32ArrayJoinPartOne034
     * @tc.desc Verify separator='undefined' undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('undefined')).assertEqual('10undefined20undefined30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_3500
     * @tc.name testUint32ArrayJoinPartOne035
     * @tc.desc Verify separator='true'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('true')).assertEqual('10true20true30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_3600
     * @tc.name testUint32ArrayJoinPartOne036
     * @tc.desc Verify separator='NaN' NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('NaN')).assertEqual('10NaN20NaN30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_3700
     * @tc.name testUint32ArrayJoinPartOne037
     * @tc.desc Verify separator='--'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('--')).assertEqual('10--20--30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_3800
     * @tc.name testUint32ArrayJoinPartOne038
     * @tc.desc Verify separator='——'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('——')).assertEqual('10——20——30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_3900
     * @tc.name testUint32ArrayJoinPartOne039
     * @tc.desc Verify separator='…'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('…')).assertEqual('10…20…30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_4000
     * @tc.name testUint32ArrayJoinPartOne040
     * @tc.desc Verify separator='>>>'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('>>>')).assertEqual('10>>>20>>>30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_4100
     * @tc.name testUint32ArrayJoinPartOne041
     * @tc.desc Verify separator='separator'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('separator')).assertEqual('10separator20separator30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_4200
     * @tc.name testUint32ArrayJoinPartOne042
     * @tc.desc Verify separator 25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('abcdeabcdeabcdeabcdeabcde').length).assertEqual(56);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_4300
     * @tc.name testUint32ArrayJoinPartOne043
     * @tc.desc Verify separator='4294967295' uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('4294967295')).assertEqual('10429496729520429496729530');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_4400
     * @tc.name testUint32ArrayJoinPartOne044
     * @tc.desc Verify separator='-1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('-1')).assertEqual('10-120-130');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_4500
     * @tc.name testUint32ArrayJoinPartOne045
     * @tc.desc Verify separator='2147483648' int32 +1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('2147483648')).assertEqual('10214748364820214748364830');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_4600
     * @tc.name testUint32ArrayJoinPartOne046
     * @tc.desc Verify separator='3.14'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('3.14')).assertEqual('103.14203.1430');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_4700
     * @tc.name testUint32ArrayJoinPartOne047
     * @tc.desc Verify separator='0b1010'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('0b1010')).assertEqual('100b1010200b101030');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_4800
     * @tc.name testUint32ArrayJoinPartOne048
     * @tc.desc Verify separator='0o17'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('0o17')).assertEqual('100o17200o1730');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_4900
     * @tc.name testUint32ArrayJoinPartOne049
     * @tc.desc Verify separator='1e10'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('1e10')).assertEqual('101e10201e1030');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_5000
     * @tc.name testUint32ArrayJoinPartOne050
     * @tc.desc Verify separator='Infinity'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('Infinity')).assertEqual('10Infinity20Infinity30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_5100
     * @tc.name testUint32ArrayJoinPartOne051
     * @tc.desc Verify separator='0x100000000'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('0x100000000')).assertEqual('100x100000000200x10000000030');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_5200
     * @tc.name testUint32ArrayJoinPartOne052
     * @tc.desc Verify separator='False'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('False')).assertEqual('10False20False30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_5300
     * @tc.name testUint32ArrayJoinPartOne053
     * @tc.desc Verify separator='\\'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('\\')).assertEqual('10\\20\\30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_5400
     * @tc.name testUint32ArrayJoinPartOne054
     * @tc.desc Verify separator='"'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('"')).assertEqual('10"20"30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_5500
     * @tc.name testUint32ArrayJoinPartOne055
     * @tc.desc Verify separator='['
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('[')).assertEqual('10[20[30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_5600
     * @tc.name testUint32ArrayJoinPartOne056
     * @tc.desc Verify separator=']'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join(']')).assertEqual('10]20]30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_5700
     * @tc.name testUint32ArrayJoinPartOne057
     * @tc.desc Verify separator='{}'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('{}')).assertEqual('10{}20{}30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_5800
     * @tc.name testUint32ArrayJoinPartOne058
     * @tc.desc Verify separator='()'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('()')).assertEqual('10()20()30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_5900
     * @tc.name testUint32ArrayJoinPartOne059
     * @tc.desc Verify separator='<>'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('<>')).assertEqual('10<>20<>30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_6000
     * @tc.name testUint32ArrayJoinPartOne060
     * @tc.desc Verify separator='==='
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('===')).assertEqual('10===20===30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_6100
     * @tc.name testUint32ArrayJoinPartOne061
     * @tc.desc Verify separator='!='
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('!= ')).assertEqual('10!= 20!= 30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_6200
     * @tc.name testUint32ArrayJoinPartOne062
     * @tc.desc Verify separator='+'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('+')).assertEqual('10+20+30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_6300
     * @tc.name testUint32ArrayJoinPartOne063
     * @tc.desc Verify separator='*'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('*')).assertEqual('10*20*30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_6400
     * @tc.name testUint32ArrayJoinPartOne064
     * @tc.desc Verify separator='='
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('= ')).assertEqual('10= 20= 30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_6500
     * @tc.name testUint32ArrayJoinPartOne065
     * @tc.desc Verify separator='#'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('#')).assertEqual('10#20#30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_6600
     * @tc.name testUint32ArrayJoinPartOne066
     * @tc.desc Verify separator='@' at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('@')).assertEqual('10@20@30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_6700
     * @tc.name testUint32ArrayJoinPartOne067
     * @tc.desc Verify separator='$'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('$')).assertEqual('10$20$30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_6800
     * @tc.name testUint32ArrayJoinPartOne068
     * @tc.desc Verify separator='%'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('%')).assertEqual('10%20%30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_6900
     * @tc.name testUint32ArrayJoinPartOne069
     * @tc.desc Verify separator='^'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('^')).assertEqual('10^20^30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_7000
     * @tc.name testUint32ArrayJoinPartOne070
     * @tc.desc Verify separator='&'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('&')).assertEqual('10&20&30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_7100
     * @tc.name testUint32ArrayJoinPartOne071
     * @tc.desc Verify separator='~'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('~')).assertEqual('10~20~30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_7200
     * @tc.name testUint32ArrayJoinPartOne072
     * @tc.desc Verify separator='`'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('`')).assertEqual('10`20`30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_7300
     * @tc.name testUint32ArrayJoinPartOne073
     * @tc.desc Verify separator='?'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('?')).assertEqual('10?20?30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_7400
     * @tc.name testUint32ArrayJoinPartOne074
     * @tc.desc Verify separator='!'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('!')).assertEqual('10!20!30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_7500
     * @tc.name testUint32ArrayJoinPartOne075
     * @tc.desc Verify separator='0123456789'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.join('0123456789')).assertEqual('10012345678920012345678930');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_7600
     * @tc.name testUint32ArrayJoinPartOne076
     * @tc.desc Verify + separator=''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array();
      expect(arr.join('')).assertEqual('');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_7700
     * @tc.name testUint32ArrayJoinPartOne077
     * @tc.desc Verify + separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array();
      expect(arr.join('X')).assertEqual('');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_7800
     * @tc.name testUint32ArrayJoinPartOne078
     * @tc.desc Verify [0] separator '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0);
      expect(arr.join()).assertEqual('0');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_7900
     * @tc.name testUint32ArrayJoinPartOne079
     * @tc.desc Verify [uint32 ] separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295);
      expect(arr.join()).assertEqual('4294967295');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_8000
     * @tc.name testUint32ArrayJoinPartOne080
     * @tc.desc Verify [0] + separator='|'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0);
      expect(arr.join('|')).assertEqual('0');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_8100
     * @tc.name testUint32ArrayJoinPartOne081
     * @tc.desc Verify [0, ] + separator='|'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 4294967295);
      expect(arr.join('|')).assertEqual('0|4294967295');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_8200
     * @tc.name testUint32ArrayJoinPartOne082
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0xFF, 0o17, 0b1010);
      expect(arr.join()).assertEqual('255,15,10');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_8300
     * @tc.name testUint32ArrayJoinPartOne083
     * @tc.desc Verify + separator='-' '0-0-0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 0, 0);
      expect(arr.join('-')).assertEqual('0-0-0');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_8400
     * @tc.name testUint32ArrayJoinPartOne084
     * @tc.desc Verify 100 1 + separator='-'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big = new Uint32Array(100);
      big.fill(1);
      expect(big.join('-').length).assertEqual(199);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_8500
     * @tc.name testUint32ArrayJoinPartOne085
     * @tc.desc Verify + separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295, 4294967295);
      expect(arr.join(',')).assertEqual('4294967295,4294967295');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_8600
     * @tc.name testUint32ArrayJoinPartOne086
     * @tc.desc Verify [1, 0, ] + separator='::'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 0, 4294967295);
      expect(arr.join('::')).assertEqual('1::0::4294967295');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTONE_8700
     * @tc.name testUint32ArrayJoinPartOne087
     * @tc.desc Verify [int32 +1] + separator='/' 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(2147483648);
      expect(arr.join('/')).assertEqual('2147483648');
    });

  });
}
