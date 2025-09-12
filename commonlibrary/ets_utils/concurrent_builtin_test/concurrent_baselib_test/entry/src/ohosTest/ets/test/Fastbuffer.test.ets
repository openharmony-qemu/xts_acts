/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { taskpool } from '@kit.ArkTS';
import {
  testBufferFromEscape,
  testBufferIsEncodingEmoji,
  testBufferIsEncodingEscape,
  testBufferToJSONEmoji,
  testReadUIntBE,
  testWriteUInt32BE,
  testWriteUInt32LE,
  testWriteUIntLE,
  testReadBigInt64BE,
  testReadBigInt64LE,
  testReadBigUInt64BE,
  testReadBigUInt64LE,
  testReadDoubleBE,
  testWriteUIntBE,
  testBufferAllocEmoji,
  testBufferByteLengthEmoji,
  testBufferFillEmoji,
  testBufferIncludesEmoji,
  testBufferAllocEscape,
  testBufferByteLengthEscape,
  testBufferCompareEscape,
  testBufferFillEscape,
  testBufferIncludesEscape,
  testReadDoubleLE,
  testReadFloatBE,
  testReadFloatLE,
  testReadInt8,
  testReadInt16BE,
  testReadInt16LE,
  testReadInt32BE,
  testReadInt32LE,
  testReadIntBE,
  testReadIntLE,
  testReadUInt8,
  testReadUInt16BE,
  testEquals,
  testSubarray,
  testCopy,
  testToString,
  testToJSON,
  testIndexOf,
  testLastIndexOf,
  testLastIndexOfNull,
  testLastIndexOfBigOffset,
  testIncludesNormal,
  testSwap16Normal,
  testSwap32Normal,
  testSwap64Normal,
  testKeysNormal,
  testValuesNormal,
  testEntriesNormal,
  testFromUint8Array,
  testBufferLength,
  testBufferByteOffset,
  testReadUInt16LE,
  testReadUInt32BE,
  testReadUInt32LE,
  testReadUIntLE,
  testBufferCompare} from '../testability/pages/Fastbuffer';

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}

let concurrentNum = 100

