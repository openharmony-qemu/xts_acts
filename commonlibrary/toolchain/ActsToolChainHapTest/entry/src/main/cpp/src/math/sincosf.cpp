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

#define _GNU_SOURCE 1
#include <stdint.h>
#include <stdio.h>
#include "mtest.h"

static struct FFf t[] = {
#include "sanity/sincosf.h"
#include "special/sincosf.h"
};

static int SincosfTest_impl(void){
	#pragma STDC FENV_ACCESS ON
	float ysin, ycos;
	float dsin, dcos;
	int e, i, err = 0;
	struct FFf *p;

	for (i = 0; i < sizeof t/sizeof *t; i++) {
		p = t + i;

		if (p->r < 0)
			continue;
		fesetround(p->r);
		feclearexcept(FE_ALL_EXCEPT);
		sincosf(p->x, &ysin, &ycos);
		e = fetestexcept(INEXACT|INVALID|DIVBYZERO|UNDERFLOW|OVERFLOW);

		if (!Checkexcept(e, p->e, p->r)) {
			printf("%s:%d: bad fp exception: %s sincosf(%a)=%a,%a, want %s",
				p->file, p->line, Rstr(p->r), p->x, p->y, p->y2, Estr(p->e));
			printf(" got %s\n", Estr(e));
			err++;
		}
		dsin = Ulperrf(ysin, p->y, p->dy);
		dcos = Ulperrf(ycos, p->y2, p->dy2);
		if (!Checkulp(dsin, p->r) || !Checkulp(dcos, p->r)) {
			printf("%s:%d: %s sincosf(%a) want %a,%a got %a,%a, ulperr %.3f = %a + %a, %.3f = %a + %a\n",
				p->file, p->line, Rstr(p->r), p->x, p->y, p->y2, ysin, ycos,
				dsin, dsin-p->dy, p->dy, dcos, dcos-p->dy2, p->dy2);
			err++;
		}
	}
	return !!err;
}

int SincosfTest(void)
{
    return SincosfTest_impl();
}

