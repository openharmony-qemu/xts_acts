/*
 * Copyright (c) 2023-2026 Huawei Device Co., Ltd.
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
import graphic_vulkan_napi_test from 'libgraphic_vulkan_napi_test.so'

export default function VulkanLoaderUnitTest() {
  describe('VulkanLoaderUnitTest', () => {
    beforeAll(() => {
      hilog.info(0x0000, 'testTag', 'VulkanLoaderUnitTest beforeAll');
    })
    beforeEach(() => {
      hilog.info(0x0000, 'testTag', 'VulkanLoaderUnitTest beforeEach');
    })
    afterEach(() => {
      hilog.info(0x0000, 'testTag', 'VulkanLoaderUnitTest afterEach');
    })
    afterAll(() => {
      hilog.info(0x0000, 'testTag', 'VulkanLoaderUnitTest afterAll');
    })

    /**
     * @tc.name   LoadBaseFuncPtr
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Vulkan_LoadBaseFuncPtr_0100
     * @tc.desc   test LoadBaseFuncPtr, verify Vulkan base function pointers loaded and VkInstance created
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LoadBaseFuncPtr', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'LoadBaseFuncPtr begin');
      const result = graphic_vulkan_napi_test.vulkanTest(0);
      hilog.info(0x0000, 'testTag', 'LoadBaseFuncPtr result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   LoadInstanceFuncPtr
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Vulkan_LoadInstanceFuncPtr_0100
     * @tc.desc   test LoadInstanceFuncPtr, verify Vulkan instance function pointers loaded (core/platform/device/debug)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LoadInstanceFuncPtr', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'LoadInstanceFuncPtr begin');
      const result = graphic_vulkan_napi_test.vulkanTest(1);
      hilog.info(0x0000, 'testTag', 'LoadInstanceFuncPtr result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   vkEnumeratePhysicalDevices_Test
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Vulkan_VkEnumeratePhysicalDevices_0100
     * @tc.desc   test vkEnumeratePhysicalDevices, verify physical device enumeration and properties query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('vkEnumeratePhysicalDevices_Test', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'vkEnumeratePhysicalDevices_Test begin');
      const result = graphic_vulkan_napi_test.vulkanTest(2);
      hilog.info(0x0000, 'testTag', 'vkEnumeratePhysicalDevices_Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   vkCreateDevice_Test
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Vulkan_VkCreateDevice_0100
     * @tc.desc   test vkCreateDevice, verify logical device creation with graphics queue and swapchain extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('vkCreateDevice_Test', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'vkCreateDevice_Test begin');
      const result = graphic_vulkan_napi_test.vulkanTest(3);
      hilog.info(0x0000, 'testTag', 'vkCreateDevice_Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   getNativeBufferPropertiesOHOS_Test
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Vulkan_GetNativeBufferPropertiesOHOS_0100
     * @tc.desc   test vkGetNativeBufferPropertiesOHOS, verify OHOS native buffer properties extension loaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getNativeBufferPropertiesOHOS_Test', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'getNativeBufferPropertiesOHOS_Test begin');
      const result = graphic_vulkan_napi_test.vulkanTest(4);
      hilog.info(0x0000, 'testTag', 'getNativeBufferPropertiesOHOS_Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   getMemoryNativeBufferOHOS_Test
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Vulkan_GetMemoryNativeBufferOHOS_0100
     * @tc.desc   test vkGetMemoryNativeBufferOHOS, verify OHOS native buffer memory extension loaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMemoryNativeBufferOHOS_Test', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', 'getMemoryNativeBufferOHOS_Test begin');
      const result = graphic_vulkan_napi_test.vulkanTest(5);
      hilog.info(0x0000, 'testTag', 'getMemoryNativeBufferOHOS_Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })
  })
}
