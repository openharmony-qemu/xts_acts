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

#include "include/QosCapiTest.h"
#include <cerrno>
#include <hilog/log.h>
#include <qos/qos.h>
#include <thread>
#include <unistd.h>
#include "include/OhosCommonTest.h"

#define OH_NN_SUCCESS 0
#define LOG_DOMAIN 0xD003900
#define LOG_TAG "QosCapiTest"
#define INVALID_QOS_VALUE 6
#define QOS_LEVEL_TEST 1024

namespace Acts {
namespace QosManager {

/**
 * Helper function: Test a single QoS level
 * @param level: QoS level to test
 * @param levelName: Name of the level for logging
 * @param prefix: Log prefix for distinguishing test context
 * @return 0 on success, -1 on failure
 */
static int TestSingleQoSLevel(QoS_Level level, const char* levelName, const char* prefix)
{
    int ret = OH_QoS_SetThreadQoS(level);
    if (ret != 0) {
        OH_LOG_Print(LOG_APP,
                     LOG_ERROR,
                     LOG_DOMAIN,
                     LOG_TAG,
                     "%{public}sSetThreadQoS(%{public}s) failed, ret=%{public}d",
                     prefix,
                     levelName,
                     ret);
        return -1;
    }
    return 0;
}

/**
 * Helper function: Test all valid QoS levels
 * @param prefix: Log prefix for distinguishing test context (e.g., "Worker: ")
 * @return 0 on success, -1 on failure
 */
static int TestAllValidQoSLevels(const char* prefix)
{
    if (TestSingleQoSLevel(QoS_Level::QOS_BACKGROUND, "QOS_BACKGROUND", prefix) != 0) {
        return -1;
    }
    if (TestSingleQoSLevel(QoS_Level::QOS_UTILITY, "QOS_UTILITY", prefix) != 0) {
        return -1;
    }
    if (TestSingleQoSLevel(QoS_Level::QOS_DEFAULT, "QOS_DEFAULT", prefix) != 0) {
        return -1;
    }
    if (TestSingleQoSLevel(QoS_Level::QOS_USER_INITIATED, "QOS_USER_INITIATED", prefix) != 0) {
        return -1;
    }
    if (TestSingleQoSLevel(QoS_Level::QOS_DEADLINE_REQUEST, "QOS_DEADLINE_REQUEST", prefix) != 0) {
        return -1;
    }
    if (TestSingleQoSLevel(QoS_Level::QOS_USER_INTERACTIVE, "QOS_USER_INTERACTIVE", prefix) != 0) {
        return -1;
    }
    return 0;
}

/**
 * Helper function: Test all invalid QoS levels
 * @param prefix: Log prefix for distinguishing test context (e.g., "Worker: ")
 * @return 0 on success, -1 on failure
 */
static int TestInvalidQoSLevels(const char* prefix)
{
    int ret = OH_QoS_SetThreadQoS(QoS_Level(-1));
    if (ret != -1) {
        OH_LOG_Print(LOG_APP,
                     LOG_ERROR,
                     LOG_DOMAIN,
                     LOG_TAG,
                     "%{public}sSetThreadQoS(-1) expected -1, got %{public}d",
                     prefix,
                     ret);
        return -1;
    }

    ret = OH_QoS_SetThreadQoS(QoS_Level(INVALID_QOS_VALUE));
    if (ret != -1) {
        OH_LOG_Print(LOG_APP,
                     LOG_ERROR,
                     LOG_DOMAIN,
                     LOG_TAG,
                     "%{public}sSetThreadQoS(%{public}d) expected -1, got %{public}d",
                     prefix,
                     INVALID_QOS_VALUE,
                     ret);
        return -1;
    }

    ret = OH_QoS_SetThreadQoS(QoS_Level(QOS_LEVEL_TEST));
    if (ret != -1) {
        OH_LOG_Print(LOG_APP,
                     LOG_ERROR,
                     LOG_DOMAIN,
                     LOG_TAG,
                     "%{public}sSetThreadQoS(%{public}d) expected -1, got %{public}d",
                     prefix,
                     QOS_LEVEL_TEST,
                     ret);
        return -1;
    }
    return 0;
}

/**
 * Helper function: Run full QoS test in worker thread
 * @return 0 on success, -1 on failure
 */
static int RunQoSFullTestInWorkerThread()
{
    bool testPassed = true;
    std::thread fullTest([&testPassed]() {
        if (TestAllValidQoSLevels("Worker: ") != 0) {
            testPassed = false;
            return;
        }
        if (TestInvalidQoSLevels("Worker: ") != 0) {
            testPassed = false;
            return;
        }
    });
    fullTest.join();
    if (testPassed) {
        return OH_NN_SUCCESS;
    } else {
        return -1;
    }
}

/**
 * Helper function: Run full QoS test in main thread
 * @return 0 on success, -1 on failure
 */
static int RunQoSFullTestInMainThread()
{
    if (TestAllValidQoSLevels("") != 0) {
        return -1;
    }
    if (TestInvalidQoSLevels("") != 0) {
        return -1;
    }
    return OH_NN_SUCCESS;
}

/**
 * Helper function: Test QoS capability and run test in appropriate thread
 * @param testName: Name of the test for logging
 * @param workerTestFunc: Function to run if worker thread supports QoS
 * @param mainTestFunc: Function to run if only main thread supports QoS
 * @return 0 on success, -1 on failure
 */
static int RunQoSTestWithThreadStrategy(const char* testName, int (*workerTestFunc)(), int (*mainTestFunc)())
{
    int mainThreadResult = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
    std::mutex mtx;
    std::condition_variable cv;
    int workerThreadResult = -999;
    bool workerDone = false;
    std::thread worker([&mtx, &workerThreadResult, &workerDone, &cv]() {
        int ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
        std::lock_guard<std::mutex> lock(mtx);
        workerThreadResult = ret;
        workerDone = true;
        cv.notify_one();
    });
    {
        std::unique_lock<std::mutex> lock(mtx);
        cv.wait(lock, [&] { return workerDone; });
    }
    worker.join();
    if (workerThreadResult == 0) {
        return workerTestFunc();
    } else if (mainThreadResult == 0) {
        return mainTestFunc();
    } else {
        return OH_NN_SUCCESS;
    }
}

/**
 * @tc.name   SetThreadQoSNdkTest
 * @tc.number SetThreadQoSNdkTest
 * @tc.desc   Verify the Set QoSLevel function.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int SetThreadQoSNdkTest()
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "SetThreadQoSNdkTest start");
    int ret =
        RunQoSTestWithThreadStrategy("SetThreadQoSNdkTest", RunQoSFullTestInWorkerThread, RunQoSFullTestInMainThread);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "SetThreadQoSNdkTest end, ret=%{public}d", ret);
    return ret;
}

/**
 * Helper function: Test single QoS level with reset operation
 * @param level: QoS level to test
 * @param levelName: Name of the QoS level for logging
 * @param prefix: Log prefix for distinguishing test context (e.g., "Worker: ")
 * @return 0 on success, -1 on failure
 */
static int TestSingleQoSLevelWithReset(QoS_Level level, const char* levelName, const char* prefix)
{
    int ret = OH_QoS_SetThreadQoS(level);
    if (ret != 0) {
        OH_LOG_Print(LOG_APP,
                     LOG_ERROR,
                     LOG_DOMAIN,
                     LOG_TAG,
                     "%{public}sSetThreadQoS(%{public}s) failed, ret=%{public}d",
                     prefix,
                     levelName,
                     ret);
        return -1;
    }
    ret = OH_QoS_ResetThreadQoS();
    if (ret != 0) {
        OH_LOG_Print(LOG_APP,
                     LOG_ERROR,
                     LOG_DOMAIN,
                     LOG_TAG,
                     "%{public}sResetThreadQoS after %{public}s failed, ret=%{public}d",
                     prefix,
                     levelName,
                     ret);
        return -1;
    }
    return 0;
}

/**
 * Helper function: Test all QoS levels with reset operation
 * @param prefix: Log prefix for distinguishing test context (e.g., "Worker: ")
 * @return 0 on success, -1 on failure
 */
static int TestAllQoSLevelsWithReset(const char* prefix)
{
    if (TestSingleQoSLevelWithReset(QoS_Level::QOS_BACKGROUND, "QOS_BACKGROUND", prefix) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithReset(QoS_Level::QOS_UTILITY, "QOS_UTILITY", prefix) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithReset(QoS_Level::QOS_DEFAULT, "QOS_DEFAULT", prefix) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithReset(QoS_Level::QOS_USER_INITIATED, "QOS_USER_INITIATED", prefix) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithReset(QoS_Level::QOS_DEADLINE_REQUEST, "QOS_DEADLINE_REQUEST", prefix) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithReset(QoS_Level::QOS_USER_INTERACTIVE, "QOS_USER_INTERACTIVE", prefix) != 0) {
        return -1;
    }
    return 0;
}

/**
 * Helper function: Run full QoS reset test in worker thread
 * @return 0 on success, -1 on failure
 */
static int RunResetQoSFullTestInWorkerThread()
{
    bool testPassed = true;
    std::thread fullTest([&testPassed]() {
        if (TestAllQoSLevelsWithReset("Worker: ") != 0) {
            testPassed = false;
            return;
        }
    });
    fullTest.join();
    if (testPassed) {
        return OH_NN_SUCCESS;
    } else {
        return -1;
    }
}

/**
 * Helper function: Run full QoS reset test in main thread
 * @return 0 on success, -1 on failure
 */
static int RunResetQoSFullTestInMainThread()
{
    if (TestAllQoSLevelsWithReset("") != 0) {
        return -1;
    }
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   ResetThreadQoSNdkTest
 * @tc.number ResetThreadQoSNdkTest
 * @tc.desc   Verify the Reset QoSLevel function.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int ResetThreadQoSNdkTest()
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "ResetThreadQoSNdkTest start");
    int ret = RunQoSTestWithThreadStrategy(
        "ResetThreadQoSNdkTest", RunResetQoSFullTestInWorkerThread, RunResetQoSFullTestInMainThread);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "ResetThreadQoSNdkTest end, ret=%{public}d", ret);
    return ret;
}

