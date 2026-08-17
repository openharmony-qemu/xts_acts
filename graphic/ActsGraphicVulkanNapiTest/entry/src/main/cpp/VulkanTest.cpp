/*
 * Copyright (c) 2023-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, Hardware
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "VulkanTest.h"
#include <cstddef>
#include <native_window/external_window.h>
#include <sstream>
#include <string>
#include <vector>
#include "hilog/log.h"
#include "vulkan/vulkan.h"
#include "vulkan/vulkan_ohos.h"

#undef LOG_DOMAIN
#define LOG_DOMAIN 0xFF00
#define LOG_TAG "VulkanTest"

namespace vulkan {
namespace loader {

static PFN_vkCreateDebugUtilsMessengerEXT vkCreateDebugUtilsMessengerEXT = nullptr;
static PFN_vkDestroyDebugUtilsMessengerEXT vkDestroyDebugUtilsMessengerEXT = nullptr;
static PFN_vkDestroyInstance vkDestroyInstance = nullptr;
static PFN_vkDestroySurfaceKHR vkDestroySurfaceKHR = nullptr;
static PFN_vkCreateDevice vkCreateDevice = nullptr;
static PFN_vkDestroyDevice vkDestroyDevice = nullptr;
static PFN_vkEnumeratePhysicalDevices vkEnumeratePhysicalDevices = nullptr;
static PFN_vkCreateSurfaceOHOS vkCreateSurfaceOHOS = nullptr;
static PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR fpGetPhysicalDeviceSurfaceCapabilitiesKHR = nullptr;
static PFN_vkGetPhysicalDeviceSurfacePresentModesKHR fpGetPhysicalDeviceSurfacePresentModesKHR = nullptr;
static PFN_vkGetPhysicalDeviceSurfaceFormatsKHR fpGetPhysicalDeviceSurfaceFormatsKHR = nullptr;
static PFN_vkCreateSwapchainKHR fpCreateSwapchainKHR = nullptr;
static PFN_vkDestroySwapchainKHR fpDestroySwapchainKHR = nullptr;
static PFN_vkAcquireNextImage2KHR fpAcquireNextImage2KHR = nullptr;
static PFN_vkQueuePresentKHR fpQueuePresentKHR = nullptr;
static PFN_vkGetPhysicalDeviceQueueFamilyProperties vkGetPhysicalDeviceQueueFamilyProperties = nullptr;
static PFN_vkGetPhysicalDeviceProperties vkGetPhysicalDeviceProperties = nullptr;
static PFN_vkGetPhysicalDeviceFeatures vkGetPhysicalDeviceFeatures = nullptr;
static PFN_vkGetPhysicalDeviceMemoryProperties vkGetPhysicalDeviceMemoryProperties = nullptr;
static PFN_vkGetPhysicalDeviceSurfaceSupportKHR vkGetPhysicalDeviceSurfaceSupportKHR = nullptr;
static PFN_vkGetSwapchainImagesKHR fpGetSwapchainImagesKHR = nullptr;
static PFN_vkGetNativeBufferPropertiesOHOS fpGetNativeBufferPropertiesOHOS = nullptr;
static PFN_vkGetMemoryNativeBufferOHOS fpGetMemoryNativeBufferOHOS = nullptr;

static VkInstance instance = nullptr;
static VkSurfaceKHR surface = VK_NULL_HANDLE;
static VkPhysicalDevice physicalDevice = nullptr;
static VkDevice device = nullptr;
static VkSurfaceCapabilitiesKHR surfCaps = {};
static VkSurfaceFormatKHR surfaceFormat = {};
static VkSwapchainKHR swapChain = VK_NULL_HANDLE;
static VkSwapchainKHR swapChain2 = VK_NULL_HANDLE;
static VkSemaphore semaphore = VK_NULL_HANDLE;
static bool g_isSupportedVulkan = false;
static std::vector<VkQueueFamilyProperties> queueProps;
static uint32_t g_queueCount = 0;
static VkDebugUtilsMessengerEXT debugUtilsMessenger = VK_NULL_HANDLE;
static std::stringstream g_debugMessage;

/**
 * @brief Create a Vulkan instance with required extensions.
 * Sets g_isSupportedVulkan to true if instance creation succeeds.
 */
