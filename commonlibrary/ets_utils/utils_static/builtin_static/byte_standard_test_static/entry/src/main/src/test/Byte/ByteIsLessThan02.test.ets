/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function ByteIsLessThanTest06_02test(): void {
  describe("ByteIsLessThanTest06_02", () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    it('testByteIsLessThan0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 75 as byte;
        let bMin: byte = 20 as byte;
        let bMax: byte = 100 as byte;
        expect(b.isLessThan(bMax)).assertTrue();
        expect(b.isGreaterThan(bMin)).assertTrue();
      });

    it('testByteIsLessThan0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 20 as byte;
        let bMin: byte = 20 as byte;
        let bMax: byte = 100 as byte;
        expect(b.isLessThan(bMax)).assertTrue();
        expect(b.isGreaterThan(bMin)).assertFalse();
      });

    it('testByteIsLessThan0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 100 as byte;
        let bMin: byte = 20 as byte;
        let bMax: byte = 100 as byte;
        expect(b.isLessThan(bMax)).assertFalse();
        expect(b.isGreaterThan(bMin)).assertTrue();
      });

    it('testByteIsLessThan0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = -50 as byte;
        let bMin: byte = -100 as byte;
        let bMax: byte = 0 as byte;
        expect(b.isLessThan(bMax)).assertTrue();
        expect(b.isGreaterThan(bMin)).assertTrue();
      });

    it('testByteIsLessThan0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 90 as byte;
        let bUpper: byte = 100 as byte;
        let bLower: byte = 50 as byte;
        expect(b.isLessThan(bUpper)).assertTrue();
        expect(b.isGreaterThan(bLower)).assertTrue();
      });

    it('testByteIsLessThan0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 100 as byte;
        let bUpper: byte = 100 as byte;
        let bLower: byte = 50 as byte;
        expect(b.isLessThan(bUpper)).assertFalse();
        expect(b.isGreaterThan(bLower)).assertTrue();
      });

    it('testByteIsLessThan0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 50 as byte;
        let bUpper: byte = 100 as byte;
        let bLower: byte = 50 as byte;
        expect(b.isLessThan(bUpper)).assertTrue();
        expect(b.isGreaterThan(bLower)).assertFalse();
      });

    it('testByteIsLessThan0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = -10 as byte;
        let bUpper: byte = 0 as byte;
        let bLower: byte = -50 as byte;
        expect(b.isLessThan(bUpper)).assertTrue();
        expect(b.isGreaterThan(bLower)).assertTrue();
      });

    it('testByteIsLessThan0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bytes: byte[] = [
          50 as byte,
          20 as byte,
          80 as byte,
          10 as byte
        ];
        bytes.sort((a, b) => {
          if (a.isLessThan(b)) {
            return -1;
          }
          if (a.isGreaterThan(b)) {
            return 1;
          }
          return 0;
        });
        expect(bytes[0]).assertEqual(10);
        expect(bytes[3]).assertEqual(80);
      });

    it('testByteIsLessThan0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bytes: byte[] = [
          50 as byte,
          20 as byte,
          80 as byte,
          10 as byte
        ];
        bytes.sort((a, b) => {
          if (a.isLessThan(b)) {
            return 1;
          }
          if (a.isGreaterThan(b)) {
            return -1;
          }
          return 0;
        });
        expect(bytes[0]).assertEqual(80);
        expect(bytes[3]).assertEqual(10);
      });

    it('testByteIsLessThan0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bytes: byte[] = [
          50 as byte,
          20 as byte,
          50 as byte,
          10 as byte
        ];
        bytes.sort((a, b) => {
          if (a.isLessThan(b)) {
            return -1;
          }
          if (a.isGreaterThan(b)) {
            return 1;
          }
          return 0;
        });
        expect(bytes[0]).assertEqual(10);
        expect(bytes[2]).assertEqual(50);
      });

    it('testByteIsLessThan0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bytes: byte[] = [
          10 as byte,
          20 as byte,
          30 as byte,
          40 as byte
        ];

        for (let i = 0; i < bytes.length - 1; i++) {
          expect(bytes[i].isLessThan(bytes[i + 1]) || bytes[i].equals(bytes[i + 1])).assertTrue();
        }
      });

    it('testByteIsLessThan0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bytes: byte[] = [
          40 as byte,
          30 as byte,
          20 as byte,
          10 as byte
        ];
        for (let i = 0; i < bytes.length - 1; i++) {
          expect(bytes[i].isGreaterThan(bytes[i + 1]) || bytes[i].equals(bytes[i + 1])).assertTrue();
        }
      });

    it('testByteIsLessThan0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bytes: byte[] = [
          10 as byte,
          20 as byte,
          20 as byte,
          30 as byte
        ];
        for (let i = 0; i < bytes.length - 1; i++) {
          expect(bytes[i].isLessThan(bytes[i + 1]) || bytes[i].equals(bytes[i + 1])).assertTrue();
        }
      });

    it('testByteIsLessThan0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let b2: byte = 50 as byte;
        let result1: boolean = b1.isLessThan(b2);
        let result2: boolean = b2.isLessThan(b1);
        expect(result1).assertEqual(b1 < b2);
        expect(result2).assertEqual(b2 < b1);
      });

    it('testByteIsLessThan0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 50 as byte;
        let b2: byte = 30 as byte;
        let result: boolean = b1.isLessThan(b2);
        expect(result).assertFalse();
      });

    it('testByteIsLessThan0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let min: byte = -128 as byte;
        let max: byte = 127 as byte;
        expect(min.isLessThan(max)).assertTrue();
        expect(max.isLessThan(min)).assertFalse();
        expect(min.isLessThan(min)).assertFalse();
        expect(max.isLessThan(max)).assertFalse();
      });

    it('testByteIsLessThan0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 0 as byte;
        let b2: byte = 1 as byte;
        let b3: byte = -1 as byte;
        expect(b1.isLessThan(b2)).assertTrue();
        expect(b3.isLessThan(b1)).assertTrue();
        expect(b2.isLessThan(b3)).assertFalse();
      });

    it('testByteIsLessThan0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bytes: byte[] = [
          -128 as byte,
          -127 as byte,
          0 as byte,
          1 as byte,
          126 as byte
        ];
        for (let i = 0; i < bytes.length - 1; i++) {
          for (let j = 0; j < bytes.length - 1 - i; j++) {
            if (bytes[j].isLessThan(bytes[j + 1])) {
              let temp: byte = bytes[j];
              bytes[j] = bytes[j + 1];
              bytes[j + 1] = temp;
            }
          }
        }
        expect(bytes[0]).assertEqual(126);
        expect(bytes[4]).assertEqual(-128);
      });

    it('testByteIsLessThan0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bMin: byte = -128 as byte;
        let bNext: byte = -127 as byte;
        expect(bMin.isLessThan(bNext)).assertTrue();
        let bPrev: byte = 126 as byte;
        let bMax: byte = 127 as byte;
        expect(bPrev.isLessThan(bMax)).assertTrue();
      });

    it('testByteIsLessThan0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bytes: byte[] = [
          -50 as byte,
          -20 as byte,
          -80 as byte,
          -10 as byte,
          -90 as byte
        ];
        for (let i = 0; i < bytes.length - 1; i++) {
          for (let j = 0; j < bytes.length - 1 - i; j++) {
            if (bytes[j].isLessThan(bytes[j + 1])) {
              let temp: byte = bytes[j];
              bytes[j] = bytes[j + 1];
              bytes[j + 1] = temp;
            }
          }
        }
        expect(bytes[0]).assertEqual(-10);
        expect(bytes[4]).assertEqual(-90);
      });

    it('testByteIsLessThan0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bytes: byte[] = [
          -50 as byte,
          20 as byte,
          0 as byte,
          -10 as byte,
          80 as byte
        ];
        for (let i = 0; i < bytes.length - 1; i++) {
          for (let j = 0; j < bytes.length - 1 - i; j++) {
            if (bytes[j].isLessThan(bytes[j + 1])) {
              let temp: byte = bytes[j];
              bytes[j] = bytes[j + 1];
              bytes[j + 1] = temp;
            }
          }
        }
        expect(bytes[0]).assertEqual(80);
        expect(bytes[4]).assertEqual(-50);
      });

    it('testByteIsLessThan0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bZero: byte = 0 as byte;
        let bNegative1: byte = -1 as byte;
        expect(bNegative1.isLessThan(bZero)).assertTrue();
        expect(bZero.isLessThan(bNegative1)).assertFalse();
      });

    it('testByteIsLessThan0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bZero: byte = 0 as byte;
        let bPositive1: byte = 1 as byte;
        expect(bPositive1.isLessThan(bZero)).assertFalse();
        expect(bZero.isLessThan(bPositive1)).assertTrue();
      });

    it('testByteIsLessThan0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bMax: byte = 127 as byte;
        let bMin: byte = -127 as byte;
        expect(bMin.isLessThan(bMax)).assertTrue();
        expect(bMax.isLessThan(bMin)).assertFalse();
      });

    it('testByteIsLessThan0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bytes: byte[] = [
          -5 as byte,
          3 as byte,
          0 as byte,
          -10 as byte,
          10 as byte
        ];
        for (let i = 0; i < bytes.length - 1; i++) {
          for (let j = 0; j < bytes.length - 1 - i; j++) {
            if (bytes[j].isLessThan(bytes[j + 1])) {
              let temp: byte = bytes[j];
              bytes[j] = bytes[j + 1];
              bytes[j + 1] = temp;
            }
          }
        }
        expect(bytes[0]).assertEqual(10);
        expect(bytes[4]).assertEqual(-10);
      });

    it('testByteIsLessThan0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bytes: byte[] = [
          30 as byte,
          50 as byte,
          30 as byte,
          50 as byte,
          30 as byte
        ];
        for (let i = 0; i < bytes.length - 1; i++) {
          for (let j = 0; j < bytes.length - 1 - i; j++) {
            if (bytes[j].isLessThan(bytes[j + 1])) {
              let temp: byte = bytes[j];
              bytes[j] = bytes[j + 1];
              bytes[j + 1] = temp;
            }
          }
        }
        expect(bytes[0]).assertEqual(50);
        expect(bytes[4]).assertEqual(30);
      });

    it('testByteIsLessThan0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bytes: byte[] = [
          30 as byte,
          30 as byte,
          30 as byte,
          30 as byte,
          30 as byte
        ];
        for (let i = 0; i < bytes.length - 1; i++) {
          for (let j = 0; j < bytes.length - 1 - i; j++) {
            if (bytes[j].isLessThan(bytes[j + 1])) {
              let temp: byte = bytes[j];
              bytes[j] = bytes[j + 1];
              bytes[j + 1] = temp;
            }
          }
        }
        expect(bytes[0]).assertEqual(30);
        expect(bytes[4]).assertEqual(30);
      });

    it('testByteIsLessThan0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bytes: byte[] = [
          -128 as byte,
          64 as byte,
          0 as byte,
          -33 as byte,
          127 as byte
        ];
        for (let i = 0; i < bytes.length - 1; i++) {
          for (let j = 0; j < bytes.length - 1 - i; j++) {
            if (bytes[j].isLessThan(bytes[j + 1])) {
              let temp: byte = bytes[j];
              bytes[j] = bytes[j + 1];
              bytes[j + 1] = temp;
            }
          }
        }
        expect(bytes[0]).assertEqual(127);
        expect(bytes[4]).assertEqual(-128);
      });

    it('testByteIsLessThan0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bytes: byte[] = [
          -128 as byte,
          64 as byte,
          0 as byte,
          -33 as byte,
          127 as byte
        ];
        for (let i = 0; i < bytes.length - 1; i++) {
          for (let j = 0; j < bytes.length - 1 - i; j++) {
            if (!bytes[j].isLessThan(bytes[j + 1])) {
              let temp: byte = bytes[j];
              bytes[j] = bytes[j + 1];
              bytes[j + 1] = temp;
            }
          }
        }
        expect(bytes[0]).assertEqual(-128);
        expect(bytes[4]).assertEqual(127);
      });

    it('testByteIsLessThan0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bytes: byte[] = [
          5 as byte,
          2 as byte,
          5 as byte,
          1 as byte,
          3 as byte
        ];
        for (let i = 0; i < bytes.length - 1; i++) {
          for (let j = 0; j < bytes.length - 1 - i; j++) {
            if (bytes[j].isLessThan(bytes[j + 1])) {
              let temp: byte = bytes[j];
              bytes[j] = bytes[j + 1];
              bytes[j + 1] = temp;
            }
          }
        }
        expect(bytes[0]).assertEqual(5);
        expect(bytes[4]).assertEqual(1);
      });

    it('testByteIsLessThan0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bytes: byte[] = [
          50 as byte,
          20 as byte,
          80 as byte,
          10 as byte,
          30 as byte
        ];
        for (let i = 0; i < bytes.length - 1; i++) {
          for (let j = 0; j < bytes.length - 1 - i; j++) {
            if (bytes[j].isLessThan(bytes[j + 1])) {
              let temp: byte = bytes[j];
              bytes[j] = bytes[j + 1];
              bytes[j + 1] = temp;
            }
          }
        }
        expect(bytes[0]).assertEqual(80);
        expect(bytes[4]).assertEqual(10);
      });

    it('testByteIsLessThan0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bytes: byte[] = [
          30 as byte,
          10 as byte,
          20 as byte,
          10 as byte,
          25 as byte
        ];
        for (let i = 0; i < bytes.length - 1; i++) {
          for (let j = 0; j < bytes.length - 1 - i; j++) {
            if (bytes[j].isLessThan(bytes[j + 1])) {
              let temp: byte = bytes[j];
              bytes[j] = bytes[j + 1];
              bytes[j + 1] = temp;
            }
          }
        }
        expect(bytes[0]).assertEqual(30);
        expect(bytes[4]).assertEqual(10);
      });

    it('testByteIsLessThan0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let b2: byte = 50 as byte;
        expect(b1.isLessThan(b2)).assertEqual(b1.compareTo(b2) < 0);
      });

    it('testByteIsLessThan0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 50 as byte;
        let b2: byte = 30 as byte;
        expect(b1.isLessThan(b2)).assertEqual(b1.compareTo(b2) < 0);
      });

    it('testByteIsLessThan0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let b2: byte = 30 as byte;
        expect(b1.isLessThan(b2)).assertEqual(b1.compareTo(b2) < 0);
      });

    it('testByteIsLessThan0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 50 as byte;
        let b2: byte = 30 as byte;
        expect(b1.isLessThan(b2)).assertFalse();
      });

    it('testByteIsLessThan0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let b2: byte = 30 as byte;
        expect(b1.isLessThan(b2)).assertFalse();
      });

    it('testByteIsLessThan0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let i: byte = -5 as byte;
        let j: byte = -3 as byte;
        let b1: byte = i;
        let b2: byte = j;

        let result1: boolean = b1.isLessThan(b2);
        let result2: boolean = b2.isLessThan(b1);

        expect(result1).assertEqual(b1 < b2);
        expect(result2).assertEqual(b2 < b1);
      });

    it('testByteIsLessThan0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = -128 as byte;
        let b2: byte = 127 as byte;
        let i: number = -128;
        let j: number = 127;

        let result1: boolean = b1.isLessThan(b2);
        let result2: boolean = i < j;

        expect(result1).assertEqual(result2);
      });

    it('testByteIsLessThan0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let b2: byte = 50 as byte;
        expect(b1.isLessThan(b2) && !b1.equals(b2)).assertTrue();
      });

    it('testByteIsLessThan0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let b2: byte = 30 as byte;
        expect(b1.isLessThan(b2) && !b1.equals(b2)).assertFalse();
      });

    it('testByteIsLessThan0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 50 as byte;
        let b2: byte = 30 as byte;
        expect(b1.isLessThan(b2) && !b1.equals(b2)).assertFalse();
      });

    it('testByteIsLessThan0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 50 as byte;
        let bLower: byte = 20 as byte;
        let bUpper: byte = 80 as byte;
        let inRange: boolean = b.isGreaterThan(bLower) && b.isLessThan(bUpper);
        expect(inRange).assertTrue();
      });

    it('testByteIsLessThan0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 20 as byte;
        let bLower: byte = 20 as byte;
        let bUpper: byte = 80 as byte;
        let inRange = b.isGreaterThan(bLower) && b.isLessThan(bUpper);
        expect(inRange).assertFalse();
      });

    it('testByteIsLessThan0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 80 as byte;
        let bLower: byte = 20 as byte;
        let bUpper: byte = 80 as byte;
        const inRange = b.isGreaterThan(bLower) && b.isLessThan(bUpper);
        expect(inRange).assertFalse();
      });

    it('testByteIsLessThan0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 50 as byte;
        let bLower: byte = 20 as byte;
        let bUpper: byte = 80 as byte;
        const inRange = b.isGreaterEqualThan(bLower) && b.isLessEqualThan(bUpper);
        expect(inRange).assertTrue();
      });

    it('testByteIsLessThan0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 20 as byte;
        let bLower: byte = 20 as byte;
        let bUpper: byte = 80 as byte;
        let inRange: boolean = b.isGreaterEqualThan(bLower) && b.isLessEqualThan(bUpper);
        expect(inRange).assertTrue();
      });

    it('testByteIsLessThan0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 80 as byte;
        let bLower: byte = 20 as byte;
        let bUpper: byte = 80 as byte;
        let inRange: boolean = b.isGreaterEqualThan(bLower) && b.isLessEqualThan(bUpper);
        expect(inRange).assertTrue();
      });

    it('testByteIsLessThan0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let testValues: int[] = [-128, 127];

        let bMin: byte = Int.toByte(testValues[0]);
        let bMax: byte = Int.toByte(testValues[1]);

        expect(bMax.isLessThan(bMax)).assertFalse();
        expect(bMin.isLessThan(bMin)).assertFalse();
      });

    it('testByteIsLessThan0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let testValues: int[] = [-128, -127, 126, 127];

        let bMin: byte = Int.toByte(testValues[0]);
        let bNextMin: byte = Int.toByte(testValues[1]);
        let bPrevMax: byte = Int.toByte(testValues[2]);
        let bMax: byte = Int.toByte(testValues[3]);

        expect(bPrevMax.isLessThan(bMax)).assertTrue();
        expect(bMin.isLessThan(bNextMin)).assertTrue();
      });

    it('testByteIsLessThan0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bNeg1: byte = -1 as byte;
        let bPos1: byte = 1 as byte;
        expect(bNeg1.isLessThan(bPos1)).assertTrue();
        expect(bPos1.isLessThan(bNeg1)).assertFalse();
      });

    it('testByteIsLessThan0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bNeg1: byte = -1 as byte;
        let bZero: byte = 0 as byte;
        expect(bNeg1.isLessThan(bZero)).assertTrue();
        expect(bZero.isLessThan(bNeg1)).assertFalse();
      });

    it('testByteIsLessThan0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bPos1: byte = 1 as byte;
        let bZero: byte = 0 as byte;
        expect(bPos1.isLessThan(bZero)).assertFalse();
        expect(bZero.isLessThan(bPos1)).assertTrue();
      });

    it('testByteIsLessThan0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 55 as byte;
        let b2: byte = 55 as byte;
        expect(b1.isLessThan(b2)).assertFalse();
        expect(b1.equals(b2)).assertTrue();
      });

    it('testByteIsLessThan0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let testValues: int[] = [-128];

        let b1: byte = Int.toByte(testValues[0]);
        let b2: byte = Int.toByte(testValues[0]);

        expect(b1.isLessThan(b2)).assertFalse();
        expect(b1.equals(b2)).assertTrue();
      });

    it('testByteIsLessThan0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = -55 as byte;
        let b2: byte = -55 as byte;
        expect(b1.isLessThan(b2)).assertFalse();
        expect(b1.equals(b2)).assertTrue();
      });
  })
}
