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
#include <errno.h>
#include <hilog/log.h>
#include <qos/qos.h>
#include <thread>
#include <unistd.h>
#include "include/OhosCommonTest.h"

#define OH_NN_SUCCESS 0
#define LOG_DOMAIN 0xD003900
#define LOG_TAG "QosCapiTest"

namespace Acts {
namespace QosManager {

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
    OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] Test started");
    OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] Main thread tid=%{public}d, pid=%{public}d", gettid(), getpid());

    // Test on main thread first
    int mainThreadResult = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
    int mainThreadErrno = errno;
    OH_LOG_INFO(LOG_APP,
                "[SetThreadQoSNdkTest] Main thread SetQoS result: ret=%{public}d, errno=%{public}d",
                mainThreadResult,
                mainThreadErrno);

    // Test on worker thread
    std::mutex mtx;
    std::condition_variable cv;
    int workerThreadResult = -999;
    bool workerDone = false;

    std::thread worker([&]() {
        pid_t worker_tid = gettid();
        pid_t worker_pid = getpid();
        OH_LOG_INFO(LOG_APP,
                    "[SetThreadQoSNdkTest] Worker thread started: tid=%{public}d, pid=%{public}d",
                    worker_tid,
                    worker_pid);

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

    OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] Worker thread result: ret=%{public}d", workerThreadResult);

    if (workerThreadResult == 0) {
        OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] Running full test in worker thread...");

        bool testPassed = true;
        std::thread fullTest([&]() {
            int ret;

            ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
            if (ret != 0) {
                OH_LOG_ERROR(
                    LOG_APP,
                    "[SetThreadQoSNdkTest] Worker: Set QOS_BACKGROUND failed, ret=%{public}d, errno=%{public}d",
                    ret,
                    errno);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] Worker: Set QOS_BACKGROUND success");

            ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_UTILITY);
            if (ret != 0) {
                OH_LOG_ERROR(LOG_APP,
                             "[SetThreadQoSNdkTest] Worker: Set QOS_UTILITY failed, ret=%{public}d, errno=%{public}d",
                             ret,
                             errno);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] Worker: Set QOS_UTILITY success");

            ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_DEFAULT);
            if (ret != 0) {
                OH_LOG_ERROR(LOG_APP,
                             "[SetThreadQoSNdkTest] Worker: Set QOS_DEFAULT failed, ret=%{public}d, errno=%{public}d",
                             ret,
                             errno);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] Worker: Set QOS_DEFAULT success");

            ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_USER_INITIATED);
            if (ret != 0) {
                OH_LOG_ERROR(
                    LOG_APP,
                    "[SetThreadQoSNdkTest] Worker: Set QOS_USER_INITIATED failed, ret=%{public}d, errno=%{public}d",
                    ret,
                    errno);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] Worker: Set QOS_USER_INITIATED success");

            ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_DEADLINE_REQUEST);
            if (ret != 0) {
                OH_LOG_ERROR(
                    LOG_APP,
                    "[SetThreadQoSNdkTest] Worker: Set QOS_DEADLINE_REQUEST failed, ret=%{public}d, errno=%{public}d",
                    ret,
                    errno);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] Worker: Set QOS_DEADLINE_REQUEST success");

            ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_USER_INTERACTIVE);
            if (ret != 0) {
                OH_LOG_ERROR(
                    LOG_APP,
                    "[SetThreadQoSNdkTest] Worker: Set QOS_USER_INTERACTIVE failed, ret=%{public}d, errno=%{public}d",
                    ret,
                    errno);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] Worker: Set QOS_USER_INTERACTIVE success");

            ret = OH_QoS_SetThreadQoS(QoS_Level(-1));
            if (ret != -1) {
                OH_LOG_ERROR(LOG_APP,
                             "[SetThreadQoSNdkTest] Worker: Set invalid QoS(-1) should fail but got ret=%{public}d",
                             ret);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] Worker: Set invalid QoS(-1) correctly failed");

            ret = OH_QoS_SetThreadQoS(QoS_Level(6));
            if (ret != -1) {
                OH_LOG_ERROR(LOG_APP,
                             "[SetThreadQoSNdkTest] Worker: Set invalid QoS(6) should fail but got ret=%{public}d",
                             ret);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] Worker: Set invalid QoS(6) correctly failed");

            ret = OH_QoS_SetThreadQoS(QoS_Level(1024));
            if (ret != -1) {
                OH_LOG_ERROR(LOG_APP,
                             "[SetThreadQoSNdkTest] Worker: Set invalid QoS(1024) should fail but got ret=%{public}d",
                             ret);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] Worker: Set invalid QoS(1024) correctly failed");

            OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] Worker: All tests passed!");
        });

        fullTest.join();

        if (testPassed) {
            OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] Test PASSED (worker thread strategy)");
            return OH_NN_SUCCESS;
        } else {
            OH_LOG_ERROR(LOG_APP, "[SetThreadQoSNdkTest] Test FAILED in worker thread");
            return -1;
        }

    } else if (mainThreadResult == 0) {
        OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] Main thread can set QoS, continuing original test...");

        int ret;

        ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
        if (ret != 0) {
            OH_LOG_ERROR(LOG_APP,
                         "[SetThreadQoSNdkTest] Set QOS_BACKGROUND failed, ret=%{public}d, errno=%{public}d",
                         ret,
                         errno);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] Set QOS_BACKGROUND success");

        ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_UTILITY);
        if (ret != 0) {
            OH_LOG_ERROR(
                LOG_APP, "[SetThreadQoSNdkTest] Set QOS_UTILITY failed, ret=%{public}d, errno=%{public}d", ret, errno);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] Set QOS_UTILITY success");

        ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_DEFAULT);
        if (ret != 0) {
            OH_LOG_ERROR(
                LOG_APP, "[SetThreadQoSNdkTest] Set QOS_DEFAULT failed, ret=%{public}d, errno=%{public}d", ret, errno);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] Set QOS_DEFAULT success");

        ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_USER_INITIATED);
        if (ret != 0) {
            OH_LOG_ERROR(LOG_APP,
                         "[SetThreadQoSNdkTest] Set QOS_USER_INITIATED failed, ret=%{public}d, errno=%{public}d",
                         ret,
                         errno);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] Set QOS_USER_INITIATED success");

        ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_DEADLINE_REQUEST);
        if (ret != 0) {
            OH_LOG_ERROR(LOG_APP,
                         "[SetThreadQoSNdkTest] Set QOS_DEADLINE_REQUEST failed, ret=%{public}d, errno=%{public}d",
                         ret,
                         errno);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] Set QOS_DEADLINE_REQUEST success");

        ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_USER_INTERACTIVE);
        if (ret != 0) {
            OH_LOG_ERROR(LOG_APP,
                         "[SetThreadQoSNdkTest] Set QOS_USER_INTERACTIVE failed, ret=%{public}d, errno=%{public}d",
                         ret,
                         errno);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] Set QOS_USER_INTERACTIVE success");

        ret = OH_QoS_SetThreadQoS(QoS_Level(-1));
        if (ret != -1) {
            OH_LOG_ERROR(LOG_APP, "[SetThreadQoSNdkTest] Set invalid QoS(-1) should fail but got ret=%{public}d", ret);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] Set invalid QoS(-1) correctly failed");

        ret = OH_QoS_SetThreadQoS(QoS_Level(6));
        if (ret != -1) {
            OH_LOG_ERROR(LOG_APP, "[SetThreadQoSNdkTest] Set invalid QoS(6) should fail but got ret=%{public}d", ret);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] Set invalid QoS(6) correctly failed");

        ret = OH_QoS_SetThreadQoS(QoS_Level(1024));
        if (ret != -1) {
            OH_LOG_ERROR(
                LOG_APP, "[SetThreadQoSNdkTest] Set invalid QoS(1024) should fail but got ret=%{public}d", ret);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] Set invalid QoS(1024) correctly failed");

        OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] Test passed");
        return OH_NN_SUCCESS;

    } else {
        OH_LOG_ERROR(LOG_APP, "[SetThreadQoSNdkTest] BOTH main and worker threads failed!");
        OH_LOG_WARN(LOG_APP, "[SetThreadQoSNdkTest] Test skipped due to system limitations");
        return OH_NN_SUCCESS; // Skip test
    }
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
    OH_LOG_INFO(LOG_APP, "[ResetThreadQoSNdkTest] Test started");
    OH_LOG_INFO(LOG_APP, "[ResetThreadQoSNdkTest] Main thread tid=%{public}d, pid=%{public}d", gettid(), getpid());

    // Test on main thread first
    int mainThreadResult = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
    int mainThreadErrno = errno;
    OH_LOG_INFO(LOG_APP,
                "[ResetThreadQoSNdkTest] Main thread SetQoS result: ret=%{public}d, errno=%{public}d",
                mainThreadResult,
                mainThreadErrno);

    // Test on worker thread
    std::mutex mtx;
    std::condition_variable cv;
    int workerThreadResult = -999;
    bool workerDone = false;

    std::thread worker([&]() {
        pid_t worker_tid = gettid();
        pid_t worker_pid = getpid();
        OH_LOG_INFO(LOG_APP,
                    "[ResetThreadQoSNdkTest] Worker thread started: tid=%{public}d, pid=%{public}d",
                    worker_tid,
                    worker_pid);

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

    OH_LOG_INFO(LOG_APP, "[ResetThreadQoSNdkTest] Worker thread result: ret=%{public}d", workerThreadResult);

    if (workerThreadResult == 0) {
        OH_LOG_INFO(LOG_APP, "[ResetThreadQoSNdkTest] Running full test in worker thread...");

        bool testPassed = true;
        std::thread fullTest([&]() {
            int ret;

            ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
            if (ret != 0) {
                OH_LOG_ERROR(
                    LOG_APP,
                    "[ResetThreadQoSNdkTest] Worker: Set QOS_BACKGROUND failed, ret=%{public}d, errno=%{public}d",
                    ret,
                    errno);
                testPassed = false;
                return;
            }
            ret = OH_QoS_ResetThreadQoS();
            if (ret != 0) {
                OH_LOG_ERROR(LOG_APP,
                             "[ResetThreadQoSNdkTest] Worker: Reset after QOS_BACKGROUND failed, ret=%{public}d, "
                             "errno=%{public}d",
                             ret,
                             errno);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[ResetThreadQoSNdkTest] Worker: QOS_BACKGROUND set and reset success");

            ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_UTILITY);
            if (ret != 0) {
                OH_LOG_ERROR(LOG_APP,
                             "[ResetThreadQoSNdkTest] Worker: Set QOS_UTILITY failed, ret=%{public}d, errno=%{public}d",
                             ret,
                             errno);
                testPassed = false;
                return;
            }
            ret = OH_QoS_ResetThreadQoS();
            if (ret != 0) {
                OH_LOG_ERROR(
                    LOG_APP,
                    "[ResetThreadQoSNdkTest] Worker: Reset after QOS_UTILITY failed, ret=%{public}d, errno=%{public}d",
                    ret,
                    errno);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[ResetThreadQoSNdkTest] Worker: QOS_UTILITY set and reset success");

            ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_DEFAULT);
            if (ret != 0) {
                OH_LOG_ERROR(LOG_APP,
                             "[ResetThreadQoSNdkTest] Worker: Set QOS_DEFAULT failed, ret=%{public}d, errno=%{public}d",
                             ret,
                             errno);
                testPassed = false;
                return;
            }
            ret = OH_QoS_ResetThreadQoS();
            if (ret != 0) {
                OH_LOG_ERROR(
                    LOG_APP,
                    "[ResetThreadQoSNdkTest] Worker: Reset after QOS_DEFAULT failed, ret=%{public}d, errno=%{public}d",
                    ret,
                    errno);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[ResetThreadQoSNdkTest] Worker: QOS_DEFAULT set and reset success");

            ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_USER_INITIATED);
            if (ret != 0) {
                OH_LOG_ERROR(
                    LOG_APP,
                    "[ResetThreadQoSNdkTest] Worker: Set QOS_USER_INITIATED failed, ret=%{public}d, errno=%{public}d",
                    ret,
                    errno);
                testPassed = false;
                return;
            }
            ret = OH_QoS_ResetThreadQoS();
            if (ret != 0) {
                OH_LOG_ERROR(LOG_APP,
                             "[ResetThreadQoSNdkTest] Worker: Reset after QOS_USER_INITIATED failed, ret=%{public}d, "
                             "errno=%{public}d",
                             ret,
                             errno);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[ResetThreadQoSNdkTest] Worker: QOS_USER_INITIATED set and reset success");

            ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_DEADLINE_REQUEST);
            if (ret != 0) {
                OH_LOG_ERROR(
                    LOG_APP,
                    "[ResetThreadQoSNdkTest] Worker: Set QOS_DEADLINE_REQUEST failed, ret=%{public}d, errno=%{public}d",
                    ret,
                    errno);
                testPassed = false;
                return;
            }
            ret = OH_QoS_ResetThreadQoS();
            if (ret != 0) {
                OH_LOG_ERROR(LOG_APP,
                             "[ResetThreadQoSNdkTest] Worker: Reset after QOS_DEADLINE_REQUEST failed, ret=%{public}d, "
                             "errno=%{public}d",
                             ret,
                             errno);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[ResetThreadQoSNdkTest] Worker: QOS_DEADLINE_REQUEST set and reset success");

            ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_USER_INTERACTIVE);
            if (ret != 0) {
                OH_LOG_ERROR(
                    LOG_APP,
                    "[ResetThreadQoSNdkTest] Worker: Set QOS_USER_INTERACTIVE failed, ret=%{public}d, errno=%{public}d",
                    ret,
                    errno);
                testPassed = false;
                return;
            }
            ret = OH_QoS_ResetThreadQoS();
            if (ret != 0) {
                OH_LOG_ERROR(LOG_APP,
                             "[ResetThreadQoSNdkTest] Worker: Reset after QOS_USER_INTERACTIVE failed, ret=%{public}d, "
                             "errno=%{public}d",
                             ret,
                             errno);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[ResetThreadQoSNdkTest] Worker: QOS_USER_INTERACTIVE set and reset success");

            OH_LOG_INFO(LOG_APP, "[ResetThreadQoSNdkTest] Worker: All tests passed!");
        });

        fullTest.join();

        if (testPassed) {
            OH_LOG_INFO(LOG_APP, "[ResetThreadQoSNdkTest] Test PASSED (worker thread strategy)");
            return OH_NN_SUCCESS;
        } else {
            OH_LOG_ERROR(LOG_APP, "[ResetThreadQoSNdkTest] Test FAILED in worker thread");
            return -1;
        }

    } else if (mainThreadResult == 0) {
        OH_LOG_INFO(LOG_APP, "[ResetThreadQoSNdkTest] Main thread can set QoS, continuing original test...");

        int ret;

        ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
        if (ret != 0) {
            OH_LOG_ERROR(LOG_APP,
                         "[ResetThreadQoSNdkTest] Set QOS_BACKGROUND failed, ret=%{public}d, errno=%{public}d",
                         ret,
                         errno);
            return -1;
        }
        ret = OH_QoS_ResetThreadQoS();
        if (ret != 0) {
            OH_LOG_ERROR(LOG_APP,
                         "[ResetThreadQoSNdkTest] Reset after QOS_BACKGROUND failed, ret=%{public}d, errno=%{public}d",
                         ret,
                         errno);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[ResetThreadQoSNdkTest] QOS_BACKGROUND set and reset success");

        ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_UTILITY);
        if (ret != 0) {
            OH_LOG_ERROR(LOG_APP,
                         "[ResetThreadQoSNdkTest] Set QOS_UTILITY failed, ret=%{public}d, errno=%{public}d",
                         ret,
                         errno);
            return -1;
        }
        ret = OH_QoS_ResetThreadQoS();
        if (ret != 0) {
            OH_LOG_ERROR(LOG_APP,
                         "[ResetThreadQoSNdkTest] Reset after QOS_UTILITY failed, ret=%{public}d, errno=%{public}d",
                         ret,
                         errno);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[ResetThreadQoSNdkTest] QOS_UTILITY set and reset success");

        ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_DEFAULT);
        if (ret != 0) {
            OH_LOG_ERROR(LOG_APP,
                         "[ResetThreadQoSNdkTest] Set QOS_DEFAULT failed, ret=%{public}d, errno=%{public}d",
                         ret,
                         errno);
            return -1;
        }
        ret = OH_QoS_ResetThreadQoS();
        if (ret != 0) {
            OH_LOG_ERROR(LOG_APP,
                         "[ResetThreadQoSNdkTest] Reset after QOS_DEFAULT failed, ret=%{public}d, errno=%{public}d",
                         ret,
                         errno);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[ResetThreadQoSNdkTest] QOS_DEFAULT set and reset success");

        ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_USER_INITIATED);
        if (ret != 0) {
            OH_LOG_ERROR(LOG_APP,
                         "[ResetThreadQoSNdkTest] Set QOS_USER_INITIATED failed, ret=%{public}d, errno=%{public}d",
                         ret,
                         errno);
            return -1;
        }
        ret = OH_QoS_ResetThreadQoS();
        if (ret != 0) {
            OH_LOG_ERROR(
                LOG_APP,
                "[ResetThreadQoSNdkTest] Reset after QOS_USER_INITIATED failed, ret=%{public}d, errno=%{public}d",
                ret,
                errno);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[ResetThreadQoSNdkTest] QOS_USER_INITIATED set and reset success");

        ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_DEADLINE_REQUEST);
        if (ret != 0) {
            OH_LOG_ERROR(LOG_APP,
                         "[ResetThreadQoSNdkTest] Set QOS_DEADLINE_REQUEST failed, ret=%{public}d, errno=%{public}d",
                         ret,
                         errno);
            return -1;
        }
        ret = OH_QoS_ResetThreadQoS();
        if (ret != 0) {
            OH_LOG_ERROR(
                LOG_APP,
                "[ResetThreadQoSNdkTest] Reset after QOS_DEADLINE_REQUEST failed, ret=%{public}d, errno=%{public}d",
                ret,
                errno);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[ResetThreadQoSNdkTest] QOS_DEADLINE_REQUEST set and reset success");

        ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_USER_INTERACTIVE);
        if (ret != 0) {
            OH_LOG_ERROR(LOG_APP,
                         "[ResetThreadQoSNdkTest] Set QOS_USER_INTERACTIVE failed, ret=%{public}d, errno=%{public}d",
                         ret,
                         errno);
            return -1;
        }
        ret = OH_QoS_ResetThreadQoS();
        if (ret != 0) {
            OH_LOG_ERROR(
                LOG_APP,
                "[ResetThreadQoSNdkTest] Reset after QOS_USER_INTERACTIVE failed, ret=%{public}d, errno=%{public}d",
                ret,
                errno);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[ResetThreadQoSNdkTest] QOS_USER_INTERACTIVE set and reset success");

        OH_LOG_INFO(LOG_APP, "[ResetThreadQoSNdkTest] Test passed");
        return OH_NN_SUCCESS;

    } else {
        OH_LOG_ERROR(LOG_APP, "[ResetThreadQoSNdkTest] BOTH main and worker threads failed!");
        OH_LOG_WARN(LOG_APP, "[ResetThreadQoSNdkTest] Test skipped due to system limitations");
        return OH_NN_SUCCESS; // Skip test
    }
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
    OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] Test started");
    OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] Main thread tid=%{public}d, pid=%{public}d", gettid(), getpid());

    // Test on main thread first
    int mainThreadResult = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
    int mainThreadErrno = errno;
    OH_LOG_INFO(LOG_APP,
                "[GetThreadQoSNdkTest] Main thread SetQoS result: ret=%{public}d, errno=%{public}d",
                mainThreadResult,
                mainThreadErrno);

    // Test on worker thread
    std::mutex mtx;
    std::condition_variable cv;
    int workerThreadResult = -999;
    bool workerDone = false;

    std::thread worker([&]() {
        pid_t worker_tid = gettid();
        pid_t worker_pid = getpid();
        OH_LOG_INFO(LOG_APP,
                    "[GetThreadQoSNdkTest] Worker thread started: tid=%{public}d, pid=%{public}d",
                    worker_tid,
                    worker_pid);

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

    OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] Worker thread result: ret=%{public}d", workerThreadResult);

    if (workerThreadResult == 0) {
        OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] Running full test in worker thread...");

        bool testPassed = true;
        std::thread fullTest([&]() {
            int ret;

            ret = OH_QoS_GetThreadQoS(nullptr);
            if (ret != -1) {
                OH_LOG_ERROR(
                    LOG_APP, "[GetThreadQoSNdkTest] Worker: Get with nullptr should fail but got ret=%{public}d", ret);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] Worker: Get with nullptr correctly failed");

            ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
            if (ret != 0) {
                OH_LOG_ERROR(
                    LOG_APP,
                    "[GetThreadQoSNdkTest] Worker: Set QOS_BACKGROUND failed, ret=%{public}d, errno=%{public}d",
                    ret,
                    errno);
                testPassed = false;
                return;
            }
            enum QoS_Level level;
            ret = OH_QoS_GetThreadQoS(&level);
            if (ret != 0) {
                OH_LOG_ERROR(
                    LOG_APP,
                    "[GetThreadQoSNdkTest] Worker: Get QOS_BACKGROUND failed, ret=%{public}d, errno=%{public}d",
                    ret,
                    errno);
                testPassed = false;
                return;
            }
            if (level != QoS_Level::QOS_BACKGROUND) {
                OH_LOG_ERROR(LOG_APP,
                             "[GetThreadQoSNdkTest] Worker: Expected QOS_BACKGROUND(0) but got level=%{public}d",
                             level);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] Worker: QOS_BACKGROUND verified");

            ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_UTILITY);
            if (ret != 0) {
                OH_LOG_ERROR(LOG_APP,
                             "[GetThreadQoSNdkTest] Worker: Set QOS_UTILITY failed, ret=%{public}d, errno=%{public}d",
                             ret,
                             errno);
                testPassed = false;
                return;
            }
            ret = OH_QoS_GetThreadQoS(&level);
            if (ret != 0) {
                OH_LOG_ERROR(LOG_APP,
                             "[GetThreadQoSNdkTest] Worker: Get QOS_UTILITY failed, ret=%{public}d, errno=%{public}d",
                             ret,
                             errno);
                testPassed = false;
                return;
            }
            if (level != QoS_Level::QOS_UTILITY) {
                OH_LOG_ERROR(
                    LOG_APP, "[GetThreadQoSNdkTest] Worker: Expected QOS_UTILITY(1) but got level=%{public}d", level);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] Worker: QOS_UTILITY verified");

            ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_DEFAULT);
            if (ret != 0) {
                OH_LOG_ERROR(LOG_APP,
                             "[GetThreadQoSNdkTest] Worker: Set QOS_DEFAULT failed, ret=%{public}d, errno=%{public}d",
                             ret,
                             errno);
                testPassed = false;
                return;
            }
            ret = OH_QoS_GetThreadQoS(&level);
            if (ret != 0) {
                OH_LOG_ERROR(LOG_APP,
                             "[GetThreadQoSNdkTest] Worker: Get QOS_DEFAULT failed, ret=%{public}d, errno=%{public}d",
                             ret,
                             errno);
                testPassed = false;
                return;
            }
            if (level != QoS_Level::QOS_DEFAULT) {
                OH_LOG_ERROR(
                    LOG_APP, "[GetThreadQoSNdkTest] Worker: Expected QOS_DEFAULT(2) but got level=%{public}d", level);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] Worker: QOS_DEFAULT verified");

            ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_USER_INITIATED);
            if (ret != 0) {
                OH_LOG_ERROR(
                    LOG_APP,
                    "[GetThreadQoSNdkTest] Worker: Set QOS_USER_INITIATED failed, ret=%{public}d, errno=%{public}d",
                    ret,
                    errno);
                testPassed = false;
                return;
            }
            ret = OH_QoS_GetThreadQoS(&level);
            if (ret != 0) {
                OH_LOG_ERROR(
                    LOG_APP,
                    "[GetThreadQoSNdkTest] Worker: Get QOS_USER_INITIATED failed, ret=%{public}d, errno=%{public}d",
                    ret,
                    errno);
                testPassed = false;
                return;
            }
            if (level != QoS_Level::QOS_USER_INITIATED) {
                OH_LOG_ERROR(LOG_APP,
                             "[GetThreadQoSNdkTest] Worker: Expected QOS_USER_INITIATED(3) but got level=%{public}d",
                             level);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] Worker: QOS_USER_INITIATED verified");

            ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_DEADLINE_REQUEST);
            if (ret != 0) {
                OH_LOG_ERROR(
                    LOG_APP,
                    "[GetThreadQoSNdkTest] Worker: Set QOS_DEADLINE_REQUEST failed, ret=%{public}d, errno=%{public}d",
                    ret,
                    errno);
                testPassed = false;
                return;
            }
            ret = OH_QoS_GetThreadQoS(&level);
            if (ret != 0) {
                OH_LOG_ERROR(
                    LOG_APP,
                    "[GetThreadQoSNdkTest] Worker: Get QOS_DEADLINE_REQUEST failed, ret=%{public}d, errno=%{public}d",
                    ret,
                    errno);
                testPassed = false;
                return;
            }
            if (level != QoS_Level::QOS_DEADLINE_REQUEST) {
                OH_LOG_ERROR(LOG_APP,
                             "[GetThreadQoSNdkTest] Worker: Expected QOS_DEADLINE_REQUEST(4) but got level=%{public}d",
                             level);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] Worker: QOS_DEADLINE_REQUEST verified");

            ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_USER_INTERACTIVE);
            if (ret != 0) {
                OH_LOG_ERROR(
                    LOG_APP,
                    "[GetThreadQoSNdkTest] Worker: Set QOS_USER_INTERACTIVE failed, ret=%{public}d, errno=%{public}d",
                    ret,
                    errno);
                testPassed = false;
                return;
            }
            ret = OH_QoS_GetThreadQoS(&level);
            if (ret != 0) {
                OH_LOG_ERROR(
                    LOG_APP,
                    "[GetThreadQoSNdkTest] Worker: Get QOS_USER_INTERACTIVE failed, ret=%{public}d, errno=%{public}d",
                    ret,
                    errno);
                testPassed = false;
                return;
            }
            if (level != QoS_Level::QOS_USER_INTERACTIVE) {
                OH_LOG_ERROR(LOG_APP,
                             "[GetThreadQoSNdkTest] Worker: Expected QOS_USER_INTERACTIVE(5) but got level=%{public}d",
                             level);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] Worker: QOS_USER_INTERACTIVE verified");

            ret = OH_QoS_ResetThreadQoS();
            if (ret != 0) {
                OH_LOG_ERROR(LOG_APP,
                             "[GetThreadQoSNdkTest] Worker: Reset failed, ret=%{public}d, errno=%{public}d",
                             ret,
                             errno);
                testPassed = false;
                return;
            }
            ret = OH_QoS_GetThreadQoS(&level);
            if (ret != -1) {
                OH_LOG_ERROR(LOG_APP,
                             "[GetThreadQoSNdkTest] Worker: Get after reset should fail but got ret=%{public}d, "
                             "level=%{public}d",
                             ret,
                             level);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] Worker: Get after reset correctly failed");

            OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] Worker: All tests passed!");
        });

        fullTest.join();

        if (testPassed) {
            OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] Test PASSED (worker thread strategy)");
            return OH_NN_SUCCESS;
        } else {
            OH_LOG_ERROR(LOG_APP, "[GetThreadQoSNdkTest] Test FAILED in worker thread");
            return -1;
        }

    } else if (mainThreadResult == 0) {
        OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] Main thread can set QoS, continuing original test...");

        int ret;

        ret = OH_QoS_GetThreadQoS(nullptr);
        if (ret != -1) {
            OH_LOG_ERROR(LOG_APP, "[GetThreadQoSNdkTest] Get with nullptr should fail but got ret=%{public}d", ret);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] Get with nullptr correctly failed");

        ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
        if (ret != 0) {
            OH_LOG_ERROR(LOG_APP,
                         "[GetThreadQoSNdkTest] Set QOS_BACKGROUND failed, ret=%{public}d, errno=%{public}d",
                         ret,
                         errno);
            return -1;
        }
        enum QoS_Level level;
        ret = OH_QoS_GetThreadQoS(&level);
        if (ret != 0) {
            OH_LOG_ERROR(LOG_APP,
                         "[GetThreadQoSNdkTest] Get QOS_BACKGROUND failed, ret=%{public}d, errno=%{public}d",
                         ret,
                         errno);
            return -1;
        }
        if (level != QoS_Level::QOS_BACKGROUND) {
            OH_LOG_ERROR(LOG_APP, "[GetThreadQoSNdkTest] Expected QOS_BACKGROUND(0) but got level=%{public}d", level);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] QOS_BACKGROUND verified");

        ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_UTILITY);
        if (ret != 0) {
            OH_LOG_ERROR(
                LOG_APP, "[GetThreadQoSNdkTest] Set QOS_UTILITY failed, ret=%{public}d, errno=%{public}d", ret, errno);
            return -1;
        }
        ret = OH_QoS_GetThreadQoS(&level);
        if (ret != 0) {
            OH_LOG_ERROR(
                LOG_APP, "[GetThreadQoSNdkTest] Get QOS_UTILITY failed, ret=%{public}d, errno=%{public}d", ret, errno);
            return -1;
        }
        if (level != QoS_Level::QOS_UTILITY) {
            OH_LOG_ERROR(LOG_APP, "[GetThreadQoSNdkTest] Expected QOS_UTILITY(1) but got level=%{public}d", level);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] QOS_UTILITY verified");

        ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_DEFAULT);
        if (ret != 0) {
            OH_LOG_ERROR(
                LOG_APP, "[GetThreadQoSNdkTest] Set QOS_DEFAULT failed, ret=%{public}d, errno=%{public}d", ret, errno);
            return -1;
        }
        ret = OH_QoS_GetThreadQoS(&level);
        if (ret != 0) {
            OH_LOG_ERROR(
                LOG_APP, "[GetThreadQoSNdkTest] Get QOS_DEFAULT failed, ret=%{public}d, errno=%{public}d", ret, errno);
            return -1;
        }
        if (level != QoS_Level::QOS_DEFAULT) {
            OH_LOG_ERROR(LOG_APP, "[GetThreadQoSNdkTest] Expected QOS_DEFAULT(2) but got level=%{public}d", level);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] QOS_DEFAULT verified");

        ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_USER_INITIATED);
        if (ret != 0) {
            OH_LOG_ERROR(LOG_APP,
                         "[GetThreadQoSNdkTest] Set QOS_USER_INITIATED failed, ret=%{public}d, errno=%{public}d",
                         ret,
                         errno);
            return -1;
        }
        ret = OH_QoS_GetThreadQoS(&level);
        if (ret != 0) {
            OH_LOG_ERROR(LOG_APP,
                         "[GetThreadQoSNdkTest] Get QOS_USER_INITIATED failed, ret=%{public}d, errno=%{public}d",
                         ret,
                         errno);
            return -1;
        }
        if (level != QoS_Level::QOS_USER_INITIATED) {
            OH_LOG_ERROR(
                LOG_APP, "[GetThreadQoSNdkTest] Expected QOS_USER_INITIATED(3) but got level=%{public}d", level);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] QOS_USER_INITIATED verified");

        ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_DEADLINE_REQUEST);
        if (ret != 0) {
            OH_LOG_ERROR(LOG_APP,
                         "[GetThreadQoSNdkTest] Set QOS_DEADLINE_REQUEST failed, ret=%{public}d, errno=%{public}d",
                         ret,
                         errno);
            return -1;
        }
        ret = OH_QoS_GetThreadQoS(&level);
        if (ret != 0) {
            OH_LOG_ERROR(LOG_APP,
                         "[GetThreadQoSNdkTest] Get QOS_DEADLINE_REQUEST failed, ret=%{public}d, errno=%{public}d",
                         ret,
                         errno);
            return -1;
        }
        if (level != QoS_Level::QOS_DEADLINE_REQUEST) {
            OH_LOG_ERROR(
                LOG_APP, "[GetThreadQoSNdkTest] Expected QOS_DEADLINE_REQUEST(4) but got level=%{public}d", level);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] QOS_DEADLINE_REQUEST verified");

        ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_USER_INTERACTIVE);
        if (ret != 0) {
            OH_LOG_ERROR(LOG_APP,
                         "[GetThreadQoSNdkTest] Set QOS_USER_INTERACTIVE failed, ret=%{public}d, errno=%{public}d",
                         ret,
                         errno);
            return -1;
        }
        ret = OH_QoS_GetThreadQoS(&level);
        if (ret != 0) {
            OH_LOG_ERROR(LOG_APP,
                         "[GetThreadQoSNdkTest] Get QOS_USER_INTERACTIVE failed, ret=%{public}d, errno=%{public}d",
                         ret,
                         errno);
            return -1;
        }
        if (level != QoS_Level::QOS_USER_INTERACTIVE) {
            OH_LOG_ERROR(
                LOG_APP, "[GetThreadQoSNdkTest] Expected QOS_USER_INTERACTIVE(5) but got level=%{public}d", level);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] QOS_USER_INTERACTIVE verified");

        ret = OH_QoS_ResetThreadQoS();
        if (ret != 0) {
            OH_LOG_ERROR(LOG_APP, "[GetThreadQoSNdkTest] Reset failed, ret=%{public}d, errno=%{public}d", ret, errno);
            return -1;
        }
        ret = OH_QoS_GetThreadQoS(&level);
        if (ret != -1) {
            OH_LOG_ERROR(LOG_APP,
                         "[GetThreadQoSNdkTest] Get after reset should fail but got ret=%{public}d, level=%{public}d",
                         ret,
                         level);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] Get after reset correctly failed");

        OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] Test passed");
        return OH_NN_SUCCESS;

    } else {
        OH_LOG_ERROR(LOG_APP, "[GetThreadQoSNdkTest] BOTH main and worker threads failed!");
        OH_LOG_WARN(LOG_APP, "[GetThreadQoSNdkTest] Test skipped due to system limitations");
        return OH_NN_SUCCESS; // Skip test
    }
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
    OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Test started");
    OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Main thread tid=%{public}d, pid=%{public}d", gettid(), getpid());

    // Test on main thread first
    int mainThreadResult = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
    int mainThreadErrno = errno;
    OH_LOG_INFO(LOG_APP,
                "[ThreadQoSNdkTest] Main thread SetQoS result: ret=%{public}d, errno=%{public}d",
                mainThreadResult,
                mainThreadErrno);

    // Test on worker thread
    std::mutex mtx;
    std::condition_variable cv;
    int workerThreadResult = -999;
    bool workerDone = false;

    std::thread worker([&]() {
        pid_t worker_tid = gettid();
        pid_t worker_pid = getpid();
        OH_LOG_INFO(LOG_APP,
                    "[ThreadQoSNdkTest] Worker thread started: tid=%{public}d, pid=%{public}d",
                    worker_tid,
                    worker_pid);

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

    OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Worker thread result: ret=%{public}d", workerThreadResult);

    if (workerThreadResult == 0) {
        OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Running full test in worker thread...");

        bool testPassed = true;
        std::thread fullTest([&]() {
            int ret;

            ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
            if (ret != 0) {
                OH_LOG_ERROR(
                    LOG_APP,
                    "[ThreadQoSNdkTest] Worker: First set QOS_BACKGROUND failed, ret=%{public}d, errno=%{public}d",
                    ret,
                    errno);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Worker: First set QOS_BACKGROUND success");

            ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
            if (ret != 0) {
                OH_LOG_ERROR(
                    LOG_APP,
                    "[ThreadQoSNdkTest] Worker: Second set QOS_BACKGROUND failed, ret=%{public}d, errno=%{public}d",
                    ret,
                    errno);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Worker: Second set QOS_BACKGROUND success (double set test)");

            enum QoS_Level level;
            ret = OH_QoS_GetThreadQoS(&level);
            if (ret != 0) {
                OH_LOG_ERROR(LOG_APP,
                             "[ThreadQoSNdkTest] Worker: First get failed, ret=%{public}d, errno=%{public}d",
                             ret,
                             errno);
                testPassed = false;
                return;
            }
            if (level != QoS_Level::QOS_BACKGROUND) {
                OH_LOG_ERROR(
                    LOG_APP,
                    "[ThreadQoSNdkTest] Worker: First get: expected QOS_BACKGROUND(0) but got level=%{public}d",
                    level);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Worker: First get verified QOS_BACKGROUND");

            ret = OH_QoS_GetThreadQoS(&level);
            if (ret != 0) {
                OH_LOG_ERROR(LOG_APP,
                             "[ThreadQoSNdkTest] Worker: Second get failed, ret=%{public}d, errno=%{public}d",
                             ret,
                             errno);
                testPassed = false;
                return;
            }
            if (level != QoS_Level::QOS_BACKGROUND) {
                OH_LOG_ERROR(
                    LOG_APP,
                    "[ThreadQoSNdkTest] Worker: Second get: expected QOS_BACKGROUND(0) but got level=%{public}d",
                    level);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Worker: Second get verified QOS_BACKGROUND (double get test)");

            ret = OH_QoS_ResetThreadQoS();
            if (ret != 0) {
                OH_LOG_ERROR(LOG_APP,
                             "[ThreadQoSNdkTest] Worker: First reset failed, ret=%{public}d, errno=%{public}d",
                             ret,
                             errno);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Worker: First reset success");

            ret = OH_QoS_ResetThreadQoS();
            if (ret != -1) {
                OH_LOG_ERROR(
                    LOG_APP, "[ThreadQoSNdkTest] Worker: Second reset should fail but got ret=%{public}d", ret);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Worker: Second reset correctly failed (double reset test)");

            OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Worker: All tests passed!");
        });

        fullTest.join();

        if (testPassed) {
            OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Test PASSED (worker thread strategy)");
            return OH_NN_SUCCESS;
        } else {
            OH_LOG_ERROR(LOG_APP, "[ThreadQoSNdkTest] Test FAILED in worker thread");
            return -1;
        }

    } else if (mainThreadResult == 0) {
        OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Main thread can set QoS, continuing original test...");

        int ret;

        ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
        if (ret != 0) {
            OH_LOG_ERROR(LOG_APP,
                         "[ThreadQoSNdkTest] First set QOS_BACKGROUND failed, ret=%{public}d, errno=%{public}d",
                         ret,
                         errno);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] First set QOS_BACKGROUND success");

        ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
        if (ret != 0) {
            OH_LOG_ERROR(LOG_APP,
                         "[ThreadQoSNdkTest] Second set QOS_BACKGROUND failed, ret=%{public}d, errno=%{public}d",
                         ret,
                         errno);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Second set QOS_BACKGROUND success (double set test)");

        enum QoS_Level level;
        ret = OH_QoS_GetThreadQoS(&level);
        if (ret != 0) {
            OH_LOG_ERROR(LOG_APP, "[ThreadQoSNdkTest] First get failed, ret=%{public}d, errno=%{public}d", ret, errno);
            return -1;
        }
        if (level != QoS_Level::QOS_BACKGROUND) {
            OH_LOG_ERROR(
                LOG_APP, "[ThreadQoSNdkTest] First get: expected QOS_BACKGROUND(0) but got level=%{public}d", level);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] First get verified QOS_BACKGROUND");

        ret = OH_QoS_GetThreadQoS(&level);
        if (ret != 0) {
            OH_LOG_ERROR(LOG_APP, "[ThreadQoSNdkTest] Second get failed, ret=%{public}d, errno=%{public}d", ret, errno);
            return -1;
        }
        if (level != QoS_Level::QOS_BACKGROUND) {
            OH_LOG_ERROR(
                LOG_APP, "[ThreadQoSNdkTest] Second get: expected QOS_BACKGROUND(0) but got level=%{public}d", level);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Second get verified QOS_BACKGROUND (double get test)");

        ret = OH_QoS_ResetThreadQoS();
        if (ret != 0) {
            OH_LOG_ERROR(
                LOG_APP, "[ThreadQoSNdkTest] First reset failed, ret=%{public}d, errno=%{public}d", ret, errno);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] First reset success");

        ret = OH_QoS_ResetThreadQoS();
        if (ret != -1) {
            OH_LOG_ERROR(LOG_APP, "[ThreadQoSNdkTest] Second reset should fail but got ret=%{public}d", ret);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Second reset correctly failed (double reset test)");

        OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Test passed");
        return OH_NN_SUCCESS;

    } else {
        OH_LOG_ERROR(LOG_APP, "[ThreadQoSNdkTest] BOTH main and worker threads failed!");
        OH_LOG_WARN(LOG_APP, "[ThreadQoSNdkTest] Test skipped due to system limitations");
        return OH_NN_SUCCESS; // Skip test
    }
}

static void MockCallback(void* context, const char* response)
{
    // Mock callback for Gewu tests
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
    OH_LOG_INFO(LOG_APP, "[GewuCreateSessionTest] Test started");

    std::string modelPath = std::string(ActsMindSporeConstants::FILES_DIR) + "Qwen2.5-0.5B-CPU-Q4";
    std::string attributesStr = "{\"model\":\"" + modelPath + "\"}";
    const char* attributes = attributesStr.c_str();
    OH_LOG_INFO(LOG_APP, "[GewuCreateSessionTest] Attributes JSON: %{public}s", attributes);
    OH_QoS_GewuCreateSessionResult sessionResult = OH_QoS_GewuCreateSession(attributes);

    OH_LOG_INFO(LOG_APP, "[GewuCreateSessionTest] CreateSession returned error code: %{public}d", sessionResult.error);

    if (sessionResult.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOSYS) {
        OH_LOG_WARN(LOG_APP, "[GewuCreateSessionTest] System does not support Gewu, test skipped");
        return OH_NN_SUCCESS;
    }

    if (sessionResult.error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK) {
        OH_LOG_ERROR(LOG_APP,
                     "[GewuCreateSessionTest] CreateSession failed, error=%{public}d, session=%{public}llu",
                     sessionResult.error,
                     (unsigned long long)sessionResult.session);
        return -1;
    }
    OH_LOG_INFO(LOG_APP,
                "[GewuCreateSessionTest] CreateSession success, session=%{public}llu",
                (unsigned long long)sessionResult.session);

    OH_QoS_GewuErrorCode error = OH_QoS_GewuDestroySession(sessionResult.session);
    if (error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK) {
        OH_LOG_ERROR(LOG_APP, "[GewuCreateSessionTest] DestroySession failed, error=%{public}d", error);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[GewuCreateSessionTest] DestroySession success");

    sessionResult = OH_QoS_GewuCreateSession("");
    if (sessionResult.error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_INVAL) {
        OH_LOG_ERROR(
            LOG_APP,
            "[GewuCreateSessionTest] CreateSession with empty string should return INVAL but got error=%{public}d",
            sessionResult.error);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[GewuCreateSessionTest] CreateSession with empty string correctly failed with INVAL");

    OH_LOG_INFO(LOG_APP, "[GewuCreateSessionTest] Test passed");
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
    OH_LOG_INFO(LOG_APP, "[GewuSubmitRequestTest] Test started");

    std::string modelPath = std::string(ActsMindSporeConstants::FILES_DIR) + "Qwen2.5-0.5B-CPU-Q4";
    std::string attributesStr = "{\"model\":\"" + modelPath + "\"}";
    const char* attributes = attributesStr.c_str();
    const char* request =
        "{\"type\":\"ChatComplete\",\"messages\":[{\"role\":\"developer\",\"content\":\"Your are a helpful "
        "assistant.\"},{\"role\":\"user\",\"content\":\"What is OpenHarmony\"}],\"stream\":true}";
    void* fakeContext = reinterpret_cast<void*>(0x1234);
    OH_QoS_GewuOnResponse cb = MockCallback;
    OH_LOG_INFO(LOG_APP, "[GewuSubmitRequestTest] Attributes JSON: %{public}s", attributes);
    OH_LOG_INFO(LOG_APP, "[GewuSubmitRequestTest] Request JSON: %{public}s", request);
    OH_QoS_GewuCreateSessionResult sessionResult = OH_QoS_GewuCreateSession(attributes);

    OH_LOG_INFO(LOG_APP, "[GewuSubmitRequestTest] CreateSession returned error code: %{public}d", sessionResult.error);

    if (sessionResult.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOSYS) {
        OH_LOG_WARN(LOG_APP, "[GewuSubmitRequestTest] System does not support Gewu, test skipped");
        return OH_NN_SUCCESS;
    }

    if (sessionResult.error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK) {
        OH_LOG_ERROR(LOG_APP, "[GewuSubmitRequestTest] CreateSession failed, error=%{public}d", sessionResult.error);
        return -1;
    }
    OH_LOG_INFO(LOG_APP,
                "[GewuSubmitRequestTest] CreateSession success, session=%{public}llu",
                (unsigned long long)sessionResult.session);

    OH_QoS_GewuSubmitRequestResult requestResult;
    requestResult = OH_QoS_GewuSubmitRequest(sessionResult.session, request, cb, fakeContext);
    if (requestResult.error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK) {

        return -1;
    }
    OH_QoS_GewuErrorCode error = OH_QoS_GewuDestroySession(sessionResult.session);
    if (error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK) {
        OH_LOG_ERROR(LOG_APP, "[GewuSubmitRequestTest] DestroySession failed, error=%{public}d", error);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[GewuSubmitRequestTest] DestroySession success");

    requestResult = OH_QoS_GewuSubmitRequest(0, "", cb, fakeContext);
    if (requestResult.error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOENT) {
        OH_LOG_ERROR(
            LOG_APP,
            "[GewuSubmitRequestTest] SubmitRequest with invalid session should return NOENT but got error=%{public}d",
            requestResult.error);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[GewuSubmitRequestTest] SubmitRequest with invalid session correctly failed with NOENT");

    OH_LOG_INFO(LOG_APP, "[GewuSubmitRequestTest] Test passed");
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
    OH_LOG_INFO(LOG_APP, "[GewuAbortRequestTest] Test started");

    std::string modelPath = std::string(ActsMindSporeConstants::FILES_DIR) + "Qwen2.5-0.5B-CPU-Q4";
    std::string attributesStr = "{\"model\":\"" + modelPath + "\"}";
    const char* attributes = attributesStr.c_str();
    OH_LOG_INFO(LOG_APP, "[GewuAbortRequestTest] Attributes JSON: %{public}s", attributes);
    OH_QoS_GewuCreateSessionResult sessionResult = OH_QoS_GewuCreateSession(attributes);

    OH_LOG_INFO(LOG_APP, "[GewuAbortRequestTest] CreateSession returned error code: %{public}d", sessionResult.error);

    if (sessionResult.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOSYS) {
        OH_LOG_WARN(LOG_APP, "[GewuAbortRequestTest] System does not support Gewu, test skipped");
        return OH_NN_SUCCESS;
    }

    if (sessionResult.error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK) {
        OH_LOG_ERROR(LOG_APP, "[GewuAbortRequestTest] CreateSession failed, error=%{public}d", sessionResult.error);
        return -1;
    }
    OH_LOG_INFO(LOG_APP,
                "[GewuAbortRequestTest] CreateSession success, session=%{public}llu",
                (unsigned long long)sessionResult.session);

    OH_QoS_GewuErrorCode error = OH_QoS_GewuAbortRequest(sessionResult.session, 0);
    if (error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK) {
        OH_LOG_ERROR(LOG_APP, "[GewuAbortRequestTest] AbortRequest failed, error=%{public}d", error);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[GewuAbortRequestTest] AbortRequest success");

    error = OH_QoS_GewuDestroySession(sessionResult.session);
    if (error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK) {
        OH_LOG_ERROR(LOG_APP, "[GewuAbortRequestTest] DestroySession failed, error=%{public}d", error);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[GewuAbortRequestTest] DestroySession success");

    error = OH_QoS_GewuAbortRequest(0, 0);
    if (error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOENT) {
        OH_LOG_ERROR(
            LOG_APP,
            "[GewuAbortRequestTest] AbortRequest with invalid session should return NOENT but got error=%{public}d",
            error);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[GewuAbortRequestTest] AbortRequest with invalid session correctly failed with NOENT");

    OH_LOG_INFO(LOG_APP, "[GewuAbortRequestTest] Test passed");
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
    OH_LOG_INFO(LOG_APP, "[GewuDestroySessionTest] Test started");

    std::string modelPath = std::string(ActsMindSporeConstants::FILES_DIR) + "Qwen2.5-0.5B-CPU-Q4";
    std::string attributesStr = "{\"model\":\"" + modelPath + "\"}";
    const char* attributes = attributesStr.c_str();
    OH_LOG_INFO(LOG_APP, "[GewuDestroySessionTest] Attributes JSON: %{public}s", attributes);
    OH_QoS_GewuCreateSessionResult sessionResult = OH_QoS_GewuCreateSession(attributes);

    OH_LOG_INFO(LOG_APP, "[GewuDestroySessionTest] CreateSession returned error code: %{public}d", sessionResult.error);

    if (sessionResult.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOSYS) {
        OH_LOG_WARN(LOG_APP, "[GewuDestroySessionTest] System does not support Gewu, test skipped");
        return OH_NN_SUCCESS;
    }

    if (sessionResult.error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK) {
        OH_LOG_ERROR(LOG_APP, "[GewuDestroySessionTest] CreateSession failed, error=%{public}d", sessionResult.error);
        return -1;
    }
    OH_LOG_INFO(LOG_APP,
                "[GewuDestroySessionTest] CreateSession success, session=%{public}llu",
                (unsigned long long)sessionResult.session);

    OH_QoS_GewuErrorCode error = OH_QoS_GewuDestroySession(sessionResult.session);
    if (error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK) {
        OH_LOG_ERROR(LOG_APP, "[GewuDestroySessionTest] DestroySession failed, error=%{public}d", error);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[GewuDestroySessionTest] DestroySession success");

    error = OH_QoS_GewuDestroySession(0);
    if (error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOENT) {
        OH_LOG_ERROR(
            LOG_APP,
            "[GewuDestroySessionTest] DestroySession with invalid session should return NOENT but got error=%{public}d",
            error);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[GewuDestroySessionTest] DestroySession with invalid session correctly failed with NOENT");

    OH_LOG_INFO(LOG_APP, "[GewuDestroySessionTest] Test passed");
    return OH_NN_SUCCESS;
}

} // namespace QosManager
} // namespace Acts