/**
 * Helper function: Test single QoS level with get operation
 * @param level: QoS level to test
 * @param levelName: Name of the QoS level for logging
 * @param prefix: Log prefix for distinguishing test context (e.g., "Worker: ")
 * @return 0 on success, -1 on failure
 */
static int TestSingleQoSLevelWithGet(QoS_Level level, const char* levelName, const char* prefix)
{
    int ret = OH_QoS_SetThreadQoS(level);
    if (ret != 0) {
        OH_LOG_Print(LOG_APP,
                     LOG_ERROR,
                     LOG_DOMAIN,
                     LOG_TAG,
                     "%{public}sSetThreadQoS(%{public}s) failed, ret=%{public}d",
                     prefix,
                     levelName,
                     ret);
        return -1;
    }
    QoS_Level getLevel_;
    ret = OH_QoS_GetThreadQoS(&getLevel_);
    if (ret != 0) {
        OH_LOG_Print(LOG_APP,
                     LOG_ERROR,
                     LOG_DOMAIN,
                     LOG_TAG,
                     "%{public}sGetThreadQoS after SetThreadQoS(%{public}s) failed, ret=%{public}d",
                     prefix,
                     levelName,
                     ret);
        return -1;
    }
    if (getLevel_ != level) {
        OH_LOG_Print(LOG_APP,
                     LOG_ERROR,
                     LOG_DOMAIN,
                     LOG_TAG,
                     "%{public}sGetThreadQoS level mismatch for %{public}s: expected %{public}d, got %{public}d",
                     prefix,
                     levelName,
                     static_cast<int>(level),
                     static_cast<int>(getLevel_));
        return -1;
    }
    return 0;
}