export default function FastBufferTest() {
  describe('FastBufferTest', () => {
    // Defines a test suite. Two parameters 房are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(50);
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
     * @tc.number   : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0100
     * @tc.name      : testBufferAllocEmoji
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBufferAllocEmoji', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testBufferAllocEmoji';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testBufferAllocEmoji)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number   : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0200
     * @tc.name      : testBufferByteLengthEmoji
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBufferByteLengthEmoji', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testBufferByteLengthEmoji';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testBufferByteLengthEmoji)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number   : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0300
     * @tc.name      : testBufferIsEncodingEmoji
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBufferIsEncodingEmoji', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testBufferIsEncodingEmoji';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testBufferIsEncodingEmoji)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number   : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0400
     * @tc.name      : testBufferFillEmoji
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBufferFillEmoji', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testBufferFillEmoji';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testBufferFillEmoji)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });


    /**
     * @tc.number   : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0600
     * @tc.name      : testBufferIncludesEmoji
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBufferIncludesEmoji', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testBufferIncludesEmoji';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testBufferIncludesEmoji)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number   : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0700
     * @tc.name      : testBufferToJSONEmoji
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBufferToJSONEmoji', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testBufferToJSONEmoji';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testBufferToJSONEmoji)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });


    /**
     * @tc.number   : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1100
     * @tc.name      : testBufferAllocEscape
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBufferAllocEscape', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testBufferAllocEscape';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testBufferAllocEscape)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number   : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1200
     * @tc.name      : testBufferByteLengthEscape
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBufferByteLengthEscape', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testBufferByteLengthEscape';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testBufferByteLengthEscape)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number   : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1400
     * @tc.name      : testBufferCompareEscape
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBufferCompareEscape', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testBufferCompareEscape';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testBufferCompareEscape)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });
    /**
     * @tc.number   : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1500
     * @tc.name      : testBufferFromEscape
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBufferFromEscape', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testBufferFromEscape';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testBufferFromEscape)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number   : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1600
     * @tc.name      : testBufferIsEncodingEscape
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBufferIsEncodingEscape', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testBufferIsEncodingEscape';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testBufferIsEncodingEscape)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number   : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1700
     * @tc.name      : testBufferFillEscape
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBufferFillEscape', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testBufferFillEscape';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testBufferFillEscape)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number   : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1800
     * @tc.name      : testBufferIncludesEscape
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBufferIncludesEscape', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testBufferIncludesEscape';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testBufferIncludesEscape)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number   : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_2400
     * @tc.name      : testWriteUIntBE
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testWriteUIntBE', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testWriteUIntBE';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testWriteUIntBE)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number   : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_2500
     * @tc.name      : testWriteUIntLE
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testWriteUIntLE', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testWriteUIntLE';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testWriteUIntLE)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_2600
     * @tc.name      : testReadBigInt64BE
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testReadBigInt64BE', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testReadBigInt64BE';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testReadBigInt64BE)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_2700
     * @tc.name      : testReadBigInt64LE
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testReadBigInt64LE', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testReadBigInt64LE';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testReadBigInt64LE)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_2800
     * @tc.name      : testReadBigUInt64BE
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testReadBigUInt64BE', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testReadBigUInt64BE';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testReadBigUInt64BE)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_2900
     * @tc.name      : testReadBigUInt64LE
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testReadBigUInt64LE', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testReadBigUInt64LE';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testReadBigUInt64LE)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });


    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_3000
     * @tc.name      : testReadDoubleBE
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testReadDoubleBE', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testReadDoubleBE';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testReadDoubleBE)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_3100
     * @tc.name      : testReadDoubleLE
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testReadDoubleLE', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testReadDoubleLE';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testReadDoubleLE)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_3200
     * @tc.name      : testReadFloatBE
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testReadFloatBE', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testReadDoubleLE';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testReadFloatBE)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_3300
     * @tc.name      : testReadFloatLE
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testReadFloatLE', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testReadFloatLE';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testReadFloatLE)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_3400
     * @tc.name      : testReadInt8
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testReadInt8', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testReadInt8';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testReadInt8)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_3500
     * @tc.name      : testReadInt16BE
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testReadInt16BE', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testReadInt16BE';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testReadInt16BE)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_3600
     * @tc.name      : testReadInt16LE
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testReadInt16LE', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testReadInt16LE';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testReadInt16LE)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_3700
     * @tc.name      : testReadInt32BE
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testReadInt32BE', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testReadInt32BE';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testReadInt32BE)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_3800
     * @tc.name      : testReadInt32LE
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testReadInt32LE', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testReadInt32LE';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testReadInt32LE)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_3900
     * @tc.name      : testReadIntBE
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testReadIntBE', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testReadIntBE';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testReadIntBE)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_4000
     * @tc.name      : testReadIntLE
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testReadIntLE', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testReadIntLE';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testReadIntLE)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_4100
     * @tc.name      : testReadUInt8
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testReadUInt8', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testReadUInt8';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testReadUInt8)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_4200
     * @tc.name      : testReadUInt16BE
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testReadUInt16BE', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testReadUInt16BE';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testReadUInt16BE)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_4300
     * @tc.name      : testEquals
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testEquals', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testEquals';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testEquals)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_4400
     * @tc.name      : testSubarray
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testSubarray', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testSubarray';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testSubarray)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_4500
     * @tc.name      : testCopy
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testCopy', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testCopy';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testCopy)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_4600
     * @tc.name      : testToString
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testToString', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testToString';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testToString)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_4700
     * @tc.name      : testToJSON
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testToJSON', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testToJSON';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testToJSON)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_4800
     * @tc.name      : testIndexOf
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testIndexOf', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testIndexOf';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testIndexOf)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_4900
     * @tc.name      : testLastIndexOf
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testLastIndexOf', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testLastIndexOf';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testLastIndexOf)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_5000
     * @tc.name      : testLastIndexOfNull
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testLastIndexOfNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testLastIndexOfNull';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testLastIndexOfNull)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_5100
     * @tc.name      : testLastIndexOfBigOffset
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testLastIndexOfBigOffset', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testLastIndexOfBigOffset';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testLastIndexOfBigOffset)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_5200
     * @tc.name      : testIncludesNormal
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testIncludesNormal', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testIncludesNormal';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testIncludesNormal)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_5300
     * @tc.name      : testSwap16Normal
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testSwap16Normal', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testSwap16Normal';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testSwap16Normal)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_5400
     * @tc.name      : testSwap32Normal
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testSwap32Normal', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testSwap32Normal';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testSwap32Normal)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_5500
     * @tc.name      : testSwap64Normal
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testSwap64Normal', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testSwap64Normal';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testSwap64Normal)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_5600
     * @tc.name      : testKeysNormal
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testKeysNormal', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testKeysNormal';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testKeysNormal)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_5700
     * @tc.name      : testValuesNormal
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testValuesNormal', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testValuesNormal';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testValuesNormal)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_5800
     * @tc.name      : testEntriesNormal
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testEntriesNormal', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testEntriesNormal';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testEntriesNormal)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_5900
     * @tc.name      : testFromUint8Array
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testFromUint8Array', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testFromUint8Array';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testFromUint8Array)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_6000
     * @tc.name      : testBufferLength
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBufferLength', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testBufferLength';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testBufferLength)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_6100
     * @tc.name      : testBufferByteOffset
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBufferByteOffset', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testBufferByteOffset';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testBufferByteOffset)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });


    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_6200
     * @tc.name      : testReadUInt16LE
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testReadUInt16LE', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testReadUInt16LE';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testReadUInt16LE)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_6300
     * @tc.name      : testReadUInt32BE
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testReadUInt32BE', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testReadUInt32BE';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testReadUInt32BE)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_6400
     * @tc.name      : testReadUInt32LE
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testReadUInt32LE', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testReadUInt32BE';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testReadUInt32LE)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_6500
     * @tc.name      : testReadUIntBE
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testReadUIntBE', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testReadUIntBE';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testReadUIntBE)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_6600
     * @tc.name      : testWriteUInt32BE
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testWriteUInt32BE', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testWriteUInt32BE';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testWriteUInt32BE)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_6700
     * @tc.name      : testWriteUInt32LE
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testWriteUInt32LE', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testWriteUInt32LE';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testWriteUInt32LE)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_6800
     * @tc.name      : testReadUIntLE
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testReadUIntLE', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testReadUIntLE';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testReadUIntLE)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_6900
     * @tc.name      : testBufferCompare
     * @tc.desc      : Test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBufferCompare', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testBufferCompare';
        console.info(`${caseName} test start`);
        let result = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(testBufferCompare)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });
  })
}
