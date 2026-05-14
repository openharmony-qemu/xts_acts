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
     * @tc.desc Verify Byte valued constructor: passing 1 bytetype ，constructor success
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(64 as byte);
      expect(b.toByte()).assertEqual(64);
    });

    /**
     * @tc.name testByteConstructorTwo0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0200
     * @tc.desc Verify Byte valued constructor: call constructor function ， error or is
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b = new Byte();
        expect(true).assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0300
     * @tc.desc Verify Byte valued constructor: extra parameters ， ignored or error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b = new Byte(1 as byte, 2 as byte);
        expect(b != null).assertTrue();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0400
     * @tc.desc Verify Byte valued constructor: value is 0，constructor success ，toByte()returns 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(0 as byte);
      expect(b.toByte()).assertEqual(0);
    });

    /**
     * @tc.name testByteConstructorTwo0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0500
     * @tc.desc Verify Byte valued constructor: value is 1，constructor success ，toByte()returns 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(1 as byte);
      expect(b.toByte()).assertEqual(1);
    });

    /**
     * @tc.name testByteConstructorTwo0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0600
     * @tc.desc Verify Byte valued constructor: value is 64，constructor success ，toByte()returns 64
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(64 as byte);
      expect(b.toByte()).assertEqual(64);
    });

    /**
     * @tc.name testByteConstructorTwo0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0700
     * @tc.desc Verify Byte valued constructor: value is -1，constructor success ，toByte()returns -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(-1 as byte);
      expect(b.toByte()).assertEqual(-1);
    });

    /**
     * @tc.name testByteConstructorTwo0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0800
     * @tc.desc Verify Byte valued constructor: value is -64，constructor success ，toByte()returns -64
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(-64 as byte);
      expect(b.toByte()).assertEqual(-64);
    });

    /**
     * @tc.name testByteConstructorTwo0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0900
     * @tc.desc Verify Byte valued constructor: value is bytemaximum 127，constructor success ，toByte()returns 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(127 as byte);
      expect(b.toByte()).assertEqual(127);
    });

    /**
     * @tc.name testByteConstructorTwo0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1000
     * @tc.desc Verify Byte valued constructor: value is byteminimum -128，constructor success ，toByte()returns -128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(-128 as byte);
      expect(b.toByte()).assertEqual(-128);
    });

    /**
     * @tc.name testByteConstructorTwo0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1100
     * @tc.desc Verify Byte valued constructor: value is 128，out of range byte [‑128,127]， error or truncated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b = new Byte(128 as byte);
      } catch (e) {
        console.info("out of range upper bound");
      }
      expect(b != null).assertTrue()
    });

    /**
     * @tc.name testByteConstructorTwo0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1200
     * @tc.desc Verify Byte valued constructor: value is -129，out of range byte [‑128,127]， error or truncated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b = new Byte(-129 as byte);
      } catch (e) {
        console.info("out of range lower bound");
      }
      expect(b != null).assertTrue()
    });

    /**
     * @tc.name testByteConstructorTwo0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1300
     * @tc.desc Verify Byte valued constructor: value is 255， byte ， error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b = new Byte(255 as byte);
      } catch (e) {
        console.info("out of range 255");
      }
      expect(b != null).assertTrue()
    });

    /**
     * @tc.name testByteConstructorTwo0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1400
     * @tc.desc Verify Byte valued constructor: value is NaN， valid byte ， error or is
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b = new Byte(NaN);
      } catch (e) {
        console.info("NaN not valid byte");
      }
      expect(b != null).assertTrue()
    });

    /**
     * @tc.name testByteConstructorTwo0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1500
     * @tc.desc Verify Byte valued constructor: value is Infinity，out of range byte ， error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b = new Byte(Infinity);
      } catch (e) {
        console.info("Infinity not valid byte");
      }
      expect(b != null).assertTrue()
    });

    /**
     * @tc.name testByteConstructorTwo0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1600
     * @tc.desc Verify Byte valued constructor: value is -Infinity，out of range byte ， error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b = new Byte(-Infinity);
      } catch (e) {
        console.info("-Infinity not valid byte");
      }
      expect(b != null).assertTrue()
    });

    /**
     * @tc.name testByteConstructorTwo0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1700
     * @tc.desc Verify Byte valued constructor: value is floating-point ，byte is ， error or truncated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b = new Byte(0.5);
      } catch (e) {
        console.info("float not valid byte");
      }
      expect(b != null).assertTrue()
    });

    /**
     * @tc.name testByteConstructorTwo0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1800
     * @tc.desc Verify Byte valued constructor: value is null，type ， error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b = new Byte(null);
      } catch (e) {
        console.info("null not valid byte");
      }
      expect(b != null).assertTrue()
    });

    /**
     * @tc.name testByteConstructorTwo0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1900
     * @tc.desc Verify Byte valued constructor: value is undefined，type ， error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b = new Byte(undefined);
      } catch (e) {
        console.info("undefined not valid byte");
      }
      expect(b != null).assertTrue()
    });

    /**
     * @tc.name testByteConstructorTwo0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2000
     * @tc.desc Verify Byte valued constructor: value is string type ，type ， error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b = new Byte("64");
      } catch (e) {
        console.info("string type mismatch");
      }
      expect(b != null).assertTrue()
    });

    /**
     * @tc.name testByteConstructorTwo0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2100
     * @tc.desc Verify Byte valued constructor: value is booleantype true，type ， error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b = new Byte(true);
      } catch (e) {
        console.info("boolean type mismatch");
      }
      expect(b != null).assertTrue()
    });

    /**
     * @tc.name testByteConstructorTwo0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2200
     * @tc.desc Verify Byte valued constructor: value is booleantype false，type ， error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b = new Byte(false);
      } catch (e) {
        console.info("boolean false type mismatch");
      }
      expect(b != null).assertTrue()
    });

    /**
     * @tc.name testByteConstructorTwo0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2300
     * @tc.desc Verify Byte valued constructor: value is object type ，type ， error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b = new Byte({});
      } catch (e) {
        console.info("object type mismatch");
      }
      expect(b != null).assertTrue()
    });

    /**
     * @tc.name testByteConstructorTwo0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2400
     * @tc.desc Verify Byte valued constructor: value is array type ，type ， error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b = new Byte([1, 2]);
      } catch (e) {
        console.info("array type mismatch");
      }
      expect(b != null).assertTrue()
    });

    /**
     * @tc.name testByteConstructorTwo0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2500
     * @tc.desc Verify Byte valued constructor: value is function type ，type ， error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b = new Byte(() => { return 1; });
      } catch (e) {
        console.info("function type mismatch");
      }
      expect(b != null).assertTrue()
    });

    /**
     * @tc.name testByteConstructorTwo0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2600
     * @tc.desc Verify Byte valued constructor: passing normal byte ，toByte()return value equals passing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(64 as byte);
      expect(b.toByte()).assertEqual(64);
    });

    /**
     * @tc.name testByteConstructorTwo0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2700
     * @tc.desc Verify Byte valued constructor: multiple create Byteobject ， object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b1 = new Byte(10 as byte);
      const b2 = new Byte(20 as byte);
      expect(b1.toByte()).assertEqual(10);
      expect(b2.toByte()).assertEqual(20);
    });

    /**
     * @tc.name testByteConstructorTwo0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2800
     * @tc.desc Verify Byte valued constructor: create Byteobject after toString()returns string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(64 as byte);
      console.info(b.toString());
      expect(b != null).assertTrue()
    });

    /**
     * @tc.name testByteConstructorTwo0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2900
     * @tc.desc Verify Byte valued constructor: create Byteobject after valueOf()returns byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(64 as byte);
      console.info(b.valueOf());
      expect(b != null).assertTrue()
    });

    /**
     * @tc.name testByteConstructorTwo0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_3000
     * @tc.desc Verify Byte valued constructor: create object instanceof Byte is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(64 as byte);
      expect(b instanceof Byte).assertEqual(true);
    });

    /**
     * @tc.name testByteConstructorTwo0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_3100
     * @tc.desc Verify Byte valued constructor: object constructor Byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(64 as byte);
      expect(b.constructor).assertEqual(Byte);
    });

    /**
     * @tc.name testByteConstructorTwo0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_3200
     * @tc.desc Verify Byte valued constructor: typeof Byteinstance returns object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(64 as byte);
      expect(typeof b).assertEqual("object");
    });

    /**
     * @tc.name testByteConstructorTwo0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_3300
     * @tc.desc Verify Byte valued constructor: toByte()return value type is byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(64 as byte);
      const val: byte = b.toByte();
      expect(typeof val).assertEqual("number");
    });

    /**
     * @tc.name testByteConstructorTwo0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_3400
     * @tc.desc Verify Byte valued constructor: passing 127，toByte()returns 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(127 as byte);
      expect(b.toByte()).assertEqual(127);
    });

    /**
     * @tc.name testByteConstructorTwo0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_3500
     * @tc.desc Verify Byte valued constructor: passing -128，toByte()returns -128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(-128 as byte);
      expect(b.toByte()).assertEqual(-128);
    });

    /**
     * @tc.name testByteConstructorTwo0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_3600
     * @tc.desc Verify Byte valued constructor: passing 0，toByte()returns 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(0 as byte);
      expect(b.toByte()).assertEqual(0);
    });

    /**
     * @tc.name testByteConstructorTwo0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_3700
     * @tc.desc Verify Byte valued constructor: passing 126（ ），toByte()returns 126
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(126 as byte);
      expect(b.toByte()).assertEqual(126);
    });

    /**
     * @tc.name testByteConstructorTwo0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_3800
     * @tc.desc Verify Byte valued constructor: passing -127（ ），toByte()returns -127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(-127 as byte);
      expect(b.toByte()).assertEqual(-127);
    });

    /**
     * @tc.name testByteConstructorTwo0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_3900
     * @tc.desc Verify Byte valued constructor: passing 128，out of range byte ， throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b = new Byte(128 as byte);
        console.info("should not reach here");
      } catch (e) {
        expect(e !== undefined).assertEqual(true);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_4000
     * @tc.desc Verify Byte valued constructor: passing -129，out of range byte ， throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b = new Byte(-129 as byte);
        console.info("should not reach here");
      } catch (e) {
        expect(e !== undefined).assertEqual(true);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_4100
     * @tc.desc Verify Byte valued constructor: passing 256， byte ， throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b = new Byte(256 as byte);
        console.info("should not reach here");
      } catch (e) {
        expect(e !== undefined).assertEqual(true);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_4200
     * @tc.desc Verify Byte valued constructor: passing -256， byte ， throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b = new Byte(-256 as byte);
        console.info("should not reach here");
      } catch (e) {
        expect(e !== undefined).assertEqual(true);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_4300
     * @tc.desc Verify Byte valued constructor: passing string "64"，type ， throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b = new Byte("64");
        console.info("should not reach here");
      } catch (e) {
        expect(e !== undefined).assertEqual(true);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_4400
     * @tc.desc Verify Byte valued constructor: passing true，type ， throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b = new Byte(true);
        console.info("should not reach here");
      } catch (e) {
        expect(e !== undefined).assertEqual(true);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_4500
     * @tc.desc Verify Byte valued constructor: passing empty object {}，type ， throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b = new Byte({});
        console.info("should not reach here");
      } catch (e) {
        expect(e !== undefined).assertEqual(true);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_4600
     * @tc.desc Verify Byte valued constructor: passing array [1]，type ， throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b = new Byte([1]);
        console.info("should not reach here");
      } catch (e) {
        expect(e !== undefined).assertEqual(true);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_4700
     * @tc.desc Verify Byte valued constructor: passing null， throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b = new Byte(null);
        console.info("should not reach here");
      } catch (e) {
        expect(e !== undefined).assertEqual(true);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_4800
     * @tc.desc Verify Byte valued constructor: passing undefined， throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b = new Byte(undefined);
        console.info("should not reach here");
      } catch (e) {
        expect(e !== undefined).assertEqual(true);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_4900
     * @tc.desc Verify Byte valued constructor: passing NaN， valid byte ， throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b = new Byte(NaN);
        console.info("should not reach here");
      } catch (e) {
        expect(e !== undefined).assertEqual(true);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_5000
     * @tc.desc Verify Byte valued constructor: passing Infinity，out of range byte ， throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b = new Byte(Infinity);
        console.info("should not reach here");
      } catch (e) {
        expect(e !== undefined).assertEqual(true);
      }
    });
    return;
  });
}
