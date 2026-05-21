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
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

class ByteCtorTwoHelper {
  static assertClassCast(build: () => void): void {
    try {
      build();
      expect().assertFail();
    } catch (e) {
      expect(e.name).assertEqual('ClassCastError');
    }
  }
}

export default function byteConstructorTwoTest(): void {
  describe('ByteConstructorTwoTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testByteConstructorTwo0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0100
     * @tc.desc Verify b.toByte() equals 64
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(64));
      expect(b.toByte()).assertEqual(64);
    });

    /**
     * @tc.name testByteConstructorTwo0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0200
     * @tc.desc Verify b.toByte() equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte();
      expect(b.toByte()).assertEqual(0);
    });

    /**
     * @tc.name testByteConstructorTwo0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0300
     * @tc.desc Verify b.toByte() equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(0));
      expect(b.toByte()).assertEqual(0);
    });

    /**
     * @tc.name testByteConstructorTwo0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0400
     * @tc.desc Verify b.toByte() equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(1));
      expect(b.toByte()).assertEqual(1);
    });

    /**
     * @tc.name testByteConstructorTwo0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0500
     * @tc.desc Verify b.toByte() equals -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(-1));
      expect(b.toByte()).assertEqual(-1);
    });

    /**
     * @tc.name testByteConstructorTwo0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0600
     * @tc.desc Verify b.toByte() equals -64
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(-64));
      expect(b.toByte()).assertEqual(-64);
    });

    /**
     * @tc.name testByteConstructorTwo0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0700
     * @tc.desc Verify b.toByte() equals 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(127));
      expect(b.toByte()).assertEqual(127);
    });

    /**
     * @tc.name testByteConstructorTwo0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0800
     * @tc.desc Verify b.toByte() equals -128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(-128));
      expect(b.toByte()).assertEqual(-128);
    });

    /**
     * @tc.name testByteConstructorTwo0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0900
     * @tc.desc Verify b.toByte() equals 126
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(126));
      expect(b.toByte()).assertEqual(126);
    });

    /**
     * @tc.name testByteConstructorTwo0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1000
     * @tc.desc Verify b.toByte() equals -127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(-127));
      expect(b.toByte()).assertEqual(-127);
    });

    /**
     * @tc.name testByteConstructorTwo0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1100
     * @tc.desc Verify b.toByte() equals arg
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arg: byte = Int.toByte(128);
      const b = new Byte(arg);
      expect(b.toByte()).assertEqual(arg);
    });

    /**
     * @tc.name testByteConstructorTwo0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1200
     * @tc.desc Verify b.toByte() equals arg
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arg: byte = Int.toByte(-129);
      const b = new Byte(arg);
      expect(b.toByte()).assertEqual(arg);
    });

    /**
     * @tc.name testByteConstructorTwo0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1300
     * @tc.desc Verify b.toByte() equals arg
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arg: byte = Int.toByte(255);
      const b = new Byte(arg);
      expect(b.toByte()).assertEqual(arg);
    });

    /**
     * @tc.name testByteConstructorTwo0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1400
     * @tc.desc Verify new Byte(Utils.castToByte(n as Object)) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const n: number = 256;
        new Byte(Utils.castToByte(n as Object));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testByteConstructorTwo0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1500
     * @tc.desc Verify new Byte(Utils.castToByte(n as Object)) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const n: number = -256;
        new Byte(Utils.castToByte(n as Object));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testByteConstructorTwo0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1600
     * @tc.desc Verify new Byte(Utils.castToByte(n as Object)) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const n: number = Double.NaN;
        new Byte(Utils.castToByte(n as Object));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testByteConstructorTwo0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1700
     * @tc.desc Verify new Byte(Utils.castToByte(n as Object)) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const n: number = Double.POSITIVE_INFINITY;
        new Byte(Utils.castToByte(n as Object));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testByteConstructorTwo0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1800
     * @tc.desc Verify new Byte(Utils.castToByte(n as Object)) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const n: number = Double.NEGATIVE_INFINITY;
        new Byte(Utils.castToByte(n as Object));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testByteConstructorTwo0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1900
     * @tc.desc Verify b.toByte() equals arg
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arg: byte = Double.toByte(0.5);
      const b = new Byte(arg);
      expect(b.toByte()).assertEqual(arg);
    });

    /**
     * @tc.name testByteConstructorTwo0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2000
     * @tc.desc Verify Byte constructor with Utils.castToByte(null as Object throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      ByteCtorTwoHelper.assertClassCast((): void => {
        new Byte(Utils.castToByte(null as Object));
      });
    });

    /**
     * @tc.name testByteConstructorTwo0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2100
     * @tc.desc Verify Byte constructor with v as byte throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      ByteCtorTwoHelper.assertClassCast((): void => {
        const v: Object = (undefined as Object);
        new Byte(v as byte);
      });
    });

    /**
     * @tc.name testByteConstructorTwo0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2200
     * @tc.desc Verify Byte constructor with Utils.castToByte(s as Object throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      ByteCtorTwoHelper.assertClassCast((): void => {
        const s: string = '64';
        new Byte(Utils.castToByte(s as Object));
      });
    });

    /**
     * @tc.name testByteConstructorTwo0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2300
     * @tc.desc Verify Byte constructor with Utils.castToByte(true as Object throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      ByteCtorTwoHelper.assertClassCast((): void => {
        new Byte(Utils.castToByte(true as Object));
      });
    });

    /**
     * @tc.name testByteConstructorTwo0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2400
     * @tc.desc Verify Byte constructor with Utils.castToByte(false as Object throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      ByteCtorTwoHelper.assertClassCast((): void => {
        new Byte(Utils.castToByte(false as Object));
      });
    });

    /**
     * @tc.name testByteConstructorTwo0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2500
     * @tc.desc Verify Byte constructor with Utils.castToByte(Utils.plainObject()) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      ByteCtorTwoHelper.assertClassCast((): void => {
        new Byte(Utils.castToByte(Utils.plainObject()));
      });
    });

    /**
     * @tc.name testByteConstructorTwo0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2600
     * @tc.desc Verify Byte constructor with Utils.castToByte(arr as Object throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      ByteCtorTwoHelper.assertClassCast((): void => {
        const arr = new Array<number>();
        arr.pushOne(Int.toDouble(1));
        new Byte(Utils.castToByte(arr as Object));
      });
    });

    /**
     * @tc.name testByteConstructorTwo0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2700
     * @tc.desc Verify Byte constructor with Utils.castToByte(Utils.voidFnAsObject() throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      ByteCtorTwoHelper.assertClassCast((): void => {
        new Byte(Utils.castToByte(Utils.voidFnAsObject()));
      });
    });

    /**
     * @tc.name testByteConstructorTwo0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2800
     * @tc.desc Verify b1.toByte() equals 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b1 = new Byte(Int.toByte(10));
      const b2 = new Byte(Int.toByte(20));
      expect(b1.toByte()).assertEqual(10);
      expect(b2.toByte()).assertEqual(20);
    });

    /**
     * @tc.name testByteConstructorTwo0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2900
     * @tc.desc Verify string length is at least 1 and b.toByte() equals 64
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(64));
      const text = b.toString();
      expect(text.length >= 1).assertTrue();
      expect(b.toByte()).assertEqual(64);
    });

    /**
     * @tc.name testByteConstructorTwo0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_3000
     * @tc.desc Verify b.toInt() equals 64
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(64));
      expect(b.toInt()).assertEqual(64);
    });

    /**
     * @tc.name testByteConstructorTwo0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_3100
     * @tc.desc Verify b instanceof Byte is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(64));
      expect(b instanceof Byte).assertEqual(true);
    });

    /**
     * @tc.name testByteConstructorTwo0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_3200
     * @tc.desc Verify Class.of(b).getName().indexOf('Byte') >= 0 is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(64));
      expect(Class.of(b).getName().indexOf('Byte') >= 0).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_3300
     * @tc.desc Verify kind === 'object' || kind === 'byte' is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(64));
      const kind: string = typeof b;
      expect(kind === 'object' || kind === 'byte').assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_3400
     * @tc.desc Verify Utils.isRuntimeNumericOrIntTypeof(typeof val) || typeof val === 'byte' is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(64));
      const val: byte = b.toByte();
      expect(Utils.isRuntimeNumericOrIntTypeof(typeof val) || typeof val === 'byte').assertTrue();
    });
  });
}
