/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

#include <sys/resource.h>
#include "functionalext.h"

extern "C" int __getrusage_time64(int, struct rusage*);
/**
 * @tc.name      : getrusage_0100
 * @tc.desc      : Verify the program running time (parameter is RUSAGE_SELF)
 * @tc.level     : Level 0
 */
void Getrusage0100(void)
{
    struct rusage usage;
    int result = getrusage(RUSAGE_SELF, &usage);
    EXPECT_EQ("Getrusage0100", result, 0);
}

/**
 * @tc.name      : getrusage_0200
 * @tc.desc      : Verify the program running time (parameter is RUSAGE_CHILDREN)
 * @tc.level     : Level 1
 */
void Getrusage0200(void)
{
    struct rusage usage;
    int result = getrusage(RUSAGE_CHILDREN, &usage);
    EXPECT_EQ("Getrusage0200", result, 0);
}

/**
 * @tc.name      : getrusage_0300
 * @tc.desc      : Verify the program running time (parameter is RUSAGE_THREAD)
 * @tc.level     : Level 1
 */
void Getrusage0300(void)
{
    struct rusage usage;
    int result = getrusage(RUSAGE_THREAD, &usage);
    EXPECT_EQ("Getrusage0300", result, 0);
}

/**
 * @tc.name      : getrusage_0400
 * @tc.desc      : Verify that the program running time cannot be obtained (parameter is 100)
 * @tc.level     : Level 2
 */
void Getrusage0400(void)
{
    struct rusage usage;
    int result = getrusage(100, &usage);
    EXPECT_EQ("Getrusage0400", result, -1);
}

/**
 * @tc.name      : getrusage_0500
 * @tc.desc      : Verify that the program running time cannot be obtained (parameter is RUSAGE_SELF)
 * @tc.level     : Level 2
 */
void Getrusage0500(void)
{
    struct rusage usage;
    int result = getrusage(RUSAGE_SELF, NULL);
    EXPECT_EQ("Getrusage0500", result, -1);
}

/**
 * @tc.name      : getrusage_time64_0100
 * @tc.desc      : Verify the program running time (parameter is RUSAGE_SELF)
 * @tc.level     : Level 0
 */
void GetrusageTime640100(void)
{
    struct rusage usage;
    int result = __getrusage_time64(RUSAGE_SELF, &usage);
    EXPECT_EQ("GetrusageTime640100", result, 0);
}

static int GetrusageTestImpl(void)
{
    Getrusage0100();
    Getrusage0200();
    Getrusage0300();
    Getrusage0400();
    Getrusage0500();
    GetrusageTime640100();
    return t_status;
}

int GetrusageTest(void)
{
    return GetrusageTestImpl();
}
