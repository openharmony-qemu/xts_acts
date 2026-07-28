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
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Float32ArrayJoin1Test(): void {
  describe('Float32ArrayJoin1Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(45);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0010
     * @tc.name testFloat32ArrayJoinOne001
     * @tc.desc Verify join() on [1.0, 2.0, 3.0] returns '1,2,3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join();
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0020
     * @tc.name testFloat32ArrayJoinOne002
     * @tc.desc Verify join() on [7.0] returns '7'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(7.0);
      const result = arr.join();
      expect(result).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0030
     * @tc.name testFloat32ArrayJoinOne003
     * @tc.desc Verify join() on empty array returns ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const result = arr.join();
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0040
     * @tc.name testFloat32ArrayJoinOne004
     * @tc.desc Verify join() on [10.0, 20.0] returns '10,20'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0);
      const result = arr.join();
      expect(result).assertEqual('10,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0050
     * @tc.name testFloat32ArrayJoinOne005
     * @tc.desc Verify join() on [-1.0, -2.0] returns '-1,-2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0, -2.0);
      const result = arr.join();
      expect(result).assertEqual('-1,-2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0060
     * @tc.name testFloat32ArrayJoinOne006
     * @tc.desc Verify join(undefined) on [1.0,2.0,3.0] returns '1,2,3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join(undefined);
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0070
     * @tc.name testFloat32ArrayJoinOne007
     * @tc.desc Verify join on [1.0, 2.0, 3.0] returns '1,2,3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join(',');
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0080
     * @tc.name testFloat32ArrayJoinOne008
     * @tc.desc Verify join on [1.0, 2.0, 3.0] returns '123'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('');
      expect(result).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0090
     * @tc.name testFloat32ArrayJoinOne009
     * @tc.desc Verify join() == join(undefined) on [1.0,2.0,3.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const r0 = arr.join();
      const r1 = arr.join(undefined);
      expect(r0).assertEqual(r1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0100
     * @tc.name testFloat32ArrayJoinOne010
     * @tc.desc Verify join(undefined) on [9.0] returns '9'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(9.0);
      const result = arr.join(undefined);
      expect(result).assertEqual('9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0110
     * @tc.name testFloat32ArrayJoinOne011
     * @tc.desc Verify join(undefined) on empty array returns ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const result = arr.join(undefined);
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0120
     * @tc.name testFloat32ArrayJoinOne012
     * @tc.desc Verify join(undefined) on [0.0, 0.0, 0.0] returns '0,0,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0, 0.0);
      const result = arr.join(undefined);
      expect(result).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0130
     * @tc.name testFloat32ArrayJoinOne013
     * @tc.desc Verify join() on [0,0,0] returns '0,0,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0, 0.0);
      const result = arr.join();
      expect(result).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0140
     * @tc.name testFloat32ArrayJoinOne014
     * @tc.desc Verify join('') on [-1,-2,-3] returns '-1-2-3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0, -2.0, -3.0);
      const result = arr.join('');
      expect(result).assertEqual('-1-2-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0150
     * @tc.name testFloat32ArrayJoinOne015
     * @tc.desc Verify join(' ') on [1.0, 2.0, 3.0] returns '1 2 3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join(' ');
      expect(result).assertEqual('1 2 3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0160
     * @tc.name testFloat32ArrayJoinOne016
     * @tc.desc Verify join('  ') on [1.0, 2.0, 4.0] returns '1  2  4'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 4.0);
      const result = arr.join('  ');
      expect(result).assertEqual('1  2  4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0170
     * @tc.name testFloat32ArrayJoinOne017
     * @tc.desc Verify join('\t') on [1.0, 2.0, 3.0] returns '1\t2\t3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('\t');
      expect(result).assertEqual('1\t2\t3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0180
     * @tc.name testFloat32ArrayJoinOne018
     * @tc.desc Verify join('\n') on [5.0, 6.0] returns '5\n6'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 6.0);
      const result = arr.join('\n');
      expect(result).assertEqual('5\n6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0190
     * @tc.name testFloat32ArrayJoinOne019
     * @tc.desc Verify join('\r\n') on [1.0, 2.0] returns '1\r\n2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const result = arr.join('\r\n');
      expect(result).assertEqual('1\r\n2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0200
     * @tc.name testFloat32ArrayJoinOne020
     * @tc.desc Verify join(' \t ') on [1.0, 2.0] returns '1 \t 2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const result = arr.join(' \t ');
      expect(result).assertEqual('1 \t 2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0210
     * @tc.name testFloat32ArrayJoinOne021
     * @tc.desc Verify join('\t\t') on [1.0, 2.0, 3.0] returns '1\t\t2\t\t3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('\t\t');
      expect(result).assertEqual('1\t\t2\t\t3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0220
     * @tc.name testFloat32ArrayJoinOne022
     * @tc.desc Verify join('|') on [1.0, 2.0, 3.0] returns '1|2|3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('|');
      expect(result).assertEqual('1|2|3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0230
     * @tc.name testFloat32ArrayJoinOne023
     * @tc.desc Verify join('-') on [1.0, 2.0, 3.0] returns '1-2-3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('-');
      expect(result).assertEqual('1-2-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0240
     * @tc.name testFloat32ArrayJoinOne024
     * @tc.desc Verify join(':') on [1.0, 2.0, 3.0] returns '1:2:3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join(':');
      expect(result).assertEqual('1:2:3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0250
     * @tc.name testFloat32ArrayJoinOne025
     * @tc.desc Verify join(';') on [1.0, 2.0, 3.0] returns '1;2;3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join(';');
      expect(result).assertEqual('1;2;3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0260
     * @tc.name testFloat32ArrayJoinOne026
     * @tc.desc Verify join('=') on [1.0, 2.0, 3.0] returns '1=2=3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('=');
      expect(result).assertEqual('1=2=3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0270
     * @tc.name testFloat32ArrayJoinOne027
     * @tc.desc Verify join('+') on [1.0, 2.0, 3.0] returns '1+2+3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('+');
      expect(result).assertEqual('1+2+3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0280
     * @tc.name testFloat32ArrayJoinOne028
     * @tc.desc Verify join('*') on [1.0, 2.0, 3.0] returns '1*2*3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('*');
      expect(result).assertEqual('1*2*3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0290
     * @tc.name testFloat32ArrayJoinOne029
     * @tc.desc Verify join('/') on [1.0, 2.0, 3.0] returns '1/2/3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('/');
      expect(result).assertEqual('1/2/3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0300
     * @tc.name testFloat32ArrayJoinOne030
     * @tc.desc Verify join('.') on [1.0, 2.0, 3.0] returns '1.2.3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('.');
      expect(result).assertEqual('1.2.3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0310
     * @tc.name testFloat32ArrayJoinOne031
     * @tc.desc Verify join('#') on [1.0, 2.0, 3.0] returns '1#2#3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('#');
      expect(result).assertEqual('1#2#3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0320
     * @tc.name testFloat32ArrayJoinOne032
     * @tc.desc Verify join('@') on [1.0, 2.0, 3.0] returns '1@2@3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('@');
      expect(result).assertEqual('1@2@3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0330
     * @tc.name testFloat32ArrayJoinOne033
     * @tc.desc Verify join('&') on [1.0, 2.0, 3.0] returns '1&2&3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('&');
      expect(result).assertEqual('1&2&3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0340
     * @tc.name testFloat32ArrayJoinOne034
     * @tc.desc Verify join('%') on [1.0, 2.0, 3.0] returns '1%2%3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('%');
      expect(result).assertEqual('1%2%3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0350
     * @tc.name testFloat32ArrayJoinOne035
     * @tc.desc Verify join('$') on [1.0, 2.0, 3.0] returns '1$2$3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('$');
      expect(result).assertEqual('1$2$3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0360
     * @tc.name testFloat32ArrayJoinOne036
     * @tc.desc Verify join('!') on [1.0, 2.0, 3.0] returns '1!2!3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('!');
      expect(result).assertEqual('1!2!3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0370
     * @tc.name testFloat32ArrayJoinOne037
     * @tc.desc Verify join('?') on [1.0, 2.0, 3.0] returns '1?2?3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('?');
      expect(result).assertEqual('1?2?3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0380
     * @tc.name testFloat32ArrayJoinOne038
     * @tc.desc Verify join('~') on [1.0, 2.0, 3.0] returns '1~2~3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('~');
      expect(result).assertEqual('1~2~3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0390
     * @tc.name testFloat32ArrayJoinOne039
     * @tc.desc Verify join('^') on [1.0, 2.0, 3.0] returns '1^2^3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('^');
      expect(result).assertEqual('1^2^3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0400
     * @tc.name testFloat32ArrayJoinOne040
     * @tc.desc Verify join('_') on [1.0, 2.0, 3.0] returns '1_2_3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('_');
      expect(result).assertEqual('1_2_3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0410
     * @tc.name testFloat32ArrayJoinOne041
     * @tc.desc Verify join('<') on [1.0, 2.0, 3.0] returns '1<2<3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('<');
      expect(result).assertEqual('1<2<3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0420
     * @tc.name testFloat32ArrayJoinOne042
     * @tc.desc Verify join('>') on [1.0, 2.0, 3.0] returns '1>2>3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('>');
      expect(result).assertEqual('1>2>3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0430
     * @tc.name testFloat32ArrayJoinOne043
     * @tc.desc Verify join('0') on [1.0, 2.0, 3.0] returns '10203'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('0');
      expect(result).assertEqual('10203');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0440
     * @tc.name testFloat32ArrayJoinOne044
     * @tc.desc Verify join('1') on [1.0, 2.0, 3.0] returns '11213'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('1');
      expect(result).assertEqual('11213');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0450
     * @tc.name testFloat32ArrayJoinOne045
     * @tc.desc Verify join('9') on [1.0, 2.0, 3.0] returns '19293'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('9');
      expect(result).assertEqual('19293');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0460
     * @tc.name testFloat32ArrayJoinOne046
     * @tc.desc Verify join('a') on [1.0, 2.0, 3.0] returns '1a2a3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('a');
      expect(result).assertEqual('1a2a3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0470
     * @tc.name testFloat32ArrayJoinOne047
     * @tc.desc Verify join('Z') on [1.0, 2.0, 3.0] returns '1Z2Z3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('Z');
      expect(result).assertEqual('1Z2Z3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0480
     * @tc.name testFloat32ArrayJoinOne048
     * @tc.desc Verify join('z') on [1.0, 2.0, 3.0] returns '1z2z3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('z');
      expect(result).assertEqual('1z2z3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0490
     * @tc.name testFloat32ArrayJoinOne049
     * @tc.desc Verify join('A') on [1.0, 2.0, 3.0] returns '1A2A3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('A');
      expect(result).assertEqual('1A2A3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0500
     * @tc.name testFloat32ArrayJoinOne050
     * @tc.desc Verify join(', ') on [1.0, 2.0, 3.0] returns '1, 2, 3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join(', ');
      expect(result).assertEqual('1, 2, 3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0510
     * @tc.name testFloat32ArrayJoinOne051
     * @tc.desc Verify join(' | ') on [1.0, 2.0, 3.0] returns '1 | 2 | 3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join(' | ');
      expect(result).assertEqual('1 | 2 | 3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0520
     * @tc.name testFloat32ArrayJoinOne052
     * @tc.desc Verify join('---') on [1.0, 2.0, 3.0] returns '1---2---3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('---');
      expect(result).assertEqual('1---2---3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0530
     * @tc.name testFloat32ArrayJoinOne053
     * @tc.desc Verify join('abc') on [1.0, 2.0, 3.0] returns '1abc2abc3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('abc');
      expect(result).assertEqual('1abc2abc3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0540
     * @tc.name testFloat32ArrayJoinOne054
     * @tc.desc Verify join('separator') on [1.0, 2.0, 3.0] returns '1separator2separator3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('separator');
      expect(result).assertEqual('1separator2separator3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0550
     * @tc.name testFloat32ArrayJoinOne055
     * @tc.desc Verify join('123') on [1.0, 2.0, 3.0] returns '112321233'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('123');
      expect(result).assertEqual('112321233');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0560
     * @tc.name testFloat32ArrayJoinOne056
     * @tc.desc Verify join('0x1F') on [1.0, 2.0, 3.0] returns '10x1F20x1F3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('0x1F');
      expect(result).assertEqual('10x1F20x1F3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0570
     * @tc.name testFloat32ArrayJoinOne057
     * @tc.desc Verify join('1.5') on [1.0, 2.0, 3.0] returns '11.521.53'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('1.5');
      expect(result).assertEqual('11.521.53');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0580
     * @tc.name testFloat32ArrayJoinOne058
     * @tc.desc Verify join(',|,') on [1.0, 2.0, 3.0] returns '1,|,2,|,3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join(',|,');
      expect(result).assertEqual('1,|,2,|,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0590
     * @tc.name testFloat32ArrayJoinOne059
     * @tc.desc Verify join(',,') on [1.0, 2.0, 3.0] returns '1,,2,,3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join(',,');
      expect(result).assertEqual('1,,2,,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0600
     * @tc.name testFloat32ArrayJoinOne060
     * @tc.desc Verify join('ab\tcd') on [1.0, 2.0, 3.0] returns '1ab\tcd2ab\tcd3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('ab\tcd');
      expect(result).assertEqual('1ab\tcd2ab\tcd3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0610
     * @tc.name testFloat32ArrayJoinOne061
     * @tc.desc Verify join(' -> ') on [1.0, 2.0, 3.0] returns '1 -> 2 -> 3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join(' -> ');
      expect(result).assertEqual('1 -> 2 -> 3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0620
     * @tc.name testFloat32ArrayJoinOne062
     * @tc.desc Verify join('null') on [1.0, 2.0, 3.0] returns '1null2null3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('null');
      expect(result).assertEqual('1null2null3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0630
     * @tc.name testFloat32ArrayJoinOne063
     * @tc.desc Verify join('undefined') on [1.0, 2.0, 3.0] returns '1undefined2undefined3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('undefined');
      expect(result).assertEqual('1undefined2undefined3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0640
     * @tc.name testFloat32ArrayJoinOne064
     * @tc.desc Verify join('NaN') on [1.0, 2.0, 3.0] returns '1NaN2NaN3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('NaN');
      expect(result).assertEqual('1NaN2NaN3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0650
     * @tc.name testFloat32ArrayJoinOne065
     * @tc.desc Verify join('Infinity') on [1.0, 2.0, 3.0] returns '1Infinity2Infinity3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('Infinity');
      expect(result).assertEqual('1Infinity2Infinity3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0660
     * @tc.name testFloat32ArrayJoinOne066
     * @tc.desc Verify join('true') on [1.0, 2.0, 3.0] returns '1true2true3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('true');
      expect(result).assertEqual('1true2true3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0670
     * @tc.name testFloat32ArrayJoinOne067
     * @tc.desc Verify join('false') on [1.0, 2.0, 3.0] returns '1false2false3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('false');
      expect(result).assertEqual('1false2false3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0680
     * @tc.name testFloat32ArrayJoinOne068
     * @tc.desc Verify join('\\') on [1.0, 2.0, 3.0] returns '1\\2\\3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('\\');
      expect(result).assertEqual('1\\2\\3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0690
     * @tc.name testFloat32ArrayJoinOne069
     * @tc.desc Verify join('\"') on [1.0, 2.0, 3.0] returns '1\"2\"3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('\"');
      expect(result).assertEqual('1\"2\"3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0700
     * @tc.name testFloat32ArrayJoinOne070
     * @tc.desc Verify join('\'') on [1.0, 2.0, 3.0] returns '1\'2\'3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('\'');
      expect(result).assertEqual('1\'2\'3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0710
     * @tc.name testFloat32ArrayJoinOne071
     * @tc.desc Verify join('\\n') on [1.0, 2.0, 3.0] returns '1\\n2\\n3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('\\n');
      expect(result).assertEqual('1\\n2\\n3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0720
     * @tc.name testFloat32ArrayJoinOne072
     * @tc.desc Verify join('\\t') on [1.0, 2.0, 3.0] returns '1\\t2\\t3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('\\t');
      expect(result).assertEqual('1\\t2\\t3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0730
     * @tc.name testFloat32ArrayJoinOne073
     * @tc.desc Verify join('`') on [1.0, 2.0, 3.0] returns '1`2`3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('`');
      expect(result).assertEqual('1`2`3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0740
     * @tc.name testFloat32ArrayJoinOne074
     * @tc.desc Verify join with em-dash separator on [1.0, 2.0, 3.0] returns values joined by it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('—');
      expect(result).assertEqual('1—2—3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0750
     * @tc.name testFloat32ArrayJoinOne075
     * @tc.desc Verify join with Chinese char separator on [1.0, 2.0, 3.0] returns values joined by it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('中');
      expect(result).assertEqual('1中2中3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0760
     * @tc.name testFloat32ArrayJoinOne076
     * @tc.desc Verify join with emoji separator on [1.0, 2.0, 3.0] returns values joined by it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('😀');
      expect(result).assertEqual('1😀2😀3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0770
     * @tc.name testFloat32ArrayJoinOne077
     * @tc.desc Verify join with e-acute separator string on [1.0, 2.0, 3.0] returns values joined by it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('café');
      expect(result).assertEqual('1café2café3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0780
     * @tc.name testFloat32ArrayJoinOne078
     * @tc.desc Verify join('0123456789') on [1.0, 2.0, 3.0] returns '10123456789201234567893'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('0123456789');
      expect(result).assertEqual('10123456789201234567893');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0790
     * @tc.name testFloat32ArrayJoinOne079
     * @tc.desc Verify join('abcdefghijklmnopqrstuvwxyz') on [1.0, 2.0, 3.0] returns '1abcdefghijklmnopqrstuvwxyz2abcdefghijklmnopqrstuvwxyz3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('abcdefghijklmnopqrstuvwxyz');
      expect(result).assertEqual('1abcdefghijklmnopqrstuvwxyz2abcdefghijklmnopqrstuvwxyz3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0800
     * @tc.name testFloat32ArrayJoinOne080
     * @tc.desc Verify join with 50-character separator on [1.0, 2.0, 3.0] returns concatenated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sep = '';
      for (let i = 0; i < 50; i++) {
        sep = sep + 'a';
      }
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join(sep);
      expect(result).assertEqual('1' + sep + '2' + sep + '3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0810
     * @tc.name testFloat32ArrayJoinOne081
     * @tc.desc Verify join with 100-character separator on [1.0, 2.0, 3.0] returns concatenated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sep = '';
      for (let i = 0; i < 100; i++) {
        sep = sep + 'a';
      }
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join(sep);
      expect(result).assertEqual('1' + sep + '2' + sep + '3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0820
     * @tc.name testFloat32ArrayJoinOne082
     * @tc.desc Verify join('2') on [1.0, 2.0, 3.0] returns '12223'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('2');
      expect(result).assertEqual('12223');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0830
     * @tc.name testFloat32ArrayJoinOne083
     * @tc.desc Verify join(',') on [NaN] returns 'NaN'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN);
      const result = arr.join(',');
      expect(result).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0840
     * @tc.name testFloat32ArrayJoinOne084
     * @tc.desc Verify join on [NaN,NaN] returns NaN,NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN, Number.NaN);
      const result = arr.join(',');
      expect(result).assertEqual('NaN,NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0850
     * @tc.name testFloat32ArrayJoinOne085
     * @tc.desc Verify join(',') on [Infinity] returns 'Infinity'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.POSITIVE_INFINITY);
      const result = arr.join(',');
      expect(result).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0860
     * @tc.name testFloat32ArrayJoinOne086
     * @tc.desc Verify join on [-Infinity] returns -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-Number.POSITIVE_INFINITY);
      const result = arr.join(',');
      expect(result).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0870
     * @tc.name testFloat32ArrayJoinOne087
     * @tc.desc Verify join(',') on [Infinity, -Infinity] returns 'Infinity,-Infinity'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY);
      const result = arr.join(',');
      expect(result).assertEqual('Infinity,-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0880
     * @tc.name testFloat32ArrayJoinOne088
     * @tc.desc Verify join on [0.0] returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0);
      const result = arr.join(',');
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0890
     * @tc.name testFloat32ArrayJoinOne089
     * @tc.desc Verify join(',') on [-0.0] returns '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-0.0);
      const result = arr.join(',');
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0900
     * @tc.name testFloat32ArrayJoinOne090
     * @tc.desc Verify join(',') on [NaN,Infinity,-0.0] returns 'NaN,Infinity,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN, Number.POSITIVE_INFINITY, -0.0);
      const result = arr.join(',');
      expect(result).assertEqual('NaN,Infinity,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0910
     * @tc.name testFloat32ArrayJoinOne091
     * @tc.desc Verify join preserves the exact decimal string for 2^24 (16777216)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(16777216.0);
      const result = arr.join(',');
      expect(result).assertEqual('16777216');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0920
     * @tc.name testFloat32ArrayJoinOne092
     * @tc.desc Verify 16777217 rounds to 16777216 in float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(16777217.0);
      const result = arr.join(',');
      expect(result).assertEqual('16777216');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0930
     * @tc.name testFloat32ArrayJoinOne093
     * @tc.desc Verify 1e40 Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1e40);
      const result = arr.join(',');
      expect(result).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0940
     * @tc.name testFloat32ArrayJoinOne094
     * @tc.desc Verify -1e40 -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1e40);
      const result = arr.join(',');
      expect(result).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0950
     * @tc.name testFloat32ArrayJoinOne095
     * @tc.desc Verify join on [1e-46] returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1e-46);
      const result = arr.join(',');
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0960
     * @tc.name testFloat32ArrayJoinOne096
     * @tc.desc Verify int 2147483647 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(2147483647.0);
      const result = arr.join(',');
      expect(result).assertEqual('2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0970
     * @tc.name testFloat32ArrayJoinOne097
     * @tc.desc Verify int -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-2147483648.0);
      const result = arr.join(',');
      expect(result).assertEqual('-2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0980
     * @tc.name testFloat32ArrayJoinOne098
     * @tc.desc Verify 1.0e3 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0e3);
      const result = arr.join(',');
      expect(result).assertEqual('1000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_0990
     * @tc.name testFloat32ArrayJoinOne099
     * @tc.desc Verify 2.0e2 200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(2.0e2);
      const result = arr.join(',');
      expect(result).assertEqual('200');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_1000
     * @tc.name testFloat32ArrayJoinOne100
     * @tc.desc Verify 1.5e1 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.5e1);
      const result = arr.join(',');
      expect(result).assertEqual('15');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_1010
     * @tc.name testFloat32ArrayJoinOne101
     * @tc.desc Verify 0x10 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10);
      const result = arr.join(',');
      expect(result).assertEqual('16');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_1020
     * @tc.name testFloat32ArrayJoinOne102
     * @tc.desc Verify 0xff 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0xff);
      const result = arr.join(',');
      expect(result).assertEqual('255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_1030
     * @tc.name testFloat32ArrayJoinOne103
     * @tc.desc Verify 0x100 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x100);
      const result = arr.join(',');
      expect(result).assertEqual('256');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_1040
     * @tc.name testFloat32ArrayJoinOne104
     * @tc.desc Verify 0.5 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.5);
      const result = arr.join(',');
      expect(result).assertEqual('0.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_1050
     * @tc.name testFloat32ArrayJoinOne105
     * @tc.desc Verify 2.5 2.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(2.5);
      const result = arr.join(',');
      expect(result).assertEqual('2.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_1060
     * @tc.name testFloat32ArrayJoinOne106
     * @tc.desc Verify -0.5 -0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-0.5);
      const result = arr.join(',');
      expect(result).assertEqual('-0.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_1070
     * @tc.name testFloat32ArrayJoinOne107
     * @tc.desc Verify join(',') on [1.5, 2.5] returns '1.5,2.5'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.5, 2.5);
      const result = arr.join(',');
      expect(result).assertEqual('1.5,2.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_1080
     * @tc.name testFloat32ArrayJoinOne108
     * @tc.desc Verify join(',') on [11.0, 22.0, 33.0] returns '11,22,33'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(11.0, 22.0, 33.0);
      const result = arr.join(',');
      expect(result).assertEqual('11,22,33');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_1090
     * @tc.name testFloat32ArrayJoinOne109
     * @tc.desc Verify join(',') on [-1.0, -2.0, -3.0] returns '-1,-2,-3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0, -2.0, -3.0);
      const result = arr.join(',');
      expect(result).assertEqual('-1,-2,-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_1100
     * @tc.name testFloat32ArrayJoinOne110
     * @tc.desc Verify join('|') on [100.0] returns '100'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(100.0);
      const result = arr.join('|');
      expect(result).assertEqual('100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_1110
     * @tc.name testFloat32ArrayJoinOne111
     * @tc.desc Verify join('|') on [NaN] returns 'NaN'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN);
      const result = arr.join('|');
      expect(result).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_ONE_1120
     * @tc.name testFloat32ArrayJoinOne112
     * @tc.desc Verify join(' - ') on [NaN,1.0,Infinity] returns 'NaN - 1 - Infinity'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinOne112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN, 1.0, Number.POSITIVE_INFINITY);
      const result = arr.join(' - ');
      expect(result).assertEqual('NaN - 1 - Infinity');
    });

  });
}