/**
 * Helper function: Test Get QoS with nullptr and after reset
 * @param prefix: Log prefix for distinguishing test context (e.g., "Worker: ")
 * @return 0 on success, -1 on failure
 */
static int TestGetQoSWithNullAndReset(const char* prefix)
{
    int ret = OH_QoS_GetThreadQoS(nullptr);
    if (ret != -1) {
        OH_LOG_Print(LOG_APP,
                     LOG_ERROR,
                     LOG_DOMAIN,
                     LOG_TAG,
                     "%{public}sGetThreadQoS(nullptr) expected -1, got %{public}d",
                     prefix,
                     ret);
        return -1;
    }

    // Set a QoS level before resetting to avoid EINVAL error
    ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
    if (ret != 0) {
        OH_LOG_Print(LOG_APP,
                     LOG_ERROR,
                     LOG_DOMAIN,
                     LOG_TAG,
                     "%{public}sSetThreadQoS(QOS_BACKGROUND) before reset failed, ret=%{public}d",
                     prefix,
                     ret);
        return -1;
    }

    ret = OH_QoS_ResetThreadQoS();
    if (ret != 0) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "%{public}sResetThreadQoS failed, ret=%{public}d", prefix, ret);
        return -1;
    }
    QoS_Level level;
    ret = OH_QoS_GetThreadQoS(&level);
    if (ret != -1) {
        OH_LOG_Print(LOG_APP,
                     LOG_ERROR,
                     LOG_DOMAIN,
                     LOG_TAG,
                     "%{public}sGetThreadQoS after reset expected -1, got %{public}d",
                     prefix,
                     ret);
        return -1;
    }
    return 0;
}

