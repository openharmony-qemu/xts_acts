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
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';
import util from '@ohos.util';

export default function encodeIntoUint8ArrayInfoProperties01Test(): void {
  describe('encodeIntoUint8ArrayInfoProperties01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_0100
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest001
     * @tc.desc Verify encodeIntoUint8Array('a', dest(3)) read=1 written=1 no throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdn1 = new util.TextEncoder();
      let dn1 = new Uint8Array(3);
      let ri1 = tdn1.encodeIntoUint8Array('a', dn1);
      let actual1: number = ri1.read;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: number = ri1.written;
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_0200
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest002
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('abcd', new Uint8Array(4)).read returns 4, and new TextEncoder().encodeIntoUint8Array('abcd', new Uint8Array(4)).written returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdi4 = new util.TextEncoder();
      let di4 = new Uint8Array(4);
      let ri4 = tdi4.encodeIntoUint8Array('abcd', di4);
      let actual1: number = ri4.read;
      let expected1: int = 4;
      expect(actual1).assertEqual(expected1);
      let actual2: number = ri4.written;
      let expected2: int = 4;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_0300
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest003
     * @tc.desc Verify encodeIntoUint8Array('abcde', dest(4)) read=4 written=4 no throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdn4 = new util.TextEncoder();
      let dn4 = new Uint8Array(4);
      let ri4 = tdn4.encodeIntoUint8Array('abcde', dn4);
      let actual1: number = ri4.read;
      let expected1: int = 4;
      expect(actual1).assertEqual(expected1);
      let actual2: number = ri4.written;
      let expected2: int = 4;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_0400
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest004
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('', new Uint8Array(4)).read returns 0, and new TextEncoder().encodeIntoUint8Array('', new Uint8Array(4)).written returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdi1 = new util.TextEncoder();
      let di1 = new Uint8Array(4);
      let ri1 = tdi1.encodeIntoUint8Array('', di1);
      let actual1: number = ri1.read;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: number = ri1.written;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
      let actual3: number = di1[0];
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_0500
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest005
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('a\u0000c', new Uint8Array(8)).read returns 3, and new TextEncoder().encodeIntoUint8Array('a\u0000c', new Uint8Array(8)).written returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdi5 = new util.TextEncoder();
      let di5 = new Uint8Array(8);
      let ri5 = tdi5.encodeIntoUint8Array('a\u0000c', di5);
      let actual1: number = ri5.read;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: number = ri5.written;
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_0600
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest006
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('U+00E9', new Uint8Array(4)).read returns 1, and new TextEncoder().encodeIntoUint8Array('U+00E9', new Uint8Array(4)).written returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdi6 = new util.TextEncoder();
      let di6 = new Uint8Array(4);
      let ri6 = tdi6.encodeIntoUint8Array('é', di6);
      let actual1: number = ri6.read;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: number = ri6.written;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_0700
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest007
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('U+4F60', new Uint8Array(4)).read returns 1, and new TextEncoder().encodeIntoUint8Array('U+4F60', new Uint8Array(4)).written returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdi7 = new util.TextEncoder();
      let di7 = new Uint8Array(4);
      let ri7 = tdi7.encodeIntoUint8Array('你', di7);
      let actual1: number = ri7.read;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: number = ri7.written;
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_0800
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest008
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('U+1F600', new Uint8Array(4)).read returns 2, and new TextEncoder().encodeIntoUint8Array('U+1F600', new Uint8Array(4)).written returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdi8 = new util.TextEncoder();
      let di8 = new Uint8Array(4);
      let ri8 = tdi8.encodeIntoUint8Array('😀', di8);
      let actual1: number = ri8.read;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: number = ri8.written;
      let expected2: int = 4;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_0900
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest009
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('eU+0301', new Uint8Array(8)).read returns 2, and new TextEncoder().encodeIntoUint8Array('eU+0301', new Uint8Array(8)).written returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdi15 = new util.TextEncoder();
      let di15 = new Uint8Array(8);
      let ri15 = tdi15.encodeIntoUint8Array('e\u0301', di15);
      let actual1: number = ri15.read;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: number = ri15.written;
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_1000
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest010
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('\uD800', new Uint8Array(8)).read returns 1, and new TextEncoder().encodeIntoUint8Array('\uD800', new Uint8Array(8)).written returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdi16 = new util.TextEncoder();
      let di16 = new Uint8Array(8);
      let ri16 = tdi16.encodeIntoUint8Array('\uD800', di16);
      let actual1: number = ri16.read;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: number = ri16.written;
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_1100
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest011
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('\uDC00', new Uint8Array(8)).read returns 1, and new TextEncoder().encodeIntoUint8Array('\uDC00', new Uint8Array(8)).written returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdi17 = new util.TextEncoder();
      let di17 = new Uint8Array(8);
      let ri17 = tdi17.encodeIntoUint8Array('\uDC00', di17);
      let actual1: number = ri17.read;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: number = ri17.written;
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_1200
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest012
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('\n', new Uint8Array(4)).read returns 1, and new TextEncoder().encodeIntoUint8Array('\n', new Uint8Array(4)).written returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdi18 = new util.TextEncoder();
      let di18 = new Uint8Array(4);
      let ri18 = tdi18.encodeIntoUint8Array('\n', di18);
      let actual1: number = ri18.read;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: number = ri18.written;
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_1300
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest013
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('U+FEFF', new Uint8Array(8)).read returns 1, and new TextEncoder().encodeIntoUint8Array('U+FEFF', new Uint8Array(8)).written returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdi19 = new util.TextEncoder();
      let di19 = new Uint8Array(8);
      let ri19 = tdi19.encodeIntoUint8Array('﻿', di19);
      let actual1: number = ri19.read;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: number = ri19.written;
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_1400
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest014
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('U+0080', new Uint8Array(4)).read returns 1, and new TextEncoder().encodeIntoUint8Array('U+0080', new Uint8Array(4)).written returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdi20 = new util.TextEncoder();
      let di20 = new Uint8Array(4);
      let ri20 = tdi20.encodeIntoUint8Array('\u0080', di20);
      let actual1: number = ri20.read;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: number = ri20.written;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_1500
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest015
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('abcdefghijklmnop', new Uint8Array(16)).read returns 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdi21 = new util.TextEncoder();
      let di21 = new Uint8Array(16);
      let ri21 = tdi21.encodeIntoUint8Array('abcdefghijklmnop', di21);
      let actual1: number = ri21.read;
      let expected1: int = 16;
      expect(actual1).assertEqual(expected1);
      let actual2: number = ri21.written;
      let expected2: int = 16;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_1600
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest016
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('U+4F60U+4F60...(32 times)', new Uint8Array(96)).read returns 32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdi23 = new util.TextEncoder();
      let di23 = new Uint8Array(96);
      let ri23 = tdi23.encodeIntoUint8Array('你你你你你你你你你你你你你你你你你你你你你你你你你你你你你你你你', di23);
      let actual1: number = ri23.read;
      let expected1: int = 32;
      expect(actual1).assertEqual(expected1);
      let actual2: number = ri23.written;
      let expected2: int = 96;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_1700
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest017
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('U+4F60', new Uint8Array(2)).read returns 0, and new TextEncoder().encodeIntoUint8Array('U+4F60', new Uint8Array(2)).written returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdi24 = new util.TextEncoder();
      let di24 = new Uint8Array(2);
      let ri24 = tdi24.encodeIntoUint8Array('你', di24);
      let actual1: number = ri24.read;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: number = ri24.written;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_1800
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest018
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('U+1F600', new Uint8Array(2)).read returns 0, and new TextEncoder().encodeIntoUint8Array('U+1F600', new Uint8Array(2)).written returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdi28 = new util.TextEncoder();
      let di28 = new Uint8Array(2);
      let ri28 = tdi28.encodeIntoUint8Array('😀', di28);
      let actual1: number = ri28.read;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: number = ri28.written;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_1900
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest019
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('U+4F60', new Uint8Array(3)).read returns 1, and new TextEncoder().encodeIntoUint8Array('U+4F60', new Uint8Array(3)).written returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdb6 = new util.TextEncoder();
      let db6 = new Uint8Array(3);
      let rb6 = tdb6.encodeIntoUint8Array('你', db6);
      let actual1: number = rb6.read;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rb6.written;
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_2000
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest020
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('aU+4F60', new Uint8Array(3)).read returns 1, and new TextEncoder().encodeIntoUint8Array('aU+4F60', new Uint8Array(3)).written returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdi25 = new util.TextEncoder();
      let di25 = new Uint8Array(3);
      let ri25 = tdi25.encodeIntoUint8Array('a你', di25);
      let actual1: number = ri25.read;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: number = ri25.written;
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_2100
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest021
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('U+4F60a', new Uint8Array(3)).read returns 1, and new TextEncoder().encodeIntoUint8Array('U+4F60a', new Uint8Array(3)).written returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdi26 = new util.TextEncoder();
      let di26 = new Uint8Array(3);
      let ri26 = tdi26.encodeIntoUint8Array('你a', di26);
      let actual1: number = ri26.read;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: number = ri26.written;
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_2200
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest022
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('U+1F600a', new Uint8Array(4)).read returns 2, and new TextEncoder().encodeIntoUint8Array('U+1F600a', new Uint8Array(4)).written returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdi30 = new util.TextEncoder();
      let di30 = new Uint8Array(4);
      let ri30 = tdi30.encodeIntoUint8Array('😀a', di30);
      let actual1: number = ri30.read;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: number = ri30.written;
      let expected2: int = 4;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_2300
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest023
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('U+4F60U+597D', new Uint8Array(3)).read returns 1, and new TextEncoder().encodeIntoUint8Array('U+4F60U+597D', new Uint8Array(3)).written returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdi32 = new util.TextEncoder();
      let di32 = new Uint8Array(3);
      let ri32 = tdi32.encodeIntoUint8Array('你好', di32);
      let actual1: number = ri32.read;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: number = ri32.written;
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_2400
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest024
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('U+4F60a', new Uint8Array(8)).read returns 2, and new TextEncoder().encodeIntoUint8Array('U+4F60a', new Uint8Array(8)).written returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdi11 = new util.TextEncoder();
      let di11 = new Uint8Array(8);
      let ri11 = tdi11.encodeIntoUint8Array('你a', di11);
      let actual1: number = ri11.read;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: number = ri11.written;
      let expected2: int = 4;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_2500
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest025
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('U+1F600U+4F60', new Uint8Array(8)).read returns 3, and new TextEncoder().encodeIntoUint8Array('U+1F600U+4F60', new Uint8Array(8)).written returns 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdi14 = new util.TextEncoder();
      let di14 = new Uint8Array(8);
      let ri14 = tdi14.encodeIntoUint8Array('😀你', di14);
      let actual1: number = ri14.read;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: number = ri14.written;
      let expected2: int = 7;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_2600
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest026
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('U+4F60U+597D', new Uint8Array(6)).read returns 2, and new TextEncoder().encodeIntoUint8Array('U+4F60U+597D', new Uint8Array(6)).written returns 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdb11 = new util.TextEncoder();
      let db11 = new Uint8Array(6);
      let rb11 = tdb11.encodeIntoUint8Array('你好', db11);
      let actual1: number = rb11.read;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rb11.written;
      let expected2: int = 6;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_2700
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest027
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('aU+4F60bU+4F60', new Uint8Array(7)).read returns 3, and new TextEncoder().encodeIntoUint8Array('aU+4F60bU+4F60', new Uint8Array(7)).written returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdb31 = new util.TextEncoder();
      let db31 = new Uint8Array(7);
      let rb31 = tdb31.encodeIntoUint8Array('a你b你', db31);
      let actual1: number = rb31.read;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rb31.written;
      let expected2: int = 5;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_2800
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest028
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('aU+4F60bU+4F60', new Uint8Array(8)).read returns 4, and new TextEncoder().encodeIntoUint8Array('aU+4F60bU+4F60', new Uint8Array(8)).written returns 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdb32 = new util.TextEncoder();
      let db32 = new Uint8Array(8);
      let rb32 = tdb32.encodeIntoUint8Array('a你b你', db32);
      let actual1: number = rb32.read;
      let expected1: int = 4;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rb32.written;
      let expected2: int = 8;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_2900
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest029
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('U+1F600U+1F600U+1F600', new Uint8Array(100)).read returns 6, and new TextEncoder().encodeIntoUint8Array('U+1F600U+1F600U+1F600', new Uint8Array(100)).written returns 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdb23 = new util.TextEncoder();
      let db23 = new Uint8Array(100);
      let rb23 = tdb23.encodeIntoUint8Array('😀😀😀', db23);
      let actual1: number = rb23.read;
      let expected1: int = 6;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rb23.written;
      let expected2: int = 12;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_3000
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest030
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('U+1F600U+4F60ab', new Uint8Array(256)).read returns 5, and new TextEncoder().encodeIntoUint8Array('U+1F600U+4F60ab', new Uint8Array(256)).written returns 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdb15 = new util.TextEncoder();
      let db15 = new Uint8Array(256);
      let rb15 = tdb15.encodeIntoUint8Array('😀你ab', db15);
      let actual1: number = rb15.read;
      let expected1: int = 5;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rb15.written;
      let expected2: int = 9;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_3100
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest031
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('ab', new Uint8Array(new ArrayBuffer(8), 1, 7)).read returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdb16 = new util.TextEncoder();
      let ab16 = new ArrayBuffer(8);
      let db16 = new Uint8Array(ab16, 1, 7);
      let rb16 = tdb16.encodeIntoUint8Array('ab', db16);
      let actual1: number = rb16.read;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rb16.written;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_3200
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest032
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('abcd', new Uint8Array(new ArrayBuffer(8), 2, 2)).read returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdb18 = new util.TextEncoder();
      let ab18 = new ArrayBuffer(8);
      let db18 = new Uint8Array(ab18, 2, 2);
      let rb18 = tdb18.encodeIntoUint8Array('abcd', db18);
      let actual1: number = rb18.read;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rb18.written;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_3300
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest033
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('U+4F60', new Uint8Array(new ArrayBuffer(4))).read returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdb20 = new util.TextEncoder();
      let sab20 = new ArrayBuffer(4);
      let db20 = new Uint8Array(sab20);
      let rb20 = tdb20.encodeIntoUint8Array('你', db20);
      let actual1: number = rb20.read;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rb20.written;
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_3400
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest034
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('abcd', new Uint8Array(new Uint8Array([9, 9, 9, 9]))).read returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdb21 = new util.TextEncoder();
      let src21 = new Uint8Array([9, 9, 9, 9]);
      let db21 = new Uint8Array(src21);
      let rb21 = tdb21.encodeIntoUint8Array('abcd', db21);
      let actual1: number = rb21.read;
      let expected1: int = 4;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rb21.written;
      let expected2: int = 4;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_3500
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest035
     * @tc.desc Verify new Uint8Array(4)[0] returns 97, and new Uint8Array(4)[1] returns 98, and new Uint8Array(4)[2] returns 99, and new Uint8Array(4)[3] returns 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdb25 = new util.TextEncoder();
      let db25 = new Uint8Array(4);
      tdb25.encodeIntoUint8Array('abcd', db25);
      let actual1: number = db25[0];
      let expected1: int = 97;
      expect(actual1).assertEqual(expected1);
      let actual2: number = db25[1];
      let expected2: int = 98;
      expect(actual2).assertEqual(expected2);
      let actual3: number = db25[2];
      let expected3: int = 99;
      expect(actual3).assertEqual(expected3);
      let actual4: number = db25[3];
      let expected4: int = 100;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_3600
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest036
     * @tc.desc Verify new Uint8Array(3)[0] returns 0xe4, and new Uint8Array(3)[1] returns 0xbd, and new Uint8Array(3)[2] returns 0xa0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdb26 = new util.TextEncoder();
      let db26 = new Uint8Array(3);
      tdb26.encodeIntoUint8Array('你', db26);
      let actual1: number = db26[0];
      let expected1: number = 0xe4;
      expect(actual1).assertEqual(expected1);
      let actual2: number = db26[1];
      let expected2: number = 0xbd;
      expect(actual2).assertEqual(expected2);
      let actual3: number = db26[2];
      let expected3: number = 0xa0;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_3700
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest037
     * @tc.desc Verify new Uint8Array(4)[0] returns 0xf0, and new Uint8Array(4)[1] returns 0x9f, and new Uint8Array(4)[2] returns 0x98, and new Uint8Array(4)[3] returns 0x80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdb28 = new util.TextEncoder();
      let db28 = new Uint8Array(4);
      tdb28.encodeIntoUint8Array('😀', db28);
      let actual1: number = db28[0];
      let expected1: number = 0xf0;
      expect(actual1).assertEqual(expected1);
      let actual2: number = db28[1];
      let expected2: number = 0x9f;
      expect(actual2).assertEqual(expected2);
      let actual3: number = db28[2];
      let expected3: number = 0x98;
      expect(actual3).assertEqual(expected3);
      let actual4: number = db28[3];
      let expected4: number = 0x80;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_3800
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest038
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('ab', new Uint8Array(new ArrayBuffer(8), 6, 2)).read returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdb37 = new util.TextEncoder();
      let ab37 = new ArrayBuffer(8);
      let db37 = new Uint8Array(ab37, 6, 2);
      let rb37 = tdb37.encodeIntoUint8Array('ab', db37);
      let actual1: number = rb37.read;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rb37.written;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
      let full37 = new Uint8Array(ab37);
      let actual3: number = full37[6];
      let expected3: int = 97;
      expect(actual3).assertEqual(expected3);
      let actual4: number = full37[7];
      let expected4: int = 98;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_3900
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest039
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('abcd', new Uint8Array(new ArrayBuffer(4))).read returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdb33 = new util.TextEncoder();
      let ab33 = new ArrayBuffer(4);
      let dv33 = new DataView(ab33);
      let db33 = new Uint8Array(ab33);
      let rb33 = tdb33.encodeIntoUint8Array('abcd', db33);
      let actual1: number = rb33.read;
      let expected1: int = 4;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rb33.written;
      let expected2: int = 4;
      expect(actual2).assertEqual(expected2);
      let actual3: number = dv33.getUint8(0);
      let expected3: int = 97;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_4000
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest040
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('aU+1F600', new Uint8Array(2)).read returns 1, and new TextEncoder().encodeIntoUint8Array('aU+1F600', new Uint8Array(2)).written returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdi36 = new util.TextEncoder();
      let di36 = new Uint8Array(2);
      let ri36 = tdi36.encodeIntoUint8Array('a😀', di36);
      let actual1: number = ri36.read;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: number = ri36.written;
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_4100
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest041
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('abU+4F60', new Uint8Array(4)).read returns 2, and new TextEncoder().encodeIntoUint8Array('abU+4F60', new Uint8Array(4)).written returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdb9 = new util.TextEncoder();
      let db9 = new Uint8Array(4);
      let rb9 = tdb9.encodeIntoUint8Array('ab你', db9);
      let actual1: number = rb9.read;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rb9.written;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_4200
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest042
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('U+4F60U+597Dab', new Uint8Array(8)).read returns 4, and new TextEncoder().encodeIntoUint8Array('U+4F60U+597Dab', new Uint8Array(8)).written returns 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdb12 = new util.TextEncoder();
      let db12 = new Uint8Array(8);
      let rb12 = tdb12.encodeIntoUint8Array('你好ab', db12);
      let actual1: number = rb12.read;
      let expected1: int = 4;
      expect(actual1).assertEqual(expected1);
      let actual2: number = rb12.written;
      let expected2: int = 8;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_4300
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest043
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('U+1F600a', new Uint8Array(5)).read returns 3, and new TextEncoder().encodeIntoUint8Array('U+1F600a', new Uint8Array(5)).written returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdi29 = new util.TextEncoder();
      let di29 = new Uint8Array(5);
      let ri29 = tdi29.encodeIntoUint8Array('😀a', di29);
      let actual1: number = ri29.read;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: number = ri29.written;
      let expected2: int = 5;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_4400
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest044
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('\uD800', new Uint8Array(2)).read returns 0, and new TextEncoder().encodeIntoUint8Array('\uD800', new Uint8Array(2)).written returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdi31 = new util.TextEncoder();
      let di31 = new Uint8Array(2);
      let ri31 = tdi31.encodeIntoUint8Array('\uD800', di31);
      let actual1: number = ri31.read;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: number = ri31.written;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODEINTOUINT8ARRAYINFO_PROPERTIES_ONE_4500
     * @tc.name encodeIntoUint8ArrayInfoPropertiesOneTest045
     * @tc.desc Verify new TextEncoder().encodeIntoUint8Array('U+4F60U+1F600', new Uint8Array(3)).read returns 1, and new TextEncoder().encodeIntoUint8Array('U+4F60U+1F600', new Uint8Array(3)).written returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('encodeIntoUint8ArrayInfoPropertiesOneTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdi37 = new util.TextEncoder();
      let di37 = new Uint8Array(3);
      let ri37 = tdi37.encodeIntoUint8Array('你😀', di37);
      let actual1: number = ri37.read;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: number = ri37.written;
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
    });
  });
}