static void TrytoCreateVkInstance()
{
    VkApplicationInfo appInfo = {};
    appInfo.sType = VK_STRUCTURE_TYPE_APPLICATION_INFO;
    appInfo.pApplicationName = "pApplicationName";
    appInfo.pEngineName = "pEngineName";
    appInfo.apiVersion = VK_API_VERSION_1_0;

    std::vector<const char*> instanceExtensions = { VK_KHR_SURFACE_EXTENSION_NAME,
                                                    VK_OHOS_SURFACE_EXTENSION_NAME,
                                                    VK_EXT_DEBUG_UTILS_EXTENSION_NAME };

    VkInstanceCreateInfo instanceCreateInfo = {};
    instanceCreateInfo.sType = VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO;
    instanceCreateInfo.pNext = nullptr;
    instanceCreateInfo.pApplicationInfo = &appInfo;
    instanceCreateInfo.enabledExtensionCount = static_cast<uint32_t>(instanceExtensions.size());
    instanceCreateInfo.ppEnabledExtensionNames = instanceExtensions.data();

    VkResult result = vkCreateInstance(&instanceCreateInfo, nullptr, &instance);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG,
        "instance ptr: %{public}p, result: %{public}d", instance, result);
    if (result != VK_SUCCESS || instance == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "vkCreateInstance failed, result: %{public}d", result);
        g_isSupportedVulkan = false;
    } else {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "vkCreateInstance OK");
        g_isSupportedVulkan = true;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "g_isSupportedVulkan: %{public}d", g_isSupportedVulkan);
}

/**
 * @brief Build a VkSwapchainCreateInfoKHR struct with given format and color space.
 * @param imageFormat Desired swapchain image format.
 * @param imageColorSpace Desired swapchain image color space.
 * @return Populated VkSwapchainCreateInfoKHR struct.
 */
static VkSwapchainCreateInfoKHR GetSwapchainCreateInfo(VkFormat imageFormat, VkColorSpaceKHR imageColorSpace)
{
    VkSwapchainCreateInfoKHR swapchainCI = {};
    swapchainCI.sType = VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR;
    swapchainCI.surface = surface;
    uint32_t desiredNumberOfSwapchainImages = surfCaps.minImageCount + 1;
    if ((surfCaps.maxImageCount > 0) && (desiredNumberOfSwapchainImages > surfCaps.maxImageCount)) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG,
            "clamp swapchain images to maxImageCount: %{public}u", surfCaps.maxImageCount);
        desiredNumberOfSwapchainImages = surfCaps.maxImageCount;
    }
    swapchainCI.minImageCount = desiredNumberOfSwapchainImages;
    swapchainCI.imageFormat = imageFormat;
    swapchainCI.imageColorSpace = imageColorSpace;
    uint32_t width = 1280;
    uint32_t height = 720;
    swapchainCI.imageExtent = { width, height };
    swapchainCI.imageUsage = VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT;
    swapchainCI.preTransform = static_cast<VkSurfaceTransformFlagBitsKHR>(VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR);
    swapchainCI.imageArrayLayers = 1;
    swapchainCI.imageSharingMode = VK_SHARING_MODE_EXCLUSIVE;
    swapchainCI.queueFamilyIndexCount = 0;
    swapchainCI.presentMode = VK_PRESENT_MODE_IMMEDIATE_KHR;
    swapchainCI.oldSwapchain = swapChain;
    swapchainCI.clipped = VK_TRUE;
    swapchainCI.compositeAlpha = VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR;
    return swapchainCI;
}

/**
 * @brief Find a matching queue family index for the given queue flags.
 * @param queueFlags Desired queue type (graphics, compute, transfer).
 * @return Queue family index, or -1 if not found.
 */