/**
 * Helper function: Test all QoS levels with get operation
 * @param prefix: Log prefix for distinguishing test context (e.g., "Worker: ")
 * @return 0 on success, -1 on failure
 */
static int TestAllQoSLevelsWithGet(const char* prefix)
{
    if (TestGetQoSWithNullAndReset(prefix) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithGet(QoS_Level::QOS_BACKGROUND, "QOS_BACKGROUND", prefix) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithGet(QoS_Level::QOS_UTILITY, "QOS_UTILITY", prefix) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithGet(QoS_Level::QOS_DEFAULT, "QOS_DEFAULT", prefix) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithGet(QoS_Level::QOS_USER_INITIATED, "QOS_USER_INITIATED", prefix) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithGet(QoS_Level::QOS_DEADLINE_REQUEST, "QOS_DEADLINE_REQUEST", prefix) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithGet(QoS_Level::QOS_USER_INTERACTIVE, "QOS_USER_INTERACTIVE", prefix) != 0) {
        return -1;
    }
    return 0;
}

/**
 * Helper function: Run full QoS get test in worker thread
 * @return 0 on success, -1 on failure
 */
static int RunGetQoSFullTestInWorkerThread()
{
    bool testPassed = true;
    std::thread fullTest([&testPassed]() {
        if (TestAllQoSLevelsWithGet("Worker: ") != 0) {
            testPassed = false;
            return;
        }
    });
    fullTest.join();
    if (testPassed) {
        return OH_NN_SUCCESS;
    } else {
        return -1;
    }
}

/**
 * Helper function: Run full QoS get test in main thread
 * @return 0 on success, -1 on failure
 */
static int RunGetQoSFullTestInMainThread()
{
    if (TestAllQoSLevelsWithGet("") != 0) {
        return -1;
    }
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   GetThreadQoSNdkTest
 * @tc.number GetThreadQoSNdkTest
 * @tc.desc   Verify the Get QoSLevel function.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int GetThreadQoSNdkTest()
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "GetThreadQoSNdkTest start");
    int ret = RunQoSTestWithThreadStrategy(
        "GetThreadQoSNdkTest", RunGetQoSFullTestInWorkerThread, RunGetQoSFullTestInMainThread);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "GetThreadQoSNdkTest end, ret=%{public}d", ret);
    return ret;
}

/**
 * Helper function: Run double QoS operations test
 * @return 0 on success, -1 on failure
 */
static int RunDoubleGetQoSTest()
{
    QoS_Level level;
    int ret = OH_QoS_GetThreadQoS(&level);
    if (ret != 0) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "DoubleOps: 1st GetThreadQoS failed, ret=%{public}d", ret);
        return -1;
    }
    if (level != QoS_Level::QOS_BACKGROUND) {
        OH_LOG_Print(LOG_APP,
                     LOG_ERROR,
                     LOG_DOMAIN,
                     LOG_TAG,
                     "DoubleOps: 1st GetThreadQoS level mismatch, expected QOS_BACKGROUND(%{public}d), got %{public}d",
                     static_cast<int>(QoS_Level::QOS_BACKGROUND),
                     static_cast<int>(level));
        return -1;
    }
    ret = OH_QoS_GetThreadQoS(&level);
    if (ret != 0) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "DoubleOps: 2nd GetThreadQoS failed, ret=%{public}d", ret);
        return -1;
    }
    if (level != QoS_Level::QOS_BACKGROUND) {
        OH_LOG_Print(LOG_APP,
                     LOG_ERROR,
                     LOG_DOMAIN,
                     LOG_TAG,
                     "DoubleOps: 2nd GetThreadQoS level mismatch, expected QOS_BACKGROUND(%{public}d), got %{public}d",
                     static_cast<int>(QoS_Level::QOS_BACKGROUND),
                     static_cast<int>(level));
        return -1;
    }
    return 0;
}

