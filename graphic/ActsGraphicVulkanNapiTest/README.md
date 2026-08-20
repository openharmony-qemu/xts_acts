# ActsGraphicVulkanNapiTest 测试套说明

## 1. 概述

ActsGraphicVulkanNapiTest 是 OpenHarmony 图形子系统（graphic_2d）的 Vulkan native 接口测试套，用于验证 Vulkan 加载器在 OpenHarmony 设备上的功能正确性。

- **子系统**: Graphic
- **模块**: Vulkan
- **part_name**: graphic_2d
- **HAP 名称**: ActsGraphicVulkanNapiNdkTest
- **测试类型**: C++ native + NAPI（ArkTS ets 双层）

## 2. 工程结构

```
ActsGraphicVulkanNapiTest/
├── BUILD.gn                          # GN 构建配置（ohos_js_app_suite）
├── Test.json                         # XTS 测试驱动配置
├── build-profile.json5              # 工程构建配置
├── oh-package.json5                 # 依赖配置
├── signature/                        # 签名文件
│   └── openharmony_sx.p7b
├── entry/
│   ├── build-profile.json5
│   └── src/
│       ├── main/
│       │   ├── cpp/
│       │   │   ├── CMakeLists.txt          # CMake 构建配置
│       │   │   ├── VulkanTest.h            # 测试函数声明
│       │   │   ├── VulkanTest.cpp          # Vulkan 测试核心实现
│       │   │   └── VulkanTestInterfaceTest.cpp  # NAPI 接口层
│       │   └── ets/
│       │       └── entryability/
│       └── ohosTest/
│           └── ets/test/
│               ├── List.test.ets           # 测试套注册
│               └── VulkanTest.test.ets    # ArkTS 测试用例
└── hvigor/
    └── hvigor-config.json5
```

## 3. 测试用例

测试套包含 6 个用例，按 Vulkan 初始化流程顺序执行：

| 序号 | 用例名 (it) | NAPI case | C++ 函数 | 说明 |
|------|------------|-----------|----------|------|
| 0 | LoadBaseFuncPtr | 0 | LoadBaseFuncPtrTest | 加载 Vulkan 基础函数指针，创建 VkInstance |
| 1 | LoadInstanceFuncPtr | 1 | LoadInstanceFuncPtrTest | 加载实例级函数指针（core/surface/device/debug） |
| 2 | vkEnumeratePhysicalDevices_Test | 2 | VkEnumeratePhysicalDevicesTest | 枚举物理设备，查询设备属性 |
| 3 | vkCreateDevice_Test | 3 | VkCreateDeviceTest | 创建逻辑设备（graphics queue + swapchain） |
| 4 | getNativeBufferPropertiesOHOS_Test | 4 | GetNativeBufferPropertiesOhosTest | 创建逻辑设备，加载并验证 `vkGetNativeBufferPropertiesOHOS` 函数指针非空 |
| 5 | getMemoryNativeBufferOHOS_Test | 5 | GetMemoryNativeBufferOhosTest | 创建逻辑设备，加载并验证 `vkGetMemoryNativeBufferOHOS` 函数指针非空 |

> **说明**：用例 4/5 仅验证 OHOS 扩展函数指针通过 `vkGetDeviceProcAddr` 成功加载（返回非空），**未传入真实 NativeBuffer 实际调用接口**。ets 侧 `@tc.desc` 描述较宽泛（"验证功能是否正常工作"），实际测的是"指针加载是否成功"，如需功能级验证需补真实 buffer 用例。

### 执行依赖关系

用例之间存在隐式依赖（通过全局变量传递状态）：
- 用例 0 创建 VkInstance，设置 g_isSupportedVulkan
- 用例 1 依赖用例 0 的 instance，加载实例级函数指针
- 用例 2 依赖用例 0/1，枚举物理设备
- 用例 3 依赖用例 2，创建逻辑设备
- 用例 4/5 依赖用例 3，测试 OHOS 扩展

必须按序号顺序执行。

## 4. 架构说明

### 三层调用链

