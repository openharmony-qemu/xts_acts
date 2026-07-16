'use static'

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

export default function Uint8ArrayFrom02Test(): void {
  describe('Uint8ArrayFrom02Test', (): void => {
    beforeAll((): void => {})

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30)
    });

    afterEach((): void => {})

    afterAll((): void => {})

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_0100
     * @tc.name testUint8ArrayFrom001
     * @tc.desc Verify from(Set<int>) with 1 parameter normal call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(1);
      const result: Uint8Array = Uint8Array.from(s);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_0200
     * @tc.name testUint8ArrayFrom002
     * @tc.desc Verify from(Array<number>) with 1 parameter normal call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1.0];
      const result: Uint8Array = Uint8Array.from(arr);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_0300
     * @tc.name testUint8ArrayFrom003
     * @tc.desc Verify from<U>(ArrayLike, mapfn) with 2 parameters normal call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Uint8Array = Uint8Array.from([1.0], (v: number, k: number): number => v);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_0400
     * @tc.name testUint8ArrayFrom004
     * @tc.desc Verify Set<int> empty set constructs empty Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      const result: Uint8Array = Uint8Array.from(s);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_0500
     * @tc.name testUint8ArrayFrom005
     * @tc.desc Verify Set<int> single element 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(0);
      const result: Uint8Array = Uint8Array.from(s);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_0600
     * @tc.name testUint8ArrayFrom006
     * @tc.desc Verify Set<int> single element 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(255);
      const result: Uint8Array = Uint8Array.from(s);
      expect(result[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_0700
     * @tc.name testUint8ArrayFrom007
     * @tc.desc Verify Set<int> single element 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(127);
      const result: Uint8Array = Uint8Array.from(s);
      expect(result[0]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_0800
     * @tc.name testUint8ArrayFrom008
     * @tc.desc Verify Set<int> single element 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(128);
      const result: Uint8Array = Uint8Array.from(s);
      expect(result[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_0900
     * @tc.name testUint8ArrayFrom009
     * @tc.desc Verify Set<int> element -1 wraps to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(-1);
      const result: Uint8Array = Uint8Array.from(s);
      expect(result[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_1000
     * @tc.name testUint8ArrayFrom010
     * @tc.desc Verify Set<int> element -128 wraps to 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(-128);
      const result: Uint8Array = Uint8Array.from(s);
      expect(result[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_1100
     * @tc.name testUint8ArrayFrom011
     * @tc.desc Verify Set<int> element 256 wraps to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(256);
      const result: Uint8Array = Uint8Array.from(s);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_1200
     * @tc.name testUint8ArrayFrom012
     * @tc.desc Verify Set<int> multiple elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(1);
      s.add(2);
      s.add(3);
      const result: Uint8Array = Uint8Array.from(s);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_1300
     * @tc.name testUint8ArrayFrom013
     * @tc.desc Verify Array<number> empty array constructs empty Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [];
      const result: Uint8Array = Uint8Array.from(arr);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_1400
     * @tc.name testUint8ArrayFrom014
     * @tc.desc Verify Array<number> single element 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [0.0];
      const result: Uint8Array = Uint8Array.from(arr);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_1500
     * @tc.name testUint8ArrayFrom015
     * @tc.desc Verify Array<number> single element 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [255.0];
      const result: Uint8Array = Uint8Array.from(arr);
      expect(result[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_1600
     * @tc.name testUint8ArrayFrom016
     * @tc.desc Verify Array<number> single element 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [127.0];
      const result: Uint8Array = Uint8Array.from(arr);
      expect(result[0]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_1700
     * @tc.name testUint8ArrayFrom017
     * @tc.desc Verify Array<number> single element 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [128.0];
      const result: Uint8Array = Uint8Array.from(arr);
      expect(result[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_1800
     * @tc.name testUint8ArrayFrom018
     * @tc.desc Verify Array<number> element -1 wraps to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [-1.0];
      const result: Uint8Array = Uint8Array.from(arr);
      expect(result[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_1900
     * @tc.name testUint8ArrayFrom019
     * @tc.desc Verify Array<number> element -128 wraps to 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [-128.0];
      const result: Uint8Array = Uint8Array.from(arr);
      expect(result[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_2000
     * @tc.name testUint8ArrayFrom020
     * @tc.desc Verify Array<number> element 256 wraps to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [256.0];
      const result: Uint8Array = Uint8Array.from(arr);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_2100
     * @tc.name testUint8ArrayFrom021
     * @tc.desc Verify Array<number> multiple elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1.0, 2.0, 3.0];
      const result: Uint8Array = Uint8Array.from(arr);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_2200
     * @tc.name testUint8ArrayFrom022
     * @tc.desc Verify from(ArrayLike, mapfn) with empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Uint8Array = Uint8Array.from([], (v: number, k: number): number => v);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_2300
     * @tc.name testUint8ArrayFrom023
     * @tc.desc Verify from(ArrayLike, mapfn) with single element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Uint8Array = Uint8Array.from([1.0], (v: number, k: number): number => v);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_2400
     * @tc.name testUint8ArrayFrom024
     * @tc.desc Verify from(ArrayLike, mapfn) with multiple elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Uint8Array = Uint8Array.from([1.0, 2.0, 3.0], (v: number, k: number): number => v);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_2500
     * @tc.name testUint8ArrayFrom025
     * @tc.desc Verify from(ArrayLike, mapfn) with mapfn transformation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Uint8Array = Uint8Array.from([1.0, 2.0, 3.0], (v: number, k: number): number => v * 2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_2600
     * @tc.name testUint8ArrayFrom026
     * @tc.desc Verify from(ArrayLike, mapfn) with index parameter
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Uint8Array = Uint8Array.from([1.0, 2.0, 3.0], (v: number, k: number): number => k);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_2700
     * @tc.name testUint8ArrayFrom027
     * @tc.desc Verify from(ArrayLike, mapfn) with wrap-around values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Uint8Array = Uint8Array.from([256.0, -1.0], (v: number, k: number): number => v);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_2800
     * @tc.name testUint8ArrayFrom028
     * @tc.desc Verify from(Set) result instanceof
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(1);
      const result: Uint8Array = Uint8Array.from(s);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_2900
     * @tc.name testUint8ArrayFrom029
     * @tc.desc Verify from(Set) result BYTES_PER_ELEMENT
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(255);
      const result: Uint8Array = Uint8Array.from(s);
      expect(result.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_3000
     * @tc.name testUint8ArrayFrom030
     * @tc.desc Verify from(Set) result byteOffset
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(1);
      const result: Uint8Array = Uint8Array.from(s);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_3100
     * @tc.name testUint8ArrayFrom031
     * @tc.desc Verify from(Set) result buffer type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(1);
      const result: Uint8Array = Uint8Array.from(s);
      const buffer: ArrayBuffer = result.buffer;
      expect(buffer.byteLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_3200
     * @tc.name testUint8ArrayFrom032
     * @tc.desc Verify from(Array) result instanceof
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1.0];
      const result: Uint8Array = Uint8Array.from(arr);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_3300
     * @tc.name testUint8ArrayFrom033
     * @tc.desc Verify from(Array) result BYTES_PER_ELEMENT
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [255.0];
      const result: Uint8Array = Uint8Array.from(arr);
      expect(result.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_3400
     * @tc.name testUint8ArrayFrom034
     * @tc.desc Verify from(mapfn) result instanceof
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Uint8Array = Uint8Array.from([1.0], (v: number, k: number): number => v);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_3500
     * @tc.name testUint8ArrayFrom035
     * @tc.desc Verify from(mapfn) result byteOffset
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Uint8Array = Uint8Array.from([1.0], (v: number, k: number): number => v);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM02_3600
     * @tc.name testUint8ArrayFrom036
     * @tc.desc Verify from mapfn error propagation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result: Uint8Array = Uint8Array.from([1.0, 2.0], (v: number, k: number): number => {
          throw new Error('mapper-fail')
        });
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
      }
    });
  });
}
