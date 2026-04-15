/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef SIGCHAIN_H
#define SIGCHAIN_H

#include <signal.h>
#include <stdbool.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

static const int SIGCHAIN_ALLOW_NORETURN = 0x1UL;

/* The Action of the sigchain. */
struct SignalChainAction {
    bool (*sca_sigaction)(int, siginfo_t*, void*);
    sigset_t scaMask;
    int scaFlags;
};

/* Mark the signal to the sigchain, add the special Handler to the sigchain. */
void AddSpecialSignalHandler(int signo, struct SignalChainAction* sa);
/* Add the special Handler at the last of sigchain chains */
void AddSpecialHandlerAtLast(int signo, struct SignalChainAction* sa);
/* Remove the special the Handler from the sigchain. */
void RemoveSpecialSignalHandler(int signo, bool (*fn)(int, siginfo_t*, void*));
/* Remove all special the Handler from the sigchain */
void RemoveAllSpecialHandler(int signo);
/* Set the pre_validation_ignore flag to control whether to validate SIG_IGN before calling user Handler */
void SetSigchainPreValidationIgnore(int value);

#ifdef __cplusplus
}
#endif

#endif