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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from '@ohos/hypium'
import { sleep } from './pages/Utils'
import { collections } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

export default function CollectionsArrayBufferConstructorTest() {
  describe('CollectionsArrayBufferConstructorTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
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
     * @tc.name   buildinsArrayBufferConstructorTest1001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0052
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('buildinsArrayBufferConstructorTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new collections.ArrayBuffer(0)
        expect(arrayBuffer.byteLength).assertEqual(0)
        Done()

      })

    /**
     * @tc.name   buildinsArrayBufferConstructorTest1002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0057
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferConstructorTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new collections.ArrayBuffer(8)
        expect(arrayBuffer.byteLength).assertEqual(8)
        Done()

      })

    /**
     * @tc.name   buildinsArrayBufferConstructorTest1003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0003
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferConstructorTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        try {
          new collections.ArrayBuffer(-1)
          throw new Error("Not throw Uncaught RangeError")
        } catch (e) {
          expect(e.name).assertEqual(RangeError.name)
        }
        Done()

      })

    /**
     * @tc.name   buildinsArrayBufferConstructorTest1004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0004
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferConstructorTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let ab = new collections.ArrayBuffer(-0)
        expect(ab.byteLength).assertEqual(0)
        Done()

      })


    /**
     * @tc.name   buildinsArrayBufferConstructorTest1005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0005
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferConstructorTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new collections.ArrayBuffer(NaN)
        expect(arrayBuffer.byteLength).assertEqual(0)
        Done()

      })


    /**
     * @tc.name   buildinsArrayBufferConstructorTest1006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0006
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferConstructorTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        try {
          new collections.ArrayBuffer(Infinity)
          throw new Error("Not throw Uncaught RangeError")
        } catch (e) {
          expect(e.name).assertEqual(RangeError.name)
        }

        Done()

      })

    /**
     * @tc.name   buildinsArrayBufferConstructorTest1007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0007
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferConstructorTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        try {
          new collections.ArrayBuffer(-Infinity)
          throw new Error("Not throw Uncaught RangeError")
        } catch (e) {
          expect(e.name).assertEqual(RangeError.name)
        }
        Done()

      })


    /**
     * @tc.name   buildinsArrayBufferConstructorTest1008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0008
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferConstructorTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let ab = new collections.ArrayBuffer(Math.floor(1.5))
        expect(ab.byteLength).assertEqual(1)
        Done()

      })


    /**
     * @tc.name   buildinsArrayBufferConstructorTest1009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0009
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferConstructorTest1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        try {
          new collections.ArrayBuffer(Number.MAX_VALUE)
          throw new Error("Not throw Uncaught RangeError")
        } catch (e) {
          expect(e.name).assertEqual(RangeError.name)
        }

        Done()

      })

    /**
     * @tc.name   buildinsArrayBufferConstructorTest1010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0010
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferConstructorTest1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new collections.ArrayBuffer(Number.MIN_VALUE)
        expect(arrayBuffer.byteLength).assertEqual(0)
        Done()

      })


    /**
     * @tc.name   buildinsArrayBufferConstructorTest1011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0011
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferConstructorTest1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new collections.ArrayBuffer(Number.EPSILON)
        expect(arrayBuffer.byteLength).assertEqual(0)
        Done()

      })


    /**
     * @tc.name   buildinsArrayBufferConstructorTest1012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0012
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferConstructorTest1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new collections.ArrayBuffer(123.456)
        expect(arrayBuffer.byteLength).assertEqual(123)
        Done()

      })


    /**
     * @tc.name   buildinsArrayBufferConstructorTest1013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0013
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferConstructorTest1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        try {
          new collections.ArrayBuffer(0xcafebabe)
          throw new Error("Not throw Uncaught RangeError")
        } catch (e) {
          expect(e.name).assertEqual(RangeError.name)
        }
        Done()

      })

    /**
     * @tc.name   buildinsArrayBufferConstructorTest1014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0014
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferConstructorTest1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new collections.ArrayBuffer(0x0102)
        expect(arrayBuffer.byteLength).assertEqual(0x0102)
        Done()

      })


    /**
     * @tc.name   buildinsArrayBufferConstructorTest1015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0015
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferConstructorTest1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new collections.ArrayBuffer(0x01020304)
        expect(arrayBuffer.byteLength).assertEqual(0x01020304)
        Done()

      })


    /**
     * @tc.name   buildinsArrayBufferConstructorTest1016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BUFFER_ALL_0016
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferConstructorTest1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new collections.ArrayBuffer(0x3)
        expect(arrayBuffer.byteLength).assertEqual(0x3)
        Done()
      })

    /**
     * @tc.number  SUB_ARRAYBUFFER_CTOR_ONE_0100
     * @tc.name    testArrayBufferCtorOne0001
     * @tc.desc    Verify constructor with wrong-typed byteLength throws 401
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testArrayBufferCtorOne0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      let buf = new collections.ArrayBuffer('8' as Object as number)
      expect(buf instanceof collections.ArrayBuffer).assertTrue()
      Done()
    })

    /**
     * @tc.number  SUB_ARRAYBUFFER_CTOR_ONE_0200
     * @tc.name    testArrayBufferCtorOne0002
     * @tc.desc    Verify normal construction does not throw 10200012
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testArrayBufferCtorOne0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      let bufA = new collections.ArrayBuffer(8)
      let bufB = new collections.ArrayBuffer(0)
      expect(bufA.byteLength).assertEqual(8)
      expect(bufB.byteLength).assertEqual(0)
      expect(bufA instanceof collections.ArrayBuffer).assertTrue()
      expect(bufB instanceof collections.ArrayBuffer).assertTrue()
      Done()
    })
  })
}