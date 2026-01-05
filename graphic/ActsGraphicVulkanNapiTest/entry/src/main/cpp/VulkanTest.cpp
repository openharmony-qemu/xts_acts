/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
#include <dlfcn.h>
#include <iostream>
#include <native_window/external_window.h>
#include <sstream>
#include <string>
#include <vector>
#include "vulkan/vulkan.h"
#include "vulkan/vulkan_ohos.h"

namespace vulkan {
namespace loader {

static PFN_vkEnumerateInstanceExtensionProperties vkEnumerateInstanceExtensionProperties = nullptr;
static PFN_vkEnumerateDeviceExtensionProperties vkEnumerateDeviceExtensionProperties = nullptr;
static PFN_vkEnumerateInstanceLayerProperties vkEnumerateInstanceLayerProperties = nullptr;
static PFN_vkEnumerateDeviceLayerProperties vkEnumerateDeviceLayerProperties = nullptr;
static PFN_vkCreateDebugUtilsMessengerEXT vkCreateDebugUtilsMessengerEXT = nullptr;
static PFN_vkDestroyDebugUtilsMessengerEXT vkDestroyDebugUtilsMessengerEXT = nullptr;
static PFN_vkCreateInstance vkCreateInstance = nullptr;
static PFN_vkGetInstanceProcAddr vkGetInstanceProcAddr = nullptr;
static PFN_vkGetDeviceProcAddr vkGetDeviceProcAddr = nullptr;
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

static void* libVulkan_ = nullptr;
static VkInstance instance_ = nullptr;
static VkSurfaceKHR surface_ = VK_NULL_HANDLE;
static VkPhysicalDevice physicalDevice_ = nullptr;
static VkDevice device_ = nullptr;
static VkSurfaceCapabilitiesKHR surfCaps_ = {};
static VkSurfaceFormatKHR surfaceFormat_ = {};
static VkSwapchainKHR swapChain_ = VK_NULL_HANDLE;
static VkSwapchainKHR swapChain2_ = VK_NULL_HANDLE;
static VkSemaphore semaphore_ = VK_NULL_HANDLE;
static bool isSupportedVulkan_ = false;
static std::vector<VkQueueFamilyProperties> queueProps_;
static uint32_t queueCount_ = 0;
static VkDebugUtilsMessengerEXT debugUtilsMessenger = VK_NULL_HANDLE;
static std::stringstream debugMessage_;

static bool DLOpenLibVulkan()
{
#if (defined(__aarch64__) || defined(__x86_64__))
    const char* path = "/system/lib64/libvulkan.so";
#else
    const char* path = "/system/lib/libvulkan.so";
#endif
    libVulkan_ = dlopen(path, RTLD_NOW | RTLD_LOCAL);
    if (libVulkan_ == nullptr) {
        std::cout << "dlerror: " << dlerror() << std::endl;
        std::cout << "isSupportedVulkan_: false" << std::endl;
        return false;
    }
    return true;
}

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