static int RunDoubleQoSOperationsTest()
{
    int ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
    if (ret != 0) {
        OH_LOG_Print(LOG_APP,
                     LOG_ERROR,
                     LOG_DOMAIN,
                     LOG_TAG,
                     "DoubleOps: 1st SetThreadQoS(QOS_BACKGROUND) failed, ret=%{public}d",
                     ret);
        return -1;
    }
    ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
    if (ret != 0) {
        OH_LOG_Print(LOG_APP,
                     LOG_ERROR,
                     LOG_DOMAIN,
                     LOG_TAG,
                     "DoubleOps: 2nd SetThreadQoS(QOS_BACKGROUND) failed, ret=%{public}d",
                     ret);
        return -1;
    }

    if (RunDoubleGetQoSTest() != 0) {
        return -1;
    }

    ret = OH_QoS_ResetThreadQoS();
    if (ret != 0) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "DoubleOps: 1st ResetThreadQoS failed, ret=%{public}d", ret);
        return -1;
    }
    ret = OH_QoS_ResetThreadQoS();
    if (ret != -1) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "DoubleOps: 2nd ResetThreadQoS expected -1, got %{public}d", ret);
        return -1;
    }

    return 0;
}

/**
 * Helper function: Run double test in worker thread
 * @return 0 on success, -1 on failure
 */
static int RunDoubleTestInWorkerThread()
{
    bool testPassed = true;
    std::thread fullTest([&testPassed]() {
        if (RunDoubleQoSOperationsTest() != 0) {
            testPassed = false;
        }
    });
    fullTest.join();
    return testPassed ? OH_NN_SUCCESS : -1;
}

/**
 * Helper function: Run double test in main thread
 * @return 0 on success, -1 on failure
 */
static int RunDoubleTestInMainThread()
{
    if (RunDoubleQoSOperationsTest() != 0) {
        return -1;
    }
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   ThreadQoSNdkTest
 * @tc.number ThreadQoSNdkTest
 * @tc.desc   Double Test ThreadQoSNDKTest function.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int ThreadQoSNdkTest()
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "ThreadQoSNdkTest start");
    int mainThreadResult = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
    std::mutex mtx;
    std::condition_variable cv;
    int workerThreadResult = -999;
    bool workerDone = false;
    std::thread worker([&mtx, &workerThreadResult, &workerDone, &cv]() {
        int ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
        std::lock_guard<std::mutex> lock(mtx);
        workerThreadResult = ret;
        workerDone = true;
        cv.notify_one();
    });

    {
        std::unique_lock<std::mutex> lock(mtx);
        cv.wait(lock, [&] { return workerDone; });
    }
    worker.join();

    int ret;
    if (workerThreadResult == 0) {
        ret = RunDoubleTestInWorkerThread();
    } else if (mainThreadResult == 0) {
        ret = RunDoubleTestInMainThread();
    } else {
        ret = OH_NN_SUCCESS;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "ThreadQoSNdkTest end, ret=%{public}d", ret);
    return ret;
}

static void MockCallback(void* context, const char* response)
{
    // Mock callback for Gewu tests
}

