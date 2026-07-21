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

export default function Uint8ArrayToSortedTest(): void {
  describe('Uint8ArrayToSortedTest', () => {
    beforeAll(() => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_0100
     * @tc.name testUint8ArrayToSorted001
     * @tc.desc Verify toSorted returns empty array with length 0 for empty Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of();
      const r = u.toSorted();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_0200
     * @tc.name testUint8ArrayToSorted002
     * @tc.desc Verify toSorted returns new object with different reference for empty Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of();
      const r = u.toSorted();
      expect(r !== u).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_0300
     * @tc.name testUint8ArrayToSorted003
     * @tc.desc Verify toSorted returns empty array with byteLength 0 for empty Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of();
      const r = u.toSorted();
      expect(r.byteLength).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_0400
     * @tc.name testUint8ArrayToSorted004
     * @tc.desc Verify toSorted returns empty array for new Uint8Array(0)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = new Uint8Array(0);
      const r = u.toSorted();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_0500
     * @tc.name testUint8ArrayToSorted005
     * @tc.desc Verify toSorted result has no elements when iterating over empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of();
      const r = u.toSorted();
      let cnt: int = 0;
      for (let v of r) {
        cnt++;
      }
      expect(cnt).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_0600
     * @tc.name testUint8ArrayToSorted006
     * @tc.desc Verify toSorted keeps single element [0] as [0]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(0);
      const r = u.toSorted();
      expect(r[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_0700
     * @tc.name testUint8ArrayToSorted007
     * @tc.desc Verify toSorted keeps single element [255] as [255]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(255);
      const r = u.toSorted();
      expect(r[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_0800
     * @tc.name testUint8ArrayToSorted008
     * @tc.desc Verify toSorted keeps single element [128] as [128]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(128);
      const r = u.toSorted();
      expect(r[0]).assertEqual(128);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_0900
     * @tc.name testUint8ArrayToSorted009
     * @tc.desc Verify toSorted keeps single element [127] as [127]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(127);
      const r = u.toSorted();
      expect(r[0]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_1000
     * @tc.name testUint8ArrayToSorted010
     * @tc.desc Verify toSorted keeps single hex element [0x7F] as [0x7F]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(0x7F);
      const r = u.toSorted();
      expect(r[0]).assertEqual(0x7F);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_1100
     * @tc.name testUint8ArrayToSorted011
     * @tc.desc Verify toSorted returns new object for single element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(77);
      const r = u.toSorted();
      expect(r !== u).assertTrue();
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_1200
     * @tc.name testUint8ArrayToSorted012
     * @tc.desc Verify toSorted result length is 1 for single element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(99);
      const r = u.toSorted();
      expect(r.length).assertEqual(1);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_1300
     * @tc.name testUint8ArrayToSorted013
     * @tc.desc Verify toSorted result[0] is 1 for already sorted [1, 2]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(1, 2);
      const r = u.toSorted();
      expect(r[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_1400
     * @tc.name testUint8ArrayToSorted014
     * @tc.desc Verify toSorted result[1] is 2 for already sorted [1, 2]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(1, 2);
      const r = u.toSorted();
      expect(r[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_1500
     * @tc.name testUint8ArrayToSorted015
     * @tc.desc Verify toSorted result[0] is 1 for reversed [2, 1]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(2, 1);
      const r = u.toSorted();
      expect(r[0]).assertEqual(1);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_1600
     * @tc.name testUint8ArrayToSorted016
     * @tc.desc Verify toSorted result[1] is 2 for reversed [2, 1]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(2, 1);
      const r = u.toSorted();
      expect(r[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_1700
     * @tc.name testUint8ArrayToSorted017
     * @tc.desc Verify toSorted result[0] is 5 for equal elements [5, 5]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(5, 5);
      const r = u.toSorted();
      expect(r[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_1800
     * @tc.name testUint8ArrayToSorted018
     * @tc.desc Verify toSorted result[0] is 0 for boundary elements [0, 255]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(0, 255);
      const r = u.toSorted();
      expect(r[0]).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_1900
     * @tc.name testUint8ArrayToSorted019
     * @tc.desc Verify toSorted result[1] is 255 for boundary elements [0, 255]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(0, 255);
      const r = u.toSorted();
      expect(r[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_2000
     * @tc.name testUint8ArrayToSorted020
     * @tc.desc Verify toSorted result[0] is 0 for reversed boundary [255, 0]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(255, 0);
      const r = u.toSorted();
      expect(r[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_2100
     * @tc.name testUint8ArrayToSorted021
     * @tc.desc Verify toSorted result[0] is 127 for median values [127, 128]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(127, 128);
      const r = u.toSorted();
      expect(r[0]).assertEqual(127);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_2200
     * @tc.name testUint8ArrayToSorted022
     * @tc.desc Verify toSorted result[1] is 128 for median values [127, 128]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(127, 128);
      const r = u.toSorted();
      expect(r[1]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_2300
     * @tc.name testUint8ArrayToSorted023
     * @tc.desc Verify toSorted result[0] is 128 for reversed median [128, 127]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(128, 127);
      const r = u.toSorted();
      expect(r[0]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_2400
     * @tc.name testUint8ArrayToSorted024
     * @tc.desc Verify toSorted result[0] is 0 for min boundary [0, 1]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(0, 1);
      const r = u.toSorted();
      expect(r[0]).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_2500
     * @tc.name testUint8ArrayToSorted025
     * @tc.desc Verify toSorted result[1] is 1 for min boundary [0, 1]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(0, 1);
      const r = u.toSorted();
      expect(r[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_2600
     * @tc.name testUint8ArrayToSorted026
     * @tc.desc Verify toSorted result[0] is 254 for max boundary [254, 255]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(254, 255);
      const r = u.toSorted();
      expect(r[0]).assertEqual(254);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_2700
     * @tc.name testUint8ArrayToSorted027
     * @tc.desc Verify toSorted result[1] is 255 for max boundary [254, 255]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(254, 255);
      const r = u.toSorted();
      expect(r[1]).assertEqual(255);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_2800
     * @tc.name testUint8ArrayToSorted028
     * @tc.desc Verify toSorted result[0] is 10 for reversed max boundary [255, 254]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(255, 254);
      const r = u.toSorted();
      expect(r[0]).assertEqual(254);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_2900
     * @tc.name testUint8ArrayToSorted029
     * @tc.desc Verify toSorted result[0] is 10 for gap values [10, 200]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(10, 200);
      const r = u.toSorted();
      expect(r[0]).assertEqual(10);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_3000
     * @tc.name testUint8ArrayToSorted030
     * @tc.desc Verify toSorted result length is 2 for two-element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(2, 1);
      const r = u.toSorted();
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_3100
     * @tc.name testUint8ArrayToSorted031
     * @tc.desc Verify toSorted returns new object for two-element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(2, 1);
      const r = u.toSorted();
      expect(r !== u).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_3200
     * @tc.name testUint8ArrayToSorted032
     * @tc.desc Verify toSorted result byteLength is 2 for two-element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(2, 1);
      const r = u.toSorted();
      expect(r.byteLength).assertEqual(2);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_3300
     * @tc.name testUint8ArrayToSorted033
     * @tc.desc Verify toSorted result type is Uint8Array for two-element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(2, 1);
      const r = u.toSorted();
      expect(Class.of(r)).assertEqual(Class.of(u));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_3400
     * @tc.name testUint8ArrayToSorted034
     * @tc.desc Verify toSorted result[0] is 1 for three-element [3, 1, 2]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(3, 1, 2);
      const r = u.toSorted();
      expect(r[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_3500
     * @tc.name testUint8ArrayToSorted035
     * @tc.desc Verify toSorted result[1] is 2 for three-element [3, 1, 2]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(3, 1, 2);
      const r = u.toSorted();
      expect(r[1]).assertEqual(2);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_3600
     * @tc.name testUint8ArrayToSorted036
     * @tc.desc Verify toSorted result[2] is 3 for three-element [3, 1, 2]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(3, 1, 2);
      const r = u.toSorted();
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_3700
     * @tc.name testUint8ArrayToSorted037
     * @tc.desc Verify toSorted result[0] is 1 for three-element [1, 2, 3] already sorted
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(1, 2, 3);
      const r = u.toSorted();
      expect(r[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_3800
     * @tc.name testUint8ArrayToSorted038
     * @tc.desc Verify toSorted result[2] is 3 for three-element [1, 2, 3] already sorted
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(1, 2, 3);
      const r = u.toSorted();
      expect(r[2]).assertEqual(3);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_3900
     * @tc.name testUint8ArrayToSorted039
     * @tc.desc Verify toSorted result[0] is 1 for three-element [3, 2, 1] fully reversed
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(3, 2, 1);
      const r = u.toSorted();
      expect(r[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_4000
     * @tc.name testUint8ArrayToSorted040
     * @tc.desc Verify toSorted result[2] is 3 for three-element [3, 2, 1] fully reversed
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(3, 2, 1);
      const r = u.toSorted();
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_4100
     * @tc.name testUint8ArrayToSorted041
     * @tc.desc Verify toSorted result[0] is 1 for three-element [2, 3, 1] mid-max-min
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(2, 3, 1);
      const r = u.toSorted();
      expect(r[0]).assertEqual(1);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_4200
     * @tc.name testUint8ArrayToSorted042
     * @tc.desc Verify toSorted result[2] is 3 for three-element [2, 3, 1] mid-max-min
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(2, 3, 1);
      const r = u.toSorted();
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_4300
     * @tc.name testUint8ArrayToSorted043
     * @tc.desc Verify toSorted result[0] is 1 for three-element [1, 3, 2] min-max-mid
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(1, 3, 2);
      const r = u.toSorted();
      expect(r[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_4400
     * @tc.name testUint8ArrayToSorted044
     * @tc.desc Verify toSorted result[2] is 3 for three-element [1, 3, 2] min-max-mid
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(1, 3, 2);
      const r = u.toSorted();
      expect(r[2]).assertEqual(3);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_4500
     * @tc.name testUint8ArrayToSorted045
     * @tc.desc Verify toSorted result[0] is 1 for three-element [2, 1, 3] mid-min-max
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(2, 1, 3);
      const r = u.toSorted();
      expect(r[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_4600
     * @tc.name testUint8ArrayToSorted046
     * @tc.desc Verify toSorted result[2] is 3 for three-element [2, 1, 3] mid-min-max
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(2, 1, 3);
      const r = u.toSorted();
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_4700
     * @tc.name testUint8ArrayToSorted047
     * @tc.desc Verify toSorted result[0] is 1 for three-element [1, 1, 2] with duplicate min
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(1, 1, 2);
      const r = u.toSorted();
      expect(r[0]).assertEqual(1);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_4800
     * @tc.name testUint8ArrayToSorted048
     * @tc.desc Verify toSorted result[2] is 2 for three-element [1, 1, 2] with duplicate min
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(1, 1, 2);
      const r = u.toSorted();
      expect(r[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_4900
     * @tc.name testUint8ArrayToSorted049
     * @tc.desc Verify toSorted result[0] is 1 for three-element [2, 2, 1] with duplicate max
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(2, 2, 1);
      const r = u.toSorted();
      expect(r[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_5000
     * @tc.name testUint8ArrayToSorted050
     * @tc.desc Verify toSorted result[2] is 2 for three-element [2, 2, 1] with duplicate max
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(2, 2, 1);
      const r = u.toSorted();
      expect(r[2]).assertEqual(2);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_5100
     * @tc.name testUint8ArrayToSorted051
     * @tc.desc Verify toSorted result[0] is 1 for five-element [5, 4, 3, 2, 1]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(5, 4, 3, 2, 1);
      const r = u.toSorted();
      expect(r[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_5200
     * @tc.name testUint8ArrayToSorted052
     * @tc.desc Verify toSorted result[4] is 5 for five-element [5, 4, 3, 2, 1]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(5, 4, 3, 2, 1);
      const r = u.toSorted();
      expect(r[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_5300
     * @tc.name testUint8ArrayToSorted053
     * @tc.desc Verify toSorted result[0] is 1 for five-element [3, 5, 1, 4, 2]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(3, 5, 1, 4, 2);
      const r = u.toSorted();
      expect(r[0]).assertEqual(1);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_5400
     * @tc.name testUint8ArrayToSorted054
     * @tc.desc Verify toSorted result[4] is 5 for five-element [3, 5, 1, 4, 2]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(3, 5, 1, 4, 2);
      const r = u.toSorted();
      expect(r[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_5500
     * @tc.name testUint8ArrayToSorted055
     * @tc.desc Verify toSorted result[0] is 10 for ten-element [100, 90, ..., 10]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(100, 90, 80, 70, 60, 50, 40, 30, 20, 10);
      const r = u.toSorted();
      expect(r[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_5600
     * @tc.name testUint8ArrayToSorted056
     * @tc.desc Verify toSorted result[9] is 100 for ten-element [100, 90, ..., 10]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(100, 90, 80, 70, 60, 50, 40, 30, 20, 10);
      const r = u.toSorted();
      expect(r[9]).assertEqual(100);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_5700
     * @tc.name testUint8ArrayToSorted057
     * @tc.desc Verify toSorted result[0] is 0 for ten-element [255, 0, ..., 200]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(255, 0, 240, 15, 200, 55, 100, 180, 30, 128);
      const r = u.toSorted();
      expect(r[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_5800
     * @tc.name testUint8ArrayToSorted058
     * @tc.desc Verify toSorted result[9] is 255 for ten-element [255, 0, ..., 200]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(255, 0, 240, 15, 200, 55, 100, 180, 30, 128);
      const r = u.toSorted();
      expect(r[9]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_5900
     * @tc.name testUint8ArrayToSorted059
     * @tc.desc Verify toSorted result[0] is 1 for five-element [1, 2, 3, 4, 5] already sorted
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(1, 2, 3, 4, 5);
      const r = u.toSorted();
      expect(r[0]).assertEqual(1);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_6000
     * @tc.name testUint8ArrayToSorted060
     * @tc.desc Verify toSorted returns new Uint8Array instance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(3, 1, 2);
      const r = u.toSorted();
      expect(Class.of(r)).assertEqual(Class.of(u));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_6100
     * @tc.name testUint8ArrayToSorted061
     * @tc.desc Verify toSorted result length equals original length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(3, 1, 2);
      const r = u.toSorted();
      expect(r.length).assertEqual(u.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_6200
     * @tc.name testUint8ArrayToSorted062
     * @tc.desc Verify toSorted result byteLength equals original byteLength
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(3, 1, 2);
      const r = u.toSorted();
      expect(r.byteLength).assertEqual(u.byteLength);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_6300
     * @tc.name testUint8ArrayToSorted063
     * @tc.desc Verify toSorted result byteOffset is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(3, 1, 2);
      const r = u.toSorted();
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_6400
     * @tc.name testUint8ArrayToSorted064
     * @tc.desc Verify toSorted result is not the same reference as original
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(3, 1, 2);
      const r = u.toSorted();
      expect(r !== u).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_6500
     * @tc.name testUint8ArrayToSorted065
     * @tc.desc Verify toSorted result[0] is 1 for [3, 1, 2]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(3, 1, 2);
      const r = u.toSorted();
      expect(r[0]).assertEqual(1);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_6600
     * @tc.name testUint8ArrayToSorted066
     * @tc.desc Verify toSorted result[1] is 2 for [3, 1, 2]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(3, 1, 2);
      const r = u.toSorted();
      expect(r[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_6700
     * @tc.name testUint8ArrayToSorted067
     * @tc.desc Verify toSorted result[2] is 3 for [3, 1, 2]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(3, 1, 2);
      const r = u.toSorted();
      expect(r[2]).assertEqual(3);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_6800
     * @tc.name testUint8ArrayToSorted068
     * @tc.desc Verify original array is unchanged after toSorted
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(3, 1, 2);
      const r = u.toSorted();
      expect(u[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_6900
     * @tc.name testUint8ArrayToSorted069
     * @tc.desc Verify original array element[1] unchanged after toSorted
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(3, 1, 2);
      const r = u.toSorted();
      expect(u[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_7000
     * @tc.name testUint8ArrayToSorted070
     * @tc.desc Verify original array element[2] unchanged after toSorted
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(3, 1, 2);
      const r = u.toSorted();
      expect(u[2]).assertEqual(2);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_7100
     * @tc.name testUint8ArrayToSorted071
     * @tc.desc Verify original array length unchanged after toSorted
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(3, 1, 2);
      const r = u.toSorted();
      expect(u.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_7200
     * @tc.name testUint8ArrayToSorted072
     * @tc.desc Verify original array unchanged for [5, 1, 3] after toSorted
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(5, 1, 3);
      const r = u.toSorted();
      expect(u[0]).assertEqual(5);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_7300
     * @tc.name testUint8ArrayToSorted073
     * @tc.desc Verify original array unchanged for [9, 2, 5, 1, 8] after toSorted
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(9, 2, 5, 1, 8);
      const r = u.toSorted();
      expect(u[0]).assertEqual(9);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_7400
     * @tc.name testUint8ArrayToSorted074
     * @tc.desc Verify toSorted works with Uint8Array.from
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<number> = [3, 1, 2];
      const u = new Uint8Array(arr);
      const r = u.toSorted();
      expect(r[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_7500
     * @tc.name testUint8ArrayToSorted075
     * @tc.desc Verify toSorted works with new Uint8Array(length)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = new Uint8Array(3);
      u[0] = 3;
      u[1] = 1;
      u[2] = 2;
      const r = u.toSorted();
      expect(r[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_7600
     * @tc.name testUint8ArrayToSorted076
     * @tc.desc Verify toSorted works with new Uint8Array(array)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<number> = [3, 1, 2];
      const u = new Uint8Array(arr);
      const r = u.toSorted();
      expect(r[0]).assertEqual(1);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_7700
     * @tc.name testUint8ArrayToSorted077
     * @tc.desc Verify toSorted works with new Uint8Array(buffer)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      const u = new Uint8Array(buf);
      u[0] = 3;
      u[1] = 1;
      u[2] = 2;
      const r = u.toSorted();
      expect(r[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_7800
     * @tc.name testUint8ArrayToSorted078
     * @tc.desc Verify toSorted works with new Uint8Array(buffer, offset)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const u = new Uint8Array(buf, 3, 3);
      u[0] = 3;
      u[1] = 1;
      u[2] = 2;
      const r = u.toSorted();
      expect(r[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_7900
     * @tc.name testUint8ArrayToSorted079
     * @tc.desc Verify toSorted works with new Uint8Array(typedArray)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint8Array.of(3, 1, 2);
      const u = new Uint8Array(src);
      const r = u.toSorted();
      expect(r[0]).assertEqual(1);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_8000
     * @tc.name testUint8ArrayToSorted080
     * @tc.desc Verify toSorted works with binary literal values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(0b0011, 0b0001, 0b0101);
      const r = u.toSorted();
      expect(r[0]).assertEqual(1);
      expect(r[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_8100
     * @tc.name testUint8ArrayToSorted081
     * @tc.desc Verify toSorted works with octal literal values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(0o10, 0o03, 0o07);
      const r = u.toSorted();
      expect(r[0]).assertEqual(3);
      expect(r[2]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_8200
     * @tc.name testUint8ArrayToSorted082
     * @tc.desc Verify toSorted works with scientific notation values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<number> = [3e0, 1e0, 2e0];
      const u = new Uint8Array(arr);
      const r = u.toSorted();
      expect(r[0]).assertEqual(1);
      expect(r[2]).assertEqual(3);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_8300
     * @tc.name testUint8ArrayToSorted083
     * @tc.desc Verify toSorted handles large value 256 truncated to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<int> = [256, 128, 64];
      const u = new Uint8Array(arr);
      const r = u.toSorted();
      expect(r[0]).assertEqual(0);
      expect(r[2]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_8400
     * @tc.name testUint8ArrayToSorted084
     * @tc.desc Verify toSorted result[0] is 0 for [0, 0, 0] all zeros
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(0, 0, 0);
      const r = u.toSorted();
      expect(r[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_8500
     * @tc.name testUint8ArrayToSorted085
     * @tc.desc Verify toSorted result[2] is 0 for [0, 0, 0] all zeros
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(0, 0, 0);
      const r = u.toSorted();
      expect(r[2]).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_8600
     * @tc.name testUint8ArrayToSorted086
     * @tc.desc Verify toSorted result[0] is 255 for [255, 255, 255] all max
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(255, 255, 255);
      const r = u.toSorted();
      expect(r[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_8700
     * @tc.name testUint8ArrayToSorted087
     * @tc.desc Verify toSorted result[2] is 255 for [255, 255, 255] all max
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(255, 255, 255);
      const r = u.toSorted();
      expect(r[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_8800
     * @tc.name testUint8ArrayToSorted088
     * @tc.desc Verify toSorted result[0] is 0 for [0, 128, 255] full range
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(0, 128, 255);
      const r = u.toSorted();
      expect(r[0]).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_8900
     * @tc.name testUint8ArrayToSorted089
     * @tc.desc Verify toSorted result[2] is 255 for [0, 128, 255] full range
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(0, 128, 255);
      const r = u.toSorted();
      expect(r[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_9000
     * @tc.name testUint8ArrayToSorted090
     * @tc.desc Verify toSorted result[0] is 0 for [255, 128, 0] reversed full range
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(255, 128, 0);
      const r = u.toSorted();
      expect(r[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_9100
     * @tc.name testUint8ArrayToSorted091
     * @tc.desc Verify toSorted result[2] is 255 for [255, 128, 0] reversed full range
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(255, 128, 0);
      const r = u.toSorted();
      expect(r[2]).assertEqual(255);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_9200
     * @tc.name testUint8ArrayToSorted092
     * @tc.desc Verify toSorted result[0] is 1 for [1, 2, 3, 4, 5] already sorted
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(1, 2, 3, 4, 5);
      const r = u.toSorted();
      expect(r[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_9300
     * @tc.name testUint8ArrayToSorted093
     * @tc.desc Verify toSorted result[4] is 5 for [1, 2, 3, 4, 5] already sorted
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(1, 2, 3, 4, 5);
      const r = u.toSorted();
      expect(r[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_9400
     * @tc.name testUint8ArrayToSorted094
     * @tc.desc Verify toSorted result[0] is 1 for [5, 4, 3, 2, 1] fully reversed
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(5, 4, 3, 2, 1);
      const r = u.toSorted();
      expect(r[0]).assertEqual(1);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_9500
     * @tc.name testUint8ArrayToSorted095
     * @tc.desc Verify toSorted twice is idempotent
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(3, 1, 2);
      const r1 = u.toSorted();
      const r2 = r1.toSorted();
      expect(r2[0]).assertEqual(r1[0]);
      expect(r2[1]).assertEqual(r1[1]);
      expect(r2[2]).assertEqual(r1[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_9600
     * @tc.name testUint8ArrayToSorted096
     * @tc.desc Verify toSorted then join outputs ascending string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(5, 1, 3);
      const r = u.toSorted();
      const result: string = r.join(',');
      expect(result).assertEqual('1,3,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_9700
     * @tc.name testUint8ArrayToSorted097
     * @tc.desc Verify toSorted then chain map preserves sorting
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(4, 1, 3);
      const r = u.toSorted();
      const m = r.map((v: number): number => v);
      expect(m[0]).assertEqual(1);
      expect(m[2]).assertEqual(4);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_9800
     * @tc.name testUint8ArrayToSorted098
     * @tc.desc Verify toSorted then toReversed gives descending order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(3, 1, 2);
      const r = u.toSorted();
      const rev = r.toReversed();
      expect(rev[0]).assertEqual(3);
      expect(rev[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_SORTED_9900
     * @tc.name testUint8ArrayToSorted099
     * @tc.desc Verify toSorted then subarray preserves sorting
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToSorted099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = Uint8Array.of(9, 2, 5, 1, 8);
      const r = u.toSorted();
      const sub = r.subarray(1, 4);
      expect(sub[0]).assertEqual(2);
      expect(sub[2]).assertEqual(8);
    });

  });
}