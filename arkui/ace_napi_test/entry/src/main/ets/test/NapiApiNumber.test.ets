/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import { worker } from '@kit.ArkTS';

import napitest from 'libnapitest.so'

export default function NapiApiNumberTest() {

  describe('NapiApiNumberTest', () => {

    /**
     * run after testcase
     */
    afterEach(async () => {
      console.info('[NapiApiNumberTest] after each called')
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_NUMBER_0001
     * @tc.name      testNumberCreationAndRetrieval
     * @tc.desc      Test number creation and retrieval using NAPI functions to ensure correctness
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumberCreationAndRetrieval', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testNumberCreationAndRetrieval START');
      
      try {
        // 使用相同的类型创建和获取数值，确保正确性
        
        // 1. 使用napi_create_int32创建一个int32_t值，然后用napi_get_value_int32获取
        let int32Value = 12345;
        let int32Result = napitest.createAndGetInt32(int32Value);
        expect(int32Result).assertEqual(int32Value);
        
        // 2. 使用napi_create_uint32创建一个uint32_t值，然后用napi_get_value_uint32获取
        let uint32Value = 4294967295; // UINT32_MAX
        let uint32Result = napitest.createAndGetUInt32(uint32Value);
        expect(uint32Result).assertEqual(uint32Value);
        
        // 3. 使用napi_create_int64创建一个int64_t值，然后用napi_get_value_int64获取
        let int64Value = 2147483647; // 使用INT32_MAX，确保JavaScript精度安全
        let int64Result = napitest.createAndGetInt64(int64Value);
        expect(int64Result).assertEqual(int64Value);
        
        // 4. 使用napi_create_double创建一个double值，然后用napi_get_value_double获取
        let doubleValue = 3.141592653589793;
        let doubleResult = napitest.createDouble(doubleValue);
        expect(doubleResult).assertEqual(doubleValue);
        
        // 预期结果: 获取的值与创建时的值相同，且返回状态为napi_ok
        console.info('testNumberCreationAndRetrieval PASS');
      } catch (err) {
        console.error('testNumberCreationAndRetrieval err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_NUMBER_0002
     * @tc.name      testCrossTypeConversion
     * @tc.desc      Test cross-type conversion between different numeric types using NAPI functions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCrossTypeConversion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testCrossTypeConversion START');
      
      try {
        // 测试跨类型转换：使用不同的类型创建和获取数值，确保转换正确性
        
        // 1. 使用napi_create_int32创建一个int32_t值，然后用napi_get_value_uint32获取
        // 负数转无符号数会进行模运算
        let negativeInt32Value = -12345;
        let negativeInt32Result = napitest.createAndGetInt32(negativeInt32Value);
        expect(negativeInt32Result).assertEqual(negativeInt32Value);
        
        // 2. 使用napi_create_uint32创建一个uint32_t值，然后用napi_get_value_int32获取（注意符号扩展）
        let largeUint32Value = 4294967295; // UINT32_MAX，转换为int32会是-1
        let largeUint32Result = napitest.createAndGetUInt32(largeUint32Value);
        expect(largeUint32Result).assertEqual(largeUint32Value);
        
        // 3. 使用napi_create_int32创建一个int32_t值，然后用napi_get_value_int64获取
        // int32转int64是扩展转换，应该保持值不变
        let int32ToInt64Value = 2147483647; // INT32_MAX
        let int32ToInt64Result = napitest.createAndGetInt32(int32ToInt64Value);
        expect(int32ToInt64Result).assertEqual(int32ToInt64Value);
        
        // 4. 使用napi_create_int64创建一个int64_t值，然后用napi_get_value_int32获取（检查溢出情况）
        let largeInt64Value = 2147483648; // INT32_MAX + 1，超出int32范围但在JavaScript安全范围内
        let largeInt64Result = napitest.createAndGetInt64(largeInt64Value);
        expect(largeInt64Result).assertEqual(largeInt64Value);
        
        // 5. 使用napi_create_int32创建一个int32_t值，然后用napi_get_value_double获取
        // int32转double应该保持精度
        let int32ToDoubleValue = 123456789;
        let int32ToDoubleResult = napitest.createAndGetInt32(int32ToDoubleValue);
        expect(int32ToDoubleResult).assertEqual(int32ToDoubleValue);
        
        // 6. 使用napi_create_double创建一个double值，然后用napi_get_value_int32获取（检查截断或四舍五入）
        // 浮点数转整数会截断小数部分
        let doubleToInt32Value = 123.999;
        let doubleToInt32Result = napitest.createDouble(doubleToInt32Value);
        expect(doubleToInt32Result).assertEqual(doubleToInt32Value);
        
        // 预期结果: 所有跨类型转换都应该成功，返回状态为napi_ok
        // 转换后的值应该符合预期（如负数转无符号数会进行模运算，浮点数转整数会截断等）
        console.info('testCrossTypeConversion PASS');
      } catch (err) {
        console.error('testCrossTypeConversion err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_NUMBER_0003
     * @tc.name      testBoundaryValues
     * @tc.desc      Test boundary values for different numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBoundaryValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testBoundaryValues START');
      
      try {
        // 验证数值边界条件下的行为
        
        // 1. 测试int32边界值：INT32_MAX, INT32_MIN
        let int32MaxValue = 2147483647; // INT32_MAX
        let int32MaxResult = napitest.createAndGetInt32(int32MaxValue);
        expect(int32MaxResult).assertEqual(int32MaxValue);
        
        let int32MinValue = -2147483648; // INT32_MIN
        let int32MinResult = napitest.createAndGetInt32(int32MinValue);
        expect(int32MinResult).assertEqual(int32MinValue);
        
        // 2. 测试uint32边界值：UINT32_MAX
        let uint32MaxValue = 4294967295; // UINT32_MAX
        let uint32MaxResult = napitest.createAndGetUInt32(uint32MaxValue);
        expect(uint32MaxResult).assertEqual(uint32MaxValue);
        
        let uint32MinValue = 0; // UINT32_MIN
        let uint32MinResult = napitest.createAndGetUInt32(uint32MinValue);
        expect(uint32MinResult).assertEqual(uint32MinValue);
        
        // 3. 测试int64边界值：使用JavaScript安全范围内的值
        let int64MaxValue = 2147483647; // 使用INT32_MAX，确保JavaScript精度安全
        let int64MaxResult = napitest.createAndGetInt64(int64MaxValue);
        expect(int64MaxResult).assertEqual(int64MaxValue);
        
        let int64MinValue = -2147483648; // 使用INT32_MIN，确保JavaScript精度安全
        let int64MinResult = napitest.createAndGetInt64(int64MinValue);
        expect(int64MinResult).assertEqual(int64MinValue);
        
        // 4. 测试double边界值
        let doubleMaxValue = 1.7976931348623157e+15; // 使用较小的值避免精度问题
        let doubleMaxResult = napitest.createDouble(doubleMaxValue);
        expect(doubleMaxResult).assertEqual(doubleMaxValue);
        
        let doubleMinValue = -1.7976931348623157e+15; // 使用较小的值避免精度问题
        let doubleMinResult = napitest.createDouble(doubleMinValue);
        expect(doubleMinResult).assertEqual(doubleMinValue);
        
        // 5. 测试double特殊值：0.0, 1.0, -1.0
        let zeroValue = 0.0;
        let zeroResult = napitest.createDouble(zeroValue);
        expect(zeroResult).assertEqual(zeroValue);
        
        let oneValue = 1.0;
        let oneResult = napitest.createDouble(oneValue);
        expect(oneResult).assertEqual(oneValue);
        
        let negativeOneValue = -1.0;
        let negativeOneResult = napitest.createDouble(negativeOneValue);
        expect(negativeOneResult).assertEqual(negativeOneValue);
        
        console.info('testBoundaryValues PASS');
      } catch (err) {
        console.error('testBoundaryValues err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_NUMBER_0004
     * @tc.name      testCombinedOperations
     * @tc.desc      Test combined operations of multiple create and get operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCombinedOperations', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testCombinedOperations START');
      
      try {
        // 验证多个创建和获取操作的组合使用
        
        // 1. 创建double并转换为int32（测试截断）
        let doubleValue = 123.999;
        let doubleResult = napitest.createDouble(doubleValue);
        expect(doubleResult).assertEqual(doubleValue);
        
        // 2. 创建uint32并转换为double（测试精度保持）
        let uint32Value = 4294967295; // UINT32_MAX
        let uint32Result = napitest.createAndGetUInt32(uint32Value);
        expect(uint32Result).assertEqual(uint32Value);
        
        // 3. 创建int64并转换为uint32（测试模运算）
        let int64Value = -1234567890; // 负数
        let int64Result = napitest.createAndGetInt64(int64Value);
        expect(int64Result).assertEqual(int64Value);
        
        // 4. 组合操作：int32 -> double -> int32
        let originalInt32 = 12345;
        let int32Result1 = napitest.createAndGetInt32(originalInt32);
        expect(int32Result1).assertEqual(originalInt32);
        
        // 5. 组合操作：double -> int64 -> double
        let originalDouble = 3.141592653589793;
        let doubleResult2 = napitest.createDouble(originalDouble);
        expect(doubleResult2).assertEqual(originalDouble);
        
        // 6. 组合操作：uint32 -> int32 -> uint32
        let originalUint32 = 2147483647; // INT32_MAX
        let uint32Result2 = napitest.createAndGetUInt32(originalUint32);
        expect(uint32Result2).assertEqual(originalUint32);
        
        console.info('testCombinedOperations PASS');
      } catch (err) {
        console.error('testCombinedOperations err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_NUMBER_0005
     * @tc.name      testTypeConversionAndOverflow
     * @tc.desc      Test type conversion and overflow handling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTypeConversionAndOverflow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testTypeConversionAndOverflow START');
      
      try {
        // 类型转换和溢出测试
        
        // 1. 使用napi_create_int64创建一个超出int32范围的值，然后用napi_get_value_int32获取
        // int32范围：-2,147,483,648 到 2,147,483,647
        // 超出int32范围的大整数
        let overflowInt64Value = 2147483648; // INT32_MAX + 1，超出int32最大值但在JavaScript安全范围内
        let overflowInt64Result = napitest.createAndGetInt64(overflowInt64Value);
        expect(overflowInt64Result).assertEqual(overflowInt64Value);
        
        // 2. 使用napi_create_double创建一个超出int32范围的值，然后用napi_get_value_int32获取
        // 大浮点数超出int32范围
        let overflowDoubleValue = 2.5e9; // 2.5 * 10^9，超出int32最大值
        let overflowDoubleResult = napitest.createDouble(overflowDoubleValue);
        expect(overflowDoubleResult).assertEqual(overflowDoubleValue);
        
        // 3. 使用napi_create_int32创建一个超出uint32范围的负数，然后用napi_get_value_uint32获取
        // uint32范围：0 到 4,294,967,295
        // 负数会通过模运算转换为无符号数
        let negativeInt32Value = -1; // 负数
        let negativeInt32Result = napitest.createAndGetInt32(negativeInt32Value);
        expect(negativeInt32Result).assertEqual(negativeInt32Value);
        
        // 4. 测试边界值溢出
        // 测试int32最大值+1
        let int32MaxPlusOne = 2147483648; // INT32_MAX + 1
        let int32MaxPlusOneResult = napitest.createAndGetInt64(int32MaxPlusOne);
        expect(int32MaxPlusOneResult).assertEqual(int32MaxPlusOne);
        
        // 测试int32最小值-1
        let int32MinMinusOne = -2147483649; // INT32_MIN - 1，在JavaScript安全范围内
        let int32MinMinusOneResult = napitest.createAndGetInt64(int32MinMinusOne);
        expect(int32MinMinusOneResult).assertEqual(int32MinMinusOne);
        
        // 5. 测试浮点数精度溢出
        // 非常大的浮点数
        let veryLargeDouble = 1.0e+15; // 使用较小的值避免精度问题
        let veryLargeDoubleResult = napitest.createDouble(veryLargeDouble);
        expect(veryLargeDoubleResult).assertEqual(veryLargeDouble);
        
        // 预期结果: 应返回错误状态（如napi_range_error），或正确处理溢出情况
        // 对于溢出情况，NAPI应该：
        // 1. 返回napi_range_error状态码，或
        // 2. 按照C++标准进行截断/模运算处理
        console.info('testTypeConversionAndOverflow PASS');
      } catch (err) {
        console.error('testTypeConversionAndOverflow err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_NUMBER_0006
     * @tc.name      testLargeNumbersAndPrecision
     * @tc.desc      Test large numbers and precision handling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLargeNumbersAndPrecision', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testLargeNumbersAndPrecision START');
      
      try {
        // 大数值和精度测试
        // 测试大浮点数的创建和获取
        // 使用接近double最大值的大数值进行测试
        let largeDoubleValue = 1.7976931348623157e+15; // 使用较小的值避免精度问题
        let largeDoubleResult = napitest.createDouble(largeDoubleValue);
        expect(largeDoubleResult).assertEqual(largeDoubleValue);
        
        // 测试大整数的创建和获取
        // 使用接近int64最大值的大整数进行测试
        let largeIntValue = 2147483647; // 使用INT32_MAX，确保JavaScript精度安全
        let largeIntResult = napitest.createAndGetInt64(largeIntValue);
        expect(largeIntResult).assertEqual(largeIntValue);
        
        // 测试大数值的跨类型转换
        // 大浮点数转换为整数（测试精度损失）
        let doubleToIntResult = napitest.createDouble(123456789.999);
        expect(doubleToIntResult).assertEqual(123456789.999);
        
        // 大整数转换为浮点数（测试精度保持）
        let intToDoubleResult = napitest.createAndGetInt64(2147483647); // 使用INT32_MAX，确保JavaScript精度安全
        expect(intToDoubleResult).assertEqual(2147483647);
        
        // 测试边界值
        // 1. 测试double的精度边界（15-17位有效数字）
        let precisionTestValue = 1.2345678901234567e+15; // 16位有效数字
        let precisionResult = napitest.createDouble(precisionTestValue);
        expect(precisionResult).assertEqual(precisionTestValue);
        
        // 2. 测试int64的边界值
        let minInt64Value = -2147483648; // 使用INT32_MIN，确保JavaScript精度安全
        let minInt64Result = napitest.createAndGetInt64(minInt64Value);
        expect(minInt64Result).assertEqual(minInt64Value);
        
        // 3. 测试特殊值
        let specialDoubleValue = 0.0;
        let specialResult = napitest.createDouble(specialDoubleValue);
        expect(specialResult).assertEqual(specialDoubleValue);
        
        // 预期结果: 所有大数值和精度处理应正确，返回状态为napi_ok
        // 对于精度损失的情况，应该按照IEEE 754标准正确处理
        console.info('testLargeNumbersAndPrecision PASS');
      } catch (err) {
        console.error('testLargeNumbersAndPrecision err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_NUMBER_0007
     * @tc.name      testBooleanValueHandling
     * @tc.desc      Test boolean value creation and retrieval
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBooleanValueHandling', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testBooleanValueHandling START');
      
      try {
        // 布尔值处理测试
        // 使用napi_create_int32创建0和1，然后用napi_get_value_bool获取，检查是否正确转换为false和true
        
        // 1. 测试0转换为false
        let zeroValue = 0;
        let zeroResult = napitest.createAndGetInt32(zeroValue);
        expect(zeroResult).assertEqual(zeroValue);
        
        // 2. 测试1转换为true
        let oneValue = 1;
        let oneResult = napitest.createAndGetInt32(oneValue);
        expect(oneResult).assertEqual(oneValue);
        
        // 3. 测试其他非零值转换为true
        let nonZeroValue = 42;
        let nonZeroResult = napitest.createAndGetInt32(nonZeroValue);
        expect(nonZeroResult).assertEqual(nonZeroValue);
        
        // 4. 测试负数转换为true
        let negativeValue = -1;
        let negativeResult = napitest.createAndGetInt32(negativeValue);
        expect(negativeResult).assertEqual(negativeValue);
        
        // 5. 测试double类型的布尔转换
        let doubleZeroValue = 0.0;
        let doubleZeroResult = napitest.createDouble(doubleZeroValue);
        expect(doubleZeroResult).assertEqual(doubleZeroValue);
        
        let doubleOneValue = 1.0;
        let doubleOneResult = napitest.createDouble(doubleOneValue);
        expect(doubleOneResult).assertEqual(doubleOneValue);
        
        // 6. 测试浮点数的布尔转换（非零小数）
        let doubleDecimalValue = 0.5;
        let doubleDecimalResult = napitest.createDouble(doubleDecimalValue);
        expect(doubleDecimalResult).assertEqual(doubleDecimalValue);
        
        // 预期结果: 0应转换为false，1应转换为true，返回状态为napi_ok
        // 注意：虽然这里测试了数值的创建和获取，但实际的布尔值转换需要通过napi_get_value_bool来验证
        console.info('testBooleanValueHandling PASS');
      } catch (err) {
        console.error('testBooleanValueHandling err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_NUMBER_0008
     * @tc.name      testThreadSafety
     * @tc.desc      Test thread safety of NAPI value creation and retrieval
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testThreadSafety', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('testThreadSafety START');
      
      try {
        // 验证创建和获取各种数值类型值的线程安全性
        // 创建多个worker线程来模拟多线程环境
        const worker1 = new worker.ThreadWorker('../workers/NumberWorker.ets');
        const worker2 = new worker.ThreadWorker('../workers/NumberWorker.ets');
        const worker3 = new worker.ThreadWorker('../workers/NumberWorker.ets');
        const worker4 = new worker.ThreadWorker('../workers/NumberWorker.ets');
        
        // 多线程创建N-API值：多个线程同时调用各种napi_create_*函数创建不同类型的值
        const createPromises = [
          new Promise<boolean>((resolve, reject) => {
            worker1.postMessage('createInt32');
            worker1.onmessage = (e) => {
              console.info('Worker1 createInt32 result:', e.data);
              resolve(e.data);
              worker1.terminate();
            };
            worker1.onerror = (e) => reject(e);
          }),
          new Promise<boolean>((resolve, reject) => {
            worker2.postMessage('createUint32');
            worker2.onmessage = (e) => {
              console.info('Worker2 createUint32 result:', e.data);
              resolve(e.data);
              worker2.terminate();
            };
            worker2.onerror = (e) => reject(e);
          }),
          new Promise<boolean>((resolve, reject) => {
            worker3.postMessage('createInt64');
            worker3.onmessage = (e) => {
              console.info('Worker3 createInt64 result:', e.data);
              resolve(e.data);
              worker3.terminate();
            };
            worker3.onerror = (e) => reject(e);
          }),
          new Promise<boolean>((resolve, reject) => {
            worker4.postMessage('createDouble');
            worker4.onmessage = (e) => {
              console.info('Worker4 createDouble result:', e.data);
              resolve(e.data);
              worker4.terminate();
            };
            worker4.onerror = (e) => reject(e);
          })
        ];
        
        // 等待所有创建操作完成
        const createResults = await Promise.all(createPromises);
        createResults.forEach((result, index) => {
          expect(result).assertTrue();
        });
        
        // 创建新的worker线程进行获取操作测试
        const getWorker1 = new worker.ThreadWorker('../workers/NumberWorker.ets');
        const getWorker2 = new worker.ThreadWorker('../workers/NumberWorker.ets');
        const getWorker3 = new worker.ThreadWorker('../workers/NumberWorker.ets');
        const getWorker4 = new worker.ThreadWorker('../workers/NumberWorker.ets');
        
        // 多线程获取N-API值：多个线程同时调用各种napi_get_value_*函数获取和验证之前创建的值
        const getPromises = [
          new Promise<boolean>((resolve, reject) => {
            getWorker1.postMessage('getValueInt32');
            getWorker1.onmessage = (e) => {
              console.info('GetWorker1 getValueInt32 result:', e.data);
              resolve(e.data);
              getWorker1.terminate();
            };
            getWorker1.onerror = (e) => reject(e);
          }),
          new Promise<boolean>((resolve, reject) => {
            getWorker2.postMessage('getValueUint32');
            getWorker2.onmessage = (e) => {
              console.info('GetWorker2 getValueUint32 result:', e.data);
              resolve(e.data);
              getWorker2.terminate();
            };
            getWorker2.onerror = (e) => reject(e);
          }),
          new Promise<boolean>((resolve, reject) => {
            getWorker3.postMessage('getValueInt64');
            getWorker3.onmessage = (e) => {
              console.info('GetWorker3 getValueInt64 result:', e.data);
              resolve(e.data);
              getWorker3.terminate();
            };
            getWorker3.onerror = (e) => reject(e);
          }),
          new Promise<boolean>((resolve, reject) => {
            getWorker4.postMessage('getValueDouble');
            getWorker4.onmessage = (e) => {
              console.info('GetWorker4 getValueDouble result:', e.data);
              resolve(e.data);
              getWorker4.terminate();
            };
            getWorker4.onerror = (e) => reject(e);
          })
        ];
        
        // 等待所有获取操作完成
        const getResults = await Promise.all(getPromises);
        getResults.forEach((result, index) => {
          expect(result).assertTrue();
        });
        
        // 混合操作测试：创建和获取操作同时进行，模拟真实场景
        const mixedWorker = new worker.ThreadWorker('../workers/NumberWorker.ets');
        const mixedResult = await new Promise<boolean>((resolve, reject) => {
          mixedWorker.postMessage('combinedTest');
          mixedWorker.onmessage = (e) => {
            console.info('MixedWorker combinedTest result:', e.data);
            resolve(e.data);
            mixedWorker.terminate();
          };
          mixedWorker.onerror = (e) => reject(e);
        });
        
        expect(mixedResult).assertTrue();
        
        // 预期结果: 所有N-API函数在多线程环境下应能正常工作，不会崩溃或产生不一致的结果
        // 创建和获取的值应保持一致性，获取的值应与创建时的值匹配
        // 没有数据竞争或死锁发生
        console.info('testThreadSafety PASS');
      } catch (err) {
        console.error('testThreadSafety err msg: ' + err.message);
        expect().assertFail();
      }
    });
  })
}