static int GewuSubmitRequestInvalidSessionTest(OH_QoS_GewuOnResponse cb, void* fakeContext)
{
    OH_QoS_GewuCreateSessionResult sessionResult = OH_QoS_GewuCreateSession("");
    OH_QoS_GewuSubmitRequestResult requestResult2 =
        OH_QoS_GewuSubmitRequest(sessionResult.session, "", cb, fakeContext);
    if (requestResult2.error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOENT) {
        OH_LOG_Print(LOG_APP,
                     LOG_ERROR,
                     LOG_DOMAIN,
                     LOG_TAG,
                     "GewuSubmitRequestTest: invalid session submit expected NOENT, got error=%{public}d",
                     static_cast<int>(requestResult2.error));
        return -1;
    }
    OH_QoS_GewuSubmitRequestResult requestResult3 = OH_QoS_GewuSubmitRequest(0, nullptr, cb, fakeContext);
    if (requestResult3.error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_FAULT) {
        OH_LOG_Print(LOG_APP,
                     LOG_ERROR,
                     LOG_DOMAIN,
                     LOG_TAG,
                     "GewuSubmitRequestTest: (0,nullptr) submit expected FAULT, got error=%{public}d",
                     static_cast<int>(requestResult3.error));
        return -1;
    }
    if (requestResult3.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOMEM) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, "GewuSubmitRequestTest: (0,nullptr) submit must not return NOMEM");
        return -1;
    }
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   GewuCreateSessionTest
 * @tc.number SUB_RESOURCESCHEDULE_QOS_0100
 * @tc.desc   Verify the GewuCreateSession function
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int GewuCreateSessionTest()
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "GewuCreateSessionTest start");
    OH_QoS_GewuCreateSessionResult sessionResult = OH_QoS_GewuCreateSession("");
    if (sessionResult.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOSYS) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "GewuCreateSessionTest: NOSYS, skip");
        return OH_NN_SUCCESS;
    }
    if (sessionResult.error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_INVAL) {
        OH_LOG_Print(LOG_APP,
                     LOG_ERROR,
                     LOG_DOMAIN,
                     LOG_TAG,
                     "GewuCreateSessionTest: expected INVAL, got error=%{public}d",
                     static_cast<int>(sessionResult.error));
        return -1;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "GewuCreateSessionTest end: PASS");
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   GewuSubmitRequestTest
 * @tc.number SUB_RESOURCESCHEDULE_QOS_0200
 * @tc.desc   Verify the GewuSubmitRequest function
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int GewuSubmitRequestTest()
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "GewuSubmitRequestTest start");
    std::string modelPath = std::string(ActsMindSporeConstants::FILES_DIR) + "Qwen2.5-0.5B-CPU-Q4";
    std::string attributesStr = "{\"model\":\"" + modelPath + "\"}";
    const char* attributes = attributesStr.c_str();
    const char* request =
        "{\"type\":\"ChatComplete\",\"messages\":[{\"role\":\"developer\",\"content\":\"Your are a helpful "
        "assistant.\"},{\"role\":\"user\",\"content\":\"hi\"}],\"stream\":true}";
    void* fakeContext = reinterpret_cast<void*>(0x1234);
    OH_QoS_GewuOnResponse cb = MockCallback;
    OH_LOG_Print(LOG_APP,
                 LOG_INFO,
                 LOG_DOMAIN,
                 LOG_TAG,
                 "GewuSubmitRequestTest: creating session with model=%{public}s",
                 modelPath.c_str());
    OH_QoS_GewuCreateSessionResult sessionResult = OH_QoS_GewuCreateSession(attributes);
    if (sessionResult.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOSYS) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "GewuSubmitRequestTest: NOSYS, skip");
        return OH_NN_SUCCESS;
    }

    if (sessionResult.error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK) {
        OH_LOG_Print(LOG_APP,
                     LOG_ERROR,
                     LOG_DOMAIN,
                     LOG_TAG,
                     "GewuSubmitRequestTest: CreateSession expected OK, got error=%{public}d",
                     static_cast<int>(sessionResult.error));
        return -1;
    }
    OH_QoS_GewuSubmitRequestResult requestResult =
        OH_QoS_GewuSubmitRequest(sessionResult.session, request, cb, fakeContext);
    if (requestResult.error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK) {
        OH_LOG_Print(LOG_APP,
                     LOG_ERROR,
                     LOG_DOMAIN,
                     LOG_TAG,
                     "GewuSubmitRequestTest: 1st SubmitRequest expected OK, got error=%{public}d",
                     static_cast<int>(requestResult.error));
        return -1;
    }
    OH_QoS_GewuErrorCode error = OH_QoS_GewuDestroySession(sessionResult.session);
    if (error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK) {
        OH_LOG_Print(LOG_APP,
                     LOG_ERROR,
                     LOG_DOMAIN,
                     LOG_TAG,
                     "GewuSubmitRequestTest: DestroySession expected OK, got error=%{public}d",
                     static_cast<int>(error));
        return -1;
    }
    if (GewuSubmitRequestInvalidSessionTest(cb, fakeContext) != OH_NN_SUCCESS) {
        return -1;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "GewuSubmitRequestTest end: PASS");
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   GewuAbortRequestTest
 * @tc.number SUB_RESOURCESCHEDULE_QOS_0300
 * @tc.desc   Verify the GewuAbortRequest function
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int GewuAbortRequestTest()
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "GewuAbortRequestTest start");
    OH_QoS_GewuCreateSessionResult sessionResult = OH_QoS_GewuCreateSession("");
    if (sessionResult.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOSYS) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "GewuAbortRequestTest: NOSYS, skip");
        return OH_NN_SUCCESS;
    }
    OH_LOG_Print(LOG_APP,
                 LOG_INFO,
                 LOG_DOMAIN,
                 LOG_TAG,
                 "GewuAbortRequestTest: CreateSession(\"\") error=%{public}d, calling AbortRequest",
                 static_cast<int>(sessionResult.error));
    OH_QoS_GewuErrorCode error = OH_QoS_GewuAbortRequest(sessionResult.session, 0);
    if (error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOENT) {
        OH_LOG_Print(LOG_APP,
                     LOG_ERROR,
                     LOG_DOMAIN,
                     LOG_TAG,
                     "GewuAbortRequestTest: AbortRequest expected NOENT, got error=%{public}d",
                     static_cast<int>(error));
        return -1;
    }
    if (error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK) {
        OH_LOG_Print(LOG_APP,
                     LOG_ERROR,
                     LOG_DOMAIN,
                     LOG_TAG,
                     "GewuAbortRequestTest: AbortRequest must not return OK for invalid session");
        return -1;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "GewuAbortRequestTest end: PASS");
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   GewuDestroySessionTest
 * @tc.number SUB_RESOURCESCHEDULE_QOS_0400
 * @tc.desc   Verify the GewuDestroySession function
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int GewuDestroySessionTest()
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "GewuDestroySessionTest start");
    OH_QoS_GewuCreateSessionResult sessionResult = OH_QoS_GewuCreateSession("");
    if (sessionResult.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOSYS) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "GewuDestroySessionTest: NOSYS, skip");
        return OH_NN_SUCCESS;
    }
    OH_LOG_Print(LOG_APP,
                 LOG_INFO,
                 LOG_DOMAIN,
                 LOG_TAG,
                 "GewuDestroySessionTest: CreateSession(\"\") error=%{public}d, calling DestroySession",
                 static_cast<int>(sessionResult.error));
    OH_QoS_GewuErrorCode error = OH_QoS_GewuDestroySession(sessionResult.session);
    if (error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOENT) {
        OH_LOG_Print(LOG_APP,
                     LOG_ERROR,
                     LOG_DOMAIN,
                     LOG_TAG,
                     "GewuDestroySessionTest: DestroySession expected NOENT, got error=%{public}d",
                     static_cast<int>(error));
        return -1;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "GewuDestroySessionTest end: PASS");
    return OH_NN_SUCCESS;
}

