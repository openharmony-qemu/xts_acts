/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <clocale>
#include <cstdlib>
#include "functionalext.h"

static const int g_lcMarkArry[] = {LC_PAPER_MASK,
    LC_NAME_MASK,
    LC_ADDRESS_MASK,
    LC_TELEPHONE_MASK,
    LC_MEASUREMENT_MASK,
    LC_IDENTIFICATION_MASK,
    LC_ALL_MASK};

/**
 * @tc.name      : newlocale_0100
 * @tc.desc      : Check whether the LC_ALL type is passed to newlocale to create a custom locale environment
 * @tc.level     : Level 0
 */
static void Newlocale0100(void)
{
    char *lo = setlocale(LC_ALL, "C");
    if (!lo) {
        EXPECT_PTRNE("newlocale_0100", lo, NULL);
        return;
    }
    locale_t newLocale = newlocale(LC_ALL_MASK, "en_US", NULL);
    EXPECT_PTRNE("newlocale_0100", newLocale, NULL);

    if (newLocale) {
        freelocale(newLocale);
        newLocale = NULL;
    }
}

/**
 * @tc.name      : newlocale_0200
 * @tc.desc      : Check whether the LC_ALL type is passed to newlocale to create a custom locale environment
 * @tc.level     : Level 0
 */
static void Newlocale0200(void)
{
    char *lo = setlocale(LC_ALL, "C");
    if (!lo) {
        EXPECT_PTRNE("newlocale_0200", lo, NULL);
        return;
    }
    locale_t newLocale = newlocale(LC_ALL_MASK, "C", NULL);
    EXPECT_PTRNE("newlocale_0200", newLocale, NULL);

    if (newLocale) {
        freelocale(newLocale);
        newLocale = NULL;
    }
}

/**
 * @tc.name      : newlocale_0300
 * @tc.desc      : Determines whether the custom locale environment is created successfully
 * by passing different LC data types to newlocale
 * @tc.level     : Level 0
 */
static void Newlocale0300(void)
{
    char *lo = setlocale(LC_ALL, "C");
    if (!lo) {
        EXPECT_PTRNE("newlocale_0300", lo, NULL);
        return;
    }
    for (int i = 0; i < sizeof(g_lcMarkArry) / sizeof(g_lcMarkArry[0]); i++) {
        locale_t newLocale = newlocale(g_lcMarkArry[i], "en_US", NULL);
        EXPECT_PTRNE("newlocale_0300", newLocale, NULL);

        if (newLocale) {
            freelocale(newLocale);
            newLocale = NULL;
        }
    }
}

static int NewlocaleSupTestImpl(void)
{
    Newlocale0100();
    Newlocale0200();
    Newlocale0300();

    return g_tStatus;
}

int NewlocaleSupTest(void)
{
    return NewlocaleSupTestImpl();
}
