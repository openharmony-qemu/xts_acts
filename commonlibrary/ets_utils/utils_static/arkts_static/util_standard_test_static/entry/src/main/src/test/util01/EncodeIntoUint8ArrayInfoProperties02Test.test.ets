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
import util from '@ohos.util';

export default function encodeIntoUint8ArrayInfoProperties02Test(): void {
  describe('encodeIntoUint8ArrayInfoProperties02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_0100
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest001
     * @tc.desc Verify typeof new TextEncoder().encodeIntoUint8Array('a', new Uint8Array(4)) returns 'object'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encT1 = new util.TextEncoder();
      let dT1 = new Uint8Array(4);
      let rT1 = encT1.encodeIntoUint8Array('a', dT1);
      let actual1: string = typeof rT1;
      let expected1: string = 'object';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_0200
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest002
     * @tc.desc Verify typeof new TextEncoder().encodeIntoUint8Array('a', new Uint8Array(4)).read returns 'int'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encT8 = new util.TextEncoder();
      let dT8 = new Uint8Array(4);
      let rT8 = encT8.encodeIntoUint8Array('a', dT8);
      let actual1: string = typeof rT8.read;
      let expected1: string = 'int';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_0300
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest003
     * @tc.desc Verify encodeIntoUint8Array('a', dest(4)) read equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encT10 = new util.TextEncoder();
      let dT10 = new Uint8Array(4);
      let rT10 = encT10.encodeIntoUint8Array('a', dT10);
      let actual1: number = rT10.read;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_0400
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest004
     * @tc.desc Verify encodeIntoUint8Array() result written is 3 for a 3-byte character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encT13 = new util.TextEncoder();
      let dT13 = new Uint8Array(4);
      let rT13 = encT13.encodeIntoUint8Array('你', dT13);
      let actual1: number = rT13.written;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_0500
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest005
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('z', new Uint8Array(1)).read returns 1, and new TextEncoder().encodeIntoUint8Array('z', new Uint8Array(1)).written returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encB1 = new util.TextEncoder();
      let dB1 = new Uint8Array(1);
      let rB1 = encB1.encodeIntoUint8Array('z', dB1);
      let actual1: number = rB1.read;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rB1.written;
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_0600
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest006
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('hello', new Uint8Array(5)).read returns 5, and new TextEncoder().encodeIntoUint8Array('hello', new Uint8Array(5)).written returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encB3 = new util.TextEncoder();
      let dB3 = new Uint8Array(5);
      let rB3 = encB3.encodeIntoUint8Array('hello', dB3);
      let actual1: number = rB3.read;
      let expected1: int = 5;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rB3.written;
      let expected2: int = 5;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_0700
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest007
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('\t', new Uint8Array(1)).read returns 1, and new TextEncoder().encodeIntoUint8Array('\t', new Uint8Array(1)).written returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encB5 = new util.TextEncoder();
      let dB5 = new Uint8Array(1);
      let rB5 = encB5.encodeIntoUint8Array('\t', dB5);
      let actual1: number = rB5.read;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rB5.written;
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_0800
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest008
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('\r\n', new Uint8Array(2)).read returns 2, and new TextEncoder().encodeIntoUint8Array('\r\n', new Uint8Array(2)).written returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encB6 = new util.TextEncoder();
      let dB6 = new Uint8Array(2);
      let rB6 = encB6.encodeIntoUint8Array('\r\n', dB6);
      let actual1: number = rB6.read;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rB6.written;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_0900
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest009
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('a b', new Uint8Array(3)).read returns 3, and new TextEncoder().encodeIntoUint8Array('a b', new Uint8Array(3)).written returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encB7 = new util.TextEncoder();
      let dB7 = new Uint8Array(3);
      let rB7 = encB7.encodeIntoUint8Array('a b', dB7);
      let actual1: number = rB7.read;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rB7.written;
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_1000
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest010
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('U+4E2D', new Uint8Array(3)).read returns 1, and new TextEncoder().encodeIntoUint8Array('U+4E2D', new Uint8Array(3)).written returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encB8 = new util.TextEncoder();
      let dB8 = new Uint8Array(3);
      let rB8 = encB8.encodeIntoUint8Array('中', dB8);
      let actual1: number = rB8.read;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rB8.written;
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_1100
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest011
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('U+1F600', new Uint8Array(8)).read returns 2, and new TextEncoder().encodeIntoUint8Array('U+1F600', new Uint8Array(8)).written returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encB10 = new util.TextEncoder();
      let dB10 = new Uint8Array(8);
      let rB10 = encB10.encodeIntoUint8Array('😀', dB10);
      let actual1: number = rB10.read;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rB10.written;
      let expected2: int = 4;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_1200
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest012
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('U+1F600U+1F600', new Uint8Array(8)).read returns 4, and new TextEncoder().encodeIntoUint8Array('U+1F600U+1F600', new Uint8Array(8)).written returns 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encB11 = new util.TextEncoder();
      let dB11 = new Uint8Array(8);
      let rB11 = encB11.encodeIntoUint8Array('😀😀', dB11);
      let actual1: number = rB11.read;
      let expected1: int = 4;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rB11.written;
      let expected2: int = 8;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_1300
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest013
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('abcU+4E2Ddef', new Uint8Array(9)).read returns 7, and new TextEncoder().encodeIntoUint8Array('abcU+4E2Ddef', new Uint8Array(9)).written returns 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encB12 = new util.TextEncoder();
      let dB12 = new Uint8Array(9);
      let rB12 = encB12.encodeIntoUint8Array('abc中def', dB12);
      let actual1: number = rB12.read;
      let expected1: int = 7;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rB12.written;
      let expected2: int = 9;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_1400
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest014
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('abcdef', new Uint8Array(4)).read returns 4, and new TextEncoder().encodeIntoUint8Array('abcdef', new Uint8Array(4)).written returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encB14 = new util.TextEncoder();
      let dB14 = new Uint8Array(4);
      let rB14 = encB14.encodeIntoUint8Array('abcdef', dB14);
      let actual1: number = rB14.read;
      let expected1: int = 4;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rB14.written;
      let expected2: int = 4;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_1500
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest015
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('hello', new Uint8Array(5)).read returns new TextEncoder().encodeIntoUint8Array('hello', new Uint8Array(5)).written
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encB15 = new util.TextEncoder();
      let dB15 = new Uint8Array(5);
      let rB15 = encB15.encodeIntoUint8Array('hello', dB15);
      let actual1: number = rB15.read;
      let expected1: number = rB15.written;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_1600
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest016
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('U+554AU+554A', new Uint8Array(6)).written returns new TextEncoder().encodeIntoUint8Array('U+554AU+554A', new Uint8Array(6)).read * 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encB16 = new util.TextEncoder();
      let dB16 = new Uint8Array(6);
      let rB16 = encB16.encodeIntoUint8Array('啊啊', dB16);
      let actual1: number = rB16.written;
      let expected1: number = rB16.read * 3;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_1700
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest017
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('aU+4E2D', new Uint8Array(4)).written - new TextEncoder().encodeIntoUint8Array('aU+4E2D', new Uint8Array(4)).read returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encB17 = new util.TextEncoder();
      let dB17 = new Uint8Array(4);
      let rB17 = encB17.encodeIntoUint8Array('a中', dB17);
      let actual1: number = rB17.written - rB17.read;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_1800
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest018
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('aU+4E2Db', new Uint8Array(8)).read returns 3, and new TextEncoder().encodeIntoUint8Array('aU+4E2Db', new Uint8Array(8)).written returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encB18 = new util.TextEncoder();
      let dB18 = new Uint8Array(8);
      let rB18 = encB18.encodeIntoUint8Array('a中b', dB18);
      let actual1: number = rB18.read;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rB18.written;
      let expected2: int = 5;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_1900
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest019
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('U+1F600', new Uint8Array(8)).read < new TextEncoder().encodeIntoUint8Array('U+1F600', new Uint8Array(8)).written
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encB20 = new util.TextEncoder();
      let dB20 = new Uint8Array(8);
      let rB20 = encB20.encodeIntoUint8Array('😀', dB20);
      expect(rB20.read).assertLess(rB20.written);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_2000
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest020
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('U+4E2DU+4E2DU+4E2DU+4E2DU+4E2D', new Uint8Array(15)).read returns 5, and new TextEncoder().encodeIntoUint8Array('U+4E2DU+4E2DU+4E2DU+4E2DU+4E2D', new Uint8Array(15)).written returns 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encB21 = new util.TextEncoder();
      let dB21 = new Uint8Array(15);
      let rB21 = encB21.encodeIntoUint8Array('中中中中中', dB21);
      let actual1: number = rB21.read;
      let expected1: int = 5;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rB21.written;
      let expected2: int = 15;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_2100
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest021
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('1234567890123456', new Uint8Array(16)).read returns 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encB22 = new util.TextEncoder();
      let dB22 = new Uint8Array(16);
      let rB22 = encB22.encodeIntoUint8Array('1234567890123456', dB22);
      let actual1: number = rB22.read;
      let expected1: int = 16;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rB22.written;
      let expected2: int = 16;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_2200
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest022
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('aU+4E2D', new Uint8Array(4)).written returns 4, and new TextEncoder().encodeIntoUint8Array('aU+4E2D', new Uint8Array(4)).read returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encB23 = new util.TextEncoder();
      let dB23 = new Uint8Array(4);
      let rB23 = encB23.encodeIntoUint8Array('a中', dB23);
      let wFirst = rB23.written;
      let rLater = rB23.read;
      expect(wFirst).assertEqual(4);
      expect(rLater).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_2300
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest023
     * @tc.desc Verify new Uint8Array(8).byteLength returns 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encC1 = new util.TextEncoder();
      let dC1 = new Uint8Array(8);
      encC1.encodeIntoUint8Array('abcd', dC1);
      let actual1: int = dC1.byteLength;
      let expected1: int = 8;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_2400
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest024
     * @tc.desc Verify new Uint8Array(new ArrayBuffer(8)).buffer.byteLength returns 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encC2 = new util.TextEncoder();
      let abC2 = new ArrayBuffer(8);
      let dC2 = new Uint8Array(abC2);
      encC2.encodeIntoUint8Array('abcd', dC2);
      let actual1: int = dC2.buffer.byteLength;
      let expected1: int = 8;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_2500
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest025
     * @tc.desc Verify Object.keys(new TextEncoder().encodeIntoUint8Array('abcd', new Uint8Array(4))).length returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encC4 = new util.TextEncoder();
      let dC4 = new Uint8Array(4);
      let rC4 = encC4.encodeIntoUint8Array('abcd', dC4);
      let keys = Object.keys(rC4);
      let actual1: int = keys.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_2600
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest026
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('abcd', new Uint8Array(4)).written returns new Uint8Array(4).byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encC5 = new util.TextEncoder();
      let dC5 = new Uint8Array(4);
      let rC5 = encC5.encodeIntoUint8Array('abcd', dC5);
      let actual1: number = rC5.written;
      let expected1: number = dC5.byteLength;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_2700
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest027
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('ab', new Uint8Array(4)).written returns 2, and new Uint8Array(4).$_get(2) returns 0xff
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encC6 = new util.TextEncoder();
      let dC6 = new Uint8Array(4);
      dC6.$_set(0, 0xff);
      dC6.$_set(1, 0xff);
      dC6.$_set(2, 0xff);
      dC6.$_set(3, 0xff);
      let rC6 = encC6.encodeIntoUint8Array('ab', dC6);
      let actual1: number = rC6.written;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: number = dC6.$_get(2);
      let expected2: number = 0xff;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_2800
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest028
     * @tc.desc Verify the destination passed to new TextEncoder().encodeIntoUint8Array('a', new Uint8Array(4)) is still an instance of Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encD5 = new util.TextEncoder();
      let dD5 = new Uint8Array(4);
      encD5.encodeIntoUint8Array('a', dD5);
      let actual1: boolean = dD5 instanceof Uint8Array;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_2900
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest029
     * @tc.desc Verify encodeIntoUint8Array() overwrites dest from byte 0 (cd after ab -> 99,100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encD7 = new util.TextEncoder();
      let dD7 = new Uint8Array(4);
      encD7.encodeIntoUint8Array('ab', dD7);
      encD7.encodeIntoUint8Array('cd', dD7);
      let actual1: number = dD7.$_get(0);
      let expected1: int = 99;
      expect(actual1).assertEqual(expected1);
      let actual2: number = dD7.$_get(1);
      let expected2: int = 100;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_3000
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest030
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('a', new Uint8Array(4)) differs from new TextEncoder().encodeIntoUint8Array('b', new Uint8Array(4))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encE1 = new util.TextEncoder();
      let dE1a = new Uint8Array(4);
      let dE1b = new Uint8Array(4);
      let rE1a = encE1.encodeIntoUint8Array('a', dE1a);
      let rE1b = encE1.encodeIntoUint8Array('b', dE1b);
      expect(rE1a).not().assertEqual(rE1b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_3100
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest031
     * @tc.desc Verify encodeIntoUint8Array('a', dE2) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encE2 = new util.TextEncoder();
      let dE2 = new Uint8Array(4);
      let chainRead = encE2.encodeIntoUint8Array('a', dE2).read;
      expect(chainRead).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_3200
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest032
     * @tc.desc Verify encodeIntoUint8Array('U+4E2D', dE4) returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encE4 = new util.TextEncoder();
      let dE4 = new Uint8Array(4);
      let chainCjk = encE4.encodeIntoUint8Array('中', dE4).written;
      expect(chainCjk).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_3300
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest033
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('abcd', new Uint8Array(8)).read returns 4, and new TextEncoder().encodeIntoUint8Array('abcd', new Uint8Array(8)).written returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encE5 = new util.TextEncoder();
      let dE5a = new Uint8Array(8);
      let dE5b = new Uint8Array(8);
      let rE5a = encE5.encodeIntoUint8Array('abcd', dE5a);
      let rE5b = encE5.encodeIntoUint8Array('中中', dE5b);
      let actual1: number = rE5a.read;
      let expected1: int = 4;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rE5a.written;
      let expected2: int = 4;
      expect(actual2).assertEqual(expected2);
      let actual3: number = rE5b.read;
      let expected3: int = 2;
      expect(actual3).assertEqual(expected3);
      let actual4: number = rE5b.written;
      let expected4: int = 6;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_3400
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest034
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('', new Uint8Array(4)).read returns 0, and new TextEncoder().encodeIntoUint8Array('', new Uint8Array(4)).written returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encE7 = new util.TextEncoder();
      let dE7a = new Uint8Array(4);
      let dE7b = new Uint8Array(4);
      let rE7a = encE7.encodeIntoUint8Array('', dE7a);
      let rE7b = encE7.encodeIntoUint8Array('a', dE7b);
      let actual1: number = rE7a.read;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rE7a.written;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
      let actual3: number = rE7b.read;
      let expected3: int = 1;
      expect(actual3).assertEqual(expected3);
      let actual4: number = rE7b.written;
      let expected4: int = 1;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_3500
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest035
     * @tc.desc Verify new Uint8Array(new ArrayBuffer(6)).$_get(1) returns 97, and new Uint8Array(new ArrayBuffer(6)).$_get(2) returns 98
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encF2 = new util.TextEncoder();
      let abF2 = new ArrayBuffer(6);
      let dF2 = new Uint8Array(abF2, 1, 4);
      encF2.encodeIntoUint8Array('ab', dF2);
      let fullF2 = new Uint8Array(abF2);
      let actual1: number = fullF2.$_get(1);
      let expected1: int = 97;
      expect(actual1).assertEqual(expected1);
      let actual2: number = fullF2.$_get(2);
      let expected2: int = 98;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_3600
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest036
     * @tc.desc Verify new DataView(new ArrayBuffer(8)).getUint8(2) returns 97, and new DataView(new ArrayBuffer(8)).getUint8(3) returns 98
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encF3 = new util.TextEncoder();
      let abF3 = new ArrayBuffer(8);
      let dF3 = new Uint8Array(abF3, 2, 2);
      let dvF3 = new DataView(abF3);
      encF3.encodeIntoUint8Array('ab', dF3);
      let actual1: number = dvF3.getUint8(2);
      let expected1: int = 97;
      expect(actual1).assertEqual(expected1);
      let actual2: number = dvF3.getUint8(3);
      let expected2: int = 98;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_3700
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest037
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('abcd', new Uint8Array(new ArrayBuffer(8), 0, 2)).read returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encF6 = new util.TextEncoder();
      let abF6 = new ArrayBuffer(8);
      let dF6 = new Uint8Array(abF6, 0, 2);
      let rF6 = encF6.encodeIntoUint8Array('abcd', dF6);
      let actual1: number = rF6.read;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rF6.written;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_3800
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest038
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('abc', new Uint8Array(8).subarray(1, 4)).read returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encF7 = new util.TextEncoder();
      let fullF7 = new Uint8Array(8);
      let subF7 = fullF7.subarray(1, 4);
      let rF7 = encF7.encodeIntoUint8Array('abc', subF7);
      let actual1: number = rF7.read;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rF7.written;
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
      let actual3: number = fullF7.$_get(1);
      let expected3: int = 97;
      expect(actual3).assertEqual(expected3);
      let actual4: number = fullF7.$_get(3);
      let expected4: int = 99;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_3900
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest039
     * @tc.desc Verify new Uint8Array(new ArrayBuffer(4)).$_get(0) returns 97, and new Uint8Array(new ArrayBuffer(4)).$_get(1) returns 98
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encF9 = new util.TextEncoder();
      let abF9 = new ArrayBuffer(4);
      let vF9a = new Uint8Array(abF9);
      let vF9b = new Uint8Array(abF9);
      encF9.encodeIntoUint8Array('ab', vF9a);
      let actual1: number = vF9b.$_get(0);
      let expected1: int = 97;
      expect(actual1).assertEqual(expected1);
      let actual2: number = vF9b.$_get(1);
      let expected2: int = 98;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_TWO_4000
     * @tc.name encodeIntoUint8ArrayInfoPropertiesTwoTest040
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('a', new Uint8Array(4)).read returns 1, and new TextEncoder().encodeIntoUint8Array('a', new Uint8Array(4)).written returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesTwoTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encG6 = new util.TextEncoder();
      let dG6 = new Uint8Array(4);
      dG6.$_set(0, 0x11);
      dG6.$_set(1, 0x22);
      let sG6: string = 'a';
      let rG6 = encG6.encodeIntoUint8Array(sG6, dG6);
      let actual1: number = rG6.read;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rG6.written;
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
      let actual3: number = dG6.$_get(0);
      let expected3: number = 97;
      expect(actual3).assertEqual(expected3);
      let actual4: number = dG6.$_get(1);
      let expected4: number = 0x22;
      expect(actual4).assertEqual(expected4);
    });
  });
}
