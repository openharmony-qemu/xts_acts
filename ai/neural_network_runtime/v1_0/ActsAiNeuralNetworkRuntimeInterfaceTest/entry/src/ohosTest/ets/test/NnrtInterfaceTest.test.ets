/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, TestType, Size, Level, it } from "@ohos/hypium"
import { hilog } from "@kit.PerformanceAnalysisKit"
import ai_nnrt_interface_test from 'libai_nnrt_interface_test.so'

export default function NnrtInterfaceTest() {
  describe('NnrtInterfaceTest', () => {
    
    beforeAll(() => {
      // 所有测试用例开始前执行一次
      hilog.info(0x0000, 'testTag', 'NnrtInterfaceTest: beforeAll');
    })
    
    beforeEach(() => {
      // 每个测试用例开始前执行
    })
    
    afterEach(() => {
      // 每个测试用例结束后执行
    })
    
    afterAll(() => {
      // 所有测试用例结束后执行一次
      hilog.info(0x0000, 'testTag', 'NnrtInterfaceTest: afterAll');
    })
    
    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Create_0100
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_Create_0100
     * @tc.desc   测试OH_NNCompilation_Construct(nullptr)是否正确返回nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Compilation_Create_0100', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Compilation_Create_0100 begin');
      
      // 调用 NAPI 接口，传入用例编号 0
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(0);
      
      hilog.info(0x0000, 'testTag', 'Test result: %{public}d', result);
      
      // 断言结果为 0（成功）
      expect(result).assertEqual(0);
    })



    // ========== 索引 1-14: Compilation 系列测试 ==========
    
    it('SUB_AI_NNRt_Func_North_Compilation_Create_0200', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Compilation_Create_0200 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(1);
      hilog.info(0x0000, 'testTag', 'Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Compilation_Create_0300', Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Compilation_Create_0300 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(2);
      hilog.info(0x0000, 'testTag', 'Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Compilation_SetDevice_0100', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Compilation_SetDevice_0100 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(3);
      hilog.info(0x0000, 'testTag', 'Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Compilation_SetDevice_0200', Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Compilation_SetDevice_0200 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(4);
      hilog.info(0x0000, 'testTag', 'Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Compilation_SetCache_0100', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Compilation_SetCache_0100 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(5);
      hilog.info(0x0000, 'testTag', 'Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Compilation_SetCache_0200', Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Compilation_SetCache_0200 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(6);
      hilog.info(0x0000, 'testTag', 'Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Compilation_SetCache_0300', Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Compilation_SetCache_0300 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(7);
      hilog.info(0x0000, 'testTag', 'Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })


    it('SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0100', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0100 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(8);
      hilog.info(0x0000, 'testTag', 'Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Compilation_SetPriority_0100', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Compilation_SetPriority_0100 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(9);
      hilog.info(0x0000, 'testTag', 'Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0100', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0100 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(10);
      hilog.info(0x0000, 'testTag', 'Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Compilation_Build_0100', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Compilation_Build_0100 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(11);
      hilog.info(0x0000, 'testTag', 'Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Compilation_Build_0200', Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Compilation_Build_0200 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(12);
      hilog.info(0x0000, 'testTag', 'Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Compilation_Destroy_0100', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Compilation_Destroy_0100 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(13);
      hilog.info(0x0000, 'testTag', 'Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Compilation_Destroy_0200', Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Compilation_Destroy_0200 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(14);
      hilog.info(0x0000, 'testTag', 'Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })


    // ========== Device 系列测试 ==========

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceID_0100
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceID_0100
     * @tc.desc   测试设备ID获取（nullptr参数）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceID_0100', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Device_DeviceID_0100 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(15);
      hilog.info(0x0000, 'testTag', 'Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceID_0200
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceID_0200
     * @tc.desc   测试设备ID获取（已分配地址的指针）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceID_0200', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Device_DeviceID_0200 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(16);
      hilog.info(0x0000, 'testTag', 'Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceID_0300
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceID_0300
     * @tc.desc   测试设备ID获取（count为nullptr）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceID_0300', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Device_DeviceID_0300 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(17);
      hilog.info(0x0000, 'testTag', 'Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceID_0400
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceID_0400
     * @tc.desc   测试正常获取设备ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceID_0400', Level.LEVEL2, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Device_DeviceID_0400 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(18);
      hilog.info(0x0000, 'testTag', 'Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceName_0100
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceName_0100
     * @tc.desc   测试获取设备名称（无效设备ID）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceName_0100', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Device_DeviceName_0100 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(19);
      hilog.info(0x0000, 'testTag', 'Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceName_0200
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceName_0200
     * @tc.desc   测试获取设备名称（name为nullptr）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceName_0200', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Device_DeviceName_0200 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(20);
      hilog.info(0x0000, 'testTag', 'Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceName_0300
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceName_0300
     * @tc.desc   测试获取设备名称（name已赋值）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceName_0300', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Device_DeviceName_0300 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(21);
      hilog.info(0x0000, 'testTag', 'Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceName_0400
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceName_0400
     * @tc.desc   测试正常获取设备名称
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceName_0400', Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Device_DeviceName_0400 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(22);
      hilog.info(0x0000, 'testTag', 'Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceType_0100
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceType_0100
     * @tc.desc   测试获取设备类型（type为nullptr）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceType_0100', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Device_DeviceType_0100 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(23);
      hilog.info(0x0000, 'testTag', 'Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceType_0200
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceType_0200
     * @tc.desc   测试获取设备类型（无效设备ID）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceType_0200', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Device_DeviceType_0200 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(24);
      hilog.info(0x0000, 'testTag', 'Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceType_0300
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceType_0300
     * @tc.desc   测试正常获取设备类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceType_0300', Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Device_DeviceType_0300 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(25);
      hilog.info(0x0000, 'testTag', 'Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    // Executor_Create 系列
    it('SUB_AI_NNRt_Func_North_Executor_Create_0100', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Create_0100 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(26);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Create_0200', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Create_0200 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(27);
      expect(result).assertEqual(0);
    })

    // Executor_SetInput 系列
    it('SUB_AI_NNRt_Func_North_Executor_SetInput_0100', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_SetInput_0100 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(28);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_SetInput_0200', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_SetInput_0200 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(29);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_SetInput_0300', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_SetInput_0300 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(30);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_SetInput_0400', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_SetInput_0400 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(31);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_SetInput_0500', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_SetInput_0500 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(32);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_SetInput_0600', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_SetInput_0600 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(33);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_SetInput_0700', Level.LEVEL2, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_SetInput_0700 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(34);
      expect(result).assertEqual(0);
    })

    // Executor_SetOutput 系列
    it('SUB_AI_NNRt_Func_North_Executor_SetOutput_0100', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_SetOutput_0100 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(35);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_SetOutput_0200', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_SetOutput_0200 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(36);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_SetOutput_0300', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_SetOutput_0300 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(37);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_SetOutput_0400', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_SetOutput_0400 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(38);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_SetOutput_0500', Level.LEVEL2, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_SetOutput_0500 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(39);
      expect(result).assertEqual(0);
    })

    // Executor_Run 系列
    it('SUB_AI_NNRt_Func_North_Executor_Run_0100', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Run_0100 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(40);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Run_0200', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Run_0200 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(41);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Run_0300', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Run_0300 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(42);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Run_0400', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Run_0400 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(43);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Run_0500', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Run_0500 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(44);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Run_0600', Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Run_0600 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(45);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Run_0700', Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Run_0700 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(46);
      expect(result).assertEqual(0);
    })

    // Executor_GetOutputDimensions 系列
    it('SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0100', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0100 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(47);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0200', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0200 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(48);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0300', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0300 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(49);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0400', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0400 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(50);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0500', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0500 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(51);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0600', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0600 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(52);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0700', Level.LEVEL2, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0700 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(53);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0800', Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0800 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(54);
      expect(result).assertEqual(0);
    })

    // Executor_Destroy 系列
    it('SUB_AI_NNRt_Func_North_Executor_Destroy_0100', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Destroy_0100 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(55);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Destroy_0200', Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Destroy_0200 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(56);
      expect(result).assertEqual(0);
    })

    // Executor_Combine 系列
    it('SUB_AI_NNR_Func_North_Executor_Combine_0100', Level.LEVEL2, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNR_Func_North_Executor_Combine_0100 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(57);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Combine_0200', Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Combine_0200 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(58);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Combine_0300', Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Combine_0300 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(59);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Combine_0400', Level.LEVEL2, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Combine_0400 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(60);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Combine_0500', Level.LEVEL2, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Combine_0500 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(61);
      expect(result).assertEqual(0);
    })

    // Memory_CreateInputMemory 系列
    it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0100', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0100 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(62);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0200', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0200 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(63);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0300', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0300 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(64);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0400', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0400 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(65);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0500', Level.LEVEL2, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0500 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(66);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0600', Level.LEVEL2, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0600 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(67);
      expect(result).assertEqual(0);
    })

    // Memory_CreateOutputMemory 系列
    it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0100', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0100 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(68);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0200', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0200 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(69);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0300', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0300 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(70);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0400', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0400 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(71);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0500', Level.LEVEL2, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0500 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(72);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0600', Level.LEVEL2, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0600 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(73);
      expect(result).assertEqual(0);
    })

    // Memory_DestroyInputMemory 系列
    it('SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0100', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0100 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(74);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0200', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0200 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(75);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0300', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0300 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(76);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0400', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0400 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(77);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0500', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0500 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(78);
      expect(result).assertEqual(0);
    })

    // Memory_DestroyOutputMemory 系列
    it('SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0100', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0100 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(79);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0200', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0200 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(80);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0300', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0300 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(81);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0400', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0400 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(82);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0500', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0500 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(83);
      expect(result).assertEqual(0);
    })

    // Memory_SetInputFromMemory 系列
    it('SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0100', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0100 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(84);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0200', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0200 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(85);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0300', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0300 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(86);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0400', Level.LEVEL2, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0400 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(87);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0500', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0500 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(88);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0600', Level.LEVEL2, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0600 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(89);
      expect(result).assertEqual(0);
    })

    // Memory_SetOutputFromMemory 系列
    it('SUB_AI_NNRt_Func_North_Executor_Memory_SetOutputFromMemory_0100', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_SetOutputFromMemory_0100 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(90);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Memory_SetOutputFromMemory_0200', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_SetOutputFromMemory_0200 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(91);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Memory_SetOutputFromMemory_0300', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_SetOutputFromMemory_0300 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(92);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Memory_SetOutputFromMemory_0400', Level.LEVEL2, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_SetOutputFromMemory_0400 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(93);
      expect(result).assertEqual(0);
    })

    // Memory_Run 系列
    it('SUB_AI_NNRt_Func_North_Executor_Memory_Run_0100', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_Run_0100 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(94);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Memory_Run_0200', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_Run_0200 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(95);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Memory_Run_0300', Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_Run_0300 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(96);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Executor_Memory_Run_0400', Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Executor_Memory_Run_0400 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(97);
      expect(result).assertEqual(0);
    })

    // Model_CreateModel 系列
    it('SUB_AI_NNRt_Func_North_Model_CreateModel_0100', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Model_CreateModel_0100 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(98);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Model_CreateModel_0200', Level.LEVEL2, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Model_CreateModel_0200 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(99);
      expect(result).assertEqual(0);
    })

    // Model_AddOperand 系列
    it('SUB_AI_NNRt_Func_North_Model_AddOperand_0100', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Model_AddOperand_0100 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(100);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Model_AddOperand_0200', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Model_AddOperand_0200 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(101);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Model_AddOperand_0300', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Model_AddOperand_0300 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(102);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Model_AddOperand_0400', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Model_AddOperand_0400 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(103);
      expect(result).assertEqual(0);
    })

    // Model_SetOperandValue 系列
    it('SUB_AI_NNRt_Func_North_Model_SetOperandValue_0100', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Model_SetOperandValue_0100 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(104);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Model_SetOperandValue_0200', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Model_SetOperandValue_0200 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(105);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Model_SetOperandValue_0300', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Model_SetOperandValue_0300 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(106);
      expect(result).assertEqual(0);
    })

    it('SUB_AI_NNRt_Func_North_Model_SetOperandValue_0400', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'SUB_AI_NNRt_Func_North_Model_SetOperandValue_0400 begin');
      const result: number = ai_nnrt_interface_test.nnrtInterfaceTest(107);
      expect(result).assertEqual(0);
    })



  })
}
