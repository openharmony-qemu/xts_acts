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

interface TestObject {
  test: string;
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
        let result: boolean = napitestex.NapiNumberTest001();
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
        let result: boolean = napitestex.NapiNumberTest002();
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
        let result: boolean = napitestex.NapiNumberTest003();
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
        let result: boolean = napitestex.NapiNumberTest004();
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
        let result: boolean = napitestex.NapiNumberTest005();
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
        let result: boolean = napitestex.NapiNumberTest006();
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
        let result: boolean = napitestex.NapiNumberTest007();
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
        let result: boolean = napitestex.NapiNumberTest008();
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
        let result: boolean = napitestex.NapiObjectTest001();
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
        let result: boolean = napitestex.NapiObjectTest002();
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
        let result: boolean = napitestex.NapiObjectTest003();
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
          let result: boolean = napitestex.NapiObjectTest004();
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
        let result: boolean = napitestex.NapiObjectTest005();
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
        let result: boolean = napitestex.NapiObjectTest006();

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
          let result: boolean = napitestex.NapiObjectTest007();
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
        let result: boolean = napitestex.NapiObjectTest008();
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
        let result: boolean = napitestex.NapiObjectTest009();
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
        let result: boolean = napitestex.NapiObjectTest010();
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
        let result: boolean = napitestex.NapiObjectTest011();
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
        let result: boolean = napitestex.NapiObjectTest012();
        expect(result).assertTrue();