    VkResult result = vkCreateInstance(&instanceCreateInfo, nullptr, &instance_);
    std::cout << "instance_ ptr: " << instance_ << std::endl;
    if (result != VK_SUCCESS || instance_ == nullptr) {
        isSupportedVulkan_ = false;
    } else {
        isSupportedVulkan_ = true;
    }
    std::cout << "set isSupportedVulkan_: " << isSupportedVulkan_ << std::endl;
    std::cout << "TrytoCreateVkInstance result: " << result << std::endl;
}

static VkSwapchainCreateInfoKHR GetSwapchainCreateInfo(VkFormat imageFormat, VkColorSpaceKHR imageColorSpace)
{
    VkSwapchainCreateInfoKHR swapchainCI = {};
    swapchainCI.sType = VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR;
    swapchainCI.surface = surface_;
    uint32_t desiredNumberOfSwapchainImages = surfCaps_.minImageCount + 1;
    if ((surfCaps_.maxImageCount > 0) && (desiredNumberOfSwapchainImages > surfCaps_.maxImageCount)) {
        desiredNumberOfSwapchainImages = surfCaps_.maxImageCount;
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
    swapchainCI.oldSwapchain = swapChain_;
    swapchainCI.clipped = VK_TRUE;
    swapchainCI.compositeAlpha = VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR;
    return swapchainCI;
}

static uint32_t GetQueueFamilyIndex(VkQueueFlagBits queueFlags)
{
    if (physicalDevice_ == nullptr || vkGetPhysicalDeviceQueueFamilyProperties == nullptr) {
        std::cout << "physicalDevice_ or vkGetPhysicalDeviceQueueFamilyProperties is null" << std::endl;
        return static_cast<uint32_t>(-1);
    }

    vkGetPhysicalDeviceQueueFamilyProperties(physicalDevice_, &queueCount_, nullptr);
    if (queueCount_ == 0) {
        return static_cast<uint32_t>(-1);
    }

    queueProps_.resize(queueCount_);
    vkGetPhysicalDeviceQueueFamilyProperties(physicalDevice_, &queueCount_, queueProps_.data());

    for (size_t i = 0; i < queueProps_.size(); i++) {
        if (queueFlags & VK_QUEUE_COMPUTE_BIT) {
            if ((queueProps_[i].queueFlags & queueFlags) &&
                ((queueProps_[i].queueFlags & VK_QUEUE_GRAPHICS_BIT) == 0)) {
                return static_cast<uint32_t>(i);
            }
        }
    }

    for (size_t i = 0; i < queueProps_.size(); i++) {
        if (queueFlags & VK_QUEUE_TRANSFER_BIT) {
            if ((queueProps_[i].queueFlags & queueFlags) &&
                ((queueProps_[i].queueFlags & VK_QUEUE_GRAPHICS_BIT) == 0) &&
                ((queueProps_[i].queueFlags & VK_QUEUE_COMPUTE_BIT) == 0)) {
                return static_cast<uint32_t>(i);
            }
        }
    }

    for (size_t i = 0; i < queueProps_.size(); i++) {
        if (queueProps_[i].queueFlags & queueFlags) {
            return static_cast<uint32_t>(i);
        }
    }

    std::cout << "Could not find a matching queue family index" << std::endl;
    return static_cast<uint32_t>(-1);
}

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
    } else if (messageSeverity & VK_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT) {
        prefix = "WARN: ";
    } else if (messageSeverity & VK_DEBUG_UTILS_MESSAGE_SEVERITY_INFO_BIT_EXT) {
        prefix = "INFO: ";
    } else if (messageSeverity & VK_DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT) {
        prefix = "DEBUG: ";
    }
    debugMessage_ << prefix << "[" << pCallbackData->messageIdNumber << "][" << pCallbackData->pMessageIdName
                  << "] : " << pCallbackData->pMessage;
    return VK_FALSE;
}

static void TearDownTestCase()
{
    if (device_ != nullptr) {
        if (swapChain_ != VK_NULL_HANDLE) {
            fpDestroySwapchainKHR(device_, swapChain_, nullptr);
        }
        vkDestroyDevice(device_, nullptr);
        device_ = nullptr;
    }
    if (instance_ != nullptr) {
        if (surface_ != VK_NULL_HANDLE) {
            vkDestroySurfaceKHR(instance_, surface_, nullptr);
            surface_ = VK_NULL_HANDLE;
        }
        vkDestroyInstance(instance_, nullptr);
        instance_ = nullptr;
    }
}

int LoadBaseFuncPtrTest()
{
    bool opened = DLOpenLibVulkan();
    std::cout << "LibVulkan opened: " << opened << std::endl;
    std::cout << "libVulkan_ ptr: " << libVulkan_ << std::endl;
    if (!opened || libVulkan_ == nullptr) {
        return -1;
    }

    vkEnumerateInstanceExtensionProperties = reinterpret_cast<PFN_vkEnumerateInstanceExtensionProperties>(
        dlsym(libVulkan_, "vkEnumerateInstanceExtensionProperties"));
    if (vkEnumerateInstanceExtensionProperties == nullptr) {
        return -1;
    }
    vkEnumerateInstanceLayerProperties = reinterpret_cast<PFN_vkEnumerateInstanceLayerProperties>(
        dlsym(libVulkan_, "vkEnumerateInstanceLayerProperties"));
    if (vkEnumerateInstanceLayerProperties == nullptr) {
        return -1;
    }
    vkEnumerateDeviceExtensionProperties = reinterpret_cast<PFN_vkEnumerateDeviceExtensionProperties>(
        dlsym(libVulkan_, "vkEnumerateDeviceExtensionProperties"));
    if (vkEnumerateDeviceExtensionProperties == nullptr) {
        return -1;
    }
    vkEnumerateDeviceLayerProperties =
        reinterpret_cast<PFN_vkEnumerateDeviceLayerProperties>(dlsym(libVulkan_, "vkEnumerateDeviceLayerProperties"));
    if (vkEnumerateDeviceLayerProperties == nullptr) {
        return -1;
    }
    vkCreateInstance = reinterpret_cast<PFN_vkCreateInstance>(dlsym(libVulkan_, "vkCreateInstance"));
    if (vkCreateInstance == nullptr) {
        return -1;
    }
    vkGetInstanceProcAddr = reinterpret_cast<PFN_vkGetInstanceProcAddr>(dlsym(libVulkan_, "vkGetInstanceProcAddr"));
    if (vkGetInstanceProcAddr == nullptr) {
        return -1;
    }
    vkGetDeviceProcAddr = reinterpret_cast<PFN_vkGetDeviceProcAddr>(dlsym(libVulkan_, "vkGetDeviceProcAddr"));
    if (vkGetDeviceProcAddr == nullptr) {
        return -1;
    }
    TrytoCreateVkInstance();
    return isSupportedVulkan_ ? 0 : -1;
}

