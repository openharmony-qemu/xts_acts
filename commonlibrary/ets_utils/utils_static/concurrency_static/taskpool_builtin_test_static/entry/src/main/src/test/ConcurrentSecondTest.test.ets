'use static';
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "../../../hypium/index";
import type { BusinessError } from '@ohos.base';
import { testUint8ArrayConstructor1,
  testUint8ArrayBytesPerElement1,
  testUint8ArrayFrom1,
  testUint8ArrayOf1,
  testUint8ArrayByteOffset1,
  testUint8ArrayByteLength1,
  testUint8ArrayBuffer1,
  testUint8ArrayLength1,
  testUint8ArrayFromArray1,
  testUint16ArrayConstructor1,
  testUint16ArrayBytesPerElement1,
  testUint16ArrayFrom1,
  testUint16ArrayOf1,
  testUint16ArrayByteOffset1,
  testUint16ArrayByteLength1,
  testUint16ArrayBuffer1,
  testUint16ArrayLength1,
  testUint16ArrayFromArray1,
  testUint32ArrayConstructor1,
  testUint32ArrayBytesPerElement1,
  testUint32ArrayFrom1,
  testUint32ArrayOf1,
  testUint32ArrayByteOffset1,
  testUint32ArrayByteLength1,
  testUint32ArrayBuffer1,
  testUint32ArrayLength1,
  testUint32ArrayFromArray1,
  testUint8ClampedArrayConstructor1,
  testUint8ClampedArrayBytesPerElement1,
  testUint8ClampedArrayFrom1,
  testUint8ClampedArrayOf1,
  testUint8ClampedArrayByteOffset1,
  testUint8ClampedArrayByteLength1,
  testUint8ClampedArrayBuffer1,
  testUint8ClampedArrayLength1,
  testUint8ClampedArrayFromArray1,
  testInt8ArrayConstructor1,
  testInt8ArrayBytesPerElement1,
  testInt8ArrayFrom1,
  testInt8ArrayOf1,
  testInt8ArrayByteOffset1,
  testInt8ArrayByteLength1,
  testInt8ArrayBuffer1,
  testInt8ArrayLength1,
  testInt8ArrayFromArray1,
  testInt16ArrayConstructor1,
  testInt16ArrayBytesPerElement1,
  testInt16ArrayFrom1,
  testInt16ArrayOf1,
  testInt16ArrayByteOffset1,
  testInt16ArrayByteLength1,
  testInt16ArrayBuffer1,
  testInt16ArrayLength1,
  testInt16ArrayFromArray1,
  testInt32ArrayConstructor1,
  testInt32ArrayBytesPerElement1,
  testInt32ArrayFrom1,
  testInt32ArrayOf1,
  testInt32ArrayByteOffset1,
  testInt32ArrayByteLength1,
  testInt32ArrayBuffer1,
  testInt32ArrayLength1,
  testInt32ArrayFromArray1,
  testBigInt64ArrayConstructor1,
  testBigInt64ArrayBytesPerElement1,
  testBigInt64ArrayFrom1,
  testBigInt64ArrayOf1,
  testBigInt64ArrayByteOffset1,
  testBigInt64ArrayByteLength1,
  testBigInt64ArrayBuffer1,
  testBigInt64ArrayLength1,
  testBigInt64ArrayFromArray1,
  testBigUint64ArrayConstructor1,
  testBigUint64ArrayBytesPerElement1,
  testBigUint64ArrayFrom1,
  testBigUint64ArrayOf1,
  testBigUint64ArrayByteOffset1,
  testBigUint64ArrayByteLength1,
  testBigUint64ArrayBuffer1,
  testBigUint64ArrayLength1,
  testBigUint64ArrayFromArray1,
  testFloat32ArrayConstructor1,
  testFloat32ArrayBytesPerElement1,
  testFloat32ArrayFrom1,
  testFloat32ArrayOf1,
  testFloat32ArrayByteOffset1,
  testFloat32ArrayByteLength1,
  testFloat32ArrayBuffer1,
  testFloat32ArrayLength1,
  testFloat64ArrayConstructor1,
  testFloat64ArrayBytesPerElement1,
  testFloat64ArrayFrom1,
  testFloat64ArrayOf1,
  testFloat64ArrayByteOffset1,
  testFloat64ArrayByteLength1,
  testFloat64ArrayBuffer1,
  testFloat64ArrayLength1
  } from '../testability/pages/taskpool2';
import {sleep} from '../testability/pages/utils'

let concurrentNum: int = 100


