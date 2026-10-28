'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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

import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";
import * as test_typedarray from '../ets/typedarray_test'

export default function typedArrayTest(): void {
  describe("ActsTypedArrayTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    let typedArrInfo: test_typedarray.TypedArrInfo = test_typedarray.getTypedArrInfo();

    /**
     * @tc.number    SUB_Taihe_TypedArray_UINT8_STATIC_0100
     * @tc.name      test_CheckUint8Array_Static_0001
     * @tc.desc      newUint8Array and sumUint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CheckUint8Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CheckUint8Array_Static_0001 start');
      let arr = test_typedarray.newUint8Array(2, (0x01).toByte());
      expect(arr.length).assertEqual(2);
      expect(arr.at(0)!.toInt()).assertEqual(0x01);
      expect(arr.at(1)!.toInt()).assertEqual(0x01);
      let res = test_typedarray.sumUint8Array(arr);
      expect(res).assertEqual((0x01 * 2).toByte());
      console.log('test_CheckUint8Array_Static_0001 done');
      done();
      console.log('test_CheckUint8Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_UINT16_STATIC_0100
     * @tc.name      test_CheckUint16Array_Static_0001
     * @tc.desc      newUint16Array and sumUint16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CheckUint16Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CheckUint16Array_Static_0001 start');
      let arr = test_typedarray.newUint16Array(2, (0x0123).toShort());
      expect(arr.at(0)!.toInt()).assertEqual(0x0123);
      expect(arr.at(1)!.toInt()).assertEqual(0x0123);
      let res = test_typedarray.sumUint16Array(arr);
      expect(res).assertEqual((0x0123 * 2).toShort());
      console.log('test_CheckUint16Array_Static_0001 done');
      done();
      console.log('test_CheckUint16Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_UINT32_STATIC_0100
     * @tc.name      test_CheckUint32Array_Static_0001
     * @tc.desc      newUint32Array and sumUint32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CheckUint32Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CheckUint32Array_Static_0001 start');
      let arr = test_typedarray.newUint32Array(2, (0x01234567).toInt());
      expect(arr.at(0)!.toInt()).assertEqual(0x01234567);
      expect(arr.at(1)!.toInt()).assertEqual(0x01234567);
      let res = test_typedarray.sumUint32Array(arr);
      expect(res).assertEqual(0x01234567 * 2);
      console.log('test_CheckUint32Array_Static_0001 done');
      done();
      console.log('test_CheckUint32Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_BIGUINT64_STATIC_0100
     * @tc.name      test_CheckBigUint64Array_Static_0001
     * @tc.desc      newBigUint64Array and sumBigUint64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CheckBigUint64Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CheckBigUint64Array_Static_0001 start');
      let arr = test_typedarray.newBigUint64Array(2, (21).toLong());
      expect(arr.at(0)).assertEqual(21n);
      expect(arr.at(1)).assertEqual(21n);
      let res = test_typedarray.sumBigUint64Array(arr);
      expect(res).assertEqual((42).toLong());
      console.log('test_CheckBigUint64Array_Static_0001 done');
      done();
      console.log('test_CheckBigUint64Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_INT8_STATIC_0100
     * @tc.name      test_CheckInt8Array_Static_0001
     * @tc.desc      newInt8Array and sumInt8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CheckInt8Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CheckInt8Array_Static_0001 start');
      let arr = test_typedarray.newInt8Array(2, (0x01).toByte());
      expect(arr.at(0)!.toInt()).assertEqual(0x01);
      expect(arr.at(1)!.toInt()).assertEqual(0x01);
      let res = test_typedarray.sumInt8Array(arr);
      expect(res).assertEqual((0x01 * 2).toByte());
      console.log('test_CheckInt8Array_Static_0001 done');
      done();
      console.log('test_CheckInt8Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_INT16_STATIC_0100
     * @tc.name      test_CheckInt16Array_Static_0001
     * @tc.desc      newInt16Array and sumInt16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CheckInt16Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CheckInt16Array_Static_0001 start');
      let arr = test_typedarray.newInt16Array(2, (0x0123).toShort());
      expect(arr.at(0)!.toInt()).assertEqual(0x0123);
      expect(arr.at(1)!.toInt()).assertEqual(0x0123);
      let res = test_typedarray.sumInt16Array(arr);
      expect(res).assertEqual((0x0123 * 2).toShort());
      console.log('test_CheckInt16Array_Static_0001 done');
      done();
      console.log('test_CheckInt16Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_INT32_STATIC_0100
     * @tc.name      test_CheckInt32Array_Static_0001
     * @tc.desc      newInt32Array and sumInt32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CheckInt32Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CheckInt32Array_Static_0001 start');
      let arr = test_typedarray.newInt32Array(2, (0x01234567).toInt());
      expect(arr.at(0)!.toInt()).assertEqual(0x01234567);
      expect(arr.at(1)!.toInt()).assertEqual(0x01234567);
      let res = test_typedarray.sumInt32Array(arr);
      expect(res).assertEqual(0x01234567 * 2);
      console.log('test_CheckInt32Array_Static_0001 done');
      done();
      console.log('test_CheckInt32Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_BIGINT64_STATIC_0100
     * @tc.name      test_CheckBigInt64Array_Static_0001
     * @tc.desc      newBigInt64Array and sumBigInt64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CheckBigInt64Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CheckBigInt64Array_Static_0001 start');
      let arr = test_typedarray.newBigInt64Array(2, (21).toLong());
      expect(arr.at(0)).assertEqual(21n);
      expect(arr.at(1)).assertEqual(21n);
      let res = test_typedarray.sumBigInt64Array(arr);
      expect(res).assertEqual((42).toLong());
      console.log('test_CheckBigInt64Array_Static_0001 done');
      done();
      console.log('test_CheckBigInt64Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_FLOAT32_STATIC_0100
     * @tc.name      test_CheckFloat32Array_Static_0001
     * @tc.desc      newFloat32Array and sumFloat32Array with tolerance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CheckFloat32Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CheckFloat32Array_Static_0001 start');
      let arr = test_typedarray.newFloat32Array(2, 0.1f);
      let tolerance = 0.00001f;
      expect(Math.abs(arr.at(0)! - 0.1) < tolerance).assertTrue();
      expect(Math.abs(arr.at(1)! - 0.1) < tolerance).assertTrue();
      let res = test_typedarray.sumFloat32Array(arr);
      expect(Math.abs(res - 0.1 * 2) < tolerance).assertTrue();
      console.log('test_CheckFloat32Array_Static_0001 done');
      done();
      console.log('test_CheckFloat32Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_FLOAT64_STATIC_0100
     * @tc.name      test_CheckFloat64Array_Static_0001
     * @tc.desc      newFloat64Array and sumFloat64Array with tolerance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CheckFloat64Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CheckFloat64Array_Static_0001 start');
      let arr = test_typedarray.newFloat64Array(2, (0.1).toDouble());
      let tolerance = (0.00001).toDouble();
      expect(Math.abs(arr.at(0)! - 0.1) < tolerance).assertTrue();
      expect(Math.abs(arr.at(1)! - 0.1) < tolerance).assertTrue();
      let res = test_typedarray.sumFloat64Array(arr);
      expect(Math.abs(res - 0.1 * 2) < tolerance).assertTrue();
      console.log('test_CheckFloat64Array_Static_0001 done');
      done();
      console.log('test_CheckFloat64Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_CREATEUINT8_STATIC_0100
     * @tc.name      test_CreateAndPrintUint8Array_Static_0001
     * @tc.desc      createUint8Array and printUint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CreateAndPrintUint8Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CreateAndPrintUint8Array_Static_0001 start');
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      typedArrInfo.createUint8Array(arr);
      let res = typedArrInfo.printUint8Array(arr);
      let arraysAreEqual = arr.length === res.length &&
        arr.every((value, index) => value === res[index.toInt()]);
      expect(arraysAreEqual).assertTrue();
      console.log('test_CreateAndPrintUint8Array_Static_0001 done');
      done();
      console.log('test_CreateAndPrintUint8Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_SETGETUINT8_STATIC_0100
     * @tc.name      test_SetAndGetUint8Array_Static_0001
     * @tc.desc      set and get Uint8Array property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_SetAndGetUint8Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_SetAndGetUint8Array_Static_0001 start');
      typedArrInfo.Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let res = typedArrInfo.Uint8Array;
      let arr = new Uint8Array([1, 2, 3, 4, 5]);
      let arraysAreEqual = arr.length === res.length &&
        arr.every((value, index) => value === res[index.toInt()]);
      expect(arraysAreEqual).assertTrue();
      console.log('test_SetAndGetUint8Array_Static_0001 done');
      done();
      console.log('test_SetAndGetUint8Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_CREATEINT8_STATIC_0100
     * @tc.name      test_CreateAndPrintInt8Array_Static_0001
     * @tc.desc      createInt8Array and printInt8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CreateAndPrintInt8Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CreateAndPrintInt8Array_Static_0001 start');
      let arr: Int8Array = new Int8Array([1, -2, 3, -4, 5]);
      typedArrInfo.createInt8Array(arr);
      let res = typedArrInfo.printInt8Array(arr);
      let arraysAreEqual = arr.length === res.length &&
        arr.every((value, index) => value === res[index.toInt()]);
      expect(arraysAreEqual).assertTrue();
      console.log('test_CreateAndPrintInt8Array_Static_0001 done');
      done();
      console.log('test_CreateAndPrintInt8Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_SETGETINT8_STATIC_0100
     * @tc.name      test_SetAndGetInt8Array_Static_0001
     * @tc.desc      set and get Int8Array property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_SetAndGetInt8Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_SetAndGetInt8Array_Static_0001 start');
      typedArrInfo.Int8Array = new Int8Array([1, -2, 3, -4, 5]);
      let res = typedArrInfo.Int8Array;
      let arr = new Int8Array([1, -2, 3, -4, 5]);
      let arraysAreEqual = arr.length === res.length &&
        arr.every((value, index) => value === res[index.toInt()]);
      expect(arraysAreEqual).assertTrue();
      console.log('test_SetAndGetInt8Array_Static_0001 done');
      done();
      console.log('test_SetAndGetInt8Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_CREATEUINT16_STATIC_0100
     * @tc.name      test_CreateAndPrintUint16Array_Static_0001
     * @tc.desc      createUint16Array and printUint16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CreateAndPrintUint16Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CreateAndPrintUint16Array_Static_0001 start');
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      typedArrInfo.createUint16Array(arr);
      let res = typedArrInfo.printUint16Array(arr);
      let arraysAreEqual = arr.length === res.length &&
        arr.every((value, index) => value === res[index.toInt()]);
      expect(arraysAreEqual).assertTrue();
      console.log('test_CreateAndPrintUint16Array_Static_0001 done');
      done();
      console.log('test_CreateAndPrintUint16Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_SETGETUINT16_STATIC_0100
     * @tc.name      test_SetAndGetUint16Array_Static_0001
     * @tc.desc      set and get Uint16Array property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_SetAndGetUint16Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_SetAndGetUint16Array_Static_0001 start');
      typedArrInfo.Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let res = typedArrInfo.Uint16Array;
      let arr = new Uint16Array([10, 20, 30, 40, 50]);
      let arraysAreEqual = arr.length === res.length &&
        arr.every((value, index) => value === res[index.toInt()]);
      expect(arraysAreEqual).assertTrue();
      console.log('test_SetAndGetUint16Array_Static_0001 done');
      done();
      console.log('test_SetAndGetUint16Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_CREATEINT16_STATIC_0100
     * @tc.name      test_CreateAndPrintInt16Array_Static_0001
     * @tc.desc      createInt16Array and printInt16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CreateAndPrintInt16Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CreateAndPrintInt16Array_Static_0001 start');
      let arr: Int16Array = new Int16Array([10, -20, 30, -40, 50]);
      typedArrInfo.createInt16Array(arr);
      let res = typedArrInfo.printInt16Array(arr);
      let arraysAreEqual = arr.length === res.length &&
        arr.every((value, index) => value === res[index.toInt()]);
      expect(arraysAreEqual).assertTrue();
      console.log('test_CreateAndPrintInt16Array_Static_0001 done');
      done();
      console.log('test_CreateAndPrintInt16Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_SETGETINT16_STATIC_0100
     * @tc.name      test_SetAndGetInt16Array_Static_0001
     * @tc.desc      set and get Int16Array property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_SetAndGetInt16Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_SetAndGetInt16Array_Static_0001 start');
      typedArrInfo.Int16Array = new Int16Array([10, -20, 30, -40, 50]);
      let res = typedArrInfo.Int16Array;
      let arr = new Int16Array([10, -20, 30, -40, 50]);
      let arraysAreEqual = arr.length === res.length &&
        arr.every((value, index) => value === res[index.toInt()]);
      expect(arraysAreEqual).assertTrue();
      console.log('test_SetAndGetInt16Array_Static_0001 done');
      done();
      console.log('test_SetAndGetInt16Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_CREATEUINT32_STATIC_0100
     * @tc.name      test_CreateAndPrintUint32Array_Static_0001
     * @tc.desc      createUint32Array and printUint32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CreateAndPrintUint32Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CreateAndPrintUint32Array_Static_0001 start');
      let arr: Uint32Array = new Uint32Array([100, 200, 300, 400, 500]);
      typedArrInfo.createUint32Array(arr);
      let res = typedArrInfo.printUint32Array(arr);
      let arraysAreEqual = arr.length === res.length &&
        arr.every((value, index) => value === res[index.toInt()]);
      expect(arraysAreEqual).assertTrue();
      console.log('test_CreateAndPrintUint32Array_Static_0001 done');
      done();
      console.log('test_CreateAndPrintUint32Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_SETGETUINT32_STATIC_0100
     * @tc.name      test_SetAndGetUint32Array_Static_0001
     * @tc.desc      set and get Uint32Array property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_SetAndGetUint32Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_SetAndGetUint32Array_Static_0001 start');
      typedArrInfo.Uint32Array = new Uint32Array([100, 200, 300, 400, 500]);
      let res = typedArrInfo.Uint32Array;
      let arr = new Uint32Array([100, 200, 300, 400, 500]);
      let arraysAreEqual = arr.length === res.length &&
        arr.every((value, index) => value === res[index.toInt()]);
      expect(arraysAreEqual).assertTrue();
      console.log('test_SetAndGetUint32Array_Static_0001 done');
      done();
      console.log('test_SetAndGetUint32Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_CREATEINT32_STATIC_0100
     * @tc.name      test_CreateAndPrintInt32Array_Static_0001
     * @tc.desc      createInt32Array and printInt32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CreateAndPrintInt32Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CreateAndPrintInt32Array_Static_0001 start');
      let arr: Int32Array = new Int32Array([100, -200, 300, -400, 500]);
      typedArrInfo.createInt32Array(arr);
      let res = typedArrInfo.printInt32Array(arr);
      let arraysAreEqual = arr.length === res.length &&
        arr.every((value, index) => value === res[index.toInt()]);
      expect(arraysAreEqual).assertTrue();
      console.log('test_CreateAndPrintInt32Array_Static_0001 done');
      done();
      console.log('test_CreateAndPrintInt32Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_SETGETINT32_STATIC_0100
     * @tc.name      test_SetAndGetInt32Array_Static_0001
     * @tc.desc      set and get Int32Array property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_SetAndGetInt32Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_SetAndGetInt32Array_Static_0001 start');
      typedArrInfo.Int32Array = new Int32Array([100, -200, 300, -400, 500]);
      let res = typedArrInfo.Int32Array;
      let arr = new Int32Array([100, -200, 300, -400, 500]);
      let arraysAreEqual = arr.length === res.length &&
        arr.every((value, index) => value === res[index.toInt()]);
      expect(arraysAreEqual).assertTrue();
      console.log('test_SetAndGetInt32Array_Static_0001 done');
      done();
      console.log('test_SetAndGetInt32Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_CREATEUINT64_STATIC_0100
     * @tc.name      test_CreateAndPrintUint64Array_Static_0001
     * @tc.desc      createUint64Array and printUint64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CreateAndPrintUint64Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CreateAndPrintUint64Array_Static_0001 start');
      let arr: BigUint64Array = new BigUint64Array([1000n, 2000n, 3000n, 4000n, 5000n]);
      typedArrInfo.createUint64Array(arr);
      let res = typedArrInfo.printUint64Array(arr);
      let arraysAreEqual = arr.length === res.length &&
        arr.every((value, index) => value === res[index.toInt()]);
      expect(arraysAreEqual).assertTrue();
      console.log('test_CreateAndPrintUint64Array_Static_0001 done');
      done();
      console.log('test_CreateAndPrintUint64Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_SETGETUINT64_STATIC_0100
     * @tc.name      test_SetAndGetUint64Array_Static_0001
     * @tc.desc      set and get Uint64Array property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_SetAndGetUint64Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_SetAndGetUint64Array_Static_0001 start');
      typedArrInfo.Uint64Array = new BigUint64Array([1000n, 2000n, 3000n, 4000n, 5000n]);
      let res = typedArrInfo.Uint64Array;
      let arr = new BigUint64Array([1000n, 2000n, 3000n, 4000n, 5000n]);
      let arraysAreEqual = arr.length === res.length &&
        arr.every((value, index) => value === res[index.toInt()]);
      expect(arraysAreEqual).assertTrue();
      console.log('test_SetAndGetUint64Array_Static_0001 done');
      done();
      console.log('test_SetAndGetUint64Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_CREATEINT64_STATIC_0100
     * @tc.name      test_CreateAndPrintInt64Array_Static_0001
     * @tc.desc      createInt64Array and printInt64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CreateAndPrintInt64Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CreateAndPrintInt64Array_Static_0001 start');
      let arr: BigInt64Array = new BigInt64Array([1000n, -2000n, 3000n, -4000n, 5000n]);
      typedArrInfo.createInt64Array(arr);
      let res = typedArrInfo.printInt64Array(arr);
      let arraysAreEqual = arr.length === res.length &&
        arr.every((value, index) => value === res[index.toInt()]);
      expect(arraysAreEqual).assertTrue();
      console.log('test_CreateAndPrintInt64Array_Static_0001 done');
      done();
      console.log('test_CreateAndPrintInt64Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_SETGETINT64_STATIC_0100
     * @tc.name      test_SetAndGetInt64Array_Static_0001
     * @tc.desc      set and get Int64Array property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_SetAndGetInt64Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_SetAndGetInt64Array_Static_0001 start');
      typedArrInfo.Int64Array = new BigInt64Array([1000n, -2000n, 3000n, -4000n, 5000n]);
      let res = typedArrInfo.Int64Array;
      let arr = new BigInt64Array([1000n, -2000n, 3000n, -4000n, 5000n]);
      let arraysAreEqual = arr.length === res.length &&
        arr.every((value, index) => value === res[index.toInt()]);
      expect(arraysAreEqual).assertTrue();
      console.log('test_SetAndGetInt64Array_Static_0001 done');
      done();
      console.log('test_SetAndGetInt64Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_CREATEFLOAT32_STATIC_0100
     * @tc.name      test_CreateAndPrintFloat32Array_Static_0001
     * @tc.desc      createFloat32Array and printFloat32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CreateAndPrintFloat32Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CreateAndPrintFloat32Array_Static_0001 start');
      let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      typedArrInfo.createFloat32Array(arr);
      let res = typedArrInfo.printFloat32Array(arr);
      let arraysAreEqual = arr.length === res.length &&
        arr.every((value, index) => Math.abs(value - res[index.toInt()]) < 1e-6);
      expect(arraysAreEqual).assertTrue();
      console.log('test_CreateAndPrintFloat32Array_Static_0001 done');
      done();
      console.log('test_CreateAndPrintFloat32Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_SETGETFLOAT32_STATIC_0100
     * @tc.name      test_SetAndGetFloat32Array_Static_0001
     * @tc.desc      set and get Float32Array property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_SetAndGetFloat32Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_SetAndGetFloat32Array_Static_0001 start');
      typedArrInfo.Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res = typedArrInfo.Float32Array;
      let arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let arraysAreEqual = arr.length === res.length &&
        arr.every((value, index) => Math.abs(value - res[index.toInt()]) < 1e-6);
      expect(arraysAreEqual).assertTrue();
      console.log('test_SetAndGetFloat32Array_Static_0001 done');
      done();
      console.log('test_SetAndGetFloat32Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_CREATEFLOAT64_STATIC_0100
     * @tc.name      test_CreateAndPrintFloat64Array_Static_0001
     * @tc.desc      createFloat64Array and printFloat64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CreateAndPrintFloat64Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CreateAndPrintFloat64Array_Static_0001 start');
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      typedArrInfo.createFloat64Array(arr);
      let res = typedArrInfo.printFloat64Array(arr);
      let arraysAreEqual = arr.length === res.length &&
        arr.every((value, index) => Math.abs(value - res[index.toInt()]) < 1e-15);
      expect(arraysAreEqual).assertTrue();
      console.log('test_CreateAndPrintFloat64Array_Static_0001 done');
      done();
      console.log('test_CreateAndPrintFloat64Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_SETGETFLOAT64_STATIC_0100
     * @tc.name      test_SetAndGetFloat64Array_Static_0001
     * @tc.desc      set and get Float64Array property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_SetAndGetFloat64Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_SetAndGetFloat64Array_Static_0001 start');
      typedArrInfo.Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res = typedArrInfo.Float64Array;
      let arr = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let arraysAreEqual = arr.length === res.length &&
        arr.every((value, index) => Math.abs(value - res[index.toInt()]) < 1e-15);
      expect(arraysAreEqual).assertTrue();
      console.log('test_SetAndGetFloat64Array_Static_0001 done');
      done();
      console.log('test_SetAndGetFloat64Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_CONVERTINT64_STATIC_0100
     * @tc.name      test_ConvertToInt64Array_Static_0001
     * @tc.desc      convertToInt64Array combines five typed arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ConvertToInt64Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ConvertToInt64Array_Static_0001 start');
      let uint8Arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let uint16Arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let uint32Arr: Uint32Array = new Uint32Array([100, 200, 300, 400, 500]);
      let uint64Arr: BigUint64Array = new BigUint64Array([1000n, 2000n, 3000n, 4000n, 5000n]);
      let int8Arr: Int8Array = new Int8Array([1, -2, 3, -4, 5]);
      let res = typedArrInfo.convertToInt64Array(uint8Arr, uint16Arr, uint32Arr, uint64Arr, int8Arr);
      let exceptArr: BigInt64Array = new BigInt64Array([1112n, 2220n, 3336n, 4440n, 5560n]);
      let arraysAreEqual = res.length === exceptArr.length &&
        res.every((value, index) => value === exceptArr[index.toInt()]);
      expect(arraysAreEqual).assertTrue();
      console.log('test_ConvertToInt64Array_Static_0001 done');
      done();
      console.log('test_ConvertToInt64Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_CONVERTFLOAT64_STATIC_0100
     * @tc.name      test_ConvertToFloat64Array_Static_0001
     * @tc.desc      convertToFloat64Array combines five typed arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ConvertToFloat64Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ConvertToFloat64Array_Static_0001 start');
      let int16Arr: Int16Array = new Int16Array([10, -20, 30, -40, 50]);
      let int32Arr: Int32Array = new Int32Array([100, -200, 300, -400, 500]);
      let int64Arr: BigInt64Array = new BigInt64Array([1000n, -2000n, 3000n, -4000n, 5000n]);
      let float32Arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let float64Arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res = typedArrInfo.convertToFloat64Array(int16Arr, int32Arr, int64Arr, float32Arr, float64Arr);
      let exceptArr: Float64Array = new Float64Array([1112.0, -2216.0, 3336.0, -4432.0, 5560.0]);
      let arraysAreEqual = res.length === exceptArr.length &&
        res.every((value, index) => Math.abs(value - exceptArr[index.toInt()]) < 1e-6);
      expect(arraysAreEqual).assertTrue();
      console.log('test_ConvertToFloat64Array_Static_0001 done');
      done();
      console.log('test_ConvertToFloat64Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_OPTUINT8_STATIC_0100
     * @tc.name      test_GetUint8ArrayOptional_Static_0001
     * @tc.desc      getUint8ArrayOptional with and without optional
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetUint8ArrayOptional_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_GetUint8ArrayOptional_Static_0001 start');
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let res = typedArrInfo.getUint8ArrayOptional(arr);
      expect(res.length).assertEqual(5);
      for (let i = 0; i < res.length; i++) {
        expect(res[i]).assertEqual(i + 1);
      }
      let res2 = typedArrInfo.getUint8ArrayOptional(undefined);
      expect(res2.length).assertEqual(0);
      console.log('test_GetUint8ArrayOptional_Static_0001 done');
      done();
      console.log('test_GetUint8ArrayOptional_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_OPTINT8_STATIC_0100
     * @tc.name      test_GetInt8ArrayOptional_Static_0001
     * @tc.desc      getInt8ArrayOptional with and without optional
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetInt8ArrayOptional_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_GetInt8ArrayOptional_Static_0001 start');
      let arr: Int8Array = new Int8Array([1, -2, 3, -4, 5]);
      let res = typedArrInfo.getInt8ArrayOptional(arr);
      expect(res.length).assertEqual(5);
      expect(res[0]).assertEqual(1);
      expect(res[1]).assertEqual(-2);
      expect(res[4]).assertEqual(5);
      let res2 = typedArrInfo.getInt8ArrayOptional(undefined);
      expect(res2.length).assertEqual(0);
      console.log('test_GetInt8ArrayOptional_Static_0001 done');
      done();
      console.log('test_GetInt8ArrayOptional_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_OPTUINT16_STATIC_0100
     * @tc.name      test_GetUint16ArrayOptional_Static_0001
     * @tc.desc      getUint16ArrayOptional with and without optional
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetUint16ArrayOptional_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_GetUint16ArrayOptional_Static_0001 start');
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let res = typedArrInfo.getUint16ArrayOptional(arr);
      expect(res.length).assertEqual(5);
      for (let i = 0; i < res.length; i++) {
        expect(res[i]).assertEqual((i + 1) * 10);
      }
      let res2 = typedArrInfo.getUint16ArrayOptional(undefined);
      expect(res2.length).assertEqual(0);
      console.log('test_GetUint16ArrayOptional_Static_0001 done');
      done();
      console.log('test_GetUint16ArrayOptional_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_OPTINT16_STATIC_0100
     * @tc.name      test_GetInt16ArrayOptional_Static_0001
     * @tc.desc      getInt16ArrayOptional with and without optional
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetInt16ArrayOptional_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_GetInt16ArrayOptional_Static_0001 start');
      let arr: Int16Array = new Int16Array([10, -20, 30, -40, 50]);
      let res = typedArrInfo.getInt16ArrayOptional(arr);
      expect(res.length).assertEqual(5);
      expect(res[0]).assertEqual(10);
      expect(res[1]).assertEqual(-20);
      expect(res[4]).assertEqual(50);
      let res2 = typedArrInfo.getInt16ArrayOptional(undefined);
      expect(res2.length).assertEqual(0);
      console.log('test_GetInt16ArrayOptional_Static_0001 done');
      done();
      console.log('test_GetInt16ArrayOptional_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_OPTUINT32_STATIC_0100
     * @tc.name      test_GetUint32ArrayOptional_Static_0001
     * @tc.desc      getUint32ArrayOptional with and without optional
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetUint32ArrayOptional_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_GetUint32ArrayOptional_Static_0001 start');
      let arr: Uint32Array = new Uint32Array([100, 200, 300, 400, 500]);
      let res = typedArrInfo.getUint32ArrayOptional(arr);
      expect(res.length).assertEqual(5);
      for (let i = 0; i < res.length; i++) {
        expect(res[i]).assertEqual((i + 1) * 100);
      }
      let res2 = typedArrInfo.getUint32ArrayOptional(undefined);
      expect(res2.length).assertEqual(0);
      console.log('test_GetUint32ArrayOptional_Static_0001 done');
      done();
      console.log('test_GetUint32ArrayOptional_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_OPTINT32_STATIC_0100
     * @tc.name      test_GetInt32ArrayOptional_Static_0001
     * @tc.desc      getInt32ArrayOptional with and without optional
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetInt32ArrayOptional_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_GetInt32ArrayOptional_Static_0001 start');
      let arr: Int32Array = new Int32Array([100, -200, 300, -400, 500]);
      let res = typedArrInfo.getInt32ArrayOptional(arr);
      expect(res.length).assertEqual(5);
      expect(res[0]).assertEqual(100);
      expect(res[1]).assertEqual(-200);
      expect(res[4]).assertEqual(500);
      let res2 = typedArrInfo.getInt32ArrayOptional(undefined);
      expect(res2.length).assertEqual(0);
      console.log('test_GetInt32ArrayOptional_Static_0001 done');
      done();
      console.log('test_GetInt32ArrayOptional_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_OPTUINT64_STATIC_0100
     * @tc.name      test_GetUint64ArrayOptional_Static_0001
     * @tc.desc      getUint64ArrayOptional with and without optional
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetUint64ArrayOptional_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_GetUint64ArrayOptional_Static_0001 start');
      let arr: BigUint64Array = new BigUint64Array([1000n, 2000n, 3000n, 4000n, 5000n]);
      let res = typedArrInfo.getUint64ArrayOptional(arr);
      expect(res.length).assertEqual(5);
      for (let i = 0; i < res.length; i++) {
        expect(res[i]).assertEqual((i + 1) * 1000);
      }
      let res2 = typedArrInfo.getUint64ArrayOptional(undefined);
      expect(res2.length).assertEqual(0);
      console.log('test_GetUint64ArrayOptional_Static_0001 done');
      done();
      console.log('test_GetUint64ArrayOptional_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_OPTINT64_STATIC_0100
     * @tc.name      test_GetInt64ArrayOptional_Static_0001
     * @tc.desc      getInt64ArrayOptional with and without optional
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetInt64ArrayOptional_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_GetInt64ArrayOptional_Static_0001 start');
      let arr: BigInt64Array = new BigInt64Array([1000n, -2000n, 3000n, -4000n, 5000n]);
      let res = typedArrInfo.getInt64ArrayOptional(arr);
      expect(res.length).assertEqual(5);
      expect(res[0]).assertEqual(1000);
      expect(res[1]).assertEqual(-2000);
      expect(res[4]).assertEqual(5000);
      let res2 = typedArrInfo.getInt64ArrayOptional(undefined);
      expect(res2.length).assertEqual(0);
      console.log('test_GetInt64ArrayOptional_Static_0001 done');
      done();
      console.log('test_GetInt64ArrayOptional_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_OPTFLOAT32_STATIC_0100
     * @tc.name      test_GetFloat32ArrayOptional_Static_0001
     * @tc.desc      getFloat32ArrayOptional with and without optional
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetFloat32ArrayOptional_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_GetFloat32ArrayOptional_Static_0001 start');
      let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res = typedArrInfo.getFloat32ArrayOptional(arr);
      expect(res.length).assertEqual(5);
      for (let i = 0; i < res.length; i++) {
        expect(res[i]).assertEqual(i + 1);
      }
      let res2 = typedArrInfo.getFloat32ArrayOptional(undefined);
      expect(res2.length).assertEqual(0);
      console.log('test_GetFloat32ArrayOptional_Static_0001 done');
      done();
      console.log('test_GetFloat32ArrayOptional_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_OPTFLOAT64_STATIC_0100
     * @tc.name      test_GetFloat64ArrayOptional_Static_0001
     * @tc.desc      getFloat64ArrayOptional with and without optional
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetFloat64ArrayOptional_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_GetFloat64ArrayOptional_Static_0001 start');
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res = typedArrInfo.getFloat64ArrayOptional(arr);
      expect(res.length).assertEqual(5);
      for (let i = 0; i < res.length; i++) {
        expect(res[i]).assertEqual(i + 1);
      }
      let res2 = typedArrInfo.getFloat64ArrayOptional(undefined);
      expect(res2.length).assertEqual(0);
      console.log('test_GetFloat64ArrayOptional_Static_0001 done');
      done();
      console.log('test_GetFloat64ArrayOptional_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_MAPUINT8_STATIC_0100
     * @tc.name      test_MapUint8Arrays_Static_0001
     * @tc.desc      mapUint8Arrays returns map with Uint8Array value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MapUint8Arrays_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_MapUint8Arrays_Static_0001 start');
      let data: Record<string, Uint8Array> = {
        "uint8Key": new Uint8Array([1, 2, 3, 4, 5])
      };
      let res = typedArrInfo.mapUint8Arrays(data);
      expect(res.size).assertEqual(1);
      expect(res["uint8Key"]!.length).assertEqual(5);
      expect(res["uint8Key"]![0].toInt()).assertEqual(1);
      console.log('test_MapUint8Arrays_Static_0001 done');
      done();
      console.log('test_MapUint8Arrays_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_MAPINT8_STATIC_0100
     * @tc.name      test_MapInt8Arrays_Static_0001
     * @tc.desc      mapInt8Arrays returns map with Int8Array value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MapInt8Arrays_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_MapInt8Arrays_Static_0001 start');
      let data: Record<string, Int8Array> = {
        "int8Key": new Int8Array([1, -2, 3, -4, 5])
      };
      let res = typedArrInfo.mapInt8Arrays(data);
      expect(res.size).assertEqual(1);
      expect(res["int8Key"]!.length).assertEqual(5);
      expect(res["int8Key"]![0].toInt()).assertEqual(1);
      console.log('test_MapInt8Arrays_Static_0001 done');
      done();
      console.log('test_MapInt8Arrays_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_MAPUINT16_STATIC_0100
     * @tc.name      test_MapUint16Arrays_Static_0001
     * @tc.desc      mapUint16Arrays returns map with Uint16Array value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MapUint16Arrays_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_MapUint16Arrays_Static_0001 start');
      let data: Record<string, Uint16Array> = {
        "uint16Key": new Uint16Array([10, 20, 30, 40, 50])
      };
      let res = typedArrInfo.mapUint16Arrays(data);
      expect(res.size).assertEqual(1);
      expect(res["uint16Key"]!.length).assertEqual(5);
      expect(res["uint16Key"]![0].toInt()).assertEqual(10);
      console.log('test_MapUint16Arrays_Static_0001 done');
      done();
      console.log('test_MapUint16Arrays_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_MAPINT16_STATIC_0100
     * @tc.name      test_MapInt16Arrays_Static_0001
     * @tc.desc      mapInt16Arrays returns map with Int16Array value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MapInt16Arrays_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_MapInt16Arrays_Static_0001 start');
      let data: Record<string, Int16Array> = {
        "int16Key": new Int16Array([10, -20, 30, -40, 50])
      };
      let res = typedArrInfo.mapInt16Arrays(data);
      expect(res.size).assertEqual(1);
      expect(res["int16Key"]!.length).assertEqual(5);
      expect(res["int16Key"]![0].toInt()).assertEqual(10);
      console.log('test_MapInt16Arrays_Static_0001 done');
      done();
      console.log('test_MapInt16Arrays_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_MAPUINT32_STATIC_0100
     * @tc.name      test_MapUint32Arrays_Static_0001
     * @tc.desc      mapUint32Arrays returns map with Uint32Array value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MapUint32Arrays_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_MapUint32Arrays_Static_0001 start');
      let data: Record<string, Uint32Array> = {
        "uint32Key": new Uint32Array([100, 200, 300, 400, 500])
      };
      let res = typedArrInfo.mapUint32Arrays(data);
      expect(res.size).assertEqual(1);
      expect(res["uint32Key"]!.length).assertEqual(5);
      expect(res["uint32Key"]![0].toInt()).assertEqual(100);
      console.log('test_MapUint32Arrays_Static_0001 done');
      done();
      console.log('test_MapUint32Arrays_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_MAPINT32_STATIC_0100
     * @tc.name      test_MapInt32Arrays_Static_0001
     * @tc.desc      mapInt32Arrays returns map with Int32Array value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MapInt32Arrays_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_MapInt32Arrays_Static_0001 start');
      let data: Record<string, Int32Array> = {
        "int32Key": new Int32Array([100, -200, 300, -400, 500])
      };
      let res = typedArrInfo.mapInt32Arrays(data);
      expect(res.size).assertEqual(1);
      expect(res["int32Key"]!.length).assertEqual(5);
      expect(res["int32Key"]![0].toInt()).assertEqual(100);
      console.log('test_MapInt32Arrays_Static_0001 done');
      done();
      console.log('test_MapInt32Arrays_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_MAPUINT64_STATIC_0100
     * @tc.name      test_MapUint64Arrays_Static_0001
     * @tc.desc      mapUint64Arrays returns map with BigUint64Array value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MapUint64Arrays_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_MapUint64Arrays_Static_0001 start');
      let data: Record<string, BigUint64Array> = {
        "uint64Key": new BigUint64Array([1000n, 2000n, 3000n, 4000n, 5000n])
      };
      let res = typedArrInfo.mapUint64Arrays(data);
      expect(res.size).assertEqual(1);
      expect(res["uint64Key"]!.length).assertEqual(5);
      expect(res["uint64Key"]![0]).assertEqual(1000n);
      console.log('test_MapUint64Arrays_Static_0001 done');
      done();
      console.log('test_MapUint64Arrays_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_MAPINT64_STATIC_0100
     * @tc.name      test_MapInt64Arrays_Static_0001
     * @tc.desc      mapInt64Arrays returns map with BigInt64Array value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MapInt64Arrays_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_MapInt64Arrays_Static_0001 start');
      let data: Record<string, BigInt64Array> = {
        "int64Key": new BigInt64Array([1000n, -2000n, 3000n, -4000n, 5000n])
      };
      let res = typedArrInfo.mapInt64Arrays(data);
      expect(res.size).assertEqual(1);
      expect(res["int64Key"]!.length).assertEqual(5);
      expect(res["int64Key"]![0]).assertEqual(1000n);
      console.log('test_MapInt64Arrays_Static_0001 done');
      done();
      console.log('test_MapInt64Arrays_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_MAPFLOAT32_STATIC_0100
     * @tc.name      test_MapFloat32Arrays_Static_0001
     * @tc.desc      mapFloat32Arrays returns map with Float32Array value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MapFloat32Arrays_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_MapFloat32Arrays_Static_0001 start');
      let data: Record<string, Float32Array> = {
        "float32Key": new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0])
      };
      let res = typedArrInfo.mapFloat32Arrays(data);
      expect(res.size).assertEqual(1);
      expect(res["float32Key"]!.length).assertEqual(5);
      expect(res["float32Key"]![0].toInt()).assertEqual(1);
      console.log('test_MapFloat32Arrays_Static_0001 done');
      done();
      console.log('test_MapFloat32Arrays_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_MAPFLOAT64_STATIC_0100
     * @tc.name      test_MapFloat64Arrays_Static_0001
     * @tc.desc      mapFloat64Arrays returns map with Float64Array value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MapFloat64Arrays_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_MapFloat64Arrays_Static_0001 start');
      let data: Record<string, Float64Array> = {
        "float64Key": new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0])
      };
      let res = typedArrInfo.mapFloat64Arrays(data);
      expect(res.size).assertEqual(1);
      expect(res["float64Key"]!.length).assertEqual(5);
      expect(res["float64Key"]![0].toInt()).assertEqual(1);
      console.log('test_MapFloat64Arrays_Static_0001 done');
      done();
      console.log('test_MapFloat64Arrays_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_STRUCT_STATIC_0100
     * @tc.name      test_SetupStructAndPrint_Static_0001
     * @tc.desc      setupStructAndPrint with TypedArray1 struct
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_SetupStructAndPrint_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_SetupStructAndPrint_Static_0001 start');
      let a: test_typedarray.TypedArray1 = {
        a: new Uint8Array([1, 2, 3]),
        b: new Int8Array([1, -2, 3]),
        c: new Uint16Array([10, 20, 30]),
        d: new Int16Array([10, -20, 30]),
        e: new Uint32Array([100, 200, 300]),
        f: new Int32Array([100, -200, 300]),
        g: new BigUint64Array([1000n, 2000n, 3000n]),
        h: new BigInt64Array([1000n, -2000n, 3000n]),
        i: new Float32Array([1.0, 2.0, 3.0]),
        j: new Float64Array([1.0, 2.0, 3.0])
      };
      let pass: boolean = true;
      try {
        test_typedarray.setupStructAndPrint(a);
      } catch (e) {
        pass = false;
        console.log('setupStructAndPrint failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_SetupStructAndPrint_Static_0001 done');
      done();
      console.log('test_SetupStructAndPrint_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_UNION_STATIC_0100
     * @tc.name      test_MyUnion_Static_0001
     * @tc.desc      makeMyUnion and showMyUnion with all union variants
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MyUnion_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_MyUnion_Static_0001 start');
      test_typedarray.showMyUnion(null);
      let union0 = test_typedarray.makeMyUnion(0);
      expect(union0).assertEqual(null);

      let u8Arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      test_typedarray.showMyUnion(u8Arr);
      let union1 = test_typedarray.makeMyUnion(1);
      let u8Expected: Uint8Array = union1 as Uint8Array;
      expect(u8Arr.toString()).assertEqual(u8Expected.toString());

      let i8Arr: Int8Array = new Int8Array([1, -2, 3, -4, 5]);
      test_typedarray.showMyUnion(i8Arr);
      let union2 = test_typedarray.makeMyUnion(2);
      let i8Expected: Int8Array = union2 as Int8Array;
      expect(i8Arr.toString()).assertEqual(i8Expected.toString());

      let u16Arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      test_typedarray.showMyUnion(u16Arr);
      let union3 = test_typedarray.makeMyUnion(3);
      let u16Expected: Uint16Array = union3 as Uint16Array;
      expect(u16Arr.toString()).assertEqual(u16Expected.toString());

      let i16Arr: Int16Array = new Int16Array([10, -20, 30, -40, 50]);
      test_typedarray.showMyUnion(i16Arr);
      let union4 = test_typedarray.makeMyUnion(4);
      let i16Expected: Int16Array = union4 as Int16Array;
      expect(i16Arr.toString()).assertEqual(i16Expected.toString());

      let u32Arr: Uint32Array = new Uint32Array([100, 200, 300, 400, 500]);
      test_typedarray.showMyUnion(u32Arr);
      let union5 = test_typedarray.makeMyUnion(5);
      let u32Expected: Uint32Array = union5 as Uint32Array;
      expect(u32Arr.toString()).assertEqual(u32Expected.toString());

      let i32Arr: Int32Array = new Int32Array([100, -200, 300, -400, 500]);
      test_typedarray.showMyUnion(i32Arr);
      let union6 = test_typedarray.makeMyUnion(6);
      let i32Expected: Int32Array = union6 as Int32Array;
      expect(i32Arr.toString()).assertEqual(i32Expected.toString());

      let u64Arr: BigUint64Array = new BigUint64Array([1000n, 2000n, 3000n, 4000n, 5000n]);
      test_typedarray.showMyUnion(u64Arr);
      let union7 = test_typedarray.makeMyUnion(7);
      let u64Expected: BigUint64Array = union7 as BigUint64Array;
      expect(u64Arr.toString()).assertEqual(u64Expected.toString());

      let i64Arr: BigInt64Array = new BigInt64Array([1000n, -2000n, 3000n, -4000n, 5000n]);
      test_typedarray.showMyUnion(i64Arr);
      let union8 = test_typedarray.makeMyUnion(8);
      let i64Expected: BigInt64Array = union8 as BigInt64Array;
      expect(i64Arr.toString()).assertEqual(i64Expected.toString());

      let f32Arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      test_typedarray.showMyUnion(f32Arr);
      let union9 = test_typedarray.makeMyUnion(9);
      let f32Expected: Float32Array = union9 as Float32Array;
      expect(f32Arr.toString()).assertEqual(f32Expected.toString());

      let f64Arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      test_typedarray.showMyUnion(f64Arr);
      let union10 = test_typedarray.makeMyUnion(10);
      let f64Expected: Float64Array = union10 as Float64Array;
      expect(f64Arr.toString()).assertEqual(f64Expected.toString());
      console.log('test_MyUnion_Static_0001 done');
      done();
      console.log('test_MyUnion_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_MODIFYINT8_STATIC_0100
     * @tc.name      test_ModifyInt8Array_Static_0001
     * @tc.desc      modifyInt8Array increments elements in place
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ModifyInt8Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ModifyInt8Array_Static_0001 start');
      let arr = new Int8Array([-2, -1, 0, 1, 2]);
      let arrCopy = new Int8Array(arr);
      test_typedarray.modifyInt8Array(arr);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(arrCopy[i] + 1);
      }
      console.log('test_ModifyInt8Array_Static_0001 done');
      done();
      console.log('test_ModifyInt8Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_MODIFYINT16_STATIC_0100
     * @tc.name      test_ModifyInt16Array_Static_0001
     * @tc.desc      modifyInt16Array increments elements in place
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ModifyInt16Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ModifyInt16Array_Static_0001 start');
      let arr = new Int16Array([-20, -10, 0, 10, 20]);
      let arrCopy = new Int16Array(arr);
      test_typedarray.modifyInt16Array(arr);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(arrCopy[i] + 1);
      }
      console.log('test_ModifyInt16Array_Static_0001 done');
      done();
      console.log('test_ModifyInt16Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_MODIFYINT32_STATIC_0100
     * @tc.name      test_ModifyInt32Array_Static_0001
     * @tc.desc      modifyInt32Array increments elements in place
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ModifyInt32Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ModifyInt32Array_Static_0001 start');
      let arr = new Int32Array([-200, -100, 0, 100, 200]);
      let arrCopy = new Int32Array(arr);
      test_typedarray.modifyInt32Array(arr);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(arrCopy[i] + 1);
      }
      console.log('test_ModifyInt32Array_Static_0001 done');
      done();
      console.log('test_ModifyInt32Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_MODIFYINT64_STATIC_0100
     * @tc.name      test_ModifyInt64Array_Static_0001
     * @tc.desc      modifyInt64Array increments elements in place
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ModifyInt64Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ModifyInt64Array_Static_0001 start');
      let arr = new BigInt64Array([-2000n, -1000n, 0n, 1000n, 2000n]);
      let arrCopy = new BigInt64Array(arr);
      test_typedarray.modifyInt64Array(arr);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(arrCopy[i] + 1n);
      }
      console.log('test_ModifyInt64Array_Static_0001 done');
      done();
      console.log('test_ModifyInt64Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_MODIFYUINT8_STATIC_0100
     * @tc.name      test_ModifyUint8Array_Static_0001
     * @tc.desc      modifyUint8Array increments elements in place
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ModifyUint8Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ModifyUint8Array_Static_0001 start');
      let arr = new Uint8Array([0, 1, 2, 3, 4]);
      let arrCopy = new Uint8Array(arr);
      test_typedarray.modifyUint8Array(arr);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(arrCopy[i] + 1);
      }
      console.log('test_ModifyUint8Array_Static_0001 done');
      done();
      console.log('test_ModifyUint8Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_MODIFYUINT16_STATIC_0100
     * @tc.name      test_ModifyUint16Array_Static_0001
     * @tc.desc      modifyUint16Array increments elements in place
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ModifyUint16Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ModifyUint16Array_Static_0001 start');
      let arr = new Uint16Array([0, 10, 20, 30, 40]);
      let arrCopy = new Uint16Array(arr);
      test_typedarray.modifyUint16Array(arr);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(arrCopy[i] + 1);
      }
      console.log('test_ModifyUint16Array_Static_0001 done');
      done();
      console.log('test_ModifyUint16Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_MODIFYUINT32_STATIC_0100
     * @tc.name      test_ModifyUint32Array_Static_0001
     * @tc.desc      modifyUint32Array increments elements in place
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ModifyUint32Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ModifyUint32Array_Static_0001 start');
      let arr = new Uint32Array([0, 100, 200, 300, 400]);
      let arrCopy = new Uint32Array(arr);
      test_typedarray.modifyUint32Array(arr);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(arrCopy[i] + 1);
      }
      console.log('test_ModifyUint32Array_Static_0001 done');
      done();
      console.log('test_ModifyUint32Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_MODIFYUINT64_STATIC_0100
     * @tc.name      test_ModifyUint64Array_Static_0001
     * @tc.desc      modifyUint64Array increments elements in place
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ModifyUint64Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ModifyUint64Array_Static_0001 start');
      let arr = new BigUint64Array([0n, 1000n, 2000n, 3000n, 4000n]);
      let arrCopy = new BigUint64Array(arr);
      test_typedarray.modifyUint64Array(arr);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(arrCopy[i] + 1n);
      }
      console.log('test_ModifyUint64Array_Static_0001 done');
      done();
      console.log('test_ModifyUint64Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_MODIFYFLOAT32_STATIC_0100
     * @tc.name      test_ModifyFloat32Array_Static_0001
     * @tc.desc      modifyFloat32Array negates elements in place
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ModifyFloat32Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ModifyFloat32Array_Static_0001 start');
      let arr = new Float32Array([0.0, 1.0, 2.0, 3.0, 4.0]);
      let arrCopy = new Float32Array(arr);
      test_typedarray.modifyFloat32Array(arr);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(-arrCopy[i]);
      }
      console.log('test_ModifyFloat32Array_Static_0001 done');
      done();
      console.log('test_ModifyFloat32Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_TypedArray_MODIFYFLOAT64_STATIC_0100
     * @tc.name      test_ModifyFloat64Array_Static_0001
     * @tc.desc      modifyFloat64Array negates elements in place
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ModifyFloat64Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ModifyFloat64Array_Static_0001 start');
      let arr = new Float64Array([0.0, 1.0, 2.0, 3.0, 4.0]);
      let arrCopy = new Float64Array(arr);
      test_typedarray.modifyFloat64Array(arr);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(-arrCopy[i]);
      }
      console.log('test_ModifyFloat64Array_Static_0001 done');
      done();
      console.log('test_ModifyFloat64Array_Static_0001 end');
    });
  })
}
