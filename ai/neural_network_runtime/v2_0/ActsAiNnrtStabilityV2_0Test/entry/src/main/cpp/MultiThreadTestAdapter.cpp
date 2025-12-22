/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
#include <cmath>
#include <cstdio>
#include <vector>
#include <thread>

#include "neural_network_runtime/neural_network_runtime.h"
#include "include/NnrtUtilsTest.h"

using namespace OHOS::NeuralNetworkRuntime;
using namespace OHOS::NeuralNetworkRuntime::Test;

/**
 * @tc.name   SUB_AI_NNR_Reliability_North_Stress_0100
 * @tc.number SUB_AI_NNR_Reliability_North_Stress_0100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   RELIABILITY
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 * 
 * 测试说明：循环创建模型、编译并释放资源，验证稳定性
 */
static int SUB_AI_NNR_Reliability_North_Stress_0100()
{
    OH_LOG_INFO(LOG_APP, "[Test] ========== SUB_AI_NNR_Reliability_North_Stress_0100 START ==========");
    OH_LOG_INFO(LOG_APP, "[Test] Stress test: Running %{public}d iterations", STRESS_COUNT);
    
    OHNNCompileParam compileParam;
    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    
    for (int i = 0; i < STRESS_COUNT; i++) {
        OH_NNModel *model1 = OH_NNModel_Construct();
        if (model1 == nullptr) {
            OH_LOG_ERROR(LOG_APP, "[Test] FAILED at iteration %{public}d: OH_NNModel_Construct returned nullptr", i);
            return -1;
        }
        
        int ret = BuildSingleOpGraph(model1, graphArgs);
        if (ret != OH_NN_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "[Test] FAILED at iteration %{public}d: BuildSingleOpGraph failed, ret=%{public}d", i, ret);
            OH_NNModel_Destroy(&model1);
            return -1;
        }

        OH_NNCompilation *compilation1 = OH_NNCompilation_Construct(model1);
        if (compilation1 == nullptr) {
            OH_LOG_ERROR(LOG_APP, "[Test] FAILED at iteration %{public}d: OH_NNCompilation_Construct returned nullptr", i);
            OH_NNModel_Destroy(&model1);
            return -1;
        }
        
        ret = CompileGraphMock(compilation1, compileParam);
        if (ret != OH_NN_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "[Test] FAILED at iteration %{public}d: CompileGraphMock failed, ret=%{public}d", i, ret);
            Free(model1, compilation1);
            return -1;
        }

        Free(model1, compilation1);
        
        if (i % PRINT_FREQ == 0) {
            OH_LOG_INFO(LOG_APP, "[Test] SUB_AI_NNR_Reliability_North_Stress_0100 progress: %{public}d/%{public}d", i, STRESS_COUNT);
        }
    }
    
    OH_LOG_INFO(LOG_APP, "[Test] ========== SUB_AI_NNR_Reliability_North_Stress_0100 PASSED ==========");
    OH_LOG_INFO(LOG_APP, "[Test] All %{public}d iterations completed successfully", STRESS_COUNT);
    return 0;
}

/**
 * @tc.name   SUB_AI_NNR_Reliability_North_Stress_0200
 * @tc.number SUB_AI_NNR_Reliability_North_Stress_0200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   RELIABILITY
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 * 
 * 测试说明：创建模型和编译后，循环创建执行器并执行，验证执行器稳定性
 */
static int SUB_AI_NNR_Reliability_North_Stress_0200()
{
    OH_LOG_INFO(LOG_APP, "[Test] ========== SUB_AI_NNR_Reliability_North_Stress_0200 START ==========");
    OH_LOG_INFO(LOG_APP, "[Test] Executor stress test: Running %{public}d iterations", STRESS_COUNT);
    
    OHNNCompileParam compileParam;
    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    
    OH_NNModel *model1 = OH_NNModel_Construct();
    if (model1 == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[Test] FAILED: OH_NNModel_Construct returned nullptr");
        return -1;
    }
    
    int ret = BuildSingleOpGraph(model1, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[Test] FAILED: BuildSingleOpGraph failed, ret=%{public}d", ret);
        OH_NNModel_Destroy(&model1);
        return -1;
    }

    OH_NNCompilation *compilation1 = OH_NNCompilation_Construct(model1);
    if (compilation1 == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[Test] FAILED: OH_NNCompilation_Construct returned nullptr");
        OH_NNModel_Destroy(&model1);
        return -1;
    }
    
    ret = CompileGraphMock(compilation1, compileParam);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[Test] FAILED: CompileGraphMock failed, ret=%{public}d", ret);
        Free(model1, compilation1);
        return -1;
    }

    for (int i = 0; i < STRESS_COUNT; i++) {
        OH_NNExecutor *executor1 = OH_NNExecutor_Construct(compilation1);
        if (executor1 == nullptr) {
            OH_LOG_ERROR(LOG_APP, "[Test] FAILED at iteration %{public}d: OH_NNExecutor_Construct returned nullptr", i);
            Free(model1, compilation1);
            return -1;
        }
        
        ret = ExecuteGraphMock(executor1, graphArgs, nullptr);
        if (ret != OH_NN_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "[Test] FAILED at iteration %{public}d: ExecuteGraphMock failed, ret=%{public}d", i, ret);
            OH_NNExecutor_Destroy(&executor1);
            Free(model1, compilation1);
            return -1;
        }
        
        OH_NNExecutor_Destroy(&executor1);
        if (executor1 != nullptr) {
            OH_LOG_ERROR(LOG_APP, "[Test] FAILED at iteration %{public}d: executor1 should be nullptr after destroy", i);
            Free(model1, compilation1);
            return -1;
        }
        
        if (i % PRINT_FREQ == 0) {
            OH_LOG_INFO(LOG_APP, "[Test] SUB_AI_NNR_Reliability_North_Stress_0200 progress: %{public}d/%{public}d", i, STRESS_COUNT);
        }
    }
    
    Free(model1, compilation1);
    
    OH_LOG_INFO(LOG_APP, "[Test] ========== SUB_AI_NNR_Reliability_North_Stress_0200 PASSED ==========");
    OH_LOG_INFO(LOG_APP, "[Test] All %{public}d iterations completed successfully", STRESS_COUNT);
    return 0;
}