/*
 * @tc.number:SUB_RESOURCESCHEDULE_QOS_0500
 * @tc.name: GewuErrorCodeTest
 * @tc.desc: Verify the Gewu error code
 * @tc.size: MediumTest
 * @tc.type: Function
 * @tc.level: Level 1
 */
int GewuErrorCodeTest()
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "GewuErrorCodeTest start");
    OH_QoS_GewuCreateSessionResult sessionResult = OH_QoS_GewuCreateSession("");
    OH_LOG_Print(LOG_APP,
                 LOG_INFO,
                 LOG_DOMAIN,
                 LOG_TAG,
                 "GewuErrorCodeTest: CreateSession(\"\") error=%{public}d",
                 static_cast<int>(sessionResult.error));
    if (sessionResult.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOSYS) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "GewuErrorCodeTest: NOSYS, skip");
        return OH_NN_SUCCESS;
    }
    if (sessionResult.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOPERM) {
        OH_LOG_Print(LOG_APP,
                     LOG_ERROR,
                     LOG_DOMAIN,
                     LOG_TAG,
                     "GewuErrorCodeTest: error must not be NOPERM(%{public}d)",
                     static_cast<int>(OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOPERM));
        return -1;
    }
    if (sessionResult.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOMEM) {
        OH_LOG_Print(LOG_APP,
                     LOG_ERROR,
                     LOG_DOMAIN,
                     LOG_TAG,
                     "GewuErrorCodeTest: error must not be NOMEM(%{public}d)",
                     static_cast<int>(OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOMEM));
        return -1;
    }
    if (sessionResult.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_EXIST) {
        OH_LOG_Print(LOG_APP,
                     LOG_ERROR,
                     LOG_DOMAIN,
                     LOG_TAG,
                     "GewuErrorCodeTest: error must not be EXIST(%{public}d)",
                     static_cast<int>(OH_QoS_GewuErrorCode::OH_QOS_GEWU_EXIST));
        return -1;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "GewuErrorCodeTest end: PASS");
    return OH_NN_SUCCESS;
}

} // namespace QosManager
} // namespace Acts
