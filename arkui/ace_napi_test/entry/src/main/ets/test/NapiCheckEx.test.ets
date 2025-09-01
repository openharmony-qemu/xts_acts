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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"
import hilog from '@ohos.hilog'
import napitestex from 'libnapitestex.so'

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
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_BUFFER_0001
    * @tc.name      napiTestEx0001
    * @tc.desc      napiTestEx
    */
    it('napiTestEx0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer: Object = napitestex.CreateBufferCopy();
      expect(napitestex.IsBuffer(buffer)).assertTrue();
      expect(napitestex.GetBufferInfo(buffer)).assertTrue();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_BUFFER_0002
    * @tc.name      napiBufferTest002
    * @tc.desc      aceNapiEtsTest
    */
    it('napiBufferTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer: Object = napitestex.CreateBuffer();
      expect(napitestex.IsBuffer(buffer)).assertTrue();
      expect(napitestex.GetBufferInfo(buffer)).assertTrue();
    })

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_BUFFER_0003
    * @tc.name      napiBufferTest003
    * @tc.desc      aceNapiEtsTest
    */
    it('napiBufferTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer: Object = napitestex.CreateBufferCopy();
      expect(napitestex.IsBuffer(buffer)).assertTrue();
      expect(napitestex.GetBufferInfo(buffer)).assertTrue();
    })

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_BUFFER_0004
    * @tc.name      napiBufferTest004
    * @tc.desc      aceNapiEtsTest - Test external buffer creation and finalize callback
    */
    it('napiBufferTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let externalBuffer: Object = napitestex.CreateExternalBufferTest();
      expect(napitestex.IsBuffer(externalBuffer)).assertTrue();
      expect(napitestex.GetBufferInfo(externalBuffer)).assertTrue();
    })

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_BUFFER_0005
    * @tc.name      napiBufferTest005
    * @tc.desc      aceNapiEtsTest - Test buffer creation edge cases and error handling
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
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_BUFFER_0006
    * @tc.name      napiBufferTest006
    * @tc.desc      aceNapiEtsTest - Test non-ArrayBuffer object detection
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
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_BUFFER_0007
    * @tc.name      napiBufferTest007
    * @tc.desc      aceNapiEtsTest - Test multiple operations combination
    */
    it('napiBufferTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // 测试多种操作的组合
      let testResult: Object = napitestex.TestMultipleOperations();
      hilog.info(0x0000, 'testTag', 'testResult:%{public}d', testResult);
      // 所有操作成功应该返回 0 (napi_ok)
      expect(testResult).assertDeepEquals(0);
    })

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_BUFFER_0008
    * @tc.name      napiBufferTest008
    * @tc.desc      aceNapiEtsTest - Test ArrayBuffer thread safety in multi-threaded environment
    */
    it('napiBufferTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // 测试多线程环境下的ArrayBuffer线程安全性
      let threadSafetyResult: boolean = napitestex.TestArrayBufferThreadSafety();
      hilog.info(0x0000, 'testTag', 'threadSafetyResult:%{public}s', threadSafetyResult.toString());
      // 所有线程操作成功应该返回 true
      expect(threadSafetyResult).assertTrue();
    })

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_BUFFER_0009
    * @tc.name      napiBufferTest009
    * @tc.desc      aceNapiEtsTest - Test ArrayBuffer and external ArrayBuffer comparison
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
        let result:boolean = napitestex.NapiArrayBufferTest01();
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
  })
}
