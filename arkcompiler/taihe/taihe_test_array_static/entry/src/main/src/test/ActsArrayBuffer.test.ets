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
import * as test_arraybuffer from '../ets/arraybuffer_test'

export default function arrayBufferTest(): void {
  describe("ActsArrayBufferTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_ArrayBuffer_INPUT_STATIC_0100
     * @tc.name      test_ArrayBufferInput_Static_0001
     * @tc.desc      sumArrayU8 with ArrayBuffer input returns u8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayBufferInput_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayBufferInput_Static_0001 start');
      let numbersU8: byte[] = [1, 2, 3, 4, 5];
      let arrbuf1: ArrayBuffer = new ArrayBuffer(numbersU8.length);
      for (let i = 0; i < numbersU8.length; i++) {
        arrbuf1.set(i, numbersU8[i]);
      }
      let sum = test_arraybuffer.sumArrayU8(arrbuf1);
      expect(sum).assertEqual((15).toByte());
      console.log('test_ArrayBufferInput_Static_0001 done');
      done();
      console.log('test_ArrayBufferInput_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayBuffer_RETURN_STATIC_0100
     * @tc.name      test_ArrayBufferReturn_Static_0001
     * @tc.desc      getArrayBuffer with u8 input returns ArrayBuffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayBufferReturn_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayBufferReturn_Static_0001 start');
      let arrbuf = test_arraybuffer.getArrayBuffer((4).toByte());
      expect(arrbuf.getByteLength()).assertEqual(4);
      for (let i = 0; i < arrbuf.getByteLength(); i++) {
        expect(arrbuf.at(i)).assertEqual((4).toByte());
      }
      console.log('test_ArrayBufferReturn_Static_0001 done');
      done();
      console.log('test_ArrayBufferReturn_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayBuffer_INOUT_STATIC_0100
     * @tc.name      test_ArrayBufferInout_Static_0001
     * @tc.desc      doubleArrayBuffer doubles bytes of input ArrayBuffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayBufferInout_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayBufferInout_Static_0001 start');
      let numbers2: byte[] = [3, 4, 5, 6, 7];
      let arrbuf3: ArrayBuffer = new ArrayBuffer(numbers2.length);
      for (let i = 0; i < numbers2.length; i++) {
        arrbuf3.set(i, numbers2[i]);
      }
      let res = test_arraybuffer.doubleArrayBuffer(arrbuf3);
      expect(res.getByteLength()).assertEqual(5);
      for (let i = 0; i < res.getByteLength(); i++) {
        expect(res.at(i)).assertEqual((numbers2[i] * 2).toByte());
      }
      console.log('test_ArrayBufferInout_Static_0001 done');
      done();
      console.log('test_ArrayBufferInout_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayBuffer_UINT8TOBUFFER_STATIC_0100
     * @tc.name      test_ArrayBufferUint8ToBuffer_Static_0001
     * @tc.desc      convert Uint8Array to ArrayBuffer and sum it
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayBufferUint8ToBuffer_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayBufferUint8ToBuffer_Static_0001 start');
      let uint8Array = new Uint8Array([2, 3, 4, 5, 6]);
      let arrbuf4: ArrayBuffer = uint8Array.buffer as ArrayBuffer;
      expect(arrbuf4.getByteLength()).assertEqual(uint8Array.length);
      for (let i = 0; i < arrbuf4.getByteLength(); i++) {
        expect(arrbuf4.at(i).toInt()).assertEqual(uint8Array[i].toInt());
      }
      let sum = test_arraybuffer.sumArrayU8(arrbuf4);
      expect(sum).assertEqual((20).toByte());
      console.log('test_ArrayBufferUint8ToBuffer_Static_0001 done');
      done();
      console.log('test_ArrayBufferUint8ToBuffer_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayBuffer_DATAVIEW_STATIC_0100
     * @tc.name      test_ArrayBufferDataView_Static_0001
     * @tc.desc      fill ArrayBuffer via DataView and sum it
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayBufferDataView_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayBufferDataView_Static_0001 start');
      let uint8ArrayData: Uint8Array = new Uint8Array([8, 9, 10]);
      let arrayBufferFromUint8Array: ArrayBuffer = new ArrayBuffer(uint8ArrayData.length);
      let view = new DataView(arrayBufferFromUint8Array);
      for (let i = 0; i < uint8ArrayData.length; i++) {
        view.setUint8(i, uint8ArrayData[i]);
      }
      for (let i = 0; i < uint8ArrayData.length; i++) {
        expect(view.getUint8(i).toInt()).assertEqual(uint8ArrayData[i].toInt());
      }
      let sum = test_arraybuffer.sumArrayU8(arrayBufferFromUint8Array);
      expect(sum).assertEqual((27).toByte());
      console.log('test_ArrayBufferDataView_Static_0001 done');
      done();
      console.log('test_ArrayBufferDataView_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayI8_INPUT_STATIC_0100
     * @tc.name      test_ArrayI8Input_Static_0001
     * @tc.desc      sumArrayI8 with byte array input
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayI8Input_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayI8Input_Static_0001 start');
      let int8Array: byte[] = [1, 2, 3, 4, 5];
      let sum = test_arraybuffer.sumArrayI8(int8Array);
      expect(sum).assertEqual((15).toByte());
      console.log('test_ArrayI8Input_Static_0001 done');
      done();
      console.log('test_ArrayI8Input_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayI8_RETURN_STATIC_0100
     * @tc.name      test_ArrayI8Return_Static_0001
     * @tc.desc      getArrayI8 returns byte array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayI8Return_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayI8Return_Static_0001 start');
      let arr = test_arraybuffer.getArrayI8((4).toByte());
      expect(arr.length).assertEqual(4);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual((4).toByte());
      }
      console.log('test_ArrayI8Return_Static_0001 done');
      done();
      console.log('test_ArrayI8Return_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayI8_INOUT_STATIC_0100
     * @tc.name      test_ArrayI8Inout_Static_0001
     * @tc.desc      doubleI8 doubles byte array elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayI8Inout_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayI8Inout_Static_0001 start');
      let numbers2: byte[] = [3, 4, 5, 6, 7];
      let res = test_arraybuffer.doubleI8(numbers2);
      expect(res.length).assertEqual(5);
      for (let i = 0; i < res.length; i++) {
        expect(res[i]).assertEqual((numbers2[i] * 2).toByte());
      }
      console.log('test_ArrayI8Inout_Static_0001 done');
      done();
      console.log('test_ArrayI8Inout_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayI16_INPUT_STATIC_0100
     * @tc.name      test_ArrayI16Input_Static_0001
     * @tc.desc      sumArrayI16 with short array input
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayI16Input_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayI16Input_Static_0001 start');
      let int16Array: short[] = [1, 2, 3, 4, 5];
      let sum = test_arraybuffer.sumArrayI16(int16Array);
      expect(sum).assertEqual((15).toShort());
      console.log('test_ArrayI16Input_Static_0001 done');
      done();
      console.log('test_ArrayI16Input_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayI16_RETURN_STATIC_0100
     * @tc.name      test_ArrayI16Return_Static_0001
     * @tc.desc      getArrayI16 returns short array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayI16Return_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayI16Return_Static_0001 start');
      let arr = test_arraybuffer.getArrayI16((4).toShort());
      expect(arr.length).assertEqual(4);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual((4).toShort());
      }
      console.log('test_ArrayI16Return_Static_0001 done');
      done();
      console.log('test_ArrayI16Return_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayI16_INOUT_STATIC_0100
     * @tc.name      test_ArrayI16Inout_Static_0001
     * @tc.desc      doubleI16 doubles short array elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayI16Inout_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayI16Inout_Static_0001 start');
      let numbers2: short[] = [3, 4, 5, 6, 7];
      let res = test_arraybuffer.doubleI16(numbers2);
      expect(res.length).assertEqual(5);
      for (let i = 0; i < res.length; i++) {
        expect(res[i]).assertEqual((numbers2[i] * 2).toShort());
      }
      console.log('test_ArrayI16Inout_Static_0001 done');
      done();
      console.log('test_ArrayI16Inout_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayI32_INPUT_STATIC_0100
     * @tc.name      test_ArrayI32Input_Static_0001
     * @tc.desc      sumArrayI32 with int array input
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayI32Input_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayI32Input_Static_0001 start');
      let int32Array: int[] = [1, 2, 3, 4, 5];
      let sum = test_arraybuffer.sumArrayI32(int32Array);
      expect(sum).assertEqual(15);
      console.log('test_ArrayI32Input_Static_0001 done');
      done();
      console.log('test_ArrayI32Input_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayI32_RETURN_STATIC_0100
     * @tc.name      test_ArrayI32Return_Static_0001
     * @tc.desc      getArrayI32 returns int array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayI32Return_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayI32Return_Static_0001 start');
      let arr = test_arraybuffer.getArrayI32(4);
      expect(arr.length).assertEqual(4);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(4);
      }
      console.log('test_ArrayI32Return_Static_0001 done');
      done();
      console.log('test_ArrayI32Return_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayI32_INOUT_STATIC_0100
     * @tc.name      test_ArrayI32Inout_Static_0001
     * @tc.desc      doubleI32 doubles int array elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayI32Inout_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayI32Inout_Static_0001 start');
      let numbers2: int[] = [3, 4, 5, 6, 7];
      let res = test_arraybuffer.doubleI32(numbers2);
      expect(res.length).assertEqual(5);
      for (let i = 0; i < res.length; i++) {
        expect(res[i]).assertEqual(numbers2[i] * 2);
      }
      console.log('test_ArrayI32Inout_Static_0001 done');
      done();
      console.log('test_ArrayI32Inout_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayI64_INPUT_STATIC_0100
     * @tc.name      test_ArrayI64Input_Static_0001
     * @tc.desc      sumArrayI64 with long array input
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayI64Input_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayI64Input_Static_0001 start');
      let int64Array: long[] = [10, 20, 30, 40, 50];
      let sum = test_arraybuffer.sumArrayI64(int64Array);
      expect(sum).assertEqual((150).toLong());
      console.log('test_ArrayI64Input_Static_0001 done');
      done();
      console.log('test_ArrayI64Input_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayI64_RETURN_STATIC_0100
     * @tc.name      test_ArrayI64Return_Static_0001
     * @tc.desc      getArrayI64 returns long array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayI64Return_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayI64Return_Static_0001 start');
      let arr = test_arraybuffer.getArrayI64(4);
      expect(arr.length).assertEqual(4);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual((4).toLong());
      }
      console.log('test_ArrayI64Return_Static_0001 done');
      done();
      console.log('test_ArrayI64Return_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayI64_INOUT_STATIC_0100
     * @tc.name      test_ArrayI64Inout_Static_0001
     * @tc.desc      doubleI64 doubles long array elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayI64Inout_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayI64Inout_Static_0001 start');
      let numbers2: long[] = [30, 40, 50, 60, 70];
      let res = test_arraybuffer.doubleI64(numbers2);
      expect(res.length).assertEqual(5);
      for (let i = 0; i < res.length; i++) {
        expect(res[i]).assertEqual(numbers2[i] * 2);
      }
      console.log('test_ArrayI64Inout_Static_0001 done');
      done();
      console.log('test_ArrayI64Inout_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayF32_INPUT_STATIC_0100
     * @tc.name      test_ArrayF32Input_Static_0001
     * @tc.desc      sumArrayF32 with float array input
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayF32Input_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayF32Input_Static_0001 start');
      let f32Array: float[] = [10, 20, 30, 40, 50];
      let sum = test_arraybuffer.sumArrayF32(f32Array);
      expect(sum).assertEqual(150.0f);
      console.log('test_ArrayF32Input_Static_0001 done');
      done();
      console.log('test_ArrayF32Input_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayF32_RETURN_STATIC_0100
     * @tc.name      test_ArrayF32Return_Static_0001
     * @tc.desc      getArrayF32 returns float array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayF32Return_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayF32Return_Static_0001 start');
      let arr = test_arraybuffer.getArrayF32(4);
      expect(arr.length).assertEqual(4);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(4.0f);
      }
      console.log('test_ArrayF32Return_Static_0001 done');
      done();
      console.log('test_ArrayF32Return_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayF32_INOUT_STATIC_0100
     * @tc.name      test_ArrayF32Inout_Static_0001
     * @tc.desc      doubleF32 doubles float array elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayF32Inout_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayF32Inout_Static_0001 start');
      let numbers2: float[] = [30, 40, 50, 60, 70];
      let res = test_arraybuffer.doubleF32(numbers2);
      expect(res.length).assertEqual(5);
      for (let i = 0; i < res.length; i++) {
        expect(res[i]).assertEqual(numbers2[i] * 2);
      }
      console.log('test_ArrayF32Inout_Static_0001 done');
      done();
      console.log('test_ArrayF32Inout_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayF64_INPUT_STATIC_0100
     * @tc.name      test_ArrayF64Input_Static_0001
     * @tc.desc      sumArrayF64 with double array input
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayF64Input_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayF64Input_Static_0001 start');
      let f64Array: double[] = [10, 20, 30, 40, 50];
      let sum = test_arraybuffer.sumArrayF64(f64Array);
      expect(sum).assertEqual(150.0);
      console.log('test_ArrayF64Input_Static_0001 done');
      done();
      console.log('test_ArrayF64Input_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayF64_RETURN_STATIC_0100
     * @tc.name      test_ArrayF64Return_Static_0001
     * @tc.desc      getArrayF64 returns double array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayF64Return_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayF64Return_Static_0001 start');
      let arr = test_arraybuffer.getArrayF64(4);
      expect(arr.length).assertEqual(4);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(4.0);
      }
      console.log('test_ArrayF64Return_Static_0001 done');
      done();
      console.log('test_ArrayF64Return_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayF64_INOUT_STATIC_0100
     * @tc.name      test_ArrayF64Inout_Static_0001
     * @tc.desc      doubleF64 doubles double array elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayF64Inout_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayF64Inout_Static_0001 start');
      let numbers2: double[] = [30, 40, 50, 60, 70];
      let res = test_arraybuffer.doubleF64(numbers2);
      expect(res.length).assertEqual(5);
      for (let i = 0; i < res.length; i++) {
        expect(res[i]).assertEqual(numbers2[i] * 2);
      }
      console.log('test_ArrayF64Inout_Static_0001 done');
      done();
      console.log('test_ArrayF64Inout_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Int8Array_INOUT_STATIC_0100
     * @tc.name      test_Int8ArrayInout_Static_0001
     * @tc.desc      doubleInt8Array doubles Int8Array elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Int8ArrayInout_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Int8ArrayInout_Static_0001 start');
      let buf: Int8Array = new Int8Array([10, 20, 30, 60]);
      let ret = test_arraybuffer.doubleInt8Array(buf);
      for (let i = 0; i < ret.length; i++) {
        expect(ret[i]).assertEqual(buf[i] * 2);
      }
      console.log('test_Int8ArrayInout_Static_0001 done');
      done();
      console.log('test_Int8ArrayInout_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Int16Array_INOUT_STATIC_0100
     * @tc.name      test_Int16ArrayInout_Static_0001
     * @tc.desc      doubleInt16Array doubles Int16Array elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Int16ArrayInout_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Int16ArrayInout_Static_0001 start');
      let buf: Int16Array = new Int16Array([1000, 2000, 3000, 4000]);
      let ret = test_arraybuffer.doubleInt16Array(buf);
      for (let i = 0; i < ret.length; i++) {
        expect(ret[i]).assertEqual(buf[i] * 2);
      }
      console.log('test_Int16ArrayInout_Static_0001 done');
      done();
      console.log('test_Int16ArrayInout_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Int32Array_INOUT_STATIC_0100
     * @tc.name      test_Int32ArrayInout_Static_0001
     * @tc.desc      doubleInt32Array doubles Int32Array elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Int32ArrayInout_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Int32ArrayInout_Static_0001 start');
      let buf: Int32Array = new Int32Array([100000, 200000, 300000, 400000]);
      let ret = test_arraybuffer.doubleInt32Array(buf);
      for (let i = 0; i < ret.length; i++) {
        expect(ret[i]).assertEqual(buf[i] * 2);
      }
      console.log('test_Int32ArrayInout_Static_0001 done');
      done();
      console.log('test_Int32ArrayInout_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Uint8Array_INOUT_STATIC_0100
     * @tc.name      test_Uint8ArrayInout_Static_0001
     * @tc.desc      doubleUint8Array doubles Uint8Array elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Uint8ArrayInout_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Uint8ArrayInout_Static_0001 start');
      let buf: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      let ret = test_arraybuffer.doubleUint8Array(buf);
      for (let i = 0; i < ret.length; i++) {
        expect(ret[i]).assertEqual(buf[i] * 2);
      }
      console.log('test_Uint8ArrayInout_Static_0001 done');
      done();
      console.log('test_Uint8ArrayInout_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Uint16Array_INOUT_STATIC_0100
     * @tc.name      test_Uint16ArrayInout_Static_0001
     * @tc.desc      doubleUint16Array doubles Uint16Array elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Uint16ArrayInout_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Uint16ArrayInout_Static_0001 start');
      let buf: Uint16Array = new Uint16Array([1000, 2000, 3000, 4000]);
      let ret = test_arraybuffer.doubleUint16Array(buf);
      for (let i = 0; i < ret.length; i++) {
        expect(ret[i]).assertEqual(buf[i] * 2);
      }
      console.log('test_Uint16ArrayInout_Static_0001 done');
      done();
      console.log('test_Uint16ArrayInout_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Uint32Array_INOUT_STATIC_0100
     * @tc.name      test_Uint32ArrayInout_Static_0001
     * @tc.desc      doubleUint32Array doubles Uint32Array elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Uint32ArrayInout_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Uint32ArrayInout_Static_0001 start');
      let buf: Uint32Array = new Uint32Array([100000, 200000, 300000, 400000]);
      let ret = test_arraybuffer.doubleUint32Array(buf);
      for (let i = 0; i < ret.length; i++) {
        expect(ret[i]).assertEqual(buf[i] * 2);
      }
      console.log('test_Uint32ArrayInout_Static_0001 done');
      done();
      console.log('test_Uint32ArrayInout_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayBuffer_MODIFY_STATIC_0100
     * @tc.name      test_ArrayBufferModify_Static_0001
     * @tc.desc      modifyArrayBuffer negates bytes in place
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayBufferModify_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ArrayBufferModify_Static_0001 start');
      let numbers: byte[] = [1, 2, 3, 4, 5];
      let arrbuf: ArrayBuffer = new ArrayBuffer(numbers.length);
      for (let i = 0; i < numbers.length; i++) {
        arrbuf.set(i, numbers[i]);
      }
      test_arraybuffer.modifyArrayBuffer(arrbuf);
      for (let i = 0; i < arrbuf.getByteLength(); i++) {
        expect(arrbuf.at(i)).assertEqual((~numbers[i]).toByte());
      }
      console.log('test_ArrayBufferModify_Static_0001 done');
      done();
      console.log('test_ArrayBufferModify_Static_0001 end');
    });
  })
}