int LoadInstanceFuncPtrTest()
{
    std::cout << "isSupportedVulkan_: " << isSupportedVulkan_ << std::endl;
    if (!isSupportedVulkan_) {
        return 0;
    }
    if (instance_ == nullptr || vkGetInstanceProcAddr == nullptr) {
        return -1;
    }

    vkDestroyInstance = reinterpret_cast<PFN_vkDestroyInstance>(vkGetInstanceProcAddr(instance_, "vkDestroyInstance"));
    if (vkDestroyInstance == nullptr) {
        return -1;
    }
    vkEnumeratePhysicalDevices = reinterpret_cast<PFN_vkEnumeratePhysicalDevices>(
        vkGetInstanceProcAddr(instance_, "vkEnumeratePhysicalDevices"));
    if (vkEnumeratePhysicalDevices == nullptr) {
        return -1;
    }
    vkCreateDevice = reinterpret_cast<PFN_vkCreateDevice>(vkGetInstanceProcAddr(instance_, "vkCreateDevice"));
    if (vkCreateDevice == nullptr) {
        return -1;
    }
    vkDestroyDevice = reinterpret_cast<PFN_vkDestroyDevice>(vkGetInstanceProcAddr(instance_, "vkDestroyDevice"));
    if (vkDestroyDevice == nullptr) {
        return -1;
    }
    vkDestroySurfaceKHR =
        reinterpret_cast<PFN_vkDestroySurfaceKHR>(vkGetInstanceProcAddr(instance_, "vkDestroySurfaceKHR"));
    if (vkDestroySurfaceKHR == nullptr) {
        return -1;
    }
    vkCreateSurfaceOHOS =
        reinterpret_cast<PFN_vkCreateSurfaceOHOS>(vkGetInstanceProcAddr(instance_, "vkCreateSurfaceOHOS"));
    if (vkCreateSurfaceOHOS == nullptr) {
        return -1;
    }
    fpGetPhysicalDeviceSurfaceCapabilitiesKHR = reinterpret_cast<PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR>(
        vkGetInstanceProcAddr(instance_, "vkGetPhysicalDeviceSurfaceCapabilitiesKHR"));
    if (fpGetPhysicalDeviceSurfaceCapabilitiesKHR == nullptr) {
        return -1;
    }
    fpGetPhysicalDeviceSurfacePresentModesKHR = reinterpret_cast<PFN_vkGetPhysicalDeviceSurfacePresentModesKHR>(
        vkGetInstanceProcAddr(instance_, "vkGetPhysicalDeviceSurfacePresentModesKHR"));
    if (fpGetPhysicalDeviceSurfacePresentModesKHR == nullptr) {
        return -1;
    }
    fpGetPhysicalDeviceSurfaceFormatsKHR = reinterpret_cast<PFN_vkGetPhysicalDeviceSurfaceFormatsKHR>(
        vkGetInstanceProcAddr(instance_, "vkGetPhysicalDeviceSurfaceFormatsKHR"));
    if (fpGetPhysicalDeviceSurfaceFormatsKHR == nullptr) {
        return -1;
    }
    vkGetPhysicalDeviceQueueFamilyProperties = reinterpret_cast<PFN_vkGetPhysicalDeviceQueueFamilyProperties>(
        vkGetInstanceProcAddr(instance_, "vkGetPhysicalDeviceQueueFamilyProperties"));
    if (vkGetPhysicalDeviceQueueFamilyProperties == nullptr) {
        return -1;
    }
    vkGetPhysicalDeviceProperties = reinterpret_cast<PFN_vkGetPhysicalDeviceProperties>(
        vkGetInstanceProcAddr(instance_, "vkGetPhysicalDeviceProperties"));
    if (vkGetPhysicalDeviceProperties == nullptr) {
        return -1;
    }
    vkGetPhysicalDeviceFeatures = reinterpret_cast<PFN_vkGetPhysicalDeviceFeatures>(
        vkGetInstanceProcAddr(instance_, "vkGetPhysicalDeviceFeatures"));
    if (vkGetPhysicalDeviceFeatures == nullptr) {
        return -1;
    }
    vkGetPhysicalDeviceMemoryProperties = reinterpret_cast<PFN_vkGetPhysicalDeviceMemoryProperties>(
        vkGetInstanceProcAddr(instance_, "vkGetPhysicalDeviceMemoryProperties"));
    if (vkGetPhysicalDeviceMemoryProperties == nullptr) {
        return -1;
    }
    vkGetPhysicalDeviceSurfaceSupportKHR = reinterpret_cast<PFN_vkGetPhysicalDeviceSurfaceSupportKHR>(
        vkGetInstanceProcAddr(instance_, "vkGetPhysicalDeviceSurfaceSupportKHR"));
    if (vkGetPhysicalDeviceSurfaceSupportKHR == nullptr) {
        return -1;
    }
    vkCreateDebugUtilsMessengerEXT = reinterpret_cast<PFN_vkCreateDebugUtilsMessengerEXT>(
        vkGetInstanceProcAddr(instance_, "vkCreateDebugUtilsMessengerEXT"));
    if (vkCreateDebugUtilsMessengerEXT == nullptr) {
        return -1;
    }
    vkDestroyDebugUtilsMessengerEXT = reinterpret_cast<PFN_vkDestroyDebugUtilsMessengerEXT>(
        vkGetInstanceProcAddr(instance_, "vkDestroyDebugUtilsMessengerEXT"));
    if (vkDestroyDebugUtilsMessengerEXT == nullptr) {
        return -1;
    }
    return 0;
}