static uint32_t GetQueueFamilyIndex(VkQueueFlagBits queueFlags)
{
    if (physicalDevice == nullptr || vkGetPhysicalDeviceQueueFamilyProperties == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "physicalDevice or queue func is null");
        return static_cast<uint32_t>(-1);
    }

    vkGetPhysicalDeviceQueueFamilyProperties(physicalDevice, &g_queueCount, nullptr);
    if (g_queueCount == 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "queue count is 0");
        return static_cast<uint32_t>(-1);
    }

    queueProps.resize(g_queueCount);
    vkGetPhysicalDeviceQueueFamilyProperties(physicalDevice, &g_queueCount, queueProps.data());

    for (size_t i = 0; i < queueProps.size(); i++) {
        if (queueFlags & VK_QUEUE_COMPUTE_BIT) {
            if ((queueProps[i].queueFlags & queueFlags) && ((queueProps[i].queueFlags & VK_QUEUE_GRAPHICS_BIT) == 0)) {
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG,
                    "compute queue family idx: %{public}zu", i);
                return static_cast<uint32_t>(i);
            }
        }
    }

    for (size_t i = 0; i < queueProps.size(); i++) {
        if (queueFlags & VK_QUEUE_TRANSFER_BIT) {
            if ((queueProps[i].queueFlags & queueFlags) && ((queueProps[i].queueFlags & VK_QUEUE_GRAPHICS_BIT) == 0) &&
                ((queueProps[i].queueFlags & VK_QUEUE_COMPUTE_BIT) == 0)) {
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG,
                    "transfer queue family idx: %{public}zu", i);
                return static_cast<uint32_t>(i);
            }
        }
    }

    for (size_t i = 0; i < queueProps.size(); i++) {
        if (queueProps[i].queueFlags & queueFlags) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG,
                "matched queue family idx: %{public}zu", i);
            return static_cast<uint32_t>(i);
        }
    }

    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "no matching queue family found");
    return static_cast<uint32_t>(-1);
}

/**
 * @brief Debug callback for Vulkan validation layer messages.
 * Captures messages into g_debugMessage stream for later inspection.
 */
static VkBool32 UserCallback(VkDebugUtilsMessageSeverityFlagBitsEXT messageSeverity,
                             VkDebugUtilsMessageTypeFlagsEXT messageType,
                             const VkDebugUtilsMessengerCallbackDataEXT* pCallbackData,
                             void* pUserData)
{
    (void)messageType;
    (void)pUserData;
    std::string prefix("");
    if (messageSeverity & VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT) {
        prefix = "ERROR: ";
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "debug callback ERROR: %{public}d %{public}s",
            pCallbackData->messageIdNumber, pCallbackData->pMessageIdName);
    } else if (messageSeverity & VK_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT) {
        prefix = "WARN: ";
        OH_LOG_Print(LOG_APP, LOG_WARN, LOG_DOMAIN, LOG_TAG, "debug callback WARN: %{public}d %{public}s",
            pCallbackData->messageIdNumber, pCallbackData->pMessageIdName);
    } else if (messageSeverity & VK_DEBUG_UTILS_MESSAGE_SEVERITY_INFO_BIT_EXT) {
        prefix = "INFO: ";
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "debug callback INFO: %{public}d %{public}s",
            pCallbackData->messageIdNumber, pCallbackData->pMessageIdName);
    } else if (messageSeverity & VK_DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT) {
        prefix = "DEBUG: ";
        OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_DOMAIN, LOG_TAG, "debug callback VERBOSE: %{public}d %{public}s",
            pCallbackData->messageIdNumber, pCallbackData->pMessageIdName);
    }
    g_debugMessage << prefix << "[" << pCallbackData->messageIdNumber << "][" << pCallbackData->pMessageIdName
                 << "] : " << pCallbackData->pMessage;
    return VK_FALSE;
}

/**
 * @brief Clean up all Vulkan resources (swapchain, device, surface, instance).
 */