        console.info('testSymbolThreadSafety PASS');
      } catch (err) {
        console.error('testSymbolThreadSafety err msg: ' + err.message);
        expect().assertFail();
      }
    });

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

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0001
     * @tc.name      : testExtension001
     * @tc.desc      : Testing async task scheduling priority.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testExtension001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension001 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest001();
        console.info('testExtension001 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension001 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0002
     * @tc.name      : testExtension002
     * @tc.desc      : Testing thread safe function call with priority.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testExtension002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension002 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest002();
        console.info('testExtension002 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension002 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0003
     * @tc.name      : testExtension003
     * @tc.desc      : Testing high priority call to tail.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testExtension003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension003 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest003();
        console.info('testExtension003 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension003 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0004
     * @tc.name      : testExtension004
     * @tc.desc      : Testing normal priority call to head.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testExtension004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension004 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest004();
        console.info('testExtension004 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension004 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0005
     * @tc.name      : testExtension005
     * @tc.desc      : Testing low priority call.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testExtension005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension005 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest005();
        console.info('testExtension005 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension005 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : testExtension006
     * @tc.name      : testExtension006
     * @tc.desc      : Testing mixed priority execution order.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testExtension006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension006 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest006();
        console.info('testExtension006 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension006 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : testExtension007
     * @tc.name      : testExtension007
     * @tc.desc      : Testing same priority isTail effect.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testExtension007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension007 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest007();
        console.info('testExtension007 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension007 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : testExtension008
     * @tc.name      : testExtension008
     * @tc.desc      : Testing serialize simple object.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testExtension008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension008 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest008();
        console.info('testExtension008 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension008 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : testExtension009
     * @tc.name      : testExtension009
     * @tc.desc      : Testing serialize with transfer list.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testExtension009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension009 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest009();
        console.info('testExtension009 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension009 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : testExtension010
     * @tc.name      : testExtension010
     * @tc.desc      : Testing serialize with clone list.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testExtension010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension010 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest010();
        console.info('testExtension010 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension010 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : testExtension011
     * @tc.name      : testExtension011
     * @tc.desc      : Testing serialize complex nested object.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testExtension011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension011 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest011();
        console.info('testExtension011 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension011 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : testExtension012
     * @tc.name      : testExtension012
     * @tc.desc      : Testing deserialize simple object.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testExtension012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension012 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest012();
        console.info('testExtension012 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension012 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : testExtension013
     * @tc.name      : testExtension013
     * @tc.desc      : Testing deserialize with transfer data.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testExtension013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension013 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest013();
        console.info('testExtension013 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension013 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : testExtension014
     * @tc.name      : testExtension014
     * @tc.desc      : Testing deserialize with clone data.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testExtension014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension014 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest014();
        console.info('testExtension014 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension014 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : testExtension015
     * @tc.name      : testExtension015
     * @tc.desc      : Testing delete valid serialization data.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testExtension015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension015 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest015();
        console.info('testExtension015 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension015 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : testExtension020
     * @tc.name      : testExtension020
     * @tc.desc      : Testing async event loop run and stop.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testExtension020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension020 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest020();
        console.info('testExtension020 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension020 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : testExtension021
     * @tc.name      : testExtension021
     * @tc.desc      : Testing create ArkTS runtime.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testExtension021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension021 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest021();
        console.info('testExtension021 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension021 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : testExtension027
     * @tc.name      : testExtension027
     * @tc.desc      : Testing async work with QoS.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testExtension027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension027 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest027();
        console.info('testExtension027 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension027 err msg: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number    : testExtension036
     * @tc.name      : testExtension036
     * @tc.desc      : Testing async task with promise.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testExtension036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension036 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest036();
        console.info('testExtension036 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension036 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : testExtension037
     * @tc.name      : testExtension037
     * @tc.desc      : Testing async task with callback.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testExtension037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension037 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest037();
        console.info('testExtension037 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension037 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : testExtension038
     * @tc.name      : testExtension038
     * @tc.desc      : Testing thread safety development.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testExtension038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension038 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest038();
        console.info('testExtension038 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension038 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : testExtension039
     * @tc.name      : testExtension039
     * @tc.desc      : Testing native ArkTS object binding.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testExtension039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension039 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest039();
        console.info('testExtension039 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension039 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : testExtension045
     * @tc.name      : testExtension045
     * @tc.desc      : Testing NAPI exception logging and crash analysis.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testExtension045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension045 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest045();
        console.info('testExtension045 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension045 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
      * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DATE_0001
      * @tc.name      : napiDateTest001
      * @tc.desc      : Testing Date object creation and retrieval with timestamp.
      * @tc.size      : SmallTest
      * @tc.type      : Function
      * @tc.level     : Level 1
      */
    it('napiDateTest001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Test Date creation and retrieval
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest001 begin');
      
      // Define test timestamp (2024-01-01 00:00:00 UTC)
      const TEST_TIMESTAMP = 1704067200000;
      
      // Test creating Date object
      let dateObj: Date = napitestex.testCreateDate(TEST_TIMESTAMP);
      expect(dateObj instanceof Date).assertEqual(true);
      
      // Test getting Date timestamp value
      let retrievedTimestamp: number = napitestex.testGetDateValue(dateObj);
      expect(retrievedTimestamp).assertEqual(TEST_TIMESTAMP);
      
      // Verify the Date object works correctly in JavaScript
      expect(dateObj.getTime()).assertEqual(TEST_TIMESTAMP);
      
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest001 completed successfully');
    })

    /**
      * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DATE_0002
      * @tc.name      : napiDateTest002
      * @tc.desc      : Testing invalid Date object timestamp acquisition with non-Date objects.
      * @tc.size      : SmallTest
      * @tc.type      : Function
      * @tc.level     : Level 1
      */
    it('napiDateTest002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Test Date object type verification
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest002 begin');
      
      // Define test timestamp (2024-01-01 00:00:00 UTC)
      const TEST_TIMESTAMP = 1704067200000;
      
      // Test creating Date object using napi_create_date
      let dateObj: Date = napitestex.testCreateDate(TEST_TIMESTAMP);
      expect(dateObj instanceof Date).assertEqual(true);
      
      // Test using napi_is_date to check if object is Date type
      let isDateResult: boolean = napitestex.testIsDate(dateObj);
      expect(isDateResult).assertEqual(true);
      
      // Test with non-Date objects to ensure napi_is_date returns false
      let nonDateObj: TestObject = { test: "not a date" };
      let isNotDateResult: boolean = napitestex.testIsDate(nonDateObj);
      expect(isNotDateResult).assertEqual(false);
      
      // Test with number to ensure napi_is_date returns false
      let numberObj = 123;
      let isNumberDateResult: boolean = napitestex.testIsDate(numberObj);
      expect(isNumberDateResult).assertEqual(false);
      
      // Test with string to ensure napi_is_date returns false
      let stringObj = "2024-01-01";
      let isStringDateResult: boolean = napitestex.testIsDate(stringObj);
      expect(isStringDateResult).assertEqual(false);
      
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest002 completed successfully');
    })

    /**
      * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DATE_0003
      * @tc.name      : napiDateTest003
      * @tc.desc      : Testing invalid Date object timestamp acquisition with non-Date objects.
      * @tc.size      : SmallTest
      * @tc.type      : Function
      * @tc.level     : Level 1
      */
    it('napiDateTest003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Test passing non-Date objects to Date functions
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest003 begin');
      
      // Test with string object
      let stringObj = "2024-01-01";
      let stringResult: napitestex.DateValueWithErrorResult = napitestex.testGetDateValueWithError(stringObj);
      hilog.info(0x0000, 'testTag', '%{public}s%{public}s', 'napiDateTest003:', JSON.stringify(stringResult));
      
      // Verify napi_is_date returns napi_ok and is_date is false
      expect(stringResult.isDateStatus).assertEqual(0); // napi_ok = 0
      expect(stringResult.isDate).assertEqual(false);
      
      // Verify napi_get_date_value returns error (napi_date_expected = 18)
      expect(stringResult.getDateStatus).assertEqual(18); // napi_date_expected
      
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest003 completed successfully');
    })

    /**
      * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DATE_0004
      * @tc.name      : napiDateTest004
      * @tc.desc      : Testing invalid Date object timestamp acquisition with various non-Date types.
      * @tc.size      : SmallTest
      * @tc.type      : Function
      * @tc.level     : Level 1
      */
    it('napiDateTest004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Test invalid Date object timestamp retrieval
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest004 begin');
      
      // Test with string object (non-Date type)
      let stringObj = "2024-01-01";
      let stringResult: napitestex.DateValueOnlyResult = napitestex.testGetDateValueOnly(stringObj);
      
      // Verify napi_get_date_value returns napi_date_expected (18)
      expect(stringResult.status).assertEqual(18); // napi_date_expected
      
      // Test with number object (non-Date type)
      let numberObj = 123;
      let numberResult: napitestex.DateValueOnlyResult = napitestex.testGetDateValueOnly(numberObj);
      
      // Verify napi_get_date_value returns napi_date_expected (18)
      expect(numberResult.status).assertEqual(18); // napi_date_expected
      
      // Test with plain object (non-Date type)
      let plainObj: TestObject = { test: "not a date" };
      let plainResult: napitestex.DateValueOnlyResult = napitestex.testGetDateValueOnly(plainObj);
      
      // Verify napi_get_date_value returns napi_date_expected (18)
      expect(plainResult.status).assertEqual(18); // napi_date_expected
      
      // Test with boolean (non-Date type)
      let booleanObj: boolean = true;
      let booleanResult: napitestex.DateValueOnlyResult = napitestex.testGetDateValueOnly(booleanObj);
      
      // Verify napi_get_date_value returns napi_date_expected (18)
      expect(booleanResult.status).assertEqual(18); // napi_date_expected
      
      // Test with array (non-Date type)
      let arrayObj = [1, 2, 3];
      let arrayResult: napitestex.DateValueOnlyResult = napitestex.testGetDateValueOnly(arrayObj);
      
      // Verify napi_get_date_value returns napi_date_expected (18)
      expect(arrayResult.status).assertEqual(18); // napi_date_expected
      
      // Test with actual Date object for comparison (should succeed)
      let dateObj: Date = napitestex.testCreateDate(1704067200000);
      let dateResult: napitestex.DateValueOnlyResult = napitestex.testGetDateValueOnly(dateObj);
      
      // Verify napi_get_date_value returns napi_ok (0)
      expect(dateResult.status).assertEqual(0); // napi_ok
      expect(dateResult.value).assertEqual(1704067200000);
      
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest004 completed successfully');
    })

    /**
      * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DATE_0005
      * @tc.name      : napiDateTest005
      * @tc.desc      : Testing minimum valid timestamp (0) for Date object creation and retrieval.
      * @tc.size      : SmallTest
      * @tc.type      : Function
      * @tc.level     : Level 1
      */
    it('napiDateTest005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Test minimum valid timestamp (0)
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest005 begin');
      
      // Test creating Date object with timestamp 0 and getting its value
      let result: napitestex.DateMinTimestampResult = napitestex.testCreateDateWithMinTimestamp();
      
      // Verify napi_create_date returns napi_ok
      expect(result.createStatus).assertEqual(0); // napi_ok = 0
      
      // Verify napi_get_date_value returns napi_ok
      expect(result.getStatus).assertEqual(0); // napi_ok = 0
      
      // Verify timestamp is 0
      expect(result.timestamp).assertEqual(0);
      
      // Additional verification: test with JavaScript Date object
      let jsDate = new Date(0);
      expect(jsDate.getTime()).assertEqual(0);
      
      // Verify the Date object represents Unix epoch (1970-01-01 00:00:00 UTC)
      expect(jsDate.getUTCFullYear()).assertEqual(1970);
      expect(jsDate.getUTCMonth()).assertEqual(0); // January (0-based)
      expect(jsDate.getUTCDate()).assertEqual(1);
      expect(jsDate.getUTCHours()).assertEqual(0);
      expect(jsDate.getUTCMinutes()).assertEqual(0);
      expect(jsDate.getUTCSeconds()).assertEqual(0);
      
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest005 completed successfully');
    })

    /**
      * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DATE_0006
      * @tc.name      : napiDateTest006
      * @tc.desc      : Testing maximum valid timestamp for Date object creation and retrieval.
      * @tc.size      : SmallTest
      * @tc.type      : Function
      * @tc.level     : Level 1
      */
    it('napiDateTest006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Test maximum valid timestamp
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest006 begin');
      
      // Test creating Date object with maximum timestamp and getting its value
      let result: napitestex.DateMaxTimestampResult = napitestex.testCreateDateWithMaxTimestamp();
      
      // Verify napi_create_date returns napi_ok
      expect(result.createStatus).assertEqual(0); // napi_ok = 0
      
      // Verify napi_get_date_value returns napi_ok
      expect(result.getStatus).assertEqual(0); // napi_ok = 0
      
      // Verify timestamp is the maximum safe timestamp value
      const MAX_SAFE_TIMESTAMP = 8640000000000000.0;
      expect(result.timestamp).assertEqual(MAX_SAFE_TIMESTAMP);
      
      // Additional verification: test with JavaScript Date object
      let jsDate = new Date(MAX_SAFE_TIMESTAMP);
      expect(jsDate.getTime()).assertEqual(MAX_SAFE_TIMESTAMP);
      
      // Verify the Date object represents a very far future date
      // This timestamp represents approximately year 275759
      expect(jsDate.getTime()).assertLarger(1000000000000000); // Should be much larger than current time
      
      // Test that we can create and retrieve the same timestamp
      let testDate: Date = napitestex.testCreateDate(MAX_SAFE_TIMESTAMP);
      let retrievedTimestamp: number = napitestex.testGetDateValue(testDate);
      expect(retrievedTimestamp).assertEqual(MAX_SAFE_TIMESTAMP);
      
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest006 completed successfully');
    })

    /**
      * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DATE_0007
      * @tc.name      : napiDateTest007
      * @tc.desc      : Testing multiple Date object creations and retrievals with different timestamps.
      * @tc.size      : SmallTest
      * @tc.type      : Function
      * @tc.level     : Level 1
      */
    it('napiDateTest007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Test multiple Date object creations and retrievals
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest007 begin');
      
      // Test multiple Date operations
      let result: napitestex.MultipleDateOperationsResult = napitestex.testMultipleDateOperations();
      
      // Verify both objects are Date instances
      expect(result.dateA instanceof Date).assertEqual(true);
      expect(result.dateB instanceof Date).assertEqual(true);
      
      // Verify timestamps
      expect(result.timestampA).assertEqual(1000);
      expect(result.timestampB).assertEqual(2000);
      
      // Verify modified timestamp A
      expect(result.modifiedTimestampA).assertEqual(3000);
      
      // Additional verification using JavaScript Date methods
      let dateA: Date = result.dateA;
      let dateB: Date = result.dateB;
      
      // Verify Date A properties
      expect(dateA.getTime()).assertEqual(1000);
      expect(dateA.getFullYear()).assertEqual(1970);
      expect(dateA.getMonth()).assertEqual(0); // January
      expect(dateA.getDate()).assertEqual(1);
      expect(dateA.getHours()).assertEqual(8);
      expect(dateA.getMinutes()).assertEqual(0);
      expect(dateA.getSeconds()).assertEqual(1);
      
      // Verify Date B properties
      expect(dateB.getTime()).assertEqual(2000);
      expect(dateB.getFullYear()).assertEqual(1970);
      expect(dateB.getMonth()).assertEqual(0); // January
      expect(dateB.getDate()).assertEqual(1);
      expect(dateB.getHours()).assertEqual(8);
      expect(dateB.getMinutes()).assertEqual(0);
      expect(dateB.getSeconds()).assertEqual(2);
      
      // Test creating additional Date objects to verify consistency
      hilog.info(0x0000, 'testTag', '%{public}s', 'Testing additional Date object creation...');
      
      // Create a new Date object with timestamp 5000
      let newDate: Date = napitestex.testCreateDate(5000);
      expect(newDate instanceof Date).assertEqual(true);
      expect(newDate.getTime()).assertEqual(5000);
      
      // Get timestamp using NAPI function
      let newTimestamp: number = napitestex.testGetDateValue(newDate);
      expect(newTimestamp).assertEqual(5000);
      
      // Verify Date type using NAPI function
      let isDate: boolean = napitestex.testIsDate(newDate);
      expect(isDate).assertEqual(true);
      
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest007 completed successfully');
    })

    /**
      * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DATE_0008
      * @tc.name      : napiDateTest008
      * @tc.desc      : Testing bulk Date object creation and verification with large numbers of objects.
      * @tc.size      : SmallTest
      * @tc.type      : Function
      * @tc.level     : Level 1
      */
    it('napiDateTest008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Test bulk Date object creation and verification
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest008 begin');
      
      // Test with 10000 Date objects
      const TEST_COUNT = 10000;
      hilog.info(0x0000, 'testTag', '%{public}s', `Creating and verifying ${TEST_COUNT} Date objects...`);
      
      let result: napitestex.BulkDateCreationResult = napitestex.testBulkDateCreation(TEST_COUNT);
      
      // Verify all operations were successful
      expect(result.success).assertEqual(true);
      
      // Verify all objects were created
      expect(result.totalCreated).assertEqual(TEST_COUNT);
      
      // Verify all objects were type-verified
      expect(result.totalVerified).assertEqual(TEST_COUNT);
      
      // Verify all timestamps were retrieved and verified
      expect(result.totalTimestamps).assertEqual(TEST_COUNT);
      
      // Verify execution time is reasonable (should be under 10 seconds for 10000 objects)
      expect(result.executionTime).assertLess(10000); // 10 seconds in milliseconds
      
      // Log performance metrics
      hilog.info(0x0000, 'testTag', '%{public}s',
        `Performance: ${result.executionTime}ms for ${TEST_COUNT} objects`);
      hilog.info(0x0000, 'testTag', '%{public}s',
        `Average: ${(result.executionTime / TEST_COUNT).toFixed(3)}ms per object`);
      
      // Test with smaller count for quick verification
      const SMALL_COUNT = 100;
      hilog.info(0x0000, 'testTag', '%{public}s', `Quick test with ${SMALL_COUNT} objects...`);
      
      let smallResult: napitestex.BulkDateCreationResult = napitestex.testBulkDateCreation(SMALL_COUNT);
      
      // Verify small batch also succeeds
      expect(smallResult.success).assertEqual(true);
      expect(smallResult.totalCreated).assertEqual(SMALL_COUNT);
      expect(smallResult.totalVerified).assertEqual(SMALL_COUNT);
      expect(smallResult.totalTimestamps).assertEqual(SMALL_COUNT);
      
      // Test edge case: 0 objects
      let zeroResult: napitestex.BulkDateCreationResult = napitestex.testBulkDateCreation(0);
      expect(zeroResult.success).assertEqual(true);
      expect(zeroResult.totalCreated).assertEqual(0);
      expect(zeroResult.totalVerified).assertEqual(0);
      expect(zeroResult.totalTimestamps).assertEqual(0);
      
      // Test edge case: 1 object
      let oneResult: napitestex.BulkDateCreationResult = napitestex.testBulkDateCreation(1);
      expect(oneResult.success).assertEqual(true);
      expect(oneResult.totalCreated).assertEqual(1);
      expect(oneResult.totalVerified).assertEqual(1);
      expect(oneResult.totalTimestamps).assertEqual(1);
      
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest008 completed successfully');
    })

    /**
      * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DATE_0009
      * @tc.name      : napiDateTest009
      * @tc.desc      : Testing concurrent Date object creation using multiple threads.
      * @tc.size      : SmallTest
      * @tc.type      : Function
      * @tc.level     : Level 1
      */
    it('napiDateTest009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Test concurrent Date object creation in multiple threads
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest009 begin');

      // Test concurrent Date creation with 5 threads
      let result: napitestex.ConcurrentDateCreationResult = napitestex.testConcurrentDateCreation();

      // Verify overall success
      expect(result.success).assertEqual(true);

      // Verify total number of threads
      expect(result.totalThreads).assertEqual(5);

      // Verify thread results array
      expect(result.threadResults.length).assertEqual(5);

      // Expected timestamps for each thread
      const expectedTimestamps = [1000, 2000, 3000, 4000, 5000];

      // Verify each thread's results
      for (let i = 0; i < result.threadResults.length; i++) {
        let threadResult: napitestex.ConcurrentDateThreadResult = result.threadResults[i];

        // Verify thread ID
        expect(threadResult.threadId).assertEqual(i);

        // Verify create status is napi_ok (0)
        expect(threadResult.createStatus).assertEqual(0);

        // Verify Date type check passed
        expect(threadResult.isDate).assertEqual(true);

        // Verify timestamp retrieval was successful
        expect(threadResult.timestamp).assertEqual(expectedTimestamps[i]);

        // Verify original timestamp matches retrieved timestamp
        expect(threadResult.originalTimestamp).assertEqual(expectedTimestamps[i]);

        hilog.info(0x0000, 'testTag', '%{public}s',
          `Thread ${i}: createStatus=${threadResult.createStatus}, isDate=${threadResult.isDate}, ` +
          `timestamp=${threadResult.timestamp}`);
      }

      // Test multiple runs to ensure consistency
      hilog.info(0x0000, 'testTag', '%{public}s', 
        'Running concurrent test multiple times for consistency...');

      for (let run = 0; run < 3; run++) {
        let runResult: napitestex.ConcurrentDateCreationResult = napitestex.testConcurrentDateCreation();
        expect(runResult.success).assertEqual(true);
        expect(runResult.totalThreads).assertEqual(5);
        expect(runResult.threadResults.length).assertEqual(5);

        // Verify all threads succeeded in this run
        for (let i = 0; i < runResult.threadResults.length; i++) {
          let threadResult: napitestex.ConcurrentDateThreadResult = runResult.threadResults[i];
          expect(threadResult.createStatus).assertEqual(0);
          expect(threadResult.isDate).assertEqual(true);
          expect(threadResult.timestamp).assertEqual(expectedTimestamps[i]);
        }

        hilog.info(0x0000, 'testTag', '%{public}s', `Run ${run + 1} completed successfully`);
      }

      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest009 completed successfully');
    })

    /**
      * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DATE_0010
      * @tc.name      : napiDateTest010
      * @tc.desc      : Testing multi-threaded shared Date object reading for consistency.
      * @tc.size      : SmallTest
      * @tc.type      : Function
      * @tc.level     : Level 1
      */
    it('napiDateTest010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Test multiple threads reading from a shared Date object
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest010 begin');

      // Test shared Date object read with 3 threads
      let result: napitestex.SharedDateObjectReadResult = napitestex.testSharedDateObjectRead();

      // Verify overall success
      expect(result.success).assertEqual(true);

      // Verify total number of threads
      expect(result.totalThreads).assertEqual(3);

      // Verify original timestamp
      expect(result.originalTimestamp).assertEqual(1234567890000);

      // Verify thread results array
      expect(result.threadResults.length).assertEqual(3);

      // Verify each thread's results
      for (let i = 0; i < result.threadResults.length; i++) {
        let threadResult: napitestex.SharedDateReadThreadResult = result.threadResults[i];

        // Verify thread ID
        expect(threadResult.threadId).assertEqual(i);

        // Verify napi_is_date returned napi_ok (0)
        expect(threadResult.isDateStatus).assertEqual(0);

        // Verify is_date is true
        expect(threadResult.isDate).assertEqual(true);

        // Verify napi_get_date_value returned napi_ok (0)
        expect(threadResult.getDateStatus).assertEqual(0);

        // Verify timestamp matches the original shared timestamp
        expect(threadResult.timestamp).assertEqual(1234567890000);

        hilog.info(0x0000, 'testTag', '%{public}s',
          `Thread ${i}: isDateStatus=${threadResult.isDateStatus}, isDate=${threadResult.isDate}, ` +
          `getDateStatus=${threadResult.getDateStatus}, timestamp=${threadResult.timestamp}`);
      }

      // Test multiple runs to ensure consistency and no data races
      hilog.info(0x0000, 'testTag', '%{public}s', 
        'Running shared read test multiple times for consistency...');

      for (let run = 0; run < 5; run++) {
        let runResult: napitestex.SharedDateObjectReadResult = napitestex.testSharedDateObjectRead();
        expect(runResult.success).assertEqual(true);
        expect(runResult.totalThreads).assertEqual(3);
        expect(runResult.originalTimestamp).assertEqual(1234567890000);

        // Verify all threads succeeded in this run
        for (let i = 0; i < runResult.threadResults.length; i++) {
          let threadResult: napitestex.SharedDateReadThreadResult = runResult.threadResults[i];
          expect(threadResult.isDateStatus).assertEqual(0);
          expect(threadResult.isDate).assertEqual(true);
          expect(threadResult.getDateStatus).assertEqual(0);
          expect(threadResult.timestamp).assertEqual(1234567890000);
        }

        hilog.info(0x0000, 'testTag', '%{public}s', `Run ${run + 1} completed successfully`);
      }

      // Test with different thread counts to verify scalability
      hilog.info(0x0000, 'testTag', '%{public}s', 'Testing with different thread counts...');

      // Note: The C++ implementation uses a fixed number of threads (3),
      // but we can verify the behavior is consistent
      let consistencyResult: napitestex.SharedDateObjectReadResult = napitestex.testSharedDateObjectRead();
      expect(consistencyResult.success).assertEqual(true);

      // Verify all timestamps are exactly the same (no data corruption)
              let allTimestamps: number[] = consistencyResult.threadResults.map(
          (r: napitestex.SharedDateReadThreadResult): number => r.timestamp);
      let firstTimestamp: number = allTimestamps[0];

      for (let timestamp of allTimestamps) {
        expect(timestamp).assertEqual(firstTimestamp);
        expect(timestamp).assertEqual(1234567890000);
      }

              hilog.info(0x0000, 'testTag', '%{public}s', 
          'All timestamps are consistent: ' + allTimestamps.join(', '));

      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest010 completed successfully');
    })

    /**
      * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DATE_0011
      * @tc.name      : napiDateTest011
      * @tc.desc      : Testing high concurrency Date operations stress test with multiple threads.
      * @tc.size      : LargeTest
      * @tc.type      : Function
      * @tc.level     : Level 1
      */
    it('napiDateTest011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Test high concurrency Date operations stress testing
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest011 begin');

      // Test high concurrency stress with 2 threads, 1 operations each
      let result: napitestex.HighConcurrencyDateStressResult = napitestex.testHighConcurrencyDateStress();
      hilog.info(0x0000, 'testTag', '%{public}s%{public}s', 'napiDateTest011 result', JSON.stringify(result));

      // Verify overall success
      expect(result.success).assertEqual(true);

      // Verify total number of threads
      expect(result.totalThreads).assertEqual(2);

      // Verify total operations
      expect(result.totalOperations).assertEqual(20); // 2 threads * 10 operations

      // Verify thread results array
      expect(result.threadResults.length).assertEqual(2);

      // Verify each thread's results
      for (let i = 0; i < result.threadResults.length; i++) {
        let threadResult: napitestex.StressTestThreadResult = result.threadResults[i];

        // Verify thread ID
        expect(threadResult.threadId).assertEqual(i);

        // Verify total operations per thread
        expect(threadResult.totalOperations).assertEqual(10);

        // Verify all operations in this thread were successful
        expect(threadResult.successfulOperations).assertEqual(10);
        expect(threadResult.failedOperations).assertEqual(0);

        // Verify execution time is reasonable (should be > 0 and < 60 seconds)
        expect(threadResult.executionTime).assertLarger(0);
        expect(threadResult.executionTime).assertLess(60000);

        // Verify memory usage is reasonable (should be > 0 and < 100 MB)
        expect(threadResult.memoryUsage).assertLarger(0);
        expect(threadResult.memoryUsage).assertLess(100000);

        hilog.info(0x0000, 'testTag', '%{public}s',
          `Thread ${i}: ops=${threadResult.totalOperations}, success=${threadResult.successfulOperations}, ` +
          `failed=${threadResult.failedOperations}, time=${threadResult.executionTime}ms, ` +
          `memory=${threadResult.memoryUsage}KB`);
      }

      // Verify overall performance metrics
      expect(result.totalExecutionTime).assertLarger(0);
      expect(result.totalMemory).assertLarger(0);

      // Verify performance variation is reasonable (should be < 50%)
      expect(result.performanceVariation).assertLess(50);

      // Verify memory increase percentage is reasonable (should be < 100%)
      expect(result.memoryIncreasePercent).assertLess(100);

      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest011 completed successfully');
    })

    /**
      * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DATE_0012
      * @tc.name      : napiDateTest012
      * @tc.desc      : Testing cross-thread Date object passing between multiple threads.
      * @tc.size      : SmallTest
      * @tc.type      : Function
      * @tc.level     : Level 1
      */
    it('napiDateTest012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Test cross-thread Date object passing
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest012 begin');

      // Test cross-thread Date object passing with 3 threads
      let result: napitestex.CrossThreadDatePassingResult = napitestex.testCrossThreadDatePassing();
      hilog.info(0x0000, 'testTag', '%{public}s%{public}s', 'napiDateTest012 result', JSON.stringify(result));

      // Verify overall success
      expect(result.success).assertEqual(true);

      // Verify total number of threads
      expect(result.totalThreads).assertEqual(3);

      // Verify original timestamp
      expect(result.originalTimestamp).assertEqual(987654321000);

      // Verify all threads were successful
      expect(result.allThreadsSuccessful).assertEqual(true);

      // Verify thread results array
      expect(result.threadResults.length).assertEqual(3);

      // Expected operations for each thread
      const expectedOperations = [
        "Create Date",
        "Receive from A and validate",
        "Receive from B and validate"
      ];

      // Verify each thread's results
      for (let i = 0; i < result.threadResults.length; i++) {
        let threadResult: napitestex.CrossThreadThreadResult = result.threadResults[i];

        // Verify thread ID
        expect(threadResult.threadId).assertEqual(i);

        // Verify operation description
        expect(threadResult.operation).assertEqual(expectedOperations[i]);

        // Verify Date type check passed
        expect(threadResult.isDate).assertEqual(true);

        // Verify timestamp retrieval was successful
        expect(threadResult.timestamp).assertEqual(987654321000);

        // Verify original timestamp matches
        expect(threadResult.originalTimestamp).assertEqual(987654321000);

        // Verify thread success
        expect(threadResult.success).assertEqual(true);
      }
    
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest012 completed successfully');
    })

    /**
      * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DATE_0013
      * @tc.name      : napiDateTest013
      * @tc.desc      : Testing thread safety with error parameter combinations in multi-threaded environment.
      * @tc.size      : SmallTest
      * @tc.type      : Function
      * @tc.level     : Level 1
      */
    it('napiDateTest013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Test thread safety with error parameter combinations
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest013 begin');

      // Test thread safety error handling with 4 threads
      let result: napitestex.ThreadSafetyErrorHandlingResult = napitestex.testThreadSafetyErrorHandling();
      hilog.info(0x0000, 'testTag', '%{public}s%{public}s', 'napiDateTest013 result', JSON.stringify(result));

      // Verify overall success
      expect(result.success).assertEqual(true);

      // Verify total number of threads
      expect(result.totalThreads).assertEqual(4);

      // Verify summary statistics
      expect(result.totalSuccessful).assertEqual(4);
      expect(result.totalFailed).assertEqual(0);

      // Verify thread results array
      expect(result.threadResults.length).assertEqual(4);

      // Expected operations and statuses for each thread
      const expectedOperations = [
        "create_date_nullptr",
        "get_date_value_nullptr",
        "is_date_nullptr",
        "normal_operations"
      ];

      const expectedStatuses = [1, 1, 1, 0]; // napi_invalid_arg, napi_invalid_arg, napi_invalid_arg, napi_ok

      // Verify each thread's results
      for (let i = 0; i < result.threadResults.length; i++) {
        let threadResult: napitestex.ThreadSafetyErrorHandlingThreadResult = result.threadResults[i];

        // Verify thread ID
        expect(threadResult.threadId).assertEqual(i);

        // Verify operation description
        expect(threadResult.operation).assertEqual(expectedOperations[i]);

        // Verify expected status
        expect(threadResult.expectedStatus).assertEqual(expectedStatuses[i]);

        // Verify thread success
        expect(threadResult.isSuccess).assertEqual(true);

        hilog.info(0x0000, 'testTag', '%{public}s',
          `Thread ${i}: operation=${threadResult.operation}, ` +
          `apiStatus=${threadResult.apiStatus}, expectedStatus=${threadResult.expectedStatus}, ` +
          `success=${threadResult.isSuccess}, errorDesc=${threadResult.errorDescription}`);
      }

      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest013 completed successfully');
    })

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_STRING_0001
     * @tc.name      testStringTest001
     * @tc.desc      Test UTF-16 string creation and retrieval using napi_create_string_utf16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testUtf16StringCreationAndRetrieval START');
      try {
        // 调用C++测试函数进行UTF-16字符串创建和获取测试
        let result: boolean = napitestex.NapiStringTest001();
        expect(result).assertTrue();
        console.info('testUtf16StringCreationAndRetrieval PASS');
      } catch (err) {
        console.error('testUtf16StringCreationAndRetrieval err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_STRING_0002
     * @tc.name      testStringTest002
     * @tc.desc      Test cross-encoding conversion between UTF-8, UTF-16, and Latin1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testCrossEncodingConversion START');
      try {
        // 调用C++测试函数进行跨编码转换测试
        let result: boolean = napitestex.NapiStringTest002();
        expect(result).assertTrue();
        console.info('testCrossEncodingConversion PASS');
      } catch (err) {
        console.error('testCrossEncodingConversion err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_STRING_0003
     * @tc.name      testStringTest003
     * @tc.desc      Test boundary length cases including empty strings and very long strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testBoundaryLengthCases START');
      try {
        // 调用C++测试函数进行边界长度测试
        let result: boolean = napitestex.NapiStringTest003();
        expect(result).assertTrue();
        console.info('testBoundaryLengthCases PASS');
      } catch (err) {
        console.error('testBoundaryLengthCases err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_STRING_0004
     * @tc.name      testStringTest004
     * @tc.desc      Test encoding compatibility between different string types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testEncodingCompatibility START');
      try {
        // 调用C++测试函数进行编码兼容性测试
        let result: boolean = napitestex.NapiStringTest004();
        expect(result).assertTrue();
        console.info('testEncodingCompatibility PASS');
      } catch (err) {
        console.error('testEncodingCompatibility err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_STRING_0005
     * @tc.name      testStringTest005
     * @tc.desc      Test buffer size edge cases and boundary conditions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testBufferSizeEdgeCases START');

      try {
        // 调用C++测试函数进行缓冲区边界测试
        let result: boolean = napitestex.NapiStringTest005();
        expect(result).assertTrue();
        console.info('testBufferSizeEdgeCases PASS');
      } catch (err) {
        console.error('testBufferSizeEdgeCases err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_STRING_0006
     * @tc.name      testStringTest006
     * @tc.desc      Test error handling robustness with invalid parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testErrorHandlingRobustness START');
      try {
        // 调用C++测试函数进行错误处理健全性测试
        let result: boolean = napitestex.NapiStringTest006();
        expect(result).assertTrue();

        console.info('testErrorHandlingRobustness PASS');
      } catch (err) {
        console.error('testErrorHandlingRobustness err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_STRING_0007
     * @tc.name      testStringTest007
     * @tc.desc      Test multi-encoding compatibility operations with mixed API usage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testMultiEncodingCompatibilityOperations START');
      try {
        // 调用C++测试函数进行多编码兼容操作测试
        let result: boolean = napitestex.NapiStringTest007();
        expect(result).assertTrue();
        console.info('testMultiEncodingCompatibilityOperations PASS');
      } catch (err) {
        console.error('testMultiEncodingCompatibilityOperations err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_STRING_0008
     * @tc.name      testStringTest008
     * @tc.desc      Test special character handling including BOM, NULL, and multi-byte characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testSpecialCharacterHandling START');
      try {
        // 调用C++测试函数进行特殊字符处理测试
        let result: boolean = napitestex.NapiStringTest008();
        expect(result).assertTrue();
        console.info('testSpecialCharacterHandling PASS');
      } catch (err) {
        console.error('testSpecialCharacterHandling err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_STRING_0009
     * @tc.name      testStringTest009
     * @tc.desc      Test thread safety simulation of NAPI string operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testStringTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info('testStringSafetySimulation START');
      try {
        // 调用C++测试函数进行线程安全性模拟测试
        let result: boolean = napitestex.NapiStringTest009();
        expect(result).assertTrue();
        console.info('testStringSafetySimulation PASS');
      } catch (err) {
        console.error('testStringSafetySimulation err msg: ' + err.message);
        expect().assertFail();
      }
    });    

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_PRIMITIVE_0001
     * @tc.name      testPrimitiveTest01
     * @tc.desc      Verify concurrent access to the global object and property read without errors
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrimitiveTest01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[testPrimitiveTest01] START');
      try {
        let result: boolean = napitestex.NapiPrimitiveTest01();
        expect(result).assertTrue();
        console.info('[testPrimitiveTest01] PASS');
      } catch (err) {
        console.error('[testPrimitiveTest01] ERROR. err.message: ' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_PRIMITIVE_0002
     * @tc.name      testPrimitiveTest02
     * @tc.desc      Verify multi-threaded coercions (bool/number/string/object) and global access without errors
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrimitiveTest02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[testPrimitiveTest02] START');
      try {
        let result: boolean = napitestex.NapiPrimitiveTest02();
        expect(result).assertTrue();
        console.info('[testPrimitiveTest02] PASS');
      } catch (err) {
        console.error('[testPrimitiveTest02] ERROR. err.message: ' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_PRIMITIVE_0003
     * @tc.name      testPrimitiveTest03
     * @tc.desc      Verify multiple threads concurrently call value getters (boolean/null/undefined/get_value_bool)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrimitiveTest03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[testPrimitiveTest03] START');
      try {
        let result: boolean = napitestex.NapiPrimitiveTest03();
        expect(result).assertTrue();
        console.info('[testPrimitiveTest03] PASS');
      } catch (err) {
        console.error('[testPrimitiveTest03] ERROR. err.message: ' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_PRIMITIVE_0004
     * @tc.name      testPrimitiveTest04
     * @tc.desc      Boolean conversion chain
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrimitiveTest04', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[testPrimitiveTest04] START');
      try {
        let result: boolean = napitestex.NapiPrimitiveTest04();
        expect(result).assertTrue();
        console.info('[testPrimitiveTest04] PASS');
      } catch (err) {
        console.error('[testPrimitiveTest04] ERROR. err.message: ' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_PRIMITIVE_0005
     * @tc.name      testPrimitiveTest05
     * @tc.desc      Multi-level type coercion
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrimitiveTest05', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[testPrimitiveTest05] START');
      try {
        let result: boolean = napitestex.NapiPrimitiveTest05();
        expect(result).assertTrue();
        console.info('[testPrimitiveTest05] PASS');
      } catch (err) {
        console.error('[testPrimitiveTest05] ERROR. err.message: ' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_PRIMITIVE_0006
     * @tc.name      testPrimitiveTest06
     * @tc.desc      Global object property operations
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrimitiveTest06', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[testPrimitiveTest06] START');
      try {
        let result: boolean = napitestex.NapiPrimitiveTest06();
        expect(result).assertTrue();
        console.info('[testPrimitiveTest06] PASS');
      } catch (err) {
        console.error('[testPrimitiveTest06] ERROR. err.message: ' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_PRIMITIVE_0007
     * @tc.name      testPrimitiveTest07
     * @tc.desc      Global object interactions with null and undefined
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrimitiveTest07', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[testPrimitiveTest07] START');
      try {
        let result: boolean = napitestex.NapiPrimitiveTest07();
        expect(result).assertTrue();
        console.info('[testPrimitiveTest07] PASS');
      } catch (err) {
        console.error('[testPrimitiveTest07] ERROR. err.message: ' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_PRIMITIVE_0008
     * @tc.name      testPrimitiveTest08
     * @tc.desc      Extreme value conversion (MAX_VALUE/MIN_VALUE) round-trip
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrimitiveTest08', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[testPrimitiveTest08] START');
      try {
        let result: boolean = napitestex.NapiPrimitiveTest08();
        expect(result).assertTrue();
        console.info('[testPrimitiveTest08] PASS');
      } catch (err) {
        console.error('[testPrimitiveTest08] ERROR. err.message: ' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_PRIMITIVE_0009
     * @tc.name      testPrimitiveTest09
     * @tc.desc      Null/undefined coercion to bool/number/string; ToObject should fail
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrimitiveTest09', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[testPrimitiveTest09] START');
      try {
        let result: boolean = napitestex.NapiPrimitiveTest09();
        expect(result).assertTrue();
        console.info('[testPrimitiveTest09] PASS');
      } catch (err) {
        console.error('[testPrimitiveTest09] ERROR. err.message: ' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_PRIMITIVE_0010
     * @tc.name      testPrimitiveTest10
     * @tc.desc      Error conversion: BigInt to number should throw; bool coercion ok
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrimitiveTest10', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[testPrimitiveTest10] START');
      try {
        let result: boolean = napitestex.NapiPrimitiveTest10();
        expect(result).assertTrue();
      } catch (err) {
        console.info('[testPrimitiveTest10] throw error, err.message: ' + err.message);
        expect(err.message).assertEqual('Cannot convert a BigInt value to a number');
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_PRIMITIVE_0011
     * @tc.name      testPrimitiveTest11
     * @tc.desc      Object with circular reference; stringify coercion should return string or throw
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrimitiveTest11', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[testPrimitiveTest11] START');
      try {
        let result: boolean = napitestex.NapiPrimitiveTest11();
        expect(result).assertTrue();
        console.info('[testPrimitiveTest11] PASS');
      } catch (err) {
        console.error('[testPrimitiveTest11] ERROR. err.message: ' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_PRIMITIVE_0012
     * @tc.name      testPrimitiveTest12
     * @tc.desc      Function object coercion to string (source or identifier)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrimitiveTest12', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[testPrimitiveTest12] START');
      try {
        let result: boolean = napitestex.NapiPrimitiveTest12();
        expect(result).assertTrue();
        console.info('[testPrimitiveTest12] PASS');
      } catch (err) {
        console.error('[testPrimitiveTest12] ERROR. err.message: ' + err.message);
        expect().assertFail();
      }
      done();
    });
  })
}
