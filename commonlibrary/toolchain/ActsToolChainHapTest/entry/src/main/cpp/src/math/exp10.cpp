/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

#include <dlfcn.h>
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include "mtest.h"

static struct DD t[] = {
#include "sanity/exp10.h"
#include "special/exp10.h"
};

static int Exp10Test_impl(void)
{
#pragma STDC FENV_ACCESS ON
    double y;
    float d;
    int e, i, err = 0;
    struct DD* p;

    typedef double (*exp10_func)(double);
    exp10_func exp10 = (exp10_func)dlsym(RTLD_DEFAULT, "exp10");

    for (i = 0; i < sizeof t / sizeof *t; i++) {
        p = t + i;

        if (p->r < 0)
            continue;
        fesetround(p->r);
        feclearexcept(FE_ALL_EXCEPT);
        y = exp10(p->x);
        e = fetestexcept(INEXACT | INVALID | DIVBYZERO | UNDERFLOW | OVERFLOW);

        if (!Checkexcept(e, p->e, p->r)) {
            printf("%s:%d: bad fp exception: %s exp10(%a)=%a, want %s",
                   p->file,
                   p->line,
                   Rstr(p->r),
                   p->x,
                   p->y,
                   Estr(p->e));
            printf(" got %s\n", Estr(e));
            err++;
        }
        d = Ulperr(y, p->y, p->dy);
        if (!Checkulp(d, p->r)) {
            printf("%s:%d: %s exp10(%a) want %a got %a ulperr %.3f = %a + %a\n",
                   p->file,
                   p->line,
                   Rstr(p->r),
                   p->x,
                   p->y,
                   y,
                   d,
                   d - p->dy,
                   p->dy);
            err++;
        }
    }
    return !!err;
}

int Exp10Test(void)
{
    return Exp10Test_impl();
}