static void TearDownTestCase()
{
    if (device != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "TearDown: destroy device: %{public}p", device);
        if (swapChain != VK_NULL_HANDLE) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "TearDown: destroy swapChain");
            fpDestroySwapchainKHR(device, swapChain, nullptr);
        }
        vkDestroyDevice(device, nullptr);
        device = nullptr;
    }
    if (instance != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "TearDown: destroy instance: %{public}p", instance);
        if (surface != VK_NULL_HANDLE) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "TearDown: destroy surface");
            vkDestroySurfaceKHR(instance, surface, nullptr);
            surface = VK_NULL_HANDLE;
        }
        vkDestroyInstance(instance, nullptr);
        instance = nullptr;
    }
}

/**
 * @brief Test loading Vulkan base function pointers and creating an instance.
 * Enumerates instance extensions, creates VkInstance, sets g_isSupportedVulkan.
 * @return 0 on completion (success or unsupported).
 */
int LoadBaseFuncPtrTest()
{
    uint32_t extensionCount = 0;
    VkResult result = vkEnumerateInstanceExtensionProperties(nullptr, &extensionCount, nullptr);
    if (result != VK_SUCCESS) {
        g_isSupportedVulkan = false;
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "vkEnumerateExt failed: %{public}d", result);
        return 0;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "base func OK, ext count: %{public}u", extensionCount);
    TrytoCreateVkInstance();
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "LoadBaseFuncPtr done, vulkan support: %{public}d",
        g_isSupportedVulkan);
    return 0;
}

/**
 * @brief Template helper to load a Vulkan instance function pointer by name.
 * @param funcPtr Reference to the function pointer to populate.
 * @param funcName Name of the Vulkan function to load.
 * @return true if loaded successfully, false otherwise.
 */
template <typename T> static bool LoadInstanceFunc(T& funcPtr, const char* funcName)
{
    funcPtr = reinterpret_cast<T>(vkGetInstanceProcAddr(instance, funcName));
    return funcPtr != nullptr;
}

/** @brief Load core instance functions (destroy, enumerate, create, surface). */
static bool LoadInstanceCoreFunc()
{
    if (!LoadInstanceFunc(vkDestroyInstance, "vkDestroyInstance")) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "load vkDestroyInstance failed");
        return false;
    }
    if (!LoadInstanceFunc(vkEnumeratePhysicalDevices, "vkEnumeratePhysicalDevices")) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "load vkEnumeratePhysicalDevices failed");
        return false;
    }
    if (!LoadInstanceFunc(vkCreateDevice, "vkCreateDevice")) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "load vkCreateDevice failed");
        return false;
    }
    if (!LoadInstanceFunc(vkDestroyDevice, "vkDestroyDevice")) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "load vkDestroyDevice failed");
        return false;
    }
    if (!LoadInstanceFunc(vkDestroySurfaceKHR, "vkDestroySurfaceKHR")) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "load vkDestroySurfaceKHR failed");
        return false;
    }
    if (!LoadInstanceFunc(vkCreateSurfaceOHOS, "vkCreateSurfaceOHOS")) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "load vkCreateSurfaceOHOS failed");
        return false;
    }
    return true;
}

/** @brief Load surface-related instance functions (capabilities, formats, present). */
static bool LoadInstanceSurfaceFunc()
{
    if (!LoadInstanceFunc(fpGetPhysicalDeviceSurfaceCapabilitiesKHR, "vkGetPhysicalDeviceSurfaceCapabilitiesKHR")) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "load vkGetPhysicalDeviceSurfaceCapabilitiesKHR failed");
        return false;
    }
    if (!LoadInstanceFunc(fpGetPhysicalDeviceSurfacePresentModesKHR, "vkGetPhysicalDeviceSurfacePresentModesKHR")) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "load vkGetPhysicalDeviceSurfacePresentModesKHR failed");
        return false;
    }
    if (!LoadInstanceFunc(fpGetPhysicalDeviceSurfaceFormatsKHR, "vkGetPhysicalDeviceSurfaceFormatsKHR")) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "load vkGetPhysicalDeviceSurfaceFormatsKHR failed");
        return false;
    }
    if (!LoadInstanceFunc(vkGetPhysicalDeviceSurfaceSupportKHR, "vkGetPhysicalDeviceSurfaceSupportKHR")) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "load vkGetPhysicalDeviceSurfaceSupportKHR failed");
        return false;
    }
    return true;
}

