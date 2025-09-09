/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"
import hilog from '@ohos.hilog'
import napitestex from 'libnapitestex.so'
import worker, { MessageEvents } from '@ohos.worker';

async function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function napiCheckExTest() {
  describe('napiCheckExTest', () => {
    /**
     * run after testcase
     */
    afterEach(async () => {
      console.info('[napiCheckExTest] after each called')
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_BUFFER_0001
     * @tc.name napiTestEx0001
     * @tc.desc napiTestEx
     */
    it('napiTestEx0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer: Object = napitestex.CreateBufferCopy();
      expect(napitestex.IsBuffer(buffer)).assertTrue();
      expect(napitestex.GetBufferInfo(buffer)).assertTrue();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_BUFFER_0002
     * @tc.name napiBufferTest002
     * @tc.desc aceNapiEtsTest
     */
    it('napiBufferTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer: Object = napitestex.CreateBuffer();
      expect(napitestex.IsBuffer(buffer)).assertTrue();
      expect(napitestex.GetBufferInfo(buffer)).assertTrue();
    })

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_BUFFER_0003
     * @tc.name napiBufferTest003
     * @tc.desc aceNapiEtsTest
     */
    it('napiBufferTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer: Object = napitestex.CreateBufferCopy();
      expect(napitestex.IsBuffer(buffer)).assertTrue();
      expect(napitestex.GetBufferInfo(buffer)).assertTrue();
    })

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_BUFFER_0004
     * @tc.name napiBufferTest004
     * @tc.desc aceNapiEtsTest - Test external buffer creation and finalize callback
     */
    it('napiBufferTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let externalBuffer: Object = napitestex.CreateExternalBufferTest();
      expect(napitestex.IsBuffer(externalBuffer)).assertTrue();
      expect(napitestex.GetBufferInfo(externalBuffer)).assertTrue();
    })

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_BUFFER_0005
     * @tc.name napiBufferTest005
     * @tc.desc aceNapiEtsTest - Test buffer creation edge cases and error handling
     */
    it('napiBufferTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // 测试零长度buffer
      let zeroLengthBuffer: Object = napitestex.createBufferSizeZeroTest();
      expect(zeroLengthBuffer).assertDeepEquals(1);

      // 测试最大长度buffer (2097152)
      let maxLengthBuffer: Object = napitestex.CreateBufferMaxLength();
      hilog.info(0x0000, 'testTag', 'maxLengthBuffer:%{public}d', maxLengthBuffer);
      expect(maxLengthBuffer).assertDeepEquals(0);

      // 测试超过最大长度 - 应该返回错误状态
      let invalidLengthStatus: Object = napitestex.CreateBufferExceedMaxLength();
      // 检查返回的是否为错误状态码 (napi_invalid_arg)
      hilog.info(0x0000, 'testTag', 'invalidLengthStatus:%{public}d', invalidLengthStatus);
      expect(invalidLengthStatus).assertDeepEquals(1); // napi_invalid_arg = 1

      // 测试无效参数 - 应该返回错误状态(crash)
      //let invalidEnvStatus: Object = napitestex.CreateBufferInvalidEnv();
      //hilog.info(0x0000, 'testTag', 'invalidEnvStatus:%{public}d', invalidEnvStatus);
      //expect(invalidEnvStatus).assertDeepEquals(1); // napi_invalid_arg = 1

      let invalidDataStatus: Object = napitestex.CreateBufferInvalidData();
      hilog.info(0x0000, 'testTag', 'invalidDataStatus:%{public}d', invalidDataStatus);
      expect(invalidDataStatus).assertDeepEquals(1); // napi_invalid_arg = 1

      //(crash)
      //let invalidResultStatus: Object = napitestex.CreateBufferInvalidResult();
      //hilog.info(0x0000, 'testTag', 'invalidResultStatus:%{public}d', invalidResultStatus);
      //expect(invalidResultStatus).assertDeepEquals(1); // napi_invalid_arg = 1
    })

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_BUFFER_0006
     * @tc.name napiBufferTest006
     * @tc.desc aceNapiEtsTest - Test non-ArrayBuffer object detection
     */
    it('napiBufferTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // 测试非buffer对象的检测
      let notABuffer: Object = napitestex.CreateInt32Test();
      hilog.info(0x0000, 'testTag', 'notABuffer:%{public}d', notABuffer);
      expect(napitestex.IsBuffer(notABuffer)).assertFalse();

      // 测试获取非buffer对象信息应该返回错误
      let getBufferInfoStatus: Object = napitestex.GetBufferInfoNonBuffer(notABuffer);
      hilog.info(0x0000, 'testTag', 'getBufferInfoStatus:%{public}d', getBufferInfoStatus);
      // 应该返回 napi_arraybuffer_expected 错误码
      expect(getBufferInfoStatus).assertDeepEquals(19); // napi_arraybuffer_expected = 19
    })

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_BUFFER_0007
     * @tc.name napiBufferTest007
     * @tc.desc aceNapiEtsTest - Test multiple operations combination
     */
    it('napiBufferTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // 测试多种操作的组合
      let testResult: Object = napitestex.TestMultipleOperations();
      hilog.info(0x0000, 'testTag', 'testResult:%{public}d', testResult);
      // 所有操作成功应该返回 0 (napi_ok)
      expect(testResult).assertDeepEquals(0);
    })

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_BUFFER_0008
     * @tc.name napiBufferTest008
     * @tc.desc aceNapiEtsTest - Test ArrayBuffer thread safety in multi-threaded environment
     */
    it('napiBufferTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // 测试多线程环境下的ArrayBuffer线程安全性
      let threadSafetyResult: boolean = napitestex.TestArrayBufferThreadSafety();
      hilog.info(0x0000, 'testTag', 'threadSafetyResult:%{public}s', threadSafetyResult.toString());
      // 所有线程操作成功应该返回 true
      expect(threadSafetyResult).assertTrue();
    })

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_BUFFER_0009
     * @tc.name napiBufferTest009
     * @tc.desc aceNapiEtsTest - Test ArrayBuffer and external ArrayBuffer comparison
     */
    it('napiBufferTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // 测试ArrayBuffer和外部ArrayBuffer的比对
      let comparisonResult: number = napitestex.TestArrayBufferComparison();
      hilog.info(0x0000, 'testTag', 'comparisonResult:%{public}d', comparisonResult);
      // 所有测试通过应该返回 0 (napi_ok)
      expect(comparisonResult).assertDeepEquals(1);
    })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ARRAYBUFFER_0001
     * @tc.name      : testArrayBufferTest0001
     * @tc.desc      : Testing NapiWrapEnhanceTest multi object binding testing.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayBufferTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testArrayBufferTest0001 START');
      try {
        let result: boolean = napitestex.NapiArrayBufferTest01();
        console.info('testArrayBufferTest0001 test result: ' + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`testArrayBufferTest0001 err msg: ${err.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ARRAYBUFFER_0002
     * @tc.name      : testArrayBufferTest0002
     * @tc.desc      : Testing ArrayBuffer creation and basic operations.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayBufferTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testArrayBufferTest0002 START');
      try {
        const result: boolean = napitestex.NapiArrayBufferTest02();
        console.info('testArrayBufferTest0002 test result: ' + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`testArrayBufferTest0002 err msg: ${err.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ARRAYBUFFER_0003
     * @tc.name      : testArrayBufferTest0003
     * @tc.desc      : Testing ArrayBuffer data writing and verification.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayBufferTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testArrayBufferTest0003 START');
      try {
        const result: boolean = napitestex.NapiArrayBufferTest04();
        console.info('testArrayBufferTest0003 test result: ' + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`testArrayBufferTest0003 err msg: ${err.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ARRAYBUFFER_0004
     * @tc.name      : testArrayBufferTest0004
     * @tc.desc      : Testing ArrayBuffer detach operations.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayBufferTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testArrayBufferTest0004 START');
      try {
        const result: boolean = napitestex.NapiArrayBufferTest04();
        console.info('testArrayBufferTest0004 test result: ' + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`testArrayBufferTest0004 err msg: ${err.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ARRAYBUFFER_0005
     * @tc.name      : testArrayBufferTest0005
     * @tc.desc      : Testing zero-length ArrayBuffer operations.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayBufferTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testArrayBufferTest0005 START');
      try {
        const result: boolean = napitestex.NapiArrayBufferTest05();
        console.info('testArrayBufferTest0005 test result: ' + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`testArrayBufferTest0005 err msg: ${err.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ARRAYBUFFER_0006
     * @tc.name      : testArrayBufferTest0006
     * @tc.desc      : Testing ArrayBuffer multiple detach operations.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayBufferTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testArrayBufferTest0006 START');
      try {
        const result: boolean = napitestex.NapiArrayBufferTest06();
        console.info('testArrayBufferTest0006 test result: ' + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`testArrayBufferTest0006 err msg: ${err.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ARRAYBUFFER_0007
     * @tc.name      : testArrayBufferTest0007
     * @tc.desc      : Testing ArrayBuffer thread safety operations.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayBufferTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testArrayBufferThreadSafety START');
      try {
        const result: boolean = napitestex.NapiArrayBufferTest07();
        console.info('ArrayBuffer thread safety test result: ' + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`ArrayBuffer thread safety test failed: ${err.message}`);
        expect().assertFail();
      }
      done();
    });

    // ==================== NAPI Number Tests ====================

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_NUMBER_0001
     * @tc.name testNumberCreationAndRetrieval
     * @tc.desc Test number creation and retrieval using NAPI functions to ensure correctness
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberCreationAndRetrieval', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testNumberCreationAndRetrieval START');

      try {
        // 调用C++测试函数进行数值创建和获取测试
        let result = napitestex.NapiNumberTest001();
        expect(result).assertTrue();

        console.info('testNumberCreationAndRetrieval PASS');
      } catch (err) {
        console.error('testNumberCreationAndRetrieval err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_NUMBER_0002
     * @tc.name testCrossTypeConversion
     * @tc.desc Test cross-type conversion between different numeric types using NAPI functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCrossTypeConversion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testCrossTypeConversion START');

      try {
        // 调用C++测试函数进行跨类型转换测试
        let result = napitestex.NapiNumberTest002();
        expect(result).assertTrue();

        console.info('testCrossTypeConversion PASS');
      } catch (err) {
        console.error('testCrossTypeConversion err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_NUMBER_0003
     * @tc.name testBoundaryValues
     * @tc.desc Test boundary values for different numeric types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBoundaryValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testBoundaryValues START');

      try {
        // 调用C++测试函数进行边界值测试
        let result = napitestex.NapiNumberTest003();
        expect(result).assertTrue();

        console.info('testBoundaryValues PASS');
      } catch (err) {
        console.error('testBoundaryValues err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_NUMBER_0004
     * @tc.name testCombinedOperations
     * @tc.desc Test combined operations of multiple create and get operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCombinedOperations', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testCombinedOperations START');

      try {
        // 调用C++测试函数进行组合操作测试
        let result = napitestex.NapiNumberTest004();
        expect(result).assertTrue();

        console.info('testCombinedOperations PASS');
      } catch (err) {
        console.error('testCombinedOperations err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_NUMBER_0005
     * @tc.name testTypeConversionAndOverflow
     * @tc.desc Test type conversion and overflow handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypeConversionAndOverflow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testTypeConversionAndOverflow START');

      try {
        // 调用C++测试函数进行类型转换和溢出测试
        let result = napitestex.NapiNumberTest005();
        expect(result).assertTrue();

        console.info('testTypeConversionAndOverflow PASS');
      } catch (err) {
        console.error('testTypeConversionAndOverflow err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_NUMBER_0006
     * @tc.name testLargeNumbersAndPrecision
     * @tc.desc Test large numbers and precision handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLargeNumbersAndPrecision', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testLargeNumbersAndPrecision START');

      try {
        // 调用C++测试函数进行大数值和精度测试
        let result = napitestex.NapiNumberTest006();
        expect(result).assertTrue();

        console.info('testLargeNumbersAndPrecision PASS');
      } catch (err) {
        console.error('testLargeNumbersAndPrecision err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_NUMBER_0007
     * @tc.name testBooleanValueHandling
     * @tc.desc Test boolean value creation and retrieval
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBooleanValueHandling', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testBooleanValueHandling START');

      try {
        // 调用C++测试函数进行布尔值处理测试
        let result = napitestex.NapiNumberTest007();
        expect(result).assertTrue();

        console.info('testBooleanValueHandling PASS');
      } catch (err) {
        console.error('testBooleanValueHandling err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_NUMBER_0008
     * @tc.name testThreadSafety
     * @tc.desc Test thread safety of NAPI value creation and retrieval
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testThreadSafety', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testThreadSafety START');

      try {
        // 调用C++测试函数进行线程安全性测试
        let result = napitestex.NapiNumberTest008();
        expect(result).assertTrue();

        console.info('testThreadSafety PASS');
      } catch (err) {
        console.error('testThreadSafety err msg: ' + err.message);
        expect().assertFail();
      }
    });

    // ==================== NAPI Object Tests ====================

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_OBJECT_0001
     * @tc.name testObjectCreationPrototypeFreezeAndTypeCheck
     * @tc.desc Test object creation, prototype retrieval, freezing and type checking functionality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testObjectCreationPrototypeFreezeAndTypeCheck', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testObjectCreationPrototypeFreezeAndTypeCheck START');

      try {
        // 调用C++测试函数进行对象创建、原型获取、冻结和类型检查测试
        let result = napitestex.NapiObjectTest001();
        expect(result).assertTrue();

        console.info('testObjectCreationPrototypeFreezeAndTypeCheck PASS');
      } catch (err) {
        console.error('testObjectCreationPrototypeFreezeAndTypeCheck err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_OBJECT_0002
     * @tc.name testObjectTypeTagCreationAndVerification
     * @tc.desc Test object type tag creation and verification functionality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testObjectTypeTagCreationAndVerification', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testObjectTypeTagCreationAndVerification START');

      try {
        // 调用C++测试函数进行对象类型标签创建和验证测试
        let result = napitestex.NapiObjectTest002();
        expect(result).assertTrue();

        console.info('testObjectTypeTagCreationAndVerification PASS');
      } catch (err) {
        console.error('testObjectTypeTagCreationAndVerification err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_OBJECT_0003
     * @tc.name testExternalObjectCreationAndValueRetrieval
     * @tc.desc Test external object creation and value retrieval functionality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testExternalObjectCreationAndValueRetrieval', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testExternalObjectCreationAndValueRetrieval START');

      try {
        // 调用C++测试函数进行外部对象创建和值获取测试
        let result = napitestex.NapiObjectTest003();
        expect(result).assertTrue();

        console.info('testExternalObjectCreationAndValueRetrieval PASS');
      } catch (err) {
        console.error('testExternalObjectCreationAndValueRetrieval err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_OBJECT_0004
     * @tc.name testObjectPropertyOperationsUnderDifferentProtectionLevels
     * @tc.desc Test object property operations under different protection levels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testObjectPropertyOperationsUnderDifferentProtectionLevels', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        console.info('testObjectPropertyOperationsUnderDifferentProtectionLevels START');

        try {
          // 调用C++测试函数进行不同保护级别下的对象属性操作测试
          let result = napitestex.NapiObjectTest004();
          expect(result).assertTrue();

          console.info('testObjectPropertyOperationsUnderDifferentProtectionLevels PASS');
        } catch (err) {
          console.error('testObjectPropertyOperationsUnderDifferentProtectionLevels err msg: ' + err.message);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_OBJECT_0005
     * @tc.name testSymbolCreationAndTypeCheck
     * @tc.desc Test Symbol creation and type checking functionality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSymbolCreationAndTypeCheck', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testSymbolCreationAndTypeCheck START');

      try {
        // 调用C++测试函数进行Symbol创建和类型检查测试
        let result = napitestex.NapiObjectTest005();
        expect(result).assertTrue();

        console.info('testSymbolCreationAndTypeCheck PASS');
      } catch (err) {
        console.error('testSymbolCreationAndTypeCheck err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_OBJECT_0006
     * @tc.name testTypeTagWithExternalObjectCombination
     * @tc.desc Test type tag with external object combination usage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypeTagWithExternalObjectCombination', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testTypeTagWithExternalObjectCombination START');

      try {
        // 调用C++测试函数进行类型标签与外部对象组合使用测试
        let result = napitestex.NapiObjectTest006();

        if (result) {
          console.info('[TestTypeTagWithExternalObjectCombination] SUCCESS - Type tag and external object operations completed');
        } else {
          console.error('[TestTypeTagWithExternalObjectCombination] FAILED - Test returned false');
        }

        expect(result).assertTrue();

        console.info('testTypeTagWithExternalObjectCombination PASS');
      } catch (err) {
        console.error('testTypeTagWithExternalObjectCombination err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_OBJECT_0007
     * @tc.name testSymbolAsObjectPropertyKeyUnderDifferentProtectionLevels
     * @tc.desc Test Symbol as object property key under different protection levels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSymbolAsObjectPropertyKeyUnderDifferentProtectionLevels',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        console.info('testSymbolAsObjectPropertyKeyUnderDifferentProtectionLevels START');

        try {
          // 调用C++测试函数进行Symbol作为对象属性键在不同保护级别下的行为测试
          let result = napitestex.NapiObjectTest007();
          expect(result).assertTrue();

          console.info('testSymbolAsObjectPropertyKeyUnderDifferentProtectionLevels PASS');
        } catch (err) {
          console.error('testSymbolAsObjectPropertyKeyUnderDifferentProtectionLevels err msg: ' + err.message);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_OBJECT_0008
     * @tc.name testTypeTagBehaviorInPrototypeChain
     * @tc.desc Test type tag behavior in prototype chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypeTagBehaviorInPrototypeChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testTypeTagBehaviorInPrototypeChain START');

      try {
        // 调用C++测试函数进行类型标签在原型链中的行为测试
        let result = napitestex.NapiObjectTest008();
        expect(result).assertTrue();

        console.info('testTypeTagBehaviorInPrototypeChain PASS');
      } catch (err) {
        console.error('testTypeTagBehaviorInPrototypeChain err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_OBJECT_0009
     * @tc.name testExternalObjectWithPrototypeMethodInteraction
     * @tc.desc Test external object interaction with prototype methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExternalObjectWithPrototypeMethodInteraction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testExternalObjectWithPrototypeMethodInteraction START');

      try {
        // 调用C++测试函数进行外部对象与原型方法交互测试
        let result = napitestex.NapiObjectTest009();
        expect(result).assertTrue();

        console.info('testExternalObjectWithPrototypeMethodInteraction PASS');
      } catch (err) {
        console.error('testExternalObjectWithPrototypeMethodInteraction err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_OBJECT_0010
     * @tc.name testObjectThreadSafety
     * @tc.desc Test thread safety of object-related NAPI functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectThreadSafety', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testObjectThreadSafety START');

      try {
        // 调用C++测试函数进行对象相关函数的线程安全性测试
        let result = napitestex.NapiObjectTest010();
        expect(result).assertTrue();

        console.info('testObjectThreadSafety PASS');
      } catch (err) {
        console.error('testObjectThreadSafety err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_OBJECT_0011
     * @tc.name testExternalObjectThreadSafety
     * @tc.desc Test thread safety of external object NAPI functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExternalObjectThreadSafety', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testExternalObjectThreadSafety START');

      try {
        // 调用C++测试函数进行外部对象函数的线程安全性测试
        let result = napitestex.NapiObjectTest011();
        expect(result).assertTrue();

        console.info('testExternalObjectThreadSafety PASS');
      } catch (err) {
        console.error('testExternalObjectThreadSafety err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_OBJECT_0012
     * @tc.name testSymbolThreadSafety
     * @tc.desc Test thread safety of Symbol NAPI functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSymbolThreadSafety', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testSymbolThreadSafety START');

      try {
        // 调用C++测试函数进行Symbol函数的线程安全性测试
        let result = napitestex.NapiObjectTest012();
        expect(result).assertTrue();

        console.info('testSymbolThreadSafety PASS');
      } catch (err) {
        console.error('testSymbolThreadSafety err msg: ' + err.message);
        expect().assertFail();
      }
    });
  })

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_BIGINT_0001
   * @tc.name      : testBigIntTest0001
   * @tc.desc      : Testing BigInt creation from int64 value.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testBigIntTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
    console.info('testBigIntTest0001 START');
    try {
      let result: boolean = napitestex.NapiBigIntTest01();
      console.info('testBigIntTest0001 test result: ' + result);
      expect(result).assertEqual(true);
    } catch (err) {
      console.error(`testBigIntTest0001 err msg: ${err.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_BIGINT_0002
   * @tc.name      : testBigIntTest0002
   * @tc.desc      : Testing BigInt creation from uint64 value.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testBigIntTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
    console.info('testBigIntTest0002 START');
    try {
      const result: boolean = napitestex.NapiBigIntTest02();
      console.info('testBigIntTest0002 test result: ' + result);
      expect(result).assertEqual(true);
    } catch (err) {
      console.error(`testBigIntTest0002 err msg: ${err.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_BIGINT_0003
   * @tc.name      : testBigIntTest0003
   * @tc.desc      : Testing BigInt creation and retrieval using words interface (positive and negative).
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testBigIntTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
    console.info('testBigIntTest0003 START');
    try {
      const result: boolean = napitestex.NapiBigIntTest03();
      console.info('testBigIntTest0003 test result: ' + result);
      expect(result).assertEqual(true);
    } catch (err) {
      console.error(`testBigIntTest0003 err msg: ${err.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_BIGINT_0004
   * @tc.name      : testBigIntTest0004
   * @tc.desc      : Testing BigInt boundary values (INT64_MAX, INT64_MIN, UINT64_MAX).
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testBigIntTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
    console.info('testBigIntTest0004 START');
    try {
      const result: boolean = napitestex.NapiBigIntTest04();
      console.info('testBigIntTest0004 test result: ' + result);
      expect(result).assertEqual(true);
    } catch (err) {
      console.error(`testBigIntTest0004 err msg: ${err.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_BIGINT_0005
   * @tc.name      : testBigIntTest0005
   * @tc.desc      : Testing BigInt error handling (nullptr parameters, non-BigInt values).
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testBigIntTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
    console.info('testBigIntTest0005 START');
    try {
      const result: boolean = napitestex.NapiBigIntTest05();
      console.info('testBigIntTest0005 test result: ' + result);
      expect(result).assertEqual(true);
    } catch (err) {
      console.error(`testBigIntTest0005 err msg: ${err.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_BIGINT_0006
   * @tc.name      : testBigIntTest0006
   * @tc.desc      : Testing BigInt conversion precision (lossless flag verification).
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testBigIntTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
    console.info('testBigIntTest0006 START');
    try {
      const result: boolean = napitestex.NapiBigIntTest06();
      console.info('testBigIntTest0006 test result: ' + result);
      expect(result).assertEqual(true);
    } catch (err) {
      console.error(`testBigIntTest0006 err msg: ${err.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_BIGINT_0007
   * @tc.name      : testBigIntTest0007
   * @tc.desc      : Testing BigInt int64 round-trip correctness verification.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testBigIntTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
    console.info('testBigIntTest0007 START');
    try {
      const result: boolean = napitestex.NapiBigIntTest07();
      console.info('testBigIntTest0007 test result: ' + result);
      expect(result).assertEqual(true);
    } catch (err) {
      console.error(`testBigIntTest0007 err msg: ${err.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_BIGINT_0008
   * @tc.name      : testBigIntTest0008
   * @tc.desc      : Testing BigInt uint64 round-trip correctness verification.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testBigIntTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
    console.info('testBigIntTest0008 START');
    try {
      const result: boolean = napitestex.NapiBigIntTest08();
      console.info('testBigIntTest0008 test result: ' + result);
      expect(result).assertEqual(true);
    } catch (err) {
      console.error(`testBigIntTest0008 err msg: ${err.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_BIGINT_0009
   * @tc.name      : testBigIntTest0009
   * @tc.desc      : Testing BigInt uint64 array words round-trip correctness verification.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testBigIntTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
    console.info('testBigIntTest0009 START');
    try {
      const result: boolean = napitestex.NapiBigIntTest09();
      console.info('testBigIntTest0009 test result: ' + result);
      expect(result).assertEqual(true);
    } catch (err) {
      console.error(`testBigIntTest0009 err msg: ${err.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_BIGINT_0010
   * @tc.name      : testBigIntTest0010
   * @tc.desc      : Testing BigInt with negative value.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testBigIntTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
    console.info('testBigIntTest0010 START');
    try {
      const result: boolean = napitestex.NapiBigIntTest10();
      console.info('testBigIntTest0010 test result: ' + result);
      expect(result).assertEqual(true);
    } catch (err) {
      console.error(`testBigIntTest0010 err msg: ${err.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_BIGINT_0011
   * @tc.name      : testBigIntTest0011
   * @tc.desc      : Testing BigInt with maximum int64 value.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testBigIntTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
    console.info('testBigIntTest0011 START');
    try {
      const result: boolean = napitestex.NapiBigIntTest11();
      console.info('testBigIntTest0011 test result: ' + result);
      expect(result).assertEqual(true);
    } catch (err) {
      console.error(`testBigIntTest0011 err msg: ${err.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_BIGINT_0012
   * @tc.name      : testBigIntTest0012
   * @tc.desc      : Testing BigInt with zero value verification.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testBigIntTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
    console.info('testBigIntTest0012 START');
    try {
      const result: boolean = napitestex.NapiBigIntTest12();
      console.info('testBigIntTest0012 test result: ' + result);
      expect(result).assertEqual(true);
    } catch (err) {
      console.error(`testBigIntTest0012 err msg: ${err.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_BIGINT_0013
   * @tc.name      : testBigIntTest0013
   * @tc.desc      : Testing BigInt multi-thread concurrent creation.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testBigIntTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
    console.info('testBigIntTest0013 START');
    try {
      const result: boolean = napitestex.NapiBigIntTest13();
      console.info('testBigIntTest0013 test result: ' + result);
      expect(result).assertEqual(true);
    } catch (err) {
      console.error(`testBigIntTest0013 err msg: ${err.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_BIGINT_0014
   * @tc.name      : testBigIntTest0014
   * @tc.desc      : Testing BigInt multi-thread shared object reading.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testBigIntTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
    console.info('testBigIntTest0014 START');
    try {
      const result: boolean = napitestex.NapiBigIntTest14();
      console.info('testBigIntTest0014 test result: ' + result);
      expect(result).assertEqual(true);
    } catch (err) {
      console.error(`testBigIntTest0014 err msg: ${err.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_BIGINT_0015
   * @tc.name      : testBigIntTest0015
   * @tc.desc      : Testing BigInt inter-thread object passing.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testBigIntTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
    console.info('testBigIntTest0015 START');
    try {
      const result: boolean = napitestex.NapiBigIntTest15();
      console.info('testBigIntTest0015 test result: ' + result);
      expect(result).assertEqual(true);
    } catch (err) {
      console.error(`testBigIntTest0015 err msg: ${err.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_BIGINT_0016
   * @tc.name      : testBigIntTest0016
   * @tc.desc      : Testing BigInt multi-thread exception handling.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testBigIntTest0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
    console.info('testBigIntTest0016 START');
    try {
      const result: boolean = napitestex.NapiBigIntTest16();
      console.info('testBigIntTest0016 test result: ' + result);
      expect(result).assertEqual(true);
    } catch (err) {
      console.error(`testBigIntTest0016 err msg: ${err.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_BIGINT_0017
   * @tc.name      : testBigIntTest0017
   * @tc.desc      : Testing BigInt thread safety with ArkTS exception interaction.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testBigIntTest0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
    console.info('testBigIntTest0017 START');
    try {
      const result: boolean = napitestex.NapiBigIntTest17();
      console.info('testBigIntTest0017 test result: ' + result);
      expect(result).assertEqual(true);
    } catch (err) {
      console.error(`testBigIntTest0017 err msg: ${err.message}`);
      expect().assertFail();
    }
    done();
  });

  // ==================== NAPI Extension Test Cases ====================

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0001
   * @tc.name      : testAsyncTaskSchedulingPriority
   * @tc.desc      : Testing async task scheduling priority.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testAsyncTaskSchedulingPriority', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest001();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0002
   * @tc.name      : testCallThreadSafeFunctionWithPriority
   * @tc.desc      : Testing thread safe function call with priority.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testCallThreadSafeFunctionWithPriority', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest002();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0003
   * @tc.name      : testHighPriorityCallToTail
   * @tc.desc      : Testing high priority call to tail.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testHighPriorityCallToTail', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest003();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0004
   * @tc.name      : testNormalPriorityCallToHead
   * @tc.desc      : Testing normal priority call to head.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testNormalPriorityCallToHead', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest004();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0005
   * @tc.name      : testLowPriorityCall
   * @tc.desc      : Testing low priority call.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testLowPriorityCall', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest005();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0006
   * @tc.name      : testMixedPriorityExecutionOrder
   * @tc.desc      : Testing mixed priority execution order.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testMixedPriorityExecutionOrder', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest006();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0007
   * @tc.name      : testSamePriorityIsTailEffect
   * @tc.desc      : Testing same priority isTail effect.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testSamePriorityIsTailEffect', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest007();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0008
   * @tc.name      : testSerializeSimpleObject
   * @tc.desc      : Testing serialize simple object.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testSerializeSimpleObject', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest008();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0009
   * @tc.name      : testSerializeWithTransferList
   * @tc.desc      : Testing serialize with transfer list.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testSerializeWithTransferList', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest009();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0010
   * @tc.name      : testSerializeWithCloneList
   * @tc.desc      : Testing serialize with clone list.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testSerializeWithCloneList', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest010();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0011
   * @tc.name      : testSerializeComplexNestedObject
   * @tc.desc      : Testing serialize complex nested object.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testSerializeComplexNestedObject', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest011();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0012
   * @tc.name      : testDeserializeSimpleObject
   * @tc.desc      : Testing deserialize simple object.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testDeserializeSimpleObject', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest012();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0013
   * @tc.name      : testDeserializeWithTransferData
   * @tc.desc      : Testing deserialize with transfer data.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testDeserializeWithTransferData', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest013();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0014
   * @tc.name      : testDeserializeWithCloneData
   * @tc.desc      : Testing deserialize with clone data.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testDeserializeWithCloneData', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest014();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0015
   * @tc.name      : testDeleteValidSerializationData
   * @tc.desc      : Testing delete valid serialization data.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testDeleteValidSerializationData', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest015();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0016
   * @tc.name      : testDeleteSerializationDataTwice
   * @tc.desc      : Testing delete serialization data twice.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testDeleteSerializationDataTwice', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest016();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0017
   * @tc.name      : testSerializeDeserializeDeleteFlow
   * @tc.desc      : Testing serialize deserialize delete flow.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testSerializeDeserializeDeleteFlow', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest017();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0018
   * @tc.name      : testMultiThreadSerialization
   * @tc.desc      : Testing multi thread serialization.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testMultiThreadSerialization', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest018();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0019
   * @tc.name      : testCrossThreadSerialization
   * @tc.desc      : Testing cross thread serialization.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testCrossThreadSerialization', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest019();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0020
   * @tc.name      : testAsyncEventLoopRunAndStop
   * @tc.desc      : Testing async event loop run and stop.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testAsyncEventLoopRunAndStop', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest020();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0021
   * @tc.name      : testCreateArkTSRuntime
   * @tc.desc      : Testing create ArkTS runtime.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testCreateArkTSRuntime', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest021();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0022
   * @tc.name      : testCreateAndDestroyRuntime
   * @tc.desc      : Testing create and destroy runtime.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testCreateAndDestroyRuntime', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest022();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0023
   * @tc.name      : testCreateMultipleRuntimes
   * @tc.desc      : Testing create multiple runtimes.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testCreateMultipleRuntimes', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest023();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0024
   * @tc.name      : testBasicEventLoopOperations
   * @tc.desc      : Testing basic event loop operations.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testBasicEventLoopOperations', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest024();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0025
   * @tc.name      : testDifferentEventLoopModes
   * @tc.desc      : Testing different event loop modes.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testDifferentEventLoopModes', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest025();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0026
   * @tc.name      : testFullLifecycle
   * @tc.desc      : Testing full lifecycle.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testFullLifecycle', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest026();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0027
   * @tc.name      : testAsyncWorkWithQoS
   * @tc.desc      : Testing async work with QoS.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testAsyncWorkWithQoS', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest027();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0028
   * @tc.name      : testRunScriptPath
   * @tc.desc      : Testing run script path.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testRunScriptPath', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest028();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0029
   * @tc.name      : testLoadModule
   * @tc.desc      : Testing load module.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testLoadModule', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest029();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0030
   * @tc.name      : testLoadModuleWithInfo
   * @tc.desc      : Testing load module with info.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testLoadModuleWithInfo', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest030();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0032
   * @tc.name      : testCreateObjectWithProperties
   * @tc.desc      : Testing create object with properties.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testCreateObjectWithProperties', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest032();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0033
   * @tc.name      : testCreateObjectWithNamedProperties
   * @tc.desc      : Testing create object with named properties.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testCreateObjectWithNamedProperties', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest033();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0034
   * @tc.name      : testCoerceToNativeBindingObject
   * @tc.desc      : Testing coerce to native binding object.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testCoerceToNativeBindingObject', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest034();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0035
   * @tc.name      : testJSObjectNativeBindingAndUnwrapping
   * @tc.desc      : Testing JS object native binding and unwrapping.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testJSObjectNativeBindingAndUnwrapping', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest035();
    expect(result).assertTrue();
  });


  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0036
   * @tc.name      : testAsyncTaskWithPromise
   * @tc.desc      : Testing async task with promise.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testAsyncTaskWithPromise', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest036();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0037
   * @tc.name      : testAsyncTaskWithCallback
   * @tc.desc      : Testing async task with callback.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testAsyncTaskWithCallback', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest037();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0038
   * @tc.name      : testThreadSafetyDevelopment
   * @tc.desc      : Testing thread safety development.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testThreadSafetyDevelopment', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest038();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0039
   * @tc.name      : testNativeArkTSObjectBinding
   * @tc.desc      : Testing native ArkTS object binding.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testNativeArkTSObjectBinding', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest039();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0040
   * @tc.name      : testNativeSendableArkTSObjectBinding
   * @tc.desc      : Testing native sendable ArkTS object binding.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testNativeSendableArkTSObjectBinding', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest040();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0041
   * @tc.name      : testMainThreadModuleLoading
   * @tc.desc      : Testing main thread module loading.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testMainThreadModuleLoading', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest041();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0042
   * @tc.name      : testAsyncThreadEventLoop
   * @tc.desc      : Testing async thread event loop.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testAsyncThreadEventLoop', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest042();
    expect(result).assertTrue();
  });


  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0044
   * @tc.name      : testAsyncThreadTaskSubmission
   * @tc.desc      : Testing async thread task submission.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testAsyncThreadTaskSubmission', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest044();
    expect(result).assertTrue();
  });

  /**
   * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0045
   * @tc.name      : testNAPIExceptionLoggingAndCrashAnalysis
   * @tc.desc      : Testing NAPI exception logging and crash analysis.
   * @tc.size      : SmallTest
   * @tc.type      : Function
   * @tc.level     : Level 1
   */
  it('testNAPIExceptionLoggingAndCrashAnalysis', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
    let result = napitestex.NapiExtensionTest045();
    expect(result).assertTrue();
  });
}