int vkEnumeratePhysicalDevices_Test()
{
    std::cout << "isSupportedVulkan_: " << isSupportedVulkan_ << std::endl;
    if (!isSupportedVulkan_) {
        return 0;
    }
    if (instance_ == nullptr || vkEnumeratePhysicalDevices == nullptr) {
        return -1;
    }

    uint32_t gpuCount = 0;
    VkResult err = vkEnumeratePhysicalDevices(instance_, &gpuCount, nullptr);
    if (err != VK_SUCCESS || gpuCount == 0) {
        return -1;
    }
    std::vector<VkPhysicalDevice> physicalDevices(gpuCount);
    err = vkEnumeratePhysicalDevices(instance_, &gpuCount, physicalDevices.data());
    if (err != VK_SUCCESS || physicalDevices.empty()) {
        return -1;
    }
    physicalDevice_ = physicalDevices[0];
    if (physicalDevice_ == nullptr) {
        return -1;
    }

    VkPhysicalDeviceProperties deviceProperties;
    VkPhysicalDeviceFeatures deviceFeatures;
    VkPhysicalDeviceMemoryProperties deviceMemoryProperties;
    vkGetPhysicalDeviceProperties(physicalDevice_, &deviceProperties);
    vkGetPhysicalDeviceFeatures(physicalDevice_, &deviceFeatures);
    vkGetPhysicalDeviceMemoryProperties(physicalDevice_, &deviceMemoryProperties);
    (void)deviceProperties;
    (void)deviceFeatures;
    (void)deviceMemoryProperties;
    return 0;
}

