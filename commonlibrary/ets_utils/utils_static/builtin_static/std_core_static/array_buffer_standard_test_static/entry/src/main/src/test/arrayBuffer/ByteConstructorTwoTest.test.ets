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

class ByteConstructorTwoInvalidArgBox {
}

const byteConstructorTwoArrowReturnOne = (): number => { return 1; };

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
      const b = new Byte(Int.toByte(64));
      expect(b.toByte()).assertEqual(64);
    });

    /**
     * @tc.name testByteConstructorTwo0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0200
     * @tc.desc Mindmap expects no-arg ctor error elsewhere; STA allows new Byte(); verify toByte is 0
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
     * @tc.desc Mindmap expects extra ctor args compile error on STA; runtime covers single-arg new Byte(Int.toByte(1))
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(1));
      expect(b.toByte()).assertEqual(1);
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
      const b = new Byte(Int.toByte(0));
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
      const b = new Byte(Int.toByte(1));
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
      const b = new Byte(Int.toByte(64));
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
      const b = new Byte(Int.toByte(-1));
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
      const b = new Byte(Int.toByte(-64));
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
      const b = new Byte(Int.toByte(127));
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
      const b = new Byte(Int.toByte(-128));
      expect(b.toByte()).assertEqual(-128);
    });

    /**
     * @tc.name testByteConstructorTwo0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1100
     * @tc.desc Mindmap expects 128 out of signed byte range; illegal byte literals avoided; coerce 128 via ESObject and observe constructor throws per STA runtime or assertFail when no exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const v128: number = 128;
        new Byte((v128 as Object) as byte);
        expect(true).assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1200
     * @tc.desc Mindmap expects -129 out of signed byte range; illegal byte literals avoided; coerce via ESObject
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const vn129: number = -129;
        new Byte((vn129 as Object) as byte);
        expect(true).assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1300
     * @tc.desc Mindmap expects 255 outside signed byte semantics; coerce via ESObject
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const v255: number = 255;
        new Byte((v255 as Object) as byte);
        expect(true).assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1400
     * @tc.desc Mindmap expects NaN invalid as byte primitive; observe ctor throws when given NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const nanVal: number = Number.NaN;
        new Byte((nanVal as Object) as byte);
        expect(true).assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1500
     * @tc.desc Mindmap expects Infinity invalid as byte primitive
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const posInf: number = Number.POSITIVE_INFINITY;
        new Byte((posInf as Object) as byte);
        expect(true).assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1600
     * @tc.desc Mindmap expects -Infinity invalid as byte primitive
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const negInf: number = Number.NEGATIVE_INFINITY;
        new Byte((negInf as Object) as byte);
        expect(true).assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1700
     * @tc.desc Mindmap expects non-integer double invalid or truncated; try 0.5 path
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const half: number = 0.5;
        new Byte((half as Object) as byte);
        expect(true).assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1800
     * @tc.desc Mindmap expects null invalid; mindmap direct null may be compile-rejected; use ESObject coercion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Byte((null as Object) as byte);
        expect(true).assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_1900
     * @tc.desc Mindmap expects undefined invalid; mindmap direct undefined may be compile-rejected; use ESObject coercion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Byte((undefined as Object) as byte);
        expect(true).assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2000
     * @tc.desc Mindmap expects string invalid; coerce string via ESObject to byte-formal parameter shape
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const s64: string = "64";
        new Byte((s64 as Object) as byte);
        expect(true).assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2100
     * @tc.desc Mindmap expects boolean invalid; coerce true via ESObject
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Byte((true as Object) as byte);
        expect(true).assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2200
     * @tc.desc Mindmap expects boolean invalid; coerce false via ESObject
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Byte((false as Object) as byte);
        expect(true).assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2300
     * @tc.desc Mindmap expects object invalid; plain class instance via ESObject coercion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Byte((new ByteConstructorTwoInvalidArgBox() as ESObject) as byte);
        expect(true).assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2400
     * @tc.desc Mindmap expects array invalid; coerce array literal via ESObject
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const badArr = new Array<number>();
        badArr.pushOne(Int.toDouble(1));
        badArr.pushOne(Int.toDouble(2));
        new Byte((badArr as Object) as byte);
        expect(true).assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2500
     * @tc.desc Mindmap expects function invalid; module-level arrow coerced via ESObject
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Byte((byteConstructorTwoArrowReturnOne as ESObject) as byte);
        expect(true).assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
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
      const b = new Byte(Int.toByte(64));
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
      const b1 = new Byte(Int.toByte(10));
      const b2 = new Byte(Int.toByte(20));
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
      const b = new Byte(Int.toByte(64));
      expect(b.toString()).assertEqual('64');
    });

    /**
     * @tc.name testByteConstructorTwo0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_2900
     * @tc.desc STA Byte has no valueOf; verify toByte() matches constructed primitive 64
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(64));
      expect(b.toByte()).assertEqual(64);
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
      const b = new Byte(Int.toByte(64));
      expect(b instanceof Byte).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_3100
     * @tc.desc STA Byte boxed instance; verify instanceof Byte instead of constructor identity compare to JS function
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(64));
      expect(b instanceof Byte).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_3200
     * @tc.desc Verify Byte instance typeof may be object or byte on OH runtime; accept either.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(64));
      expect(Utils.isRuntimeByteBoxTypeof(typeof b)).assertTrue();
    });

    /**
     * @tc.name testByteConstructorTwo0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_3300
     * @tc.desc Verify toByte() primitive typeof may be number or int or byte on OH; accept runtime kinds.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Int.toByte(64));
      const val: byte = b.toByte();
      expect(Utils.isRuntimeBytePrimitiveTypeof(typeof val)).assertTrue();
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
      const b = new Byte(Int.toByte(127));
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
      const b = new Byte(Int.toByte(-128));
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
      const b = new Byte(Int.toByte(0));
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
      const b = new Byte(Int.toByte(126));
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
      const b = new Byte(Int.toByte(-127));
      expect(b.toByte()).assertEqual(-127);
    });

    /**
     * @tc.name testByteConstructorTwo0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_3900
     * @tc.desc Passing 128 out of signed byte range; avoid illegal byte literal; ESObject coercion expects throw
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const v128b: number = 128;
        new Byte((v128b as Object) as byte);
        expect(true).assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_4000
     * @tc.desc Passing -129 out of signed byte range; ESObject coercion expects throw
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const vn129b: number = -129;
        new Byte((vn129b as Object) as byte);
        expect(true).assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_4100
     * @tc.desc Passing 256 outside signed byte span; ESObject coercion expects throw
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const v256: number = 256;
        new Byte((v256 as Object) as byte);
        expect(true).assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_4200
     * @tc.desc Passing -256 outside signed byte span; ESObject coercion expects throw
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const vn256: number = -256;
        new Byte((vn256 as Object) as byte);
        expect(true).assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_4300
     * @tc.desc Passing string "64" invalid; ESObject coercion expects throw
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const s64: string = "64";
        new Byte((s64 as Object) as byte);
        expect(true).assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_4400
     * @tc.desc Passing true invalid; ESObject coercion expects throw
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Byte((true as Object) as byte);
        expect(true).assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_4500
     * @tc.desc Passing plain object invalid; class instance via ESObject expects throw
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Byte((new ByteConstructorTwoInvalidArgBox() as ESObject) as byte);
        expect(true).assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_4600
     * @tc.desc Passing array [1] invalid; ESObject coercion expects throw
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const oneArr = new Array<number>();
        oneArr.pushOne(Int.toDouble(1));
        new Byte((oneArr as Object) as byte);
        expect(true).assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_4700
     * @tc.desc Passing null invalid; ESObject coercion expects throw
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Byte((null as Object) as byte);
        expect(true).assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_4800
     * @tc.desc Passing undefined invalid; ESObject coercion expects throw
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Byte((undefined as Object) as byte);
        expect(true).assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_4900
     * @tc.desc Passing NaN invalid; expect throw or assertFail when ctor accepts silently
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const nan2: number = Number.NaN;
        new Byte((nan2 as Object) as byte);
        expect(true).assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
    });

    /**
     * @tc.name testByteConstructorTwo0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_5000
     * @tc.desc Passing Infinity invalid; expect throw or assertFail when ctor accepts silently
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const posInf2: number = Number.POSITIVE_INFINITY;
        new Byte((posInf2 as Object) as byte);
        expect(true).assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
    });
    return;
  });
}
