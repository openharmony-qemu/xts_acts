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
    sigset_t sca_mask;
    int sca_flags;
};
#define signal_chain_action SignalChainAction
#define scaMask sca_mask
#define scaFlags sca_flags

/* Mark the signal to the sigchain, add the special handler to the sigchain. */
static inline void add_special_signal_handler(int signo, struct signal_chain_action* sa)
{
    (void)signo;
    (void)sa;
}
/* Add the special handler at the last of sigchain chains */
static inline void add_special_handler_at_last(int signo, struct signal_chain_action* sa)
{
    (void)signo;
    (void)sa;
}
/* Remove the special the handler from the sigchain. */
static inline void remove_special_signal_handler(int signo, bool (*fn)(int, siginfo_t*, void*))
{
    (void)signo;
    (void)fn;
}
/* Remove all special the handler from the sigchain */
static inline void remove_all_special_handler(int signo)
{
    (void)signo;
}
/* Set the pre_validation_ignore flag to control whether to validate SIG_IGN before calling user handler */
static inline void set_sigchain_pre_validation_ignore(int value)
{
    (void)value;
}

#define AddSpecialSignalHandler add_special_signal_handler
#define AddSpecialHandlerAtLast add_special_handler_at_last
#define RemoveSpecialSignalHandler remove_special_signal_handler
#define RemoveAllSpecialHandler remove_all_special_handler
#define SetSigchainPreValidationIgnore set_sigchain_pre_validation_ignore

#ifdef __cplusplus
}
#endif

#endif