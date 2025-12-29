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
    })
    
    beforeEach(() => {
      // 每个测试用例开始前执行
    })
    
    afterEach(() => {
      // 每个测试用例结束后执行
    })
    
    afterAll(() => {
      // 所有测试用例结束后执行一次
    })
    
    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Create_0100
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_Create_0100
     * @tc.desc   测试OH_NNCompilation_Construct(nullptr)是否正确返回nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Compilation_Create_0100', Level.LEVEL0, async () => {
      
      // 调用 NAPI 接口，传入用例编号 0
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(0);
      
      // 断言结果为 0（成功）
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })



    // ========== 索引 3-18: Compilation 系列测试 ==========
    
    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Create_0200
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_Create_0200
     * @tc.desc   测试编译器创建功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Compilation_Create_0200', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(3);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Create_0300
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_Create_0300
     * @tc.desc   测试编译器创建功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_Create_0300', Level.LEVEL1, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(4);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetDevice_0100
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetDevice_0100
     * @tc.desc   测试编译器设置设备功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Compilation_SetDevice_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(5);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetDevice_0200
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetDevice_0200
     * @tc.desc   测试编译器设置设备功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_SetDevice_0200', Level.LEVEL1, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(6);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetCache_0100
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetCache_0100
     * @tc.desc   测试编译器缓存设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Compilation_SetCache_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(5);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetCache_0200
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetCache_0200
     * @tc.desc   测试编译器缓存设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_SetCache_0200', Level.LEVEL1, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(6);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetCache_0300
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetCache_0300
     * @tc.desc   测试编译器缓存设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_SetCache_0300', Level.LEVEL1, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(9);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })


    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0100
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0100
     * @tc.desc   测试编译器性能模式设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(11);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPriority_0100
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPriority_0100
     * @tc.desc   测试编译器优先级设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Compilation_SetPriority_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(12);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0100
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0100
     * @tc.desc   测试编译器Float16使能功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(13);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Build_0100
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_Build_0100
     * @tc.desc   测试编译器构建功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Compilation_Build_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(14);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Build_0200
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_Build_0200
     * @tc.desc   测试编译器构建功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_Build_0200', Level.LEVEL1, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(15);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Destroy_0100
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_Destroy_0100
     * @tc.desc   测试编译器销毁功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Compilation_Destroy_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(16);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Destroy_0200
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_Destroy_0200
     * @tc.desc   测试编译器销毁功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_Destroy_0200', Level.LEVEL1, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(17);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
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
    it('SUB_AI_NNRt_Func_North_Device_DeviceID_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(19);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceID_0200
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceID_0200
     * @tc.desc   测试设备ID获取（已分配地址的指针）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceID_0200', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(20);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceID_0300
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceID_0300
     * @tc.desc   测试设备ID获取（count为nullptr）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceID_0300', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(21);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceID_0400
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceID_0400
     * @tc.desc   测试正常获取设备ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceID_0400', Level.LEVEL2, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(22);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceName_0100
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceName_0100
     * @tc.desc   测试获取设备名称（无效设备ID）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceName_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(23);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceName_0200
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceName_0200
     * @tc.desc   测试获取设备名称（name为nullptr）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceName_0200', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(24);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceName_0300
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceName_0300
     * @tc.desc   测试获取设备名称（name已赋值）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceName_0300', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(25);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceName_0400
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceName_0400
     * @tc.desc   测试正常获取设备名称
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceName_0400', Level.LEVEL1, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(26);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceType_0100
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceType_0100
     * @tc.desc   测试获取设备类型（type为nullptr）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceType_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(27);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceType_0200
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceType_0200
     * @tc.desc   测试获取设备类型（无效设备ID）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceType_0200', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(28);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceType_0300
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceType_0300
     * @tc.desc   测试正常获取设备类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceType_0300', Level.LEVEL1, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(29);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    // Executor_Create 系列
    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Create_0100
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Create_0100
     * @tc.desc   测试执行器创建功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Create_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(30);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Create_0200
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Create_0200
     * @tc.desc   测试执行器创建功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Create_0200', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(31);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    // Executor_SetInput 系列
    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetInput_0100
     * @tc.number SUB_AI_NNRt_Func_North_Executor_SetInput_0100
     * @tc.desc   测试执行器输入设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_SetInput_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(32);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetInput_0200
     * @tc.number SUB_AI_NNRt_Func_North_Executor_SetInput_0200
     * @tc.desc   测试执行器输入设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_SetInput_0200', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(33);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetInput_0300
     * @tc.number SUB_AI_NNRt_Func_North_Executor_SetInput_0300
     * @tc.desc   测试执行器输入设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_SetInput_0300', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(34);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetInput_0400
     * @tc.number SUB_AI_NNRt_Func_North_Executor_SetInput_0400
     * @tc.desc   测试执行器输入设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_SetInput_0400', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(35);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetInput_0500
     * @tc.number SUB_AI_NNRt_Func_North_Executor_SetInput_0500
     * @tc.desc   测试执行器输入设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_SetInput_0500', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(36);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetInput_0600
     * @tc.number SUB_AI_NNRt_Func_North_Executor_SetInput_0600
     * @tc.desc   测试执行器输入设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_SetInput_0600', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(37);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetInput_0700
     * @tc.number SUB_AI_NNRt_Func_North_Executor_SetInput_0700
     * @tc.desc   测试执行器输入设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_NNRt_Func_North_Executor_SetInput_0700', Level.LEVEL2, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(38);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    // Executor_SetOutput 系列
    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetOutput_0100
     * @tc.number SUB_AI_NNRt_Func_North_Executor_SetOutput_0100
     * @tc.desc   测试执行器输出设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_SetOutput_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(39);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetOutput_0200
     * @tc.number SUB_AI_NNRt_Func_North_Executor_SetOutput_0200
     * @tc.desc   测试执行器输出设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_SetOutput_0200', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(40);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetOutput_0300
     * @tc.number SUB_AI_NNRt_Func_North_Executor_SetOutput_0300
     * @tc.desc   测试执行器输出设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_SetOutput_0300', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(41);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetOutput_0400
     * @tc.number SUB_AI_NNRt_Func_North_Executor_SetOutput_0400
     * @tc.desc   测试执行器输出设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_SetOutput_0400', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(42);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetOutput_0500
     * @tc.number SUB_AI_NNRt_Func_North_Executor_SetOutput_0500
     * @tc.desc   测试执行器输出设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_NNRt_Func_North_Executor_SetOutput_0500', Level.LEVEL2, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(43);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    // Executor_Run 系列
    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Run_0100
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Run_0100
     * @tc.desc   测试执行器运行功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Run_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(44);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Run_0200
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Run_0200
     * @tc.desc   测试执行器运行功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Run_0200', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(45);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Run_0300
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Run_0300
     * @tc.desc   测试执行器运行功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Run_0300', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(46);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Run_0400
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Run_0400
     * @tc.desc   测试执行器运行功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Run_0400', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(47);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Run_0500
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Run_0500
     * @tc.desc   测试执行器运行功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Run_0500', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(48);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Run_0600
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Run_0600
     * @tc.desc   测试执行器运行功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Executor_Run_0600', Level.LEVEL1, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(49);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Run_0700
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Run_0700
     * @tc.desc   测试执行器运行功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Executor_Run_0700', Level.LEVEL1, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(50);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    // Executor_GetOutputDimensions 系列
    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0100
     * @tc.number SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0100
     * @tc.desc   测试执行器输出维度获取功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(51);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0200
     * @tc.number SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0200
     * @tc.desc   测试执行器输出维度获取功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0200', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(52);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0300
     * @tc.number SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0300
     * @tc.desc   测试执行器输出维度获取功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0300', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(53);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0400
     * @tc.number SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0400
     * @tc.desc   测试执行器输出维度获取功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0400', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(54);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0500
     * @tc.number SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0500
     * @tc.desc   测试执行器输出维度获取功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0500', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(55);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0600
     * @tc.number SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0600
     * @tc.desc   测试执行器输出维度获取功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0600', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(56);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0700
     * @tc.number SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0700
     * @tc.desc   测试执行器输出维度获取功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0700', Level.LEVEL2, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(57);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0800
     * @tc.number SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0800
     * @tc.desc   测试执行器输出维度获取功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0800', Level.LEVEL1, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(58);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    // Executor_Destroy 系列
    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Destroy_0100
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Destroy_0100
     * @tc.desc   测试执行器销毁功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Destroy_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(59);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Destroy_0200
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Destroy_0200
     * @tc.desc   测试执行器销毁功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Executor_Destroy_0200', Level.LEVEL1, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(60);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    // Executor_Combine 系列
    /**
     * @tc.name   SUB_AI_NNR_Func_North_Executor_Combine_0100
     * @tc.number SUB_AI_NNR_Func_North_Executor_Combine_0100
     * @tc.desc   测试执行器组合功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_NNR_Func_North_Executor_Combine_0100', Level.LEVEL2, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(61);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Combine_0200
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Combine_0200
     * @tc.desc   测试执行器组合功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Executor_Combine_0200', Level.LEVEL1, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(62);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Combine_0300
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Combine_0300
     * @tc.desc   测试执行器组合功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Executor_Combine_0300', Level.LEVEL1, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(63);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Combine_0400
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Combine_0400
     * @tc.desc   测试执行器组合功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_NNRt_Func_North_Executor_Combine_0400', Level.LEVEL2, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(64);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Combine_0500
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Combine_0500
     * @tc.desc   测试执行器组合功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_NNRt_Func_North_Executor_Combine_0500', Level.LEVEL2, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(65);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    // Memory_CreateInputMemory 系列
    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0100
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0100
     * @tc.desc   测试输入内存创建功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(66);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0200
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0200
     * @tc.desc   测试输入内存创建功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0200', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(67);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0300
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0300
     * @tc.desc   测试输入内存创建功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0300', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(68);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0400
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0400
     * @tc.desc   测试输入内存创建功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0400', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(69);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0500
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0500
     * @tc.desc   测试输入内存创建功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0500', Level.LEVEL2, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(70);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0600
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0600
     * @tc.desc   测试输入内存创建功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0600', Level.LEVEL2, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(71);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    // Memory_CreateOutputMemory 系列
    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0100
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0100
     * @tc.desc   测试输出内存创建功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(72);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0200
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0200
     * @tc.desc   测试输出内存创建功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0200', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(73);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0300
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0300
     * @tc.desc   测试输出内存创建功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0300', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(74);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0400
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0400
     * @tc.desc   测试输出内存创建功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0400', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(75);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0500
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0500
     * @tc.desc   测试输出内存创建功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0500', Level.LEVEL2, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(76);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0600
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0600
     * @tc.desc   测试输出内存创建功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0600', Level.LEVEL2, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(77);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    // Memory_DestroyInputMemory 系列
    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0100
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0100
     * @tc.desc   测试输入内存销毁功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(78);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0200
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0200
     * @tc.desc   测试输入内存销毁功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0200', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(79);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0300
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0300
     * @tc.desc   测试输入内存销毁功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0300', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(80);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0400
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0400
     * @tc.desc   测试输入内存销毁功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0400', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(81);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0500
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0500
     * @tc.desc   测试输入内存销毁功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0500', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(82);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    // Memory_DestroyOutputMemory 系列
    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0100
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0100
     * @tc.desc   测试输出内存销毁功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(83);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0200
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0200
     * @tc.desc   测试输出内存销毁功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0200', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(84);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0300
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0300
     * @tc.desc   测试输出内存销毁功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0300', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(85);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0400
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0400
     * @tc.desc   测试输出内存销毁功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0400', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(86);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0500
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0500
     * @tc.desc   测试输出内存销毁功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0500', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(87);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    // Memory_SetInputFromMemory 系列
    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0100
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0100
     * @tc.desc   测试从内存设置输入功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(88);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0200
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0200
     * @tc.desc   测试从内存设置输入功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0200', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(89);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0300
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0300
     * @tc.desc   测试从内存设置输入功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0300', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(90);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0400
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0400
     * @tc.desc   测试从内存设置输入功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0400', Level.LEVEL2, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(91);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0500
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0500
     * @tc.desc   测试从内存设置输入功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0500', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(92);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0600
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0600
     * @tc.desc   测试从内存设置输入功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0600', Level.LEVEL2, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(93);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    // Memory_SetOutputFromMemory 系列
    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_SetOutputFromMemory_0100
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_SetOutputFromMemory_0100
     * @tc.desc   测试从内存设置输出功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Memory_SetOutputFromMemory_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(94);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_SetOutputFromMemory_0200
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_SetOutputFromMemory_0200
     * @tc.desc   测试从内存设置输出功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Memory_SetOutputFromMemory_0200', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(95);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_SetOutputFromMemory_0300
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_SetOutputFromMemory_0300
     * @tc.desc   测试从内存设置输出功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
   
    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Model_AddOperation_0200
     * @tc.number SUB_AI_NNRt_Func_North_Model_AddOperation_0200
     * @tc.desc   测试模型添加操作功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Model_AddOperation_0200', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(113);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Model_AddOperation_0300
     * @tc.number SUB_AI_NNRt_Func_North_Model_AddOperation_0300
     * @tc.desc   测试模型添加操作功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Model_AddOperation_0300', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(114);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Model_AddOperation_0400
     * @tc.number SUB_AI_NNRt_Func_North_Model_AddOperation_0400
     * @tc.desc   测试模型添加操作功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Model_AddOperation_0400', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(115);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

   
    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Model_GetSupportedOperation_0300
     * @tc.number SUB_AI_NNRt_Func_North_Model_GetSupportedOperation_0300
     * @tc.desc   测试模型获取支持操作功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Model_GetSupportedOperation_0300', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(142);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Model_GetSupportedOperation_0400
     * @tc.number SUB_AI_NNRt_Func_North_Model_GetSupportedOperation_0400
     * @tc.desc   测试模型获取支持操作功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Model_GetSupportedOperation_0400', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(143);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Model_GetSupportedOperation_0500
     * @tc.number SUB_AI_NNRt_Func_North_Model_GetSupportedOperation_0500
     * @tc.desc   测试模型获取支持操作功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Model_GetSupportedOperation_0500', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(144);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Model_GetSupportedOperation_0600
     * @tc.number SUB_AI_NNRt_Func_North_Model_GetSupportedOperation_0600
     * @tc.desc   测试模型获取支持操作功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Model_GetSupportedOperation_0600', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(145);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Model_GetSupportedOperation_0700
     * @tc.number SUB_AI_NNRt_Func_North_Model_GetSupportedOperation_0700
     * @tc.desc   测试模型获取支持操作功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Model_GetSupportedOperation_0700', Level.LEVEL1, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(146);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Model_GetSupportedOperation_0800
     * @tc.number SUB_AI_NNRt_Func_North_Model_GetSupportedOperation_0800
     * @tc.desc   测试模型获取支持操作功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_NNRt_Func_North_Model_GetSupportedOperation_0800', Level.LEVEL2, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(147);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    // Model_Combine 系列
    /**
     * @tc.name   SUB_AI_NNR_Func_North_Model_Combine_0100
     * @tc.number SUB_AI_NNR_Func_North_Model_Combine_0100
     * @tc.desc   测试模型组合功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_NNR_Func_North_Model_Combine_0100', Level.LEVEL2, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(148);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNR_Func_North_Model_Combine_0200
     * @tc.number SUB_AI_NNR_Func_North_Model_Combine_0200
     * @tc.desc   测试模型组合功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNR_Func_North_Model_Combine_0200', Level.LEVEL1, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(149);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    // ========== Compilation 补充测试 ==========
    

    // Compilation_EnableFloat16 补充测试
    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0200
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0200
     * @tc.desc   测试编译器Float16使能功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0200', Level.LEVEL3, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(153);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0300
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0300
     * @tc.desc   测试编译器Float16使能功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0300', Level.LEVEL2, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(154);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

  
    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetCache_0700
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetCache_0700
     * @tc.desc   测试编译器缓存设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_NNRt_Func_North_Compilation_SetCache_0700', Level.LEVEL2, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(158);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

  
    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPriority_0800
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPriority_0800
     * @tc.desc   测试编译器优先级设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_AI_NNRt_Func_North_Compilation_SetPriority_0800', Level.LEVEL3, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(160);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })
  })
}
