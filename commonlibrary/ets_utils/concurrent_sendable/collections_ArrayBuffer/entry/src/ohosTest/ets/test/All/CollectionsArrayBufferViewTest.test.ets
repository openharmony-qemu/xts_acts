/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium-dynamic'
import { collections } from '@kit.ArkTS';

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}

export default function CollectionsArrayBufferViewTest() {
  describe('CollectionsArrayBufferViewTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   buildinsArrayBufferViewTest1001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0056
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('buildinsArrayBufferViewTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: Function) => {
        let buffer = new collections.ArrayBuffer(16);
        let uint = new collections.Uint8Array(buffer, 0, 8);
        expect(8).assertEqual(uint.byteLength);
        expect(0).assertEqual(uint.byteOffset);
        Done();
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0061
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('buildinsArrayBufferViewTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: Function) => {
        let buffer = new collections.ArrayBuffer(16);
        let uint = new collections.Uint8Array(buffer, 8, 4);
        expect(4).assertEqual(uint.byteLength);
        expect(8).assertEqual(uint.byteOffset);
        Done();
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0064
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('buildinsArrayBufferViewTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: Function) => {
        try {
          let buffer = new collections.ArrayBuffer(16);
          let uint = new collections.Uint8Array(buffer, -8, 4);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0067
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new collections.ArrayBuffer(16);
          let uint = new collections.Uint8Array(buffer, 8, -4);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0070
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new collections.ArrayBuffer(16);
        let uint = new collections.Int8Array(buffer, 0, 8);
        expect(8).assertEqual(uint.byteLength);
        expect(0).assertEqual(uint.byteOffset);
        Done();
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0073
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new collections.ArrayBuffer(16);
        let uint = new collections.Int8Array(buffer, 8, 4);
        expect(4).assertEqual(uint.byteLength);
        expect(8).assertEqual(uint.byteOffset);
        Done();
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0076
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new collections.ArrayBuffer(16);
          let uint = new collections.Int8Array(buffer, -8, 4);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0079
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new collections.ArrayBuffer(16);
          let uint = new collections.Int8Array(buffer, 8, -4);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0082
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new collections.ArrayBuffer(16);
        let uint = new collections.Uint8ClampedArray(buffer, 0, 8);
        expect(8).assertEqual(uint.byteLength);
        expect(0).assertEqual(uint.byteOffset);
        Done();
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0085
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new collections.ArrayBuffer(16);
        let uint = new collections.Uint8ClampedArray(buffer, 8, 4);
        expect(4).assertEqual(uint.byteLength);
        expect(8).assertEqual(uint.byteOffset);
        Done();
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0088
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new collections.ArrayBuffer(16);
          let uint = new collections.Uint8ClampedArray(buffer, -8, 4);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0091
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new collections.ArrayBuffer(16);
          let uint = new collections.Uint8ClampedArray(buffer, 8, -4);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0094
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new collections.ArrayBuffer(16);
        let uint = new collections.Int16Array(buffer, 0, 8);
        expect(16).assertEqual(uint.byteLength);
        expect(0).assertEqual(uint.byteOffset);
        Done();
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0097
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new collections.ArrayBuffer(16);
        let uint = new collections.Int16Array(buffer, 8, 4);
        expect(8).assertEqual(uint.byteLength);
        expect(8).assertEqual(uint.byteOffset);
        Done();
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0100
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new collections.ArrayBuffer(16);
          let uint = new collections.Int16Array(buffer, -8, 4);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0103
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new collections.ArrayBuffer(16);
          let uint = new collections.Int16Array(buffer, 8, -4);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0105
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new collections.ArrayBuffer(16);
        let uint = new collections.Uint16Array(buffer, 0, 8);
        expect(16).assertEqual(uint.byteLength);
        expect(0).assertEqual(uint.byteOffset);
        Done();
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0107
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new collections.ArrayBuffer(16);
        let uint = new collections.Uint16Array(buffer, 8, 4);
        expect(8).assertEqual(uint.byteLength);
        expect(8).assertEqual(uint.byteOffset);
        Done();
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0109
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new collections.ArrayBuffer(16);
          let uint = new collections.Uint16Array(buffer, -8, 4);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0111
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new collections.ArrayBuffer(16);
          let uint = new collections.Uint16Array(buffer, 8, -4);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0113
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new collections.ArrayBuffer(16);
        let uint = new collections.Uint32Array(buffer, 0, 4);
        expect(16).assertEqual(uint.byteLength);
        expect(0).assertEqual(uint.byteOffset);
        Done();
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0115
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new collections.ArrayBuffer(16);
        let uint = new collections.Uint32Array(buffer, 8, 2);
        expect(8).assertEqual(uint.byteLength);
        expect(8).assertEqual(uint.byteOffset);
        Done();
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1023
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0116
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new collections.ArrayBuffer(16);
          let uint = new collections.Uint32Array(buffer, -8, 2);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1024
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0117
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new collections.ArrayBuffer(16);
          let uint = new collections.Uint32Array(buffer, 8, -2);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1025
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0118
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new collections.ArrayBuffer(16);
        let float = new collections.Float32Array(buffer, 0, 4);
        expect(16).assertEqual(float.byteLength);
        expect(0).assertEqual(float.byteOffset);
        Done();
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1026
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0119
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new collections.ArrayBuffer(16);
        let float = new collections.Float32Array(buffer, 8, 2);
        expect(8).assertEqual(float.byteLength);
        expect(8).assertEqual(float.byteOffset);
        Done();
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1027
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0120
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new collections.ArrayBuffer(16);
          let float = new collections.Float32Array(buffer, -8, 2);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1028
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0121
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new collections.ArrayBuffer(16);
          let float = new collections.Float32Array(buffer, 8, -2);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1029
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0122
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new collections.ArrayBuffer(16);
        let float = new collections.Float32Array(buffer, 0, 2);
        expect(8).assertEqual(float.byteLength);
        expect(0).assertEqual(float.byteOffset);
        Done();
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1030
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0123
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new collections.ArrayBuffer(16);
        let float = new collections.Float32Array(buffer, 8, 1);
        expect(4).assertEqual(float.byteLength);
        expect(8).assertEqual(float.byteOffset);
        Done();
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1031
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0124
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new collections.ArrayBuffer(16);
          let float = new collections.Float32Array(buffer, -8, 1);
          expect(true).assertEqual(false);
        } catch (error) {
          expect(error.message).assertContain('integerIndex < 0 or integerIndex > SAFE_NUMBER');
        }
        Done();
      });

    /**
     * @tc.name   buildinsArrayBufferViewTest1032
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0125
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new collections.ArrayBuffer(16);
          let float = new collections.Float32Array(buffer, 8, -1);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1033
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0126
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new collections.ArrayBuffer(16);
        let big = new collections.Int32Array(buffer, 0, 2);
        expect(8).assertEqual(big.byteLength);
        expect(0).assertEqual(big.byteOffset);
        Done();
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1034
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0127
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new collections.ArrayBuffer(16);
        let big = new collections.Int32Array(buffer, 8, 1);
        expect(4).assertEqual(big.byteLength);
        expect(8).assertEqual(big.byteOffset);
        Done();
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1035
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0128
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new collections.ArrayBuffer(16);
          let big = new collections.Int32Array(buffer, -8, 1);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1036
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0129
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new collections.ArrayBuffer(16);
          let big = new collections.Int32Array(buffer, 8, -1);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1037
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0130
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new collections.ArrayBuffer(16);
        let big = new collections.Uint32Array(buffer, 0, 2);
        expect(8).assertEqual(big.byteLength);
        expect(0).assertEqual(big.byteOffset);
        Done();
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1038
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0131
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new collections.ArrayBuffer(16);
        let big = new collections.Uint32Array(buffer, 8, 1);
        expect(4).assertEqual(big.byteLength);
        expect(8).assertEqual(big.byteOffset);
        Done();
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1039
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0132
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new collections.ArrayBuffer(16);
          let big = new collections.Uint32Array(buffer, -8, 1);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.name   buildinsArrayBufferViewTest1040
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0133
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferViewTest1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new collections.ArrayBuffer(16);
          let big = new collections.Uint32Array(buffer, 8, -1);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

  })
}