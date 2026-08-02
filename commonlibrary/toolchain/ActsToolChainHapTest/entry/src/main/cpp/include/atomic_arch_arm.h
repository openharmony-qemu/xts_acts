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

#ifndef ATOMIC_ARCH_ARM_H_H
#define ATOMIC_ARCH_ARM_H_H

#define A_CAS A_CAS
static inline int A_CAS(volatile int *p, int t, int s)
{
    int old;
    __asm__ __volatile__(
        "1: ldrex %0,%3\n cmp %0,%1\n bne 2f\n strex %0,%2,%3\n teq %0,#0\n bne 1b\n2:"
        : "=&r"(old)
        : "r"(t), "r"(s), "q"(*p)
        : "memory", "cc");
    return old;
}

#define A_BARRIER A_BARRIER
static inline void A_BARRIER()
{
    __asm__ __volatile__("dmb ish" : : : "memory");
}

#define A_CRASH A_CRASH
static inline void A_CRASH()
{
    __asm__ __volatile__("udf #24" : : : "memory");
}

#define A_CLZ32 A_CLZ32
static inline int A_CLZ32(uint32_t x)
{
    __asm__("clz %0,%1" : "=r"(x) : "r"(x));
    return x;
}

#endif // ATOMIC_ARCH_ARM_H_H