/** @brief Load physical device query functions (queue, properties, features, memory). */
static bool LoadInstanceDeviceFunc()
{
    if (!LoadInstanceFunc(vkGetPhysicalDeviceQueueFamilyProperties, "vkGetPhysicalDeviceQueueFamilyProperties")) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "load vkGetPhysicalDeviceQueueFamilyProperties failed");
        return false;
    }
    if (!LoadInstanceFunc(vkGetPhysicalDeviceProperties, "vkGetPhysicalDeviceProperties")) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "load vkGetPhysicalDeviceProperties failed");
        return false;
    }
    if (!LoadInstanceFunc(vkGetPhysicalDeviceFeatures, "vkGetPhysicalDeviceFeatures")) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "load vkGetPhysicalDeviceFeatures failed");
        return false;
    }
    if (!LoadInstanceFunc(vkGetPhysicalDeviceMemoryProperties, "vkGetPhysicalDeviceMemoryProperties")) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "load vkGetPhysicalDeviceMemoryProperties failed");
        return false;
    }
    return true;
}

/** @brief Load debug messenger functions for validation layer. */
static bool LoadInstanceDebugFunc()
{
    if (!LoadInstanceFunc(vkCreateDebugUtilsMessengerEXT, "vkCreateDebugUtilsMessengerEXT")) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "load vkCreateDebugUtilsMessengerEXT failed");
        return false;
    }
    if (!LoadInstanceFunc(vkDestroyDebugUtilsMessengerEXT, "vkDestroyDebugUtilsMessengerEXT")) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "load vkDestroyDebugUtilsMessengerEXT failed");
        return false;
    }
    return true;
}

/**
 * @brief Test loading instance-level function pointers (core, surface, device, debug).
 * @return 0 on success, -1 if Vulkan unsupported or loading failed.
 */
int LoadInstanceFuncPtrTest()
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "LoadInstanceFuncPtr, support: %{public}d",
        g_isSupportedVulkan);
    if (!g_isSupportedVulkan) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "vulkan not supported, skip");
        return 0;
    }
    if (instance == nullptr || vkGetInstanceProcAddr == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "instance or vkGetInstanceProcAddr is null");
        return -1;
    }

    if (!LoadInstanceCoreFunc()) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "LoadInstanceCoreFunc failed");
        return -1;
    }
    if (!LoadInstanceSurfaceFunc()) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "LoadInstanceSurfaceFunc failed");
        return -1;
    }
    if (!LoadInstanceDeviceFunc()) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "LoadInstanceDeviceFunc failed");
        return -1;
    }
    if (!LoadInstanceDebugFunc()) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "LoadInstanceDebugFunc failed");
        return -1;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "LoadInstanceFuncPtr all succeeded");
    return 0;
}

/**
 * @brief Test vkEnumeratePhysicalDevices and query physical device properties.
 * Enumerates GPUs, selects the first one, queries properties/features/memory.
 * @return 0 on success, -1 on failure, 0 if Vulkan unsupported.
 */