```
ArkTS (VulkanTest.test.ets)
  ↓ napi 调用 vulkanTest(caseNum)
NAPI 接口 (VulkanTestInterfaceTest.cpp)
  ↓ switch 分发
C++ 实现 (VulkanTest.cpp)
  ↓ 调用 Vulkan API
Vulkan Loader / GPU 驱动
```

### 关键设计点

- **g_isSupportedVulkan**: 全局标志，标识设备是否支持 Vulkan。不支持时所有用例返回 0（跳过），不报错。
- **静态函数指针**: 所有 Vulkan 函数通过 `vkGetInstanceProcAddr`/`vkGetDeviceProcAddr` 动态加载，存储在 static 变量中。
- **OHOS 扩展**: 用例 4/5 测试 `vkGetNativeBufferPropertiesOHOS` 和 `vkGetMemoryNativeBufferOHOS`，这是 OpenHarmony 特有的 Vulkan 扩展，用于 GPU 与 NativeBuffer 的互操作。

## 5. 日志

C++ 侧使用 `OH_LOG_Print`（hilog）输出日志：

- **LOG_DOMAIN**: `0xD003200`
- **LOG_TAG**: `VulkanTest`
- 日志级别：LOG_INFO（正常流程）、LOG_ERROR（错误条件）
- 可通过 domain `0xD003200` 在设备 hilog 中过滤搜索

ArkTS 侧使用 `hilog.info(0x0000, 'testTag', ...)` 输出。

## 6. 依赖库

| 库文件 | 用途 |
|--------|------|
| libace_napi.z.so | NAPI 框架 |
| libhilog_ndk.z.so | hilog 日志 |
| libace_ndk.z.so | ACE native |
| libnative_window.so | NativeWindow（OHOS surface） |
| libvulkan.so | Vulkan 加载器 |

## 7. OHOS 特有 Vulkan 扩展接口

本测试套覆盖以下 OpenHarmony 特有的 Vulkan 扩展接口（vk\*OHOS）：

| 接口 | 加载方式 | 测试用例 | 说明 |
|------|---------|---------|------|
| `vkCreateSurfaceOHOS` | `vkGetInstanceProcAddr` | 用例 1 (LoadInstanceFuncPtr) | 创建 OHOS 平台 Vulkan surface，在 LoadInstanceCoreFunc 中加载（仅加载指针，未实际调用创建 surface） |
| `vkGetNativeBufferPropertiesOHOS` | `vkGetDeviceProcAddr` | 用例 4 (GetNativeBufferPropertiesOhosTest) | 查询 OHOS NativeBuffer 的 Vulkan 属性。本套件仅验证函数指针加载成功，未传入真实 buffer 调用 |
| `vkGetMemoryNativeBufferOHOS` | `vkGetDeviceProcAddr` | 用例 5 (GetMemoryNativeBufferOhosTest) | 从 Vulkan DeviceMemory 获取 OHOS NativeBuffer。本套件仅验证函数指针加载成功，未传入真实 memory 调用 |

> **测试范围说明**：本套件对上述 `vk*OHOS` 接口的验证停留在"函数指针可加载（非空）"层面，并非完整的功能调用验证。原因是构造真实 NativeBuffer/DeviceMemory 调用链较重，且与图形环境强相关；当前覆盖度满足"接口在设备上可被发现"的基本兼容性要求。

相关 Vulkan 结构体：
- `VkNativeBufferPropertiesOHOS` / `VkNativeBufferFormatPropertiesOHOS` — NativeBuffer 属性
- `VkMemoryGetNativeBufferInfoOHOS` — 内存到 NativeBuffer 转换信息

## 8. 注意事项

- 不支持 Vulkan 的设备上，所有用例返回 0（跳过），不会失败。
- 用例间有全局状态依赖，必须按序执行，不能单独运行后面的用例。
- `GetNativeBufferPropertiesOhosTest` 和 `GetMemoryNativeBufferOhosTest` 在扩展不可用时返回 0（跳过）。
- 测试不创建实际的渲染 surface（swapchain），仅验证 API 加载和设备创建流程。
