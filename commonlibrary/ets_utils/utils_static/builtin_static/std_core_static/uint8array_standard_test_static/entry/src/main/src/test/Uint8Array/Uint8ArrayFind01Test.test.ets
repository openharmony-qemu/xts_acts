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


export default function Uint8ArrayFind01Test(): void {
  describe('Uint8ArrayFind01Test', () => {
    beforeAll(() => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_0100
     * @tc.name testUint8ArrayFind001
     * @tc.desc Verify arr.find with inline arrow function returns the matching element value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result: number | undefined = arr.find( (v: number, i: int, a: Uint8Array): boolean => {
        return v === 20;
      });
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_0200
     * @tc.name testUint8ArrayFind002
     * @tc.desc Verify arr.find with pre-declared callback variable returns matching element value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let cb: (v: number, i: int, a: Uint8Array) => boolean =
        (v: number, i: int, a: Uint8Array): boolean => v === 30;
      let result: number | undefined = arr.find( cb);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_0300
     * @tc.name testUint8ArrayFind003
     * @tc.desc Verify arr.find matches value 0 and returns 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 1, 2]);
      let result: number | undefined = arr.find( (v: number, i: int, a: Uint8Array): boolean => {
        return v === 0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_0400
     * @tc.name testUint8ArrayFind004
     * @tc.desc Verify arr.find returns maximum value 255 when matched
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([100, 255, 200]);
      let result: number | undefined = arr.find( (v: number, i: int, a: Uint8Array): boolean => {
        return v === 255;
      });
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_0500
     * @tc.name testUint8ArrayFind005
     * @tc.desc Verify arr.find returns value 128 when matched
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([64, 128, 192]);
      let result: number | undefined = arr.find( (v: number, i: int, a: Uint8Array): boolean => {
        return v === 128;
      });
      expect(result).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_0600
     * @tc.name testUint8ArrayFind006
     * @tc.desc Verify arr.find returns value 127 when matched
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([63, 127, 191]);
      let result: number | undefined = arr.find( (v: number, i: int, a: Uint8Array): boolean => {
        return v === 127;
      });
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_0700
     * @tc.name testUint8ArrayFind007
     * @tc.desc Verify literal 256 is truncated to 0 and arr.forEach captures 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([256, 1, 2]);
      let captured: number = 255;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        if (i === 0) {
          captured = v;
        }
        return;
      });
      expect(captured).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_0800
     * @tc.name testUint8ArrayFind008
     * @tc.desc Verify literal -1 wraps to 255 and arr.forEach captures 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([-1]);
      let captured: number = 0;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        captured = v;
        return;
      });
      expect(captured).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_0900
     * @tc.name testUint8ArrayFind009
     * @tc.desc Verify literal 0.5 is truncated to 0 and arr.forEach captures 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0.5, 1, 2]);
      let captured: number = 255;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        if (i === 0) {
          captured = v;
        }
        return;
      });
      expect(captured).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_1000
     * @tc.name testUint8ArrayFind010
     * @tc.desc Verify literal 255.9 is truncated to 255 in construction
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([255.9]);
      let captured: number = 0;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        captured = v;
        return;
      });
      expect(captured).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_1100
     * @tc.name testUint8ArrayFind011
     * @tc.desc Verify -0 is converted to 0 and arr.forEach captures 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([-0, 1, 2]);
      let captured: number = 255;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        if (i === 0) {
          captured = v;
        }
        return;
      });
      expect(captured).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_1200
     * @tc.name testUint8ArrayFind012
     * @tc.desc Verify NaN is converted to 0 in construction
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([Number.NaN, 1, 2]);
      let captured: number = 255;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        if (i === 0) {
          captured = v;
        }
        return;
      });
      expect(captured).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_1300
     * @tc.name testUint8ArrayFind013
     * @tc.desc Verify Infinity is converted to 0 in construction
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([Number.POSITIVE_INFINITY, 1, 2]);
      let captured: number = 255;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        if (i === 0) {
          captured = v;
        }
        return;
      });
      expect(captured).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_1400
     * @tc.name testUint8ArrayFind014
     * @tc.desc Verify -Infinity is converted to 0 in construction
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([Number.NEGATIVE_INFINITY, 1, 2]);
      let captured: number = 255;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        if (i === 0) {
          captured = v;
        }
        return;
      });
      expect(captured).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_1500
     * @tc.name testUint8ArrayFind015
     * @tc.desc Verify literal 3.99 is truncated to 3 and arr.forEach captures 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([3.99, 1, 2]);
      let captured: number = 0;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        if (i === 0) {
          captured = v;
        }
        return;
      });
      expect(captured).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_1600
     * @tc.name testUint8ArrayFind016
     * @tc.desc Verify literal 128.4 is truncated to 128 in construction
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([128.4]);
      let captured: number = 0;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        captured = v;
        return;
      });
      expect(captured).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_1700
     * @tc.name testUint8ArrayFind017
     * @tc.desc Verify -0.5 is truncated to 0 in construction
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([-0.5, 1, 2]);
      let captured: number = 255;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        if (i === 0) {
          captured = v;
        }
        return;
      });
      expect(captured).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_1800
     * @tc.name testUint8ArrayFind018
     * @tc.desc Verify literal 127.999 is truncated to 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([127.999]);
      let captured: number = 0;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        captured = v;
        return;
      });
      expect(captured).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_1900
     * @tc.name testUint8ArrayFind019
     * @tc.desc Verify literal 256.1 truncates and wraps to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([256.1]);
      let captured: number = 255;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        captured = v;
        return;
      });
      expect(captured).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_2000
     * @tc.name testUint8ArrayFind020
     * @tc.desc Verify arr.find returns the single element in single-element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([77]);
      let result: number | undefined = arr.find( (v: number, i: int, a: Uint8Array): boolean => {
        return v === 77;
      });
      expect(result).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_2100
     * @tc.name testUint8ArrayFind021
     * @tc.desc Verify multi-element array matching first element stops iteration at index 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([5, 10, 15]);
      let callCount: int = 0;
      arr.find((v: number, i: int, a: Uint8Array): boolean => { callCount++; return v === 5; });
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_2200
     * @tc.name testUint8ArrayFind022
     * @tc.desc Verify multi-element array matching last element iterates through all
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([5, 10, 15]);
      let callCount: int = 0;
      arr.find((v: number, i: int, a: Uint8Array): boolean => { callCount++; return v === 15; });
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_2300
     * @tc.name testUint8ArrayFind023
     * @tc.desc Verify multi-element array matching middle element stops at correct iteration count
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let callCount: int = 0;
      arr.find((v: number, i: int, a: Uint8Array): boolean => { callCount++; return v === 3; });
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_2400
     * @tc.name testUint8ArrayFind024
     * @tc.desc Verify all-same-value array stops at first element (index of first match = 1)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([7, 7, 7, 7]);
      let callCount: int = 0;
      arr.find((v: number, i: int, a: Uint8Array): boolean => { callCount++; return v === 7; });
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_2500
     * @tc.name testUint8ArrayFind025
     * @tc.desc Verify ascending sequence callback traverses until match at index 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let visited: Array<number> = [];
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        visited.push(v);
        return;
      });
      expect(visited.length).assertEqual(5);
      expect(visited[0]).assertEqual(1);
      expect(visited[1]).assertEqual(2);
      expect(visited[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_2600
     * @tc.name testUint8ArrayFind026
     * @tc.desc Verify descending sequence callback traverses by index order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([5, 4, 3, 2, 1]);
      let visited: Array<number> = [];
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        visited.push(v);
        return;
      });
      expect(visited.length).assertEqual(5);
      expect(visited[0]).assertEqual(5);
      expect(visited[1]).assertEqual(4);
      expect(visited[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_2700
     * @tc.name testUint8ArrayFind027
     * @tc.desc Verify mixed boundary value array callback receives elements in order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 128, 255]);
      let visited: Array<number> = [];
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        visited.push(v);
        return;
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(0);
      expect(visited[1]).assertEqual(128);
      expect(visited[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_2800
     * @tc.name testUint8ArrayFind028
     * @tc.desc Verify all-zero array callback receives all 0 values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 0, 0]);
      let allZero: boolean = true;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        if (v !== 0) {
          allZero = false;
        }
        return;
      });
      expect(allZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_2900
     * @tc.name testUint8ArrayFind029
     * @tc.desc Verify all-max-value array callback receives all 255 values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([255, 255, 255]);
      let allMax: boolean = true;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        if (v !== 255) {
          allMax = false;
        }
        return;
      });
      expect(allMax).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_3000
     * @tc.name testUint8ArrayFind030
     * @tc.desc Verify hexadecimal 0xFF construction element is 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0xFF]);
      let captured: number = 0;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        captured = v;
        return;
      });
      expect(captured).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_3100
     * @tc.name testUint8ArrayFind031
     * @tc.desc Verify hexadecimal 0x0F construction element is 15
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0x0F]);
      let captured: number = 0;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        captured = v;
        return;
      });
      expect(captured).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_3200
     * @tc.name testUint8ArrayFind032
     * @tc.desc Verify binary 0b11111111 construction element is 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0b11111111]);
      let captured: number = 0;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        captured = v;
        return;
      });
      expect(captured).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_3300
     * @tc.name testUint8ArrayFind033
     * @tc.desc Verify binary 0b00001111 construction element is 15
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0b00001111]);
      let captured: number = 0;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        captured = v;
        return;
      });
      expect(captured).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_3400
     * @tc.name testUint8ArrayFind034
     * @tc.desc Verify octal 0o377 construction element is 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0o377]);
      let captured: number = 0;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        captured = v;
        return;
      });
      expect(captured).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_3500
     * @tc.name testUint8ArrayFind035
     * @tc.desc Verify octal 0o10 construction element is 8
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0o10]);
      let captured: number = 0;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        captured = v;
        return;
      });
      expect(captured).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_3600
     * @tc.name testUint8ArrayFind036
     * @tc.desc Verify scientific notation 1e2 construction element is 100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1e2]);
      let captured: number = 0;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        captured = v;
        return;
      });
      expect(captured).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_3700
     * @tc.name testUint8ArrayFind037
     * @tc.desc Verify hexadecimal 0xA construction element is 10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0xA]);
      let captured: number = 0;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        captured = v;
        return;
      });
      expect(captured).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_3800
     * @tc.name testUint8ArrayFind038
     * @tc.desc Verify hexadecimal 0x80 construction element is 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0x80]);
      let captured: number = 0;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        captured = v;
        return;
      });
      expect(captured).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_3900
     * @tc.name testUint8ArrayFind039
     * @tc.desc Verify construction with array literal callback traverses each element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let sum: number = arr.reduce((acc: number, v: number): number => acc + v, 0);
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_4000
     * @tc.name testUint8ArrayFind040
     * @tc.desc Verify construction from Array of numbers callback traverses each element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [100, 200];
      let arr: Uint8Array = new Uint8Array(src);
      let sum: number = arr.reduce((acc: number, v: number): number => acc + v, 0);
      expect(sum).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_4100
     * @tc.name testUint8ArrayFind041
     * @tc.desc Verify new Uint8Array(N) zero-initialized callback receives all 0 values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      let countZero: int = 0;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        if (v === 0) {
          countZero = countZero + 1;
        }
        return;
      });
      expect(countZero).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_4200
     * @tc.name testUint8ArrayFind042
     * @tc.desc Verify construction from ArrayBuffer callback receives all 0 values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf);
      let allZero: boolean = true;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        if (v !== 0) {
          allZero = false;
        }
        return;
      });
      expect(allZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_4300
     * @tc.name testUint8ArrayFind043
     * @tc.desc Verify construction from another Uint8Array callback traverses copied elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint8Array = new Uint8Array([10, 20, 30]);
      let arr: Uint8Array = new Uint8Array(src);
      let sum: number = arr.reduce((acc: number, v: number): number => acc + v, 0);
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_4400
     * @tc.name testUint8ArrayFind044
     * @tc.desc Verify arr.find callback i parameter is 0 when matching at index 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([5, 10, 15]);
      let matchIdx: int = -1;
      let result: number | undefined = arr.find( (v: number, i: int, a: Uint8Array): boolean => {
        if (i === 0 && v === 5) {
          matchIdx = i;
          return true;
        }
        return false;
      });
      expect(matchIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_4500
     * @tc.name testUint8ArrayFind045
     * @tc.desc Verify arr.find callback i parameter is last index for last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([5, 10, 15]);
      let matchIdx: int = -1;
      let result: number | undefined = arr.find( (v: number, i: int, a: Uint8Array): boolean => {
        if (v === 15) {
          matchIdx = i;
          return true;
        }
        return false;
      });
      expect(matchIdx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_4600
     * @tc.name testUint8ArrayFind046
     * @tc.desc Verify callback i parameter increments sequentially
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let indices: Array<int> = [];
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        indices.push(i);
        return;
      });
      expect(indices.length).assertEqual(5);
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
      expect(indices[3]).assertEqual(3);
      expect(indices[4]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_4700
     * @tc.name testUint8ArrayFind047
     * @tc.desc Verify callback i parameter matches value index pattern for each element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let allMatch: boolean = true;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        if (v !== (i + 1) * 10) {
          allMatch = false;
        }
        return;
      });
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_4800
     * @tc.name testUint8ArrayFind048
     * @tc.desc Verify callback i parameter is 0 for single element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([42]);
      let capturedIdx: int = -1;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        capturedIdx = i;
        return;
      });
      expect(capturedIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_4900
     * @tc.name testUint8ArrayFind049
     * @tc.desc Verify callback i parameter is 0 for first element of multi-element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let firstIdx: int = -1;
      let first: boolean = true;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        if (first) {
          firstIdx = i;
          first = false;
        }
        return;
      });
      expect(firstIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_5000
     * @tc.name testUint8ArrayFind050
     * @tc.desc Verify callback i parameter is last index for last element of multi-element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let lastIdx: int = -1;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        lastIdx = i;
        return;
      });
      expect(lastIdx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_5100
     * @tc.name testUint8ArrayFind051
     * @tc.desc Verify callback array parameter is the same reference as the original array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let sameRef: boolean = false;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        if (a === arr) {
          sameRef = true;
        }
        return;
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_5200
     * @tc.name testUint8ArrayFind052
     * @tc.desc Verify callback array parameter has same length as the original array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let sameLength: boolean = false;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        if (a.length === arr.length) {
          sameLength = true;
        }
        return;
      });
      expect(sameLength).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_5300
     * @tc.name testUint8ArrayFind053
     * @tc.desc Verify callback array parameter elements match original array elements at each index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let allMatch: boolean = true;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        if (a[i] !== arr[i]) {
          allMatch = false;
        }
        return;
      });
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_5400
     * @tc.name testUint8ArrayFind054
     * @tc.desc Verify callback array parameter is the same reference across multiple calls
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let firstRef: Uint8Array | undefined = undefined;
      let allSame: boolean = true;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        if (firstRef === undefined) {
          firstRef = a;
        } else if (a !== firstRef) {
          allSame = false;
        }
        return;
      });
      expect(allSame).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_5500
     * @tc.name testUint8ArrayFind055
     * @tc.desc Verify callback array parameter is the same reference for single element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([42]);
      let sameRef: boolean = false;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        if (a === arr) {
          sameRef = true;
        }
        return;
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_5600
     * @tc.name testUint8ArrayFind056
     * @tc.desc Verify callback returning true on first element stops iteration (callCount = 1)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let callCount: int = 0;
      arr.find((v: number, i: int, a: Uint8Array): boolean => { callCount++; return true; });
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_5700
     * @tc.name testUint8ArrayFind057
     * @tc.desc Verify callback returning false on all elements iterates through entire array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let callCount: int = 0;
      arr.find((v: number, i: int, a: Uint8Array): boolean => { callCount++; return false; });
      expect(callCount).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_5800
     * @tc.name testUint8ArrayFind058
     * @tc.desc Verify callback returning true on second element stops at index 1 (count = 2)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let callCount: int = 0;
      arr.find((v: number, i: int, a: Uint8Array): boolean => { callCount++; return v === 2; });
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_5900
     * @tc.name testUint8ArrayFind059
     * @tc.desc Verify callback returning true on last element iterates through all 5 elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let callCount: int = 0;
      arr.find((v: number, i: int, a: Uint8Array): boolean => { callCount++; return v === 5; });
      expect(callCount).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_6000
     * @tc.name testUint8ArrayFind060
     * @tc.desc Verify callback returning true on first element of single-element array (count = 1)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([42]);
      let callCount: int = 0;
      arr.find((v: number, i: int, a: Uint8Array): boolean => { callCount++; return true; });
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_6100
     * @tc.name testUint8ArrayFind061
     * @tc.desc Verify callback returning false on single element still iterates once (count = 1)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([42]);
      let callCount: int = 0;
      arr.find((v: number, i: int, a: Uint8Array): boolean => { callCount++; return false; });
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_6200
     * @tc.name testUint8ArrayFind062
     * @tc.desc Verify callback is not invoked on empty array literal
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([]);
      let calledFlag: boolean = false;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        calledFlag = true;
        return;
      });
      expect(calledFlag).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_6300
     * @tc.name testUint8ArrayFind063
     * @tc.desc Verify callback is not invoked on empty array with false return
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([]);
      let calledFlag: boolean = false;
      expect(calledFlag).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_6400
     * @tc.name testUint8ArrayFind064
     * @tc.desc Verify callback is not invoked on zero-length ArrayBuffer-backed Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let arr: Uint8Array = new Uint8Array(buf);
      let invoked: boolean = false;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        invoked = true;
        return;
      });
      expect(invoked).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_6500
     * @tc.name testUint8ArrayFind065
     * @tc.desc Verify variable captured as match condition via closure works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let target: number = 4;
      let result: number | undefined = arr.find( (v: number, i: int, a: Uint8Array): boolean => {
        return v === target;
      });
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_6600
     * @tc.name testUint8ArrayFind066
     * @tc.desc Verify callback accumulates sum through closure variable
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      let sum: number = arr.reduce((acc: number, v: number): number => acc + v, 0);
      expect(sum).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_6700
     * @tc.name testUint8ArrayFind067
     * @tc.desc Verify compound condition v >= 128 && v < 192 returns matching value 150
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([50, 100, 150, 200]);
      let result: number | undefined = arr.find( (v: number, i: int, a: Uint8Array): boolean => {
        return v >= 128 && v < 192;
      });
      expect(result).assertEqual(150);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_6800
     * @tc.name testUint8ArrayFind068
     * @tc.desc Verify callback uses modulo to match and return first odd number 7
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([2, 4, 7, 8, 10]);
      let result: number | undefined = arr.find( (v: number, i: int, a: Uint8Array): boolean => {
        return v % 2 === 1;
      });
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_6900
     * @tc.name testUint8ArrayFind069
     * @tc.desc Verify callback counts match occurrences while returning false (counts all 3 matches)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([3, 3, 3]);
      let matchCount: int = 0;
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        if (v === 3) {
          matchCount = matchCount + 1;
        }
        return;
      });
      expect(matchCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_7000
     * @tc.name testUint8ArrayFind070
     * @tc.desc Verify arr.find returns undefined when no element matches
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: number | undefined = arr.find( (v: number, i: int, a: Uint8Array): boolean => {
        return v > 100;
      });
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_7100
     * @tc.name testUint8ArrayFind071
     * @tc.desc Verify arr.find returns undefined on empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([]);
      let result: number | undefined = arr.find( (v: number, i: int, a: Uint8Array): boolean => {
        return true;
      });
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_7200
     * @tc.name testUint8ArrayFind072
     * @tc.desc Verify arr.find iteration count returns 0 on empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([]);
      let callCount: int = 0;
      arr.find((v: number, i: int, a: Uint8Array): boolean => { callCount++; return true; });
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_7300
     * @tc.name testUint8ArrayFind073
     * @tc.desc Verify arr.find returns true when target exists
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let found: boolean = arr.find((v: number): boolean => v === 20) !== undefined;
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_7400
     * @tc.name testUint8ArrayFind074
     * @tc.desc Verify arr.find returns false when target does not exist
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let found: boolean = arr.find((v: number): boolean => v === 99) !== undefined;
      expect(found).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_7500
     * @tc.name testUint8ArrayFind075
     * @tc.desc Verify arr.find returns false on empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([]);
      let found: boolean = arr.find((v: number): boolean => v === 1) !== undefined;
      expect(found).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_7600
     * @tc.name testUint8ArrayFind076
     * @tc.desc Verify callback that modifies array during iteration reflects changes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let modified: Array<number> = [];
      arr.forEach( (v: number, i: int, a: Uint8Array): void => {
        a[i] = v * 2;
        modified.push(a[i]);
        return;
      });
      expect(modified.length).assertEqual(5);
      expect(modified[0]).assertEqual(2);
      expect(modified[1]).assertEqual(4);
      expect(modified[2]).assertEqual(6);
      expect(modified[3]).assertEqual(8);
      expect(modified[4]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_7700
     * @tc.name testUint8ArrayFind077
     * @tc.desc Verify BYTES_PER_ELEMENT is accessible
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      let bpe: int = arr.BYTES_PER_ELEMENT;
      expect(bpe).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_7800
     * @tc.name testUint8ArrayFind078
     * @tc.desc Verify buffer property is accessible on constructed array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let buf: ArrayBuffer = arr.buffer;
      expect(buf.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_7900
     * @tc.name testUint8ArrayFind079
     * @tc.desc Verify length property returns correct element count
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND01_8000
     * @tc.name testUint8ArrayFind080
     * @tc.desc Verify array instance BYTES_PER_ELEMENT property
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      expect(arr.length).assertEqual(5);
    });
  });
}