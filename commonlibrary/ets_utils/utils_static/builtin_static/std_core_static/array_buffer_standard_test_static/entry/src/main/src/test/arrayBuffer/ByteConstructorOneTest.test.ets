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

export default function byteConstructorOneTest(): void {
  describe('ByteConstructorOneTest', (): void => {
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
     * @tc.name testByteConstructorOne0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_0100
     * @tc.desc 验证 new Byte() 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte = new Byte()
      expect(b.toByte()).assertEqual(0)
    });

    /**
     * @tc.name testByteConstructorOne0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_0200
     * @tc.desc 验证 new Byte() 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte = new Byte();
      expect(b.toByte()).assertEqual(0);
    });

    /**
     * @tc.name testByteConstructorOne0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_0300
     * @tc.desc 验证 new Byte() 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte = new Byte();
      expect(b.toByte()).assertEqual(0);
    });

    /**
     * @tc.name testByteConstructorOne0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_0400
     * @tc.desc 验证 new Byte() 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte = new Byte();
      expect(b.toByte()).assertEqual(0);
      expect(b instanceof Byte).assertTrue();
    });

    /**
     * @tc.name testByteConstructorOne0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_0500
     * @tc.desc 验证 new Byte() 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b1: Byte = new Byte()
      let b2: Byte = new Byte()
      expect(b1.toByte()).assertEqual(0)
      expect(b2.toByte()).assertEqual(0)
    });

    /**
     * @tc.name testByteConstructorOne0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_0600
     * @tc.desc 验证 new Byte() 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte = new Byte()
      expect(b instanceof Byte).assertTrue()
    });

    /**
     * @tc.name testByteConstructorOne0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_0700
     * @tc.desc 验证 new Byte() 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte = new Byte()
      expect(Class.of(b).getName().indexOf("Byte") >= 0).assertTrue()
    });

    /**
     * @tc.name testByteConstructorOne0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_0800
     * @tc.desc 验证 new Byte() 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte = new Byte();
      expect(Class.of(b).getName().indexOf('Byte') >= 0).assertTrue();
    });

    /**
     * @tc.name testByteConstructorOne0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_0900
     * @tc.desc 验证 new Byte() 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b1: Byte = new Byte();
      let b2: Byte = new Byte();
      expect(b1.toByte()).assertEqual(0);
      expect(b2.toByte()).assertEqual(0);
    });

    /**
     * @tc.name testByteConstructorOne0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_1000
     * @tc.desc 验证 new Byte() 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte = new Byte()
      expect(b.toInt()).assertEqual(0)
    });

    /**
     * @tc.name testByteConstructorOne0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_1100
     * @tc.desc 验证 new Byte() 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte = new Byte()
      expect(b.toShort()).assertEqual(0)
    });

    /**
     * @tc.name testByteConstructorOne0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_1200
     * @tc.desc 验证 new Byte() 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte = new Byte()
      expect(b.toLong()).assertEqual(0)
    });

    /**
     * @tc.name testByteConstructorOne0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_1300
     * @tc.desc 验证 new Byte() 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte = new Byte()
      expect(b.toFloat()).assertEqual(0)
    });

    /**
     * @tc.name testByteConstructorOne0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_1400
     * @tc.desc 验证 new Byte() 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte = new Byte()
      expect(b.toDouble()).assertEqual(0)
    });

    /**
     * @tc.name testByteConstructorOne0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_1500
     * @tc.desc 验证 new Byte() 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte = new Byte()
      expect(b.toString()).assertEqual("0")
    });

    /**
     * @tc.name testByteConstructorOne0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_1600
     * @tc.desc 验证 new Byte() 在当前场景执行成功，等值关系判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte = new Byte();
      expect(b.toByte() === 0).assertTrue();
    });

    /**
     * @tc.name testByteConstructorOne0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_1700
     * @tc.desc 验证 Byte.MIN_VALUE 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Byte.MIN_VALUE).assertEqual(-128)
    });

    /**
     * @tc.name testByteConstructorOne0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_1800
     * @tc.desc 验证 Byte.MAX_VALUE 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Byte.MAX_VALUE).assertEqual(127)
    });

    /**
     * @tc.name testByteConstructorOne0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_1900
     * @tc.desc 验证 new Byte(0) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte = new Byte(0);
      expect(b.toByte()).assertEqual(0);
    });

    /**
     * @tc.name testByteConstructorOne0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_2000
     * @tc.desc 验证 new Byte((("0" as Object) as byte)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let b: Byte = new Byte((("0" as Object) as byte))
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testByteConstructorOne0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_2100
     * @tc.desc 验证 new Byte(((undefined as Object) as byte)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let b: Byte = new Byte(((undefined as Object) as byte))
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testByteConstructorOne0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_2200
     * @tc.desc 验证 new Byte(((null as Object) as byte)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let b: Byte = new Byte(((null as Object) as byte))
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testByteConstructorOne0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_2300
     * @tc.desc 验证 new Byte() 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 1000; i++) {
        let b: Byte = new Byte()
        expect(b.toByte()).assertEqual(0)
      }
    });

    /**
     * @tc.name testByteConstructorOne0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_2400
     * @tc.desc 验证 new Byte() 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte = new Byte()
      expect(b.toByte()).assertEqual(0)
      expect(b.toInt()).assertEqual(0)
      expect(b.toString()).assertEqual("0")
    });
    return;
  });
}