int VkEnumeratePhysicalDevicesTest()
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "VkEnumeratePhysDev, support: %{public}d",
        g_isSupportedVulkan);
    if (!g_isSupportedVulkan) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "vulkan not supported, skip");
        return 0;
    }
    if (instance == nullptr || vkEnumeratePhysicalDevices == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "instance or enumerate func is null");
        return -1;
    }

    uint32_t gpuCount = 0;
    VkResult err = vkEnumeratePhysicalDevices(instance, &gpuCount, nullptr);
    if (err != VK_SUCCESS || gpuCount == 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "enumerate failed: %{public}d, gpu: %{public}u",
            err, gpuCount);
        return -1;
    }
    std::vector<VkPhysicalDevice> physicalDevices(gpuCount);
    err = vkEnumeratePhysicalDevices(instance, &gpuCount, physicalDevices.data());
    if (err != VK_SUCCESS || physicalDevices.empty()) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "enumerate2 failed: %{public}d", err);
        return -1;
    }
    physicalDevice = physicalDevices[0];
    if (physicalDevice == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "physicalDevice is null");
        return -1;
    }

    VkPhysicalDeviceProperties deviceProperties;
    VkPhysicalDeviceFeatures deviceFeatures;
    VkPhysicalDeviceMemoryProperties deviceMemoryProperties;
    vkGetPhysicalDeviceProperties(physicalDevice, &deviceProperties);
    vkGetPhysicalDeviceFeatures(physicalDevice, &deviceFeatures);
    vkGetPhysicalDeviceMemoryProperties(physicalDevice, &deviceMemoryProperties);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG,
        "gpu name: %{public}s, vendorID: 0x%{public}x, deviceID: 0x%{public}x, type: %{public}d",
        deviceProperties.deviceName, deviceProperties.vendorID, deviceProperties.deviceID,
        static_cast<int>(deviceProperties.deviceType));
    (void)deviceFeatures;
    (void)deviceMemoryProperties;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "enumerate OK, gpu: %{public}u", gpuCount);
    return 0;
}

/**
 * @brief Create a logical Vulkan device with a graphics queue and swapchain extension.
 *        Shared by VkCreateDeviceTest and the two OHOS extension tests to avoid duplication.
 * @return true if device created and stored in ::device, false on any failure.
 */
static bool CreateLogicalDevice()
{
    if (vkCreateDevice == nullptr || physicalDevice == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "vkCreateDevice or physDev is null");
        return false;
    }
    VkDeviceCreateInfo deviceCreateInfo = {};
    deviceCreateInfo.sType = VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO;
    std::vector<VkDeviceQueueCreateInfo> queueCreateInfos;
    const float defaultQueuePriority = 0.0f;
    VkDeviceQueueCreateInfo queueInfo = {};
    queueInfo.sType = VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO;
    queueInfo.queueFamilyIndex = GetQueueFamilyIndex(VK_QUEUE_GRAPHICS_BIT);
    if (queueInfo.queueFamilyIndex == static_cast<uint32_t>(-1)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "no graphics queue family");
        return false;
    }
    queueInfo.queueCount = 1;
    queueInfo.pQueuePriorities = &defaultQueuePriority;
    queueCreateInfos.push_back(queueInfo);
    deviceCreateInfo.queueCreateInfoCount = static_cast<uint32_t>(queueCreateInfos.size());
    deviceCreateInfo.pQueueCreateInfos = queueCreateInfos.data();
    std::vector<const char*> deviceExtensions;
    deviceExtensions.push_back(VK_KHR_SWAPCHAIN_EXTENSION_NAME);
    deviceCreateInfo.enabledExtensionCount = static_cast<uint32_t>(deviceExtensions.size());
    deviceCreateInfo.ppEnabledExtensionNames = deviceExtensions.data();
    VkDevice logicalDevice = VK_NULL_HANDLE;
    VkResult err = vkCreateDevice(physicalDevice, &deviceCreateInfo, nullptr, &logicalDevice);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "vkCreateDevice err: %{public}d", err);
    if (err != VK_SUCCESS || logicalDevice == VK_NULL_HANDLE) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "vkCreateDevice failed, err: %{public}d", err);
        return false;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "logicalDevice created: %{public}p", logicalDevice);
    device = logicalDevice;
    return true;
}

/**
 * @brief Test vkCreateDevice to create a logical Vulkan device.
 * Selects a graphics queue family, enables VK_KHR_swapchain extension.
 * @return 0 on success, -1 on failure, 0 if Vulkan unsupported.
 */
