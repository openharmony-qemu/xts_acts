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
 
#include "gtest/gtest.h"
#include "file_ex.h"
#include "config_reader.h"
#include "libxml/tree.h"
 
 
using namespace std;
using namespace testing::ext;
 
class SocperfTestSuite : public testing::Test {
protected:
    // Preset action of the test suite, which is executed before the first test case
    static void SetUpTestCase(void) {
    }
    // Test suite cleanup action, which is executed after the last test case
    static void TearDownTestCase(void) {
    }
    // Preset action of the test case
    virtual void SetUp()
    {
    }
    // Cleanup action of the test case
    virtual void TearDown()
    {
    }
};
 
bool TraversalFreqResource(xmlNode* grandson, const std::string& configFile)
{
    char* id = reinterpret_cast<char*>(xmlGetProp(grandson, reinterpret_cast<const xmlChar*>("id")));
    char* name = reinterpret_cast<char*>(xmlGetProp(grandson, reinterpret_cast<const xmlChar*>("name")));
    char* persistMode = reinterpret_cast<char*>(xmlGetProp(grandson, reinterpret_cast<const xmlChar*>("switch")));
    if (!id || !name || !persistMode) {
        return false;
    }
    xmlFree(id);
    xmlFree(name);
    xmlFree(persistMode);
    return true;
}
 
bool LoadResource(xmlNode* child, const std::string& configFile)
{
    xmlNode* grandson = child->children;
    for (; grandson; grandson = grandson->next) {
        if (!xmlStrcmp(grandson->name, reinterpret_cast<const xmlChar*>("res"))) {
            if (!TraversalFreqResource(grandson, configFile)) {
                return false;
            }
        }
    }
 
    return true;
}
 
bool LoadGovResource(xmlNode* child, const std::string& configFile)
{
    xmlNode* grandson = child->children;
    for (; grandson; grandson = grandson->next) {
        if (xmlStrcmp(grandson->name, reinterpret_cast<const xmlChar*>("res"))) {
            continue;
        }
        char* id = reinterpret_cast<char*>(xmlGetProp(grandson, reinterpret_cast<const xmlChar*>("id")));
        char* name = reinterpret_cast<char*>(xmlGetProp(grandson, reinterpret_cast<const xmlChar*>("name")));
        char* persistMode = reinterpret_cast<char*>(xmlGetProp(grandson, reinterpret_cast<const xmlChar*>("switch")));
        
        if (!id || !name || !persistMode) {
            xmlFree(id);
            xmlFree(name);
            xmlFree(persistMode);
            return false;
        }
        xmlFree(id);
        xmlFree(name);
        xmlFree(persistMode);
    }
    return true;
}
 
bool LoadSceneResource(xmlNode* child, const std::string& configFile)
{
    xmlNode* grandson = child->children;
    for (; grandson; grandson = grandson->next) {
        if (xmlStrcmp(grandson->name, reinterpret_cast<const xmlChar*>("scene"))) {
            continue;
        }
        char* name = reinterpret_cast<char*>(xmlGetProp(grandson, reinterpret_cast<const xmlChar*>("name")));
        char* persistMode = reinterpret_cast<char*>(xmlGetProp(grandson,
            reinterpret_cast<const xmlChar*>("switch")));
        if (!name || !persistMode) {
            return false;
        }
        xmlFree(name);
        xmlFree(persistMode);
    }
 
    return true;
}
 
bool TraversalBoostResource(xmlNode* grandson, const std::string& configFile)
{
    char* level = reinterpret_cast<char*>(xmlGetProp(grandson, reinterpret_cast<const xmlChar*>("thermalLvl")));
    if (!level) {
        xmlFree(level);
        return false;
    }
    xmlFree(level);
    return true;
}
 
bool LoadCmdInfo(const xmlNode* child, const std::string& configFile)
{
    char* id = reinterpret_cast<char*>(xmlGetProp(child, reinterpret_cast<const xmlChar*>("id")));
    char* name = reinterpret_cast<char*>(xmlGetProp(child, reinterpret_cast<const xmlChar*>("name")));
    if (!id || !name) {
        xmlFree(id);
        xmlFree(name);
        return false;
    }
        
    xmlNode* grandson = child->children;
    xmlFree(id);
    xmlFree(name);
 
    if (!TraversalBoostResource(grandson, configFile)) {
        return false;
    }
    return true;
}

/**
 * @tc.number CheckConfigResource001
 * @tc.name: CheckConfigResource001
 * @tc.desc: check socperf config
 * @tc.level:Level 1
 * @tc.type FUNC
 * @tc.size:MediumTest
 */
HWTEST_F(SocperfTestSuite, Check, Function | MediumTest | Level1)
{
    std::string content;
    OHOS::LoadStringFromFile("/vendor/etc/soc_perf/socperf_resource_config.xml", content);
    xmlDoc* file = xmlReadFile(content.c_str(), nullptr, XML_PARSE_NOERROR | XML_PARSE_NOWARNING);
    if (!file) {
        return;
    }
    xmlNode* rootNode = xmlDocGetRootElement(file);
    if (!rootNode) {
        xmlFreeDoc(file);
        return;
    }
    int32_t res = xmlStrcmp(rootNode->name, reinterpret_cast<const xmlChar*>("Configs"));
    EXPECT_EQ(res, 0);
    xmlNode* child = rootNode->children;
    for (; child; child = child->next) {
        if (!xmlStrcmp(child->name, reinterpret_cast<const xmlChar*>("Resource"))) {
            EXPECT_TRUE(LoadResource(child, content));
        } else if (!xmlStrcmp(child->name, reinterpret_cast<const xmlChar*>("GovResource"))) {
            EXPECT_TRUE(LoadGovResource(child, content));
        } else if (!xmlStrcmp(child->name, reinterpret_cast<const xmlChar*>("SceneResource"))) {
            EXPECT_TRUE(LoadSceneResource(child, content));
        }
    }
}

/**
 * @tc.number CheckConfigBoost_001
 * @tc.name: CheckConfigResource001
 * @tc.desc: check socperf config
 * @tc.level:Level 3
 * @tc.type FUNC
 * @tc.size:MediumTest
 */
HWTEST_F(SocperfTestSuite, ConfigBoost, Function | MediumTest Level1)
{
    std::string content;
    OHOS::LoadStringFromFile("/vendor/etc/soc_perf/socperf_boost_config_ext.xml", content);
    xmlDoc* file = xmlReadFile(content.c_str(), nullptr, XML_PARSE_NOERROR | XML_PARSE_NOWARNING);
    if (!file) {
        return;
    }
    xmlNode* rootNode = xmlDocGetRootElement(file);
    if (!rootNode) {
        xmlFreeDoc(file);
        return;
    }
    int32_t res = xmlStrcmp(rootNode->name, reinterpret_cast<const xmlChar*>("Configs"));
    EXPECT_EQ(res, 0);
    xmlNode* child = rootNode->children;
    for (; child; child = child->next) {
        if (!xmlStrcmp(child->name, reinterpret_cast<const xmlChar*>("cmd"))) {
            EXPECT_TRUE(LoadCmdInfo(child, content));
        }
    }
}