export default function globalTest2(): void {
  describe('globalTest2', () => {
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
     * @tc.name   test_concurrent_builtins_uint8array_constructor_001
     * @tc.number SUB_CONCURRENT_BUILTINS_SECOND_TEST_0100
     * @tc.desc   test_concurrent_builtins_uint8array_constructor_001 - test Uint8Array constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_builtins_uint8array_constructor_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint8array_constructor_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint8ArrayConstructor1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint8array_bytesperelement_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint8array_bytesperelement_002';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint8ArrayBytesPerElement1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint8array_from_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint8array_from_003';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint8ArrayFrom1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint8array_of_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint8array_of_004';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint8ArrayOf1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint8array_byteoffset_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint8array_byteoffset_005';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint8ArrayByteOffset1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint8array_bytelength_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint8array_bytelength_006';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint8ArrayByteLength1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint8array_buffer_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint8array_buffer_007';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint8ArrayBuffer1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint8array_length_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint8array_length_008';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint8ArrayLength1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint8array_from_array_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint8array_from_array_009';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint8ArrayFromArray1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint16array_constructor_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint16array_constructor_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint16ArrayConstructor1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint16array_bytesperelement_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint16array_bytesperelement_002';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint16ArrayBytesPerElement1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint16array_from_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint16array_from_003';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint16ArrayFrom1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint16array_of_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint16array_of_004';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint16ArrayOf1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint16array_byteoffset_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint16array_byteoffset_005';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint16ArrayByteOffset1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint16array_bytelength_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint16array_bytelength_006';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint16ArrayByteLength1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint16array_buffer_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint16array_buffer_007';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint16ArrayBuffer1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint16array_length_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint16array_length_008';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint16ArrayLength1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint16array_from_array_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint16array_from_array_009';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint16ArrayFromArray1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint32array_constructor_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint32array_constructor_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint32ArrayConstructor1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint32array_bytesperelement_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint32array_bytesperelement_002';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint32ArrayBytesPerElement1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint32array_from_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint32array_from_003';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint32ArrayFrom1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint32array_of_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint32array_of_004';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint32ArrayOf1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint32array_byteoffset_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint32array_byteoffset_005';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint32ArrayByteOffset1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint32array_bytelength_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint32array_bytelength_006';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint32ArrayByteLength1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint32array_buffer_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint32array_buffer_007';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint32ArrayBuffer1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint32array_length_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint32array_length_008';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint32ArrayLength1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint32array_from_array_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint32array_from_array_009';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint32ArrayFromArray1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint8clampedarray_constructor_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint8clampedarray_constructor_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint8ClampedArrayConstructor1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint8clampedarray_bytesperelement_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint8clampedarray_bytesperelement_002';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint8ClampedArrayBytesPerElement1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint8clampedarray_from_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint8clampedarray_from_003';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint8ClampedArrayFrom1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint8clampedarray_of_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint8clampedarray_of_004';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint8ClampedArrayOf1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint8clampedarray_byteoffset_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint8clampedarray_byteoffset_005';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint8ClampedArrayByteOffset1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint8clampedarray_bytelength_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint8clampedarray_bytelength_006';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint8ClampedArrayByteLength1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint8clampedarray_buffer_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint8clampedarray_buffer_007';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint8ClampedArrayBuffer1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint8clampedarray_length_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint8clampedarray_length_008';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint8ClampedArrayLength1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_uint8clampedarray_from_array_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'test_concurrent_builtins_uint8clampedarray_from_array_009';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testUint8ClampedArrayFromArray1)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      })
    it('test_concurrent_builtins_int8array_constructor_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_int8array_constructor_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testInt8ArrayConstructor1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_int8array_bytesperelement_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_int8array_bytesperelement_002';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testInt8ArrayBytesPerElement1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_int8array_from_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_int8array_from_003';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testInt8ArrayFrom1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_int8array_of_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_int8array_of_004';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testInt8ArrayOf1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_int8array_byteoffset_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_int8array_byteoffset_005';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testInt8ArrayByteOffset1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_int8array_bytelength_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_int8array_bytelength_006';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testInt8ArrayByteLength1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_int8array_buffer_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_int8array_buffer_007';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testInt8ArrayBuffer1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_int8array_length_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_int8array_length_008';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testInt8ArrayLength1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_int8array_from_array_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_int8array_from_array_009';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testInt8ArrayFromArray1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_int16array_constructor_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_int16array_constructor_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testInt16ArrayConstructor1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_int16array_bytesperelement_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_int16array_bytesperelement_002';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testInt16ArrayBytesPerElement1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_int16array_from_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_int16array_from_003';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testInt16ArrayFrom1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_int16array_of_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_int16array_of_004';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testInt16ArrayOf1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_int16array_byteoffset_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_int16array_byteoffset_005';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testInt16ArrayByteOffset1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_int16array_bytelength_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_int16array_bytelength_006';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testInt16ArrayByteLength1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_int16array_buffer_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_int16array_buffer_007';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testInt16ArrayBuffer1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_int16array_length_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_int16array_length_008';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testInt16ArrayLength1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_int16array_from_array_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_int16array_from_array_009';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testInt16ArrayFromArray1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_int32array_constructor_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_int32array_constructor_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testInt32ArrayConstructor1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_int32array_bytesperelement_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_int32array_bytesperelement_002';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testInt32ArrayBytesPerElement1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_int32array_from_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_int32array_from_003';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testInt32ArrayFrom1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_int32array_of_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_int32array_of_004';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testInt32ArrayOf1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_int32array_byteoffset_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_int32array_byteoffset_005';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testInt32ArrayByteOffset1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_int32array_bytelength_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_int32array_bytelength_006';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testInt32ArrayByteLength1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_int32array_buffer_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_int32array_buffer_007';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testInt32ArrayBuffer1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_int32array_length_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_int32array_length_008';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testInt32ArrayLength1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_int32array_from_array_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_int32array_from_array_009';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testInt32ArrayFromArray1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_bigint64array_constructor_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_bigint64array_constructor_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBigInt64ArrayConstructor1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_bigint64array_bytesperelement_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_bigint64array_bytesperelement_002';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBigInt64ArrayBytesPerElement1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_bigint64array_from_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_bigint64array_from_003';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBigInt64ArrayFrom1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_bigint64array_of_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_bigint64array_of_004';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBigInt64ArrayOf1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_bigint64array_byteoffset_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_bigint64array_byteoffset_005';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBigInt64ArrayByteOffset1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_bigint64array_bytelength_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_bigint64array_bytelength_006';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBigInt64ArrayByteLength1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_bigint64array_buffer_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_bigint64array_buffer_007';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBigInt64ArrayBuffer1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_bigint64array_length_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_bigint64array_length_008';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBigInt64ArrayLength1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_bigint64array_from_array_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_bigint64array_from_array_009';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBigInt64ArrayFromArray1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_biguint64array_constructor_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_biguint64array_constructor_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBigUint64ArrayConstructor1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_biguint64array_bytesperelement_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_biguint64array_bytesperelement_002';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBigUint64ArrayBytesPerElement1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_biguint64array_from_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_biguint64array_from_003';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBigUint64ArrayFrom1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_biguint64array_of_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_biguint64array_of_004';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBigUint64ArrayOf1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_biguint64array_byteoffset_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_biguint64array_byteoffset_005';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBigUint64ArrayByteOffset1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_biguint64array_bytelength_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_biguint64array_bytelength_006';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBigUint64ArrayByteLength1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_biguint64array_buffer_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_biguint64array_buffer_007';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBigUint64ArrayBuffer1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_biguint64array_length_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_biguint64array_length_008';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBigUint64ArrayLength1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_biguint64array_from_array_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_biguint64array_from_array_009';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBigUint64ArrayFromArray1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_float32array_constructor_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_float32array_constructor_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testFloat32ArrayConstructor1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_float32array_bytesperelement_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_float32array_bytesperelement_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testFloat32ArrayBytesPerElement1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_float32array_from_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_float32array_from_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testFloat32ArrayFrom1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_float32array_of_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_float32array_of_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testFloat32ArrayOf1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_float32array_byteoffset_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_float32array_byteoffset_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testFloat32ArrayByteOffset1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_float32array_bytelength_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_float32array_bytelength_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testFloat32ArrayByteLength1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_float32array_buffer_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_float32array_buffer_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testFloat32ArrayBuffer1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_float32array_length_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_float32array_length_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testFloat32ArrayLength1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_float64array_constructor_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_float64array_constructor_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testFloat64ArrayConstructor1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_float64array_bytesperelement_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_float64array_bytesperelement_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testFloat64ArrayBytesPerElement1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_float64array_from_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_float64array_from_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testFloat64ArrayFrom1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_float64array_of_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_float64array_of_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testFloat64ArrayOf1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_float64array_byteoffset_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_float64array_byteoffset_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testFloat64ArrayByteOffset1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_float64array_bytelength_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_float64array_bytelength_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testFloat64ArrayByteLength1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_float64array_buffer_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_float64array_buffer_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testFloat64ArrayBuffer1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
    it('test_concurrent_builtins_float64array_length_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_builtins_float64array_length_001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testFloat64ArrayLength1)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${result}`);
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })
  })
}