int VkCreateDeviceTest()
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "VkCreateDevice, support: %{public}d",
        g_isSupportedVulkan);
    if (!g_isSupportedVulkan) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "vulkan not supported, skip");
        return 0;
    }
    if (!CreateLogicalDevice()) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "CreateLogicalDevice failed in VkCreateDevice");
        return -1;
    }
    return 0;
}

/**
 * @brief Test vkGetNativeBufferPropertiesOHOS for OHOS native buffer interop.
 * Creates a logical device, queries the OHOS native buffer properties extension.
 * @return 0 on completion (success or unsupported), -1 on failure.
 */
int GetNativeBufferPropertiesOhosTest()
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "GetNativeBufProps, support: %{public}d",
        g_isSupportedVulkan);
    if (!g_isSupportedVulkan) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "vulkan not supported, skip");
        return 0;
    }
    if (vkGetDeviceProcAddr == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "vkGetDeviceProcAddr is null");
        return -1;
    }
    if (!CreateLogicalDevice()) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG,
            "CreateLogicalDevice failed in GetNativeBufferProperties");
        return -1;
    }

    VkNativeBufferPropertiesOHOS nativeBufferPropertiesOHOS = {};
    VkNativeBufferFormatPropertiesOHOS nativeBufferFormatPropertiesOHOS = {};
    nativeBufferFormatPropertiesOHOS.sType = VK_STRUCTURE_TYPE_NATIVE_BUFFER_FORMAT_PROPERTIES_OHOS;
    nativeBufferFormatPropertiesOHOS.pNext = nullptr;
    nativeBufferPropertiesOHOS.sType = VK_STRUCTURE_TYPE_NATIVE_BUFFER_PROPERTIES_OHOS;
    nativeBufferPropertiesOHOS.pNext = &nativeBufferFormatPropertiesOHOS;

    fpGetNativeBufferPropertiesOHOS = reinterpret_cast<PFN_vkGetNativeBufferPropertiesOHOS>(
        vkGetDeviceProcAddr(device, "vkGetNativeBufferPropertiesOHOS"));
    if (fpGetNativeBufferPropertiesOHOS == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "GetNativeBufferPropertiesOHOS not available");
        return 0;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "GetNativeBufferPropertiesOHOS loaded OK");
    return 0;
}

/**
 * @brief Test vkGetMemoryNativeBufferOHOS for OHOS native buffer memory interop.
 * Creates a logical device, queries the OHOS native buffer memory extension.
 * @return 0 on completion (success or unsupported), -1 on failure.
 */
int GetMemoryNativeBufferOhosTest()
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "GetMemoryNativeBuf, support: %{public}d",
        g_isSupportedVulkan);
    if (!g_isSupportedVulkan) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "vulkan not supported, skip");
        return 0;
    }
    if (vkGetDeviceProcAddr == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "vkGetDeviceProcAddr is null");
        return -1;
    }
    if (!CreateLogicalDevice()) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG,
            "CreateLogicalDevice failed in GetMemoryNativeBuffer");
        return -1;
    }

    VkDeviceMemory hardwareBufferMemory = {};
    VkMemoryGetNativeBufferInfoOHOS getNativeBufferInfoOHOS = {};
    getNativeBufferInfoOHOS.sType = VK_STRUCTURE_TYPE_MEMORY_GET_NATIVE_BUFFER_INFO_OHOS;
    getNativeBufferInfoOHOS.pNext = nullptr;
    getNativeBufferInfoOHOS.memory = hardwareBufferMemory;
    fpGetMemoryNativeBufferOHOS =
        reinterpret_cast<PFN_vkGetMemoryNativeBufferOHOS>(vkGetDeviceProcAddr(device, "vkGetMemoryNativeBufferOHOS"));
    if (fpGetMemoryNativeBufferOHOS == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "GetMemoryNativeBufferOHOS not available");
        return 0;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "GetMemoryNativeBufferOHOS loaded OK");
    return 0;
}

} // namespace loader
} // namespace vulkan