int vkCreateDevice_Test()
{
    std::cout << "isSupportedVulkan_: " << isSupportedVulkan_ << std::endl;
    if (!isSupportedVulkan_) {
        return 0;
    }
    if (vkCreateDevice == nullptr || physicalDevice_ == nullptr) {
        return -1;
    }

    VkDeviceCreateInfo deviceCreateInfo = {};
    deviceCreateInfo.sType = VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO;

    std::vector<VkDeviceQueueCreateInfo> queueCreateInfos;
    const float defaultQueuePriority = 0.0f;
    VkDeviceQueueCreateInfo queueInfo = {};
    queueInfo.sType = VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO;
    queueInfo.queueFamilyIndex = GetQueueFamilyIndex(VK_QUEUE_GRAPHICS_BIT);
    if (queueInfo.queueFamilyIndex == static_cast<uint32_t>(-1)) {
        return -1;
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
    VkResult err = vkCreateDevice(physicalDevice_, &deviceCreateInfo, nullptr, &logicalDevice);
    std::cout << "vkCreateDevice err: " << err << std::endl;
    if (err != VK_SUCCESS || logicalDevice == VK_NULL_HANDLE) {
        return -1;
    }
    std::cout << "logicalDevice ptr: " << logicalDevice << std::endl;
    device_ = logicalDevice;
    return 0;
}

int getNativeBufferPropertiesOHOS_Test()
{
    std::cout << "isSupportedVulkan_: " << isSupportedVulkan_ << std::endl;
    if (!isSupportedVulkan_) {
        return 0;
    }
    if (vkCreateDevice == nullptr || physicalDevice_ == nullptr || vkGetDeviceProcAddr == nullptr) {
        return -1;
    }

    VkDeviceCreateInfo deviceCreateInfo = {};
    deviceCreateInfo.sType = VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO;

    std::vector<VkDeviceQueueCreateInfo> queueCreateInfos;
    const float defaultQueuePriority = 0.0f;
    VkDeviceQueueCreateInfo queueInfo = {};
    queueInfo.sType = VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO;
    queueInfo.queueFamilyIndex = GetQueueFamilyIndex(VK_QUEUE_GRAPHICS_BIT);
    if (queueInfo.queueFamilyIndex == static_cast<uint32_t>(-1)) {
        return -1;
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
    VkResult err = vkCreateDevice(physicalDevice_, &deviceCreateInfo, nullptr, &logicalDevice);
    if (err != VK_SUCCESS || logicalDevice == VK_NULL_HANDLE) {
        return -1;
    }
    device_ = logicalDevice;

    OH_NativeBuffer* aHardBuffer = {};
    VkNativeBufferPropertiesOHOS nativeBufferPropertiesOHOS = {};
    VkNativeBufferFormatPropertiesOHOS nativeBufferFormatPropertiesOHOS = {};
    nativeBufferFormatPropertiesOHOS.sType = VK_STRUCTURE_TYPE_NATIVE_BUFFER_FORMAT_PROPERTIES_OHOS;
    nativeBufferFormatPropertiesOHOS.pNext = nullptr;
    nativeBufferPropertiesOHOS.sType = VK_STRUCTURE_TYPE_NATIVE_BUFFER_PROPERTIES_OHOS;
    nativeBufferPropertiesOHOS.pNext = &nativeBufferFormatPropertiesOHOS;

    fpGetNativeBufferPropertiesOHOS = reinterpret_cast<PFN_vkGetNativeBufferPropertiesOHOS>(
        vkGetDeviceProcAddr(device_, "vkGetNativeBufferPropertiesOHOS"));
    if (fpGetNativeBufferPropertiesOHOS == nullptr) {
        return 0;
    }
    return 0;
}

int getMemoryNativeBufferOHOS_Test()
{
    std::cout << "isSupportedVulkan_: " << isSupportedVulkan_ << std::endl;
    if (!isSupportedVulkan_) {
        return 0;
    }
    if (vkCreateDevice == nullptr || physicalDevice_ == nullptr || vkGetDeviceProcAddr == nullptr) {
        return -1;
    }

    VkDeviceCreateInfo deviceCreateInfo = {};
    deviceCreateInfo.sType = VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO;

    std::vector<VkDeviceQueueCreateInfo> queueCreateInfos;
    const float defaultQueuePriority = 0.0f;
    VkDeviceQueueCreateInfo queueInfo = {};
    queueInfo.sType = VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO;
    queueInfo.queueFamilyIndex = GetQueueFamilyIndex(VK_QUEUE_GRAPHICS_BIT);
    if (queueInfo.queueFamilyIndex == static_cast<uint32_t>(-1)) {
        return -1;
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
    VkResult err = vkCreateDevice(physicalDevice_, &deviceCreateInfo, nullptr, &logicalDevice);
    if (err != VK_SUCCESS || logicalDevice == VK_NULL_HANDLE) {
        return -1;
    }
    device_ = logicalDevice;

    OH_NativeBuffer* aHardBuffer = {};
    VkDeviceMemory hardwareBufferMemory = {};
    VkMemoryGetNativeBufferInfoOHOS getNativeBufferInfoOHOS = {};
    getNativeBufferInfoOHOS.sType = VK_STRUCTURE_TYPE_MEMORY_GET_NATIVE_BUFFER_INFO_OHOS;
    getNativeBufferInfoOHOS.pNext = nullptr;
    getNativeBufferInfoOHOS.memory = hardwareBufferMemory;

    fpGetMemoryNativeBufferOHOS =
        reinterpret_cast<PFN_vkGetMemoryNativeBufferOHOS>(vkGetDeviceProcAddr(device_, "vkGetMemoryNativeBufferOHOS"));
    if (fpGetMemoryNativeBufferOHOS == nullptr) {
        return 0;
    }
    return 0;
}

} // namespace loader
} // namespace vulkan
