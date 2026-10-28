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
import { BusinessError } from '@ohos.base';
import * as test_array from '../ets/Index'

export default function arrayPromiseTest(): void {
  describe("ActsArrayPromiseTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    let arrayPromiseI8: test_array.ArrayPromiseI8 = test_array.getArrayPromiseI8();
    let arrayPromiseI16: test_array.ArrayPromiseI16 = test_array.getArrayPromiseI16();
    let arrayPromiseI32: test_array.ArrayPromiseI32 = test_array.getArrayPromiseI32();
    let arrayPromiseI64: test_array.ArrayPromiseI64 = test_array.getArrayPromiseI64();
    let arrayPromiseF32: test_array.ArrayPromiseF32 = test_array.getArrayPromiseF32();
    let arrayPromiseF64: test_array.ArrayPromiseF64 = test_array.getArrayPromiseF64();
    let arrayPromiseString: test_array.ArrayPromiseString = test_array.getArrayPromiseString();
    let arrayPromiseBool: test_array.ArrayPromiseBool = test_array.getArrayPromiseBool();
    let arrayPromiseU8: test_array.ArrayPromiseU8 = test_array.getArrayPromiseU8();
    let arrayPromiseU16: test_array.ArrayPromiseU16 = test_array.getArrayPromiseU16();

    /**
     * @tc.number    SUB_Taihe_ArrayPromiseI8_SYNC_STATIC_0100
     * @tc.name      test_FetchDataI8_Static_0001
     * @tc.desc      ArrayPromiseI8 sync fetchDataI8 returns byte array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FetchDataI8_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FetchDataI8_Static_0001 start');
      let info = arrayPromiseI8.fetchDataI8();
      expect(info[0]).assertEqual((-128).toByte());
      expect(info[1]).assertEqual((0).toByte());
      expect(info[2]).assertEqual((127).toByte());
      console.log('test_FetchDataI8_Static_0001 done');
      done();
      console.log('test_FetchDataI8_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayPromiseI8_PROMISE_STATIC_0100
     * @tc.name      test_FetchDataI8Promise_Static_0001
     * @tc.desc      ArrayPromiseI8 promise fetchData returns byte array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FetchDataI8Promise_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FetchDataI8Promise_Static_0001 start');
      let info = await arrayPromiseI8.fetchData();
      expect(info[0]).assertEqual((-128).toByte());
      expect(info[1]).assertEqual((0).toByte());
      expect(info[2]).assertEqual((127).toByte());
      console.log('test_FetchDataI8Promise_Static_0001 done');
      done();
      console.log('test_FetchDataI8Promise_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayPromiseI8_ASYNC_STATIC_0100
     * @tc.name      test_FetchDataI8Async_Static_0001
     * @tc.desc      ArrayPromiseI8 async fetchData with callback returns byte array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FetchDataI8Async_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FetchDataI8Async_Static_0001 start');
      let info: byte[] = [];
      await new Promise<byte[]>((resolve, reject): void => {
        arrayPromiseI8.fetchData((error: BusinessError | null, data?: Array<byte>): void => {
          if (error !== null && error.code !== 0) {
            reject(error as Error);
          } else {
            info = data!;
            resolve(info);
          }
        });
      });
      expect(info[0]).assertEqual((-128).toByte());
      expect(info[1]).assertEqual((0).toByte());
      expect(info[2]).assertEqual((127).toByte());
      console.log('test_FetchDataI8Async_Static_0001 done');
      done();
      console.log('test_FetchDataI8Async_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayPromiseI16_SYNC_STATIC_0100
     * @tc.name      test_FetchDataI16_Static_0001
     * @tc.desc      ArrayPromiseI16 sync fetchDataI16 returns short array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FetchDataI16_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FetchDataI16_Static_0001 start');
      let info = arrayPromiseI16.fetchDataI16();
      expect(info[0]).assertEqual((-32768).toShort());
      expect(info[1]).assertEqual((0).toShort());
      expect(info[2]).assertEqual((32767).toShort());
      console.log('test_FetchDataI16_Static_0001 done');
      done();
      console.log('test_FetchDataI16_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayPromiseI16_PROMISE_STATIC_0100
     * @tc.name      test_FetchDataI16Promise_Static_0001
     * @tc.desc      ArrayPromiseI16 promise fetchData returns short array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FetchDataI16Promise_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FetchDataI16Promise_Static_0001 start');
      let info = await arrayPromiseI16.fetchData();
      expect(info[0]).assertEqual((-32768).toShort());
      expect(info[1]).assertEqual((0).toShort());
      expect(info[2]).assertEqual((32767).toShort());
      console.log('test_FetchDataI16Promise_Static_0001 done');
      done();
      console.log('test_FetchDataI16Promise_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayPromiseI16_ASYNC_STATIC_0100
     * @tc.name      test_FetchDataI16Async_Static_0001
     * @tc.desc      ArrayPromiseI16 async fetchData with callback returns short array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FetchDataI16Async_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FetchDataI16Async_Static_0001 start');
      let info: short[] = [];
      await new Promise<short[]>((resolve, reject): void => {
        arrayPromiseI16.fetchData((error: BusinessError | null, data?: Array<short>): void => {
          if (error !== null && error.code !== 0) {
            reject(error as Error);
          } else {
            info = data!;
            resolve(info);
          }
        });
      });
      expect(info[0]).assertEqual((-32768).toShort());
      expect(info[1]).assertEqual((0).toShort());
      expect(info[2]).assertEqual((32767).toShort());
      console.log('test_FetchDataI16Async_Static_0001 done');
      done();
      console.log('test_FetchDataI16Async_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayPromiseI32_SYNC_STATIC_0100
     * @tc.name      test_FetchDataI32_Static_0001
     * @tc.desc      ArrayPromiseI32 sync fetchDataI32 returns int array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FetchDataI32_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FetchDataI32_Static_0001 start');
      let info = arrayPromiseI32.fetchDataI32();
      expect(info[0]).assertEqual(-2147483648);
      expect(info[1]).assertEqual(0);
      expect(info[2]).assertEqual(2147483647);
      console.log('test_FetchDataI32_Static_0001 done');
      done();
      console.log('test_FetchDataI32_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayPromiseI32_PROMISE_STATIC_0100
     * @tc.name      test_FetchDataI32Promise_Static_0001
     * @tc.desc      ArrayPromiseI32 promise fetchData returns int array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FetchDataI32Promise_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FetchDataI32Promise_Static_0001 start');
      let info = await arrayPromiseI32.fetchData();
      expect(info[0]).assertEqual(-2147483648);
      expect(info[1]).assertEqual(0);
      expect(info[2]).assertEqual(2147483647);
      console.log('test_FetchDataI32Promise_Static_0001 done');
      done();
      console.log('test_FetchDataI32Promise_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayPromiseI32_ASYNC_STATIC_0100
     * @tc.name      test_FetchDataI32Async_Static_0001
     * @tc.desc      ArrayPromiseI32 async fetchData with callback returns int array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FetchDataI32Async_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FetchDataI32Async_Static_0001 start');
      let info: int[] = [];
      await new Promise<int[]>((resolve, reject): void => {
        arrayPromiseI32.fetchData((error: BusinessError | null, data?: Array<int>): void => {
          if (error !== null && error.code !== 0) {
            reject(error as Error);
          } else {
            info = data!;
            resolve(info);
          }
        });
      });
      expect(info[0]).assertEqual(-2147483648);
      expect(info[1]).assertEqual(0);
      expect(info[2]).assertEqual(2147483647);
      console.log('test_FetchDataI32Async_Static_0001 done');
      done();
      console.log('test_FetchDataI32Async_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayPromiseI64_SYNC_STATIC_0100
     * @tc.name      test_FetchDataI64_Static_0001
     * @tc.desc      ArrayPromiseI64 sync fetchDataI64 returns long array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FetchDataI64_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FetchDataI64_Static_0001 start');
      let info = arrayPromiseI64.fetchDataI64();
      expect(info[0]).assertEqual((-9223372036854775807).toLong());
      expect(info[1]).assertEqual((0).toLong());
      expect(info[2]).assertEqual((9223372036854775807).toLong());
      console.log('test_FetchDataI64_Static_0001 done');
      done();
      console.log('test_FetchDataI64_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayPromiseI64_PROMISE_STATIC_0100
     * @tc.name      test_FetchDataI64Promise_Static_0001
     * @tc.desc      ArrayPromiseI64 promise fetchData returns long array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FetchDataI64Promise_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FetchDataI64Promise_Static_0001 start');
      let info = await arrayPromiseI64.fetchData();
      expect(info[0]).assertEqual((-9223372036854775807).toLong());
      expect(info[1]).assertEqual((0).toLong());
      expect(info[2]).assertEqual((9223372036854775807).toLong());
      console.log('test_FetchDataI64Promise_Static_0001 done');
      done();
      console.log('test_FetchDataI64Promise_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayPromiseI64_ASYNC_STATIC_0100
     * @tc.name      test_FetchDataI64Async_Static_0001
     * @tc.desc      ArrayPromiseI64 async fetchData with callback returns long array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FetchDataI64Async_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FetchDataI64Async_Static_0001 start');
      let info: long[] = [];
      await new Promise<long[]>((resolve, reject): void => {
        arrayPromiseI64.fetchData((error: BusinessError | null, data?: Array<long>): void => {
          if (error !== null && error.code !== 0) {
            reject(error as Error);
          } else {
            info = data!;
            resolve(info);
          }
        });
      });
      expect(info[0]).assertEqual((-9223372036854775807).toLong());
      expect(info[1]).assertEqual((0).toLong());
      expect(info[2]).assertEqual((9223372036854775807).toLong());
      console.log('test_FetchDataI64Async_Static_0001 done');
      done();
      console.log('test_FetchDataI64Async_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayPromiseF32_SYNC_STATIC_0100
     * @tc.name      test_FetchDataF32_Static_0001
     * @tc.desc      ArrayPromiseF32 sync fetchDataF32 returns float array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FetchDataF32_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FetchDataF32_Static_0001 start');
      let info = arrayPromiseF32.fetchDataF32();
      expect(info[0]).assertEqual((-202505.22).toFloat());
      expect(info[1]).assertEqual((0).toFloat());
      expect(info[2]).assertEqual((15.39).toFloat());
      console.log('test_FetchDataF32_Static_0001 done');
      done();
      console.log('test_FetchDataF32_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayPromiseF32_PROMISE_STATIC_0100
     * @tc.name      test_FetchDataF32Promise_Static_0001
     * @tc.desc      ArrayPromiseF32 promise fetchData returns float array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FetchDataF32Promise_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FetchDataF32Promise_Static_0001 start');
      let info = await arrayPromiseF32.fetchData();
      expect(info[0]).assertEqual((-202505.22).toFloat());
      expect(info[1]).assertEqual((0).toFloat());
      expect(info[2]).assertEqual((15.39).toFloat());
      console.log('test_FetchDataF32Promise_Static_0001 done');
      done();
      console.log('test_FetchDataF32Promise_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayPromiseF32_ASYNC_STATIC_0100
     * @tc.name      test_FetchDataF32Async_Static_0001
     * @tc.desc      ArrayPromiseF32 async fetchData with callback returns float array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FetchDataF32Async_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FetchDataF32Async_Static_0001 start');
      let info: float[] = [];
      await new Promise<float[]>((resolve, reject): void => {
        arrayPromiseF32.fetchData((error: BusinessError | null, data?: Array<float>): void => {
          if (error !== null && error.code !== 0) {
            reject(error as Error);
          } else {
            info = data!;
            resolve(info);
          }
        });
      });
      expect(info[0]).assertEqual((-202505.22).toFloat());
      expect(info[1]).assertEqual((0).toFloat());
      expect(info[2]).assertEqual((15.39).toFloat());
      console.log('test_FetchDataF32Async_Static_0001 done');
      done();
      console.log('test_FetchDataF32Async_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayPromiseF64_SYNC_STATIC_0100
     * @tc.name      test_FetchDataF64_Static_0001
     * @tc.desc      ArrayPromiseF64 sync fetchDataF64 returns double array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FetchDataF64_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FetchDataF64_Static_0001 start');
      let info = arrayPromiseF64.fetchDataF64();
      expect(info[0]).assertEqual((-202505.221539).toDouble());
      expect(info[1]).assertEqual(0.0);
      expect(info[2]).assertEqual(2215.39);
      console.log('test_FetchDataF64_Static_0001 done');
      done();
      console.log('test_FetchDataF64_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayPromiseF64_PROMISE_STATIC_0100
     * @tc.name      test_FetchDataF64Promise_Static_0001
     * @tc.desc      ArrayPromiseF64 promise fetchData returns double array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FetchDataF64Promise_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FetchDataF64Promise_Static_0001 start');
      let info = await arrayPromiseF64.fetchData();
      expect(info[0]).assertEqual((-202505.221539).toDouble());
      expect(info[1]).assertEqual(0.0);
      expect(info[2]).assertEqual(2215.39);
      console.log('test_FetchDataF64Promise_Static_0001 done');
      done();
      console.log('test_FetchDataF64Promise_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayPromiseF64_ASYNC_STATIC_0100
     * @tc.name      test_FetchDataF64Async_Static_0001
     * @tc.desc      ArrayPromiseF64 async fetchData with callback returns double array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FetchDataF64Async_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FetchDataF64Async_Static_0001 start');
      let info: double[] = [];
      await new Promise<double[]>((resolve, reject): void => {
        arrayPromiseF64.fetchData((error: BusinessError | null, data?: Array<double>): void => {
          if (error !== null && error.code !== 0) {
            reject(error as Error);
          } else {
            info = data!;
            resolve(info);
          }
        });
      });
      expect(info[0]).assertEqual((-202505.221539).toDouble());
      expect(info[1]).assertEqual(0.0);
      expect(info[2]).assertEqual(2215.39);
      console.log('test_FetchDataF64Async_Static_0001 done');
      done();
      console.log('test_FetchDataF64Async_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayPromiseString_SYNC_STATIC_0100
     * @tc.name      test_FetchDataString_Static_0001
     * @tc.desc      ArrayPromiseString sync fetchDataString returns string array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FetchDataString_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FetchDataString_Static_0001 start');
      let info = arrayPromiseString.fetchDataString();
      expect(info[0]).assertEqual("String");
      expect(info[1]).assertEqual("Data");
      console.log('test_FetchDataString_Static_0001 done');
      done();
      console.log('test_FetchDataString_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayPromiseString_PROMISE_STATIC_0100
     * @tc.name      test_FetchDataStringPromise_Static_0001
     * @tc.desc      ArrayPromiseString promise fetchData returns string array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FetchDataStringPromise_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FetchDataStringPromise_Static_0001 start');
      let info = await arrayPromiseString.fetchData();
      expect(info[0]).assertEqual("String");
      expect(info[1]).assertEqual("Data");
      console.log('test_FetchDataStringPromise_Static_0001 done');
      done();
      console.log('test_FetchDataStringPromise_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayPromiseString_ASYNC_STATIC_0100
     * @tc.name      test_FetchDataStringAsync_Static_0001
     * @tc.desc      ArrayPromiseString async fetchData with callback returns string array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FetchDataStringAsync_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FetchDataStringAsync_Static_0001 start');
      let info: string[] = [];
      await new Promise<string[]>((resolve, reject): void => {
        arrayPromiseString.fetchData((error: BusinessError | null, data?: Array<string>): void => {
          if (error !== null && error.code !== 0) {
            reject(error as Error);
          } else {
            info = data!;
            resolve(info);
          }
        });
      });
      expect(info[0]).assertEqual("String");
      expect(info[1]).assertEqual("Data");
      console.log('test_FetchDataStringAsync_Static_0001 done');
      done();
      console.log('test_FetchDataStringAsync_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayPromiseBool_SYNC_STATIC_0100
     * @tc.name      test_FetchDataBool_Static_0001
     * @tc.desc      ArrayPromiseBool sync fetchDataBool returns boolean array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FetchDataBool_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FetchDataBool_Static_0001 start');
      let info = arrayPromiseBool.fetchDataBool();
      expect(info[0]).assertTrue();
      expect(info[1]).assertFalse();
      console.log('test_FetchDataBool_Static_0001 done');
      done();
      console.log('test_FetchDataBool_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayPromiseBool_PROMISE_STATIC_0100
     * @tc.name      test_FetchDataBoolPromise_Static_0001
     * @tc.desc      ArrayPromiseBool promise fetchData returns boolean array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FetchDataBoolPromise_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FetchDataBoolPromise_Static_0001 start');
      let info = await arrayPromiseBool.fetchData();
      expect(info[0]).assertTrue();
      expect(info[1]).assertFalse();
      console.log('test_FetchDataBoolPromise_Static_0001 done');
      done();
      console.log('test_FetchDataBoolPromise_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayPromiseBool_ASYNC_STATIC_0100
     * @tc.name      test_FetchDataBoolAsync_Static_0001
     * @tc.desc      ArrayPromiseBool async fetchData with callback returns boolean array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FetchDataBoolAsync_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FetchDataBoolAsync_Static_0001 start');
      let info: boolean[] = [];
      await new Promise<boolean[]>((resolve, reject): void => {
        arrayPromiseBool.fetchData((error: BusinessError | null, data?: Array<boolean>): void => {
          if (error !== null && error.code !== 0) {
            reject(error as Error);
          } else {
            info = data!;
            resolve(info);
          }
        });
      });
      expect(info[0]).assertTrue();
      expect(info[1]).assertFalse();
      console.log('test_FetchDataBoolAsync_Static_0001 done');
      done();
      console.log('test_FetchDataBoolAsync_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayPromiseU8_SYNC_STATIC_0100
     * @tc.name      test_FetchDataU8_Static_0001
     * @tc.desc      ArrayPromiseU8 sync fetchDataPro returns Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FetchDataU8_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FetchDataU8_Static_0001 start');
      let info = arrayPromiseU8.fetchDataPro();
      let expectedZero: number = 0;
      let expected: number = 255;
      expect(info[0]).assertEqual(expectedZero);
      expect(info[1]).assertEqual(expected);
      console.log('test_FetchDataU8_Static_0001 done');
      done();
      console.log('test_FetchDataU8_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayPromiseU8_PROMISE_STATIC_0100
     * @tc.name      test_FetchDataU8Promise_Static_0001
     * @tc.desc      ArrayPromiseU8 promise fetchData returns Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FetchDataU8Promise_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FetchDataU8Promise_Static_0001 start');
      let info = await arrayPromiseU8.fetchData();
      let expectedZero: number = 0;
      let expected: number = 255;
      expect(info[0]).assertEqual(expectedZero);
      expect(info[1]).assertEqual(expected);
      console.log('test_FetchDataU8Promise_Static_0001 done');
      done();
      console.log('test_FetchDataU8Promise_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayPromiseU8_ASYNC_STATIC_0100
     * @tc.name      test_FetchDataU8Async_Static_0001
     * @tc.desc      ArrayPromiseU8 async fetchData with callback returns Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FetchDataU8Async_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FetchDataU8Async_Static_0001 start');
      let info: Uint8Array = new Uint8Array(0);
      await new Promise<Uint8Array>((resolve, reject): void => {
        arrayPromiseU8.fetchData((error: BusinessError | null, data?: Uint8Array): void => {
          if (error !== null && error.code !== 0) {
            reject(error as Error);
          } else {
            info = data!;
            resolve(info);
          }
        });
      });
      let expectedZero: number = 0;
      let expected: number = 255;
      expect(info[0]).assertEqual(expectedZero);
      expect(info[1]).assertEqual(expected);
      console.log('test_FetchDataU8Async_Static_0001 done');
      done();
      console.log('test_FetchDataU8Async_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayPromiseU16_SYNC_STATIC_0100
     * @tc.name      test_FetchDataU16_Static_0001
     * @tc.desc      ArrayPromiseU16 sync fetchDataPro returns Uint16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FetchDataU16_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FetchDataU16_Static_0001 start');
      let info = arrayPromiseU16.fetchDataPro();
      let expectedZero: number = 0;
      let expected: number = 65535;
      expect(info[0]).assertEqual(expectedZero);
      expect(info[1]).assertEqual(expected);
      console.log('test_FetchDataU16_Static_0001 done');
      done();
      console.log('test_FetchDataU16_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayPromiseU16_PROMISE_STATIC_0100
     * @tc.name      test_FetchDataU16Promise_Static_0001
     * @tc.desc      ArrayPromiseU16 promise fetchData returns Uint16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FetchDataU16Promise_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FetchDataU16Promise_Static_0001 start');
      let info = await arrayPromiseU16.fetchData();
      let expectedZero: number = 0;
      let expected: number = 65535;
      expect(info[0]).assertEqual(expectedZero);
      expect(info[1]).assertEqual(expected);
      console.log('test_FetchDataU16Promise_Static_0001 done');
      done();
      console.log('test_FetchDataU16Promise_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ArrayPromiseU16_ASYNC_STATIC_0100
     * @tc.name      test_FetchDataU16Async_Static_0001
     * @tc.desc      ArrayPromiseU16 async fetchData with callback returns Uint16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FetchDataU16Async_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FetchDataU16Async_Static_0001 start');
      let info: Uint16Array = new Uint16Array(0);
      await new Promise<Uint16Array>((resolve, reject): void => {
        arrayPromiseU16.fetchData((error: BusinessError | null, data?: Uint16Array): void => {
          if (error !== null && error.code !== 0) {
            reject(error as Error);
          } else {
            info = data!;
            resolve(info);
          }
        });
      });
      let expectedZero: number = 0;
      let expected: number = 65535;
      expect(info[0]).assertEqual(expectedZero);
      expect(info[1]).assertEqual(expected);
      console.log('test_FetchDataU16Async_Static_0001 done');
      done();
      console.log('test_FetchDataU16Async_Static_0001 end');
    });
  })
}
