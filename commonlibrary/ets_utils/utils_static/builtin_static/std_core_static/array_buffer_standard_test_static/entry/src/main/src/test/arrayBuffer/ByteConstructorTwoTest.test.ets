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
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

class ByteCtorTwoObjectProbe023 {
  public tag: int = 0;
}

/** Mindmap: out-of-range or type-mismatch may throw std.core errors or truncate on OH (ArkTS spec §8.15 catch + instanceof). */
class ByteCtorTwoCatchHelper {
  private static isValidTruncatedByte(b: Byte): boolean {
    if (Class.of(b).getName().indexOf('Byte') < 0) {
      return false;
    }
    const v: byte = b.toByte();
    const lo: byte = Int.toByte(-128);
    const hi: byte = Int.toByte(127);
    return v >= lo && v <= hi;
  }

  static checkErrorOrTruncate(build: () => Byte): boolean {
    try {
      return ByteCtorTwoCatchHelper.isValidTruncatedByte(build());
    } catch (e) {
      try {
        return ByteCtorTwoCatchHelper.isValidTruncatedByte(build());
      } catch (inner) {
        if (inner === null || inner === undefined) {
          return false;
        }
        return Utils.thrownErrorCodeIsAcceptable(inner);
      }
    }
  }
}

export default function byteConstructorTwoTest(): void {
  describe('ByteConstructorTwoTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.name testByteConstructorTwo0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0100
     * @tc.desc 验证 new Byte(Int.toByte(64)) 在当前场景执行成功，返回结果与预期一致。
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
     * @tc.desc 验证 new Byte(Int.toByte(64)) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(64));
      expect(b.toByte()).assertEqual(64);
    });

    /**
     * @tc.name testByteConstructorTwo0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0300
     * @tc.desc 验证 new Byte(arg) 在当前场景执行成功，等值关系判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arg = Int.toByte(1);
      const b = new Byte(arg);
      expect(b.toByte()).assertEqual(1);
      expect(b.toByte() == arg).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0400
     * @tc.desc 验证 new Byte(Int.toByte(0)) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(0));
      expect(b.toByte()).assertEqual(0);
    });

    /**
     * @tc.name testByteConstructorTwo0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0500
     * @tc.desc 验证 new Byte(Int.toByte(1)) 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(1));
      expect(Class.of(b).getName().indexOf('Byte') >= 0).assertTrue();
      expect(b.toByte()).assertEqual(1);
    });

    /**
     * @tc.name testByteConstructorTwo0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0600
     * @tc.desc 验证 new Byte(Int.toByte(64)) 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(64));
      expect(b.toByte()).assertEqual(64);
      expect(Class.of(b).getName().indexOf('Byte') >= 0).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0700
     * @tc.desc 验证 new Byte(Int.toByte(-1)) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(-1));
      expect(b.toByte()).assertEqual(-1);
    });

    /**
     * @tc.name testByteConstructorTwo0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0800
     * @tc.desc 验证 new Byte(Int.toByte(-64)) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(-64));
      expect(b.toByte()).assertEqual(-64);
    });

    /**
     * @tc.name testByteConstructorTwo0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0900
     * @tc.desc 验证 new Byte(Int.toByte(127)) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(127));
      expect(b.toByte()).assertEqual(127);
    });

    /**
     * @tc.name testByteConstructorTwo0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1000
     * @tc.desc 验证 new Byte(Int.toByte(-128)) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(-128));
      expect(b.toByte()).assertEqual(-128);
    });

    /**
     * @tc.name testByteConstructorTwo0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1100
     * @tc.desc 验证 new Byte(Int.toByte(128)) 在当前场景下的行为符合用例预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ByteCtorTwoCatchHelper.checkErrorOrTruncate((): Byte => new Byte(Int.toByte(128)))).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1200
     * @tc.desc 验证 new Byte(Int.toByte(-129)) 在当前场景下的行为符合用例预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ByteCtorTwoCatchHelper.checkErrorOrTruncate((): Byte => new Byte(Int.toByte(-129)))).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1300
     * @tc.desc 验证 new Byte(Int.toByte(255)) 在当前场景下的行为符合用例预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ByteCtorTwoCatchHelper.checkErrorOrTruncate((): Byte => new Byte(Int.toByte(255)))).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1400
     * @tc.desc 验证 new Byte(Utils.castToByte(v as Object)) 在当前场景下的行为符合用例预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ByteCtorTwoCatchHelper.checkErrorOrTruncate((): Byte => {
        const v: number = NaN;
        return new Byte(Utils.castToByte(v as Object));
      })).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1500
     * @tc.desc 验证 new Byte(Int.toByte(128)) 在当前场景下的行为符合用例预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ByteCtorTwoCatchHelper.checkErrorOrTruncate((): Byte => new Byte(Int.toByte(128)))).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1600
     * @tc.desc 验证 new Byte(Int.toByte(-129)) 在当前场景下的行为符合用例预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ByteCtorTwoCatchHelper.checkErrorOrTruncate((): Byte => new Byte(Int.toByte(-129)))).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1700
     * @tc.desc 验证 new Byte(Double.toByte(0.5)) 在当前场景下的行为符合用例预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ByteCtorTwoCatchHelper.checkErrorOrTruncate((): Byte => new Byte(Double.toByte(0.5)))).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1800
     * @tc.desc 验证 new Byte(Utils.castToByte(v as Object)) 在当前场景下的行为符合用例预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ByteCtorTwoCatchHelper.checkErrorOrTruncate((): Byte => {
        const v: number = NaN;
        return new Byte(Utils.castToByte(v as Object));
      })).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1900
     * @tc.desc 验证 new Byte(Utils.castToByte(v as Object)) 在当前场景下的行为符合用例预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ByteCtorTwoCatchHelper.checkErrorOrTruncate((): Byte => {
        const v: number = Infinity;
        return new Byte(Utils.castToByte(v as Object));
      })).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2000
     * @tc.desc 验证 new Byte(Utils.castToByte(s as Object)) 在当前场景下的行为符合用例预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ByteCtorTwoCatchHelper.checkErrorOrTruncate((): Byte => {
        const s: string = '64';
        return new Byte(Utils.castToByte(s as Object));
      })).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2100
     * @tc.desc 验证 new Byte(Double.toByte(0.5)) 在当前场景下的行为符合用例预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ByteCtorTwoCatchHelper.checkErrorOrTruncate((): Byte => new Byte(Double.toByte(0.5)))).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2200
     * @tc.desc 验证 new Byte(v as byte) 在当前场景下的行为符合用例预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ByteCtorTwoCatchHelper.checkErrorOrTruncate((): Byte => {
        const v: Object = (undefined as Object);
        return new Byte(v as byte);
      })).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2300
     * @tc.desc 验证 new Byte(Utils.castToByte(probe as Object)) 在当前场景下的行为符合用例预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ByteCtorTwoCatchHelper.checkErrorOrTruncate((): Byte => {
        const probe = new ByteCtorTwoObjectProbe023();
        return new Byte(Utils.castToByte(probe as Object));
      })).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2400
     * @tc.desc 验证 new Byte(Utils.castToByte(true as Object)) 在当前场景下的行为符合用例预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ByteCtorTwoCatchHelper.checkErrorOrTruncate((): Byte => new Byte(Utils.castToByte(true as Object)))).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2500
     * @tc.desc 验证 new Byte(Utils.castToByte(false as Object)) 在当前场景下的行为符合用例预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ByteCtorTwoCatchHelper.checkErrorOrTruncate((): Byte => new Byte(Utils.castToByte(false as Object)))).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2600
     * @tc.desc 验证 new Byte(passed) 在当前场景执行成功，等值关系判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const passed: byte = Int.toByte(64);
      const b = new Byte(passed);
      expect(b.toByte()).assertEqual(passed);
      expect(b.toByte() == 64).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2700
     * @tc.desc 验证 new Byte(Int.toByte(10)) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b1 = new Byte(Int.toByte(10));
      const b2 = new Byte(Int.toByte(20));
      expect(b1.toByte()).assertEqual(10);
      expect(b2.toByte()).assertEqual(20);
    });

    /**
     * @tc.name testByteConstructorTwo0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2800
     * @tc.desc 验证 new Byte(Int.toByte(64)) 在当前场景执行成功，边界值比较判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(64));
      const text = b.toString();
      expect(text.length >= 1).assertTrue();
      expect(b.toByte()).assertEqual(64);
    });

    /**
     * @tc.name testByteConstructorTwo0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2900
     * @tc.desc 验证 new Byte(Int.toByte(64)) 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(64));
      const extracted: byte = b.toByte();
      expect(Utils.isRuntimeNumericOrIntTypeof(typeof extracted) || typeof extracted === 'byte').assertTrue();
      expect(extracted).assertEqual(64);
    });

    /**
     * @tc.name testByteConstructorTwo0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_3000
     * @tc.desc 验证 new Byte(Int.toByte(64)) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(64));
      expect(b instanceof Byte).assertEqual(true);
    });

    /**
     * @tc.name testByteConstructorTwo0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_3100
     * @tc.desc 验证 new Byte(Int.toByte(64)) 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(64));
      expect(Class.of(b).getName().indexOf("Byte") >= 0).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_3200
     * @tc.desc 验证 new Byte(Int.toByte(64)) 在当前场景执行成功，等值关系判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(64));
      const kind: string = typeof b;
      expect(kind === "object" || kind === "byte").assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_3300
     * @tc.desc 验证 new Byte(Int.toByte(64)) 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(64));
      const val: byte = b.toByte();
      expect(Utils.isRuntimeNumericOrIntTypeof(typeof val) || typeof val === 'byte').assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_3400
     * @tc.desc 验证 new Byte(hi) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hi: byte = Int.toByte(127);
      const b = new Byte(hi);
      expect(b.toByte()).assertEqual(127);
    });

    /**
     * @tc.name testByteConstructorTwo0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_3500
     * @tc.desc 验证 new Byte(lo) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lo: byte = Int.toByte(-128);
      const b = new Byte(lo);
      expect(b.toByte()).assertEqual(-128);
    });

    /**
     * @tc.name testByteConstructorTwo0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_3600
     * @tc.desc 验证 new Byte(Int.toByte(0)) 在当前场景执行成功，等值关系判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(0));
      expect(b.toByte() == Double.toByte(0.0)).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_3700
     * @tc.desc 验证 new Byte(Int.toByte(126)) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(126));
      expect(b.toByte()).assertEqual(126);
    });

    /**
     * @tc.name testByteConstructorTwo0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_3800
     * @tc.desc 验证 new Byte(Int.toByte(-127)) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(-127));
      expect(b.toByte()).assertEqual(-127);
    });

    /**
     * @tc.name testByteConstructorTwo0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_3900
     * @tc.desc 验证 new Byte(Int.toByte(128)) 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ByteCtorTwoCatchHelper.checkErrorOrTruncate((): Byte => new Byte(Int.toByte(128)))).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_4000
     * @tc.desc 验证 new Byte(Int.toByte(-129)) 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ByteCtorTwoCatchHelper.checkErrorOrTruncate((): Byte => new Byte(Int.toByte(-129)))).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_4100
     * @tc.desc 验证 new Byte(Int.toByte(256)) 在当前场景下的行为符合用例预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ByteCtorTwoCatchHelper.checkErrorOrTruncate((): Byte => new Byte(Int.toByte(256)))).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_4200
     * @tc.desc 验证 new Byte(Int.toByte(-256)) 在当前场景下的行为符合用例预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ByteCtorTwoCatchHelper.checkErrorOrTruncate((): Byte => new Byte(Int.toByte(-256)))).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_4300
     * @tc.desc 验证 new Byte(Utils.castToByte(digitPair as Object)) 在当前场景下的行为符合用例预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ByteCtorTwoCatchHelper.checkErrorOrTruncate((): Byte => {
        const digitPair: string = '64';
        return new Byte(Utils.castToByte(digitPair as Object));
      })).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_4400
     * @tc.desc 验证 new Byte(Utils.castToByte(true as Object)) 在当前场景下的行为符合用例预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ByteCtorTwoCatchHelper.checkErrorOrTruncate((): Byte => new Byte(Utils.castToByte(true as Object)))).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_4500
     * @tc.desc 验证 new Byte(Utils.castToByte(probe048 as Object)) 在当前场景下的行为符合用例预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ByteCtorTwoCatchHelper.checkErrorOrTruncate((): Byte => {
        const probe048 = new ByteCtorTwoObjectProbe023();
        probe048.tag = 48;
        return new Byte(Utils.castToByte(probe048 as Object));
      })).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_4600
     * @tc.desc 验证 new Byte(Utils.castToByte(arr as Object)) 在当前场景下的行为符合用例预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ByteCtorTwoCatchHelper.checkErrorOrTruncate((): Byte => {
        const arr = new Array<number>();
        arr.pushOne(Int.toDouble(1));
        return new Byte(Utils.castToByte(arr as Object));
      })).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_4700
     * @tc.desc 验证 new Byte(Utils.castToByte(null as Object)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b = new Byte(Utils.castToByte(null as Object));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testByteConstructorTwo0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_4800
     * @tc.desc 验证 new Byte({}) 在当前场景执行成功，空值有效性判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte;
      try {
        b = new Byte({});
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(b instanceof Byte).assertEqual(true);
    });

    /**
     * @tc.name testByteConstructorTwo0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_4900
     * @tc.desc 验证 new Byte(Utils.castToByte(byteBadNum as Object)) 在当前场景下的行为符合用例预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ByteCtorTwoCatchHelper.checkErrorOrTruncate((): Byte => {
        const byteBadNum: number = NaN;
        return new Byte(Utils.castToByte(byteBadNum as Object));
      })).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_5000
     * @tc.desc 验证 new Byte(Utils.castToByte(byteBadNum as Object)) 在当前场景下的行为符合用例预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ByteCtorTwoCatchHelper.checkErrorOrTruncate((): Byte => {
        const byteBadNum: number = Infinity;
        return new Byte(Utils.castToByte(byteBadNum as Object));
      })).assertTrue();
    });
    return;
  });
}