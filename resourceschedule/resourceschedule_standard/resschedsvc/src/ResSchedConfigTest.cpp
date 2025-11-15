/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include "config_reader_acts.h"
#include "plugin_switch_acts.h"


using namespace std;
using namespace testing::ext;
class ResSchedConfigTestSuite : public testing::Test {
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

/**
 * @tc.name: CheckConfig
 * @tc.desc: CheckConfig.
 * @tc.type: FUNC
 * @tc.number: 001
 */
HWTEST_F(ResSchedConfigTestSuite, CheckConfig, Function | MediumTest | Level1)
{
    std::string content;
    bool result = true;
    if (OHOS::LoadStringFromFile("/vendor/etc/ressched/res_sched_config.xml", content) && !content.empty()) {
        std::unique_ptr<OHOS::ResourceScheduleActs::ConfigReaderActs> reader =
            std::make_unique<OHOS::ResourceScheduleActs::ConfigReaderActs>();
        result = reader->LoadFromConfigContent(content);
    }
    EXPECT_EQ(result, true);
}

/**
 * @tc.name: CheckPluginSwitch
 * @tc.desc: CheckPluginSwitch.
 * @tc.type: FUNC
 * @tc.number: 002
 */
HWTEST_F(ResSchedConfigTestSuite, CheckPluginSwitch, Function | MediumTest | Level1)
{
    std::string content;
    bool result = true;
    if (OHOS::LoadStringFromFile("/vendor/etc/ressched/res_sched_plugin_switch.xml", content) && !content.empty()) {
        std::unique_ptr<OHOS::ResourceScheduleActs::PluginSwitchActs> pluginSwitch =
        std::make_unique<OHOS::ResourceScheduleActs::PluginSwitchActs>();
        result = pluginSwitch->LoadFromConfigContent(content);
    }
    EXPECT_EQ(result, true);
}