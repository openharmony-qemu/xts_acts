/*
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include <gtest/gtest.h>
#include <stdlib.h>
#include "ActsVulkanImageless_framebufferTest.h"
#include "syscap_ndk.h"
#include <parameter.h>
#include <fstream>
#include <string>
#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <sstream>

namespace OHOS {
using namespace std;
using namespace testing::ext;

// Preset action of the test suite, which is executed before the first test case
void ActsVulkanImagelessframebufferTest::SetUpTestCase(void) {}
// Test suite cleanup action, which is executed after the last test case
void ActsVulkanImagelessframebufferTest::TearDownTestCase(void) {}
// Preset action of the test case
void ActsVulkanImagelessframebufferTest::SetUp() {}
// Cleanup action of the test case
void ActsVulkanImagelessframebufferTest::TearDown() {}

/**
     * @tc.name   TestVulkanImageless_framebufferTestCase
     * @tc.number TestVulkanImageless_framebufferTestCase
     * @tc.desc   TestVulkanImageless_framebufferTestCase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
HWTEST_F(ActsVulkanImagelessframebufferTest, TestVulkanImageless_framebufferTestCase, Function | MediumTest | Level2)
{
    printf("------start ActsVulkanImagelessframebufferTest------\n");
    char value[128] = {0};
    GetParameter("const.gpu.vendor", "0", value, sizeof(value));
    std::string gpuName(value);

    const std::string caseFile = "/data/local/tmp/vulkan/vk-default/imageless-framebuffer.txt";
    const std::string newCaseFile = "/data/local/tmp/vulkan/vk-default/imageless-framebuffer_new.txt";
    const std::string logNameFile = "ActsVulkanImagelessframebufferTest.qpa";
    const std::string command = std::string("/data/local/tmp/deqp_vk_execute") + " --deqp-caselist-file=" + caseFile +
                                " --deqp-log-filename=" + logNameFile;

    // 解析 gpuName 中的版本号，例如 higpu.v300 -> 300
    int gpuVersion = 0;
    const std::string gpuPrefix = "higpu.v";
    size_t pos = gpuName.find(gpuPrefix);
    // 判断 gpuName 是否以 higpu.v 开头
    bool isHiGpu = (pos == 0);
    if (isHiGpu) {
        std::string versionStr = gpuName.substr(gpuPrefix.length());
        gpuVersion = std::atoi(versionStr.c_str());
    }

    if (canIUse("SystemCapability.Graphic.Vulkan")) {
        // higpu.v500 及以上，或者不是 higpu.v 开头的 GPU，都追加 newCaseFile
        if (gpuVersion >= 500 || !isHiGpu) {
            // 1. 检查 caseFile 最后一个字符
            std::ifstream checkFile(caseFile, std::ios::binary | std::ios::ate);
            bool needNewLine = false;
            if (checkFile.is_open()) {
                std::streamsize size = checkFile.tellg();
                if (size > 0) {
                    checkFile.seekg(-1, std::ios::end);
                    char lastChar;
                    checkFile.get(lastChar);
                    if (lastChar != '\n') {
                        needNewLine = true;
                    }
                } else {
                    // 空文件，建议不加换行
                    needNewLine = false;
                }
                checkFile.close();
            } else {
                printf("[ERROR] Failed to open case file for checking: %s\n", caseFile.c_str());
                return;
            }
            // 2. 打开 newCaseFile 和 caseFile
            std::ifstream newFile(newCaseFile, std::ios::binary);
            if (!newFile.is_open()) {
                printf("[ERROR] Failed to open source file: %s\n", newCaseFile.c_str());
                return;
            }
            std::ofstream dstFile(caseFile, std::ios::binary | std::ios::app);  // 追加模式
            if (!dstFile.is_open()) {
                printf("[ERROR] Failed to open destination file: %s\n", caseFile.c_str());
                newFile.close();
                return;
            }
            // 3. 若需要，加换行
            if (needNewLine) {
                dstFile << '\n';
            }
            // 4. 追加内容
            dstFile << newFile.rdbuf();
            dstFile.close();
            newFile.close();
        }
        printf("[INFO] GPU Name: %s, GPU Version: %d\n", gpuName.c_str(), gpuVersion);
        printf("[INFO] Generate success: %s\n", caseFile.c_str());
        printf("[INFO] Execute command: %s\n", command.c_str());
        system(command.c_str());
    }
    EXPECT_TRUE(true);
    printf("------end ActsVulkanImagelessframebufferTest------\n");
}
}