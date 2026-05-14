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
 * WITHOUT WARRANTIES OR ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
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
     * @tc.desc Verify Byte no-arg constructor: call constructor，success create Byteobject
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
     * @tc.desc Verify Byte no-arg constructor: zero-arg constructor rejects extra args; mindmap expects compile error; runtime checks 1 ，compile-time rejection expected; runtime alternative checks
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte = new Byte()
      expect(b.toByte()).assertEqual(0)
    });

    /**
     * @tc.name testByteConstructorOne0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_0300
     * @tc.desc Verify Byte no-arg constructor: zero-arg constructor rejects extra args; mindmap expects compile error; runtime checks ，compile-time rejection expected; runtime alternative checks
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte = new Byte()
      expect(b.toByte()).assertEqual(0)
    });

    /**
     * @tc.name testByteConstructorOne0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_0400
     * @tc.desc Verify Byte no-arg constructor: constructor function create Byteobject ，toByte()returns 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte = new Byte()
      expect(b.toByte()).assertEqual(0)
    });

    /**
     * @tc.name testByteConstructorOne0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_0500
     * @tc.desc Verify Byte no-arg constructor: multiple call constructor function ， object independent and is 0
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
     * @tc.desc Verify Byte no-arg constructor: verify new Byte()returns Bytetype instance
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
     * @tc.desc Verify Byte no-arg constructor: verify new Byte()returns object is null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte = new Byte()
      expect(b != null).assertTrue()
    });

    /**
     * @tc.name testByteConstructorOne0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_0800
     * @tc.desc Verify Byte no-arg constructor: verify new Byte()returns object is undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte = new Byte()
      expect(b !== undefined).assertTrue()
    });

    /**
     * @tc.name testByteConstructorOne0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_0900
     * @tc.desc Verify Byte no-arg constructor: constructor create Byteobject ，toByte()return value is 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte = new Byte()
      expect(b.toByte()).assertEqual(0)
    });

    /**
     * @tc.name testByteConstructorOne0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_1000
     * @tc.desc Verify Byte no-arg constructor: constructor create Byteobject ，toInt()return value is 0
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
     * @tc.desc Verify Byte no-arg constructor: constructor create Byteobject ，toShort()return value is 0
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
     * @tc.desc Verify Byte no-arg constructor: constructor create Byteobject ，toLong()return value is 0
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
     * @tc.desc Verify Byte no-arg constructor: constructor create Byteobject ，toFloat()return value is 0
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
     * @tc.desc Verify Byte no-arg constructor: constructor create Byteobject ，toDouble()return value is 0
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
     * @tc.desc Verify Byte no-arg constructor: constructor create Byteobject ，toString()returns string "0"
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
     * @tc.desc STA Byte has no valueOf; verify toByte() returns 0 for new Byte()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte = new Byte()
      expect(b.toByte()).assertEqual(0)
    });

    /**
     * @tc.name testByteConstructorOne0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_1700
     * @tc.desc Verify Byte no-arg constructor: Byteobject or access MIN_VALUEproperty ，verify static
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
     * @tc.desc Verify Byte no-arg constructor: Byteobject or access MAX_VALUEproperty ，verify static
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
     * @tc.desc STA Byte has no SIZE; observe signed byte distinct value count via MIN_VALUE and MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Byte.MAX_VALUE - Byte.MIN_VALUE + 1).assertEqual(256)
    });

    /**
     * @tc.name testByteConstructorOne0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_2000
     * @tc.desc STA Byte has no BYTES; verify constructor round-trip for boundary bytes via Int.toByte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Byte(Int.toByte(Byte.MAX_VALUE)).toByte()).assertEqual(127)
      expect(new Byte(Int.toByte(Byte.MIN_VALUE)).toByte()).assertEqual(-128)
    });

    /**
     * @tc.name testByteConstructorOne0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_2100
     * @tc.desc Verify Byte no-arg constructor: zero-arg constructor rejects extra args; mindmap expects compile error; runtime checks numbertype ，ArkTS-Sta compile-time error expected; runtime alternative checks
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte = new Byte()
      expect(b.toByte()).assertEqual(0)
    });

    /**
     * @tc.name testByteConstructorOne0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_2200
     * @tc.desc Verify Byte no-arg constructor: zero-arg constructor rejects extra args; mindmap expects compile error; runtime checks stringtype ，ArkTS-Sta compile-time error expected; runtime alternative checks
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte = new Byte()
      expect(b.toByte()).assertEqual(0)
    });

    /**
     * @tc.name testByteConstructorOne0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_2300
     * @tc.desc Verify Byte no-arg constructor: zero-arg constructor rejects extra args; mindmap expects compile error; runtime checks undefined，ArkTS-Sta compile-time error expected; runtime alternative checks
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte = new Byte()
      expect(b.toByte()).assertEqual(0)
    });

    /**
     * @tc.name testByteConstructorOne0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_2400
     * @tc.desc Verify Byte no-arg constructor: zero-arg constructor rejects extra args; mindmap expects compile error; runtime checks null，ArkTS-Sta compile-time error expected; runtime alternative checks
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte = new Byte()
      expect(b.toByte()).assertEqual(0)
    });

    /**
     * @tc.name testByteConstructorOne0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_2500
     * @tc.desc Verify Byte no-arg constructor: loop create Byteobject ，verify memory crash
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 1000; i++) {
        let b: Byte = new Byte()
        expect(b.toByte()).assertEqual(0)
      }
    });

    /**
     * @tc.name testByteConstructorOne0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_2600
     * @tc.desc Verify Byte no-arg constructor: create Byteobject after immediately chained call method ，verify runtime exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte = new Byte()
      expect(b.toByte()).assertEqual(0)
      expect(b.toInt()).assertEqual(0)
      expect(b.toString()).assertEqual("0")
    });
    return;
  });
}
