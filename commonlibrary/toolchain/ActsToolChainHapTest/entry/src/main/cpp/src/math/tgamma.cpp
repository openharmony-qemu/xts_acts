#include <stdint.h>
#include <stdio.h>
#include "mtest.h"

static d_d t[] = {
#include "sanity/tgamma.h"
#include "special/tgamma.h"

};

static int TgammaTest_impl(void)
{
    #pragma STDC FENV_ACCESS ON
    double y;
    float d;
    int e;
    int i;
    int err = 0;
    d_d *p;

    for (i = 0; i < sizeof t/sizeof *t; i++) {
        p = t + i;

        if (p->r < 0)
            continue;
        fesetround(p->r);
        feclearexcept(FE_ALL_EXCEPT);
        y = tgamma(p->x);
        e = fetestexcept(INEXACT|INVALID|DIVBYZERO|UNDERFLOW|OVERFLOW);
#ifndef __aarch64__
        if (!checkexcept(e, p->e, p->r)) {
            printf("%s:%d: bad fp exception: %s tgamma(%a)=%a, want %s",
               p->file, p->line, rstr(p->r), p->x, p->y, estr(p->e));
            printf(" got %s\n", estr(e));
            err++;
        }
#endif
        d = ulperr(y, p->y, p->dy);
        if (!checkulp(d, p->r)) {
            if (fabsf(d) < 5.5f)
                printf("X ");
            else
                err++;
            printf("%s:%d: %s tgamma(%a) want %a got %a ulperr %.3f = %a + %a\n",
               p->file, p->line, rstr(p->r), p->x, p->y, y, d, d-p->dy, p->dy);
        }
    }
    return !!err;
}

int TgammaTest(void)
{
    return TgammaTest_impl();
}
