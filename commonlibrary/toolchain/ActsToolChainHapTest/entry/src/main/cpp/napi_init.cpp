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

#include <string>
#include <sys/wait.h>
#include <unistd.h>
#include <unordered_map>
#include "CommonTool.h"
#include "libc_generated_100.h"
#include "libc_generated_extra.h"
#include "libc_test_cases.h"
#include "malloc-pressure.h"
#include "napi/native_api.h"
#include "src/eabi.h"
#include "src/functional.h"
#include "src/functionalext/dl_different_hash.h"
#include "src/functionalext/dlns.h"
#include "src/functionalext/info.h"
#include "src/functionalext/ldso_cfi.h"
#include "src/functionalext/ldso_cfi/crossdso.h"
#include "src/functionalext/ldso_cfi/crossdso_dtor.h"
#include "src/functionalext/locale.h"
#include "src/functionalext/relro.h"
#include "src/functionalext/supplement/ctype.h"
#include "src/functionalext/supplement/dirent.h"
#include "src/functionalext/supplement/errno.h"
#include "src/functionalext/supplement/exit.h"
#include "src/functionalext/supplement/fcntl.h"
#include "src/functionalext/supplement/ldso.h"
#include "src/functionalext/supplement/legacy.h"
#include "src/functionalext/supplement/linux.h"
#include "src/functionalext/supplement/locale.h"
#include "src/functionalext/supplement/malloc.h"
#include "src/functionalext/supplement/manual/env.h"
#include "src/functionalext/supplement/math.h"
#include "src/functionalext/supplement/misc.h"
#include "src/functionalext/supplement/multibyte.h"
#include "src/functionalext/supplement/network.h"
#include "src/functionalext/supplement/prng.h"
#include "src/functionalext/supplement/process.h"
#include "src/functionalext/supplement/sched.h"
#include "src/functionalext/supplement/setjmp.h"
#include "src/functionalext/supplement/signal.h"
#include "src/functionalext/supplement/stat.h"
#include "src/functionalext/supplement/stdio.h"
#include "src/functionalext/supplement/stdlib.h"
#include "src/functionalext/supplement/string.h"
#include "src/functionalext/supplement/termios.h"
#include "src/functionalext/supplement/thread.h"
#include "src/functionalext/supplement/time.h"
#include "src/functionalext/supplement/unistd.h"
#include "src/functionalext/symver.h"
#include "src/functionalext/time.h"
#include "src/math.h"
#include "src/regression.h"
#include "test.h"

namespace {
constexpr int K_RUN_TEST_NOT_FOUND = 404;
constexpr int K_RUN_TEST_FORK_FAILED = 500;
constexpr int K_RUN_TEST_WAITPID_FAILED = 501;
constexpr int K_RUN_TEST_UNKNOWN_EXIT = 502;
constexpr int K_CHILD_EXIT_CAP = 255;
constexpr int K_SIGNAL_EXIT_BASE = 128;
} // namespace

namespace {
const std::unordered_map<std::string, int (*)()> kTestRegistry = {
    { "basename", &BasenameTest },
    { "dirname", &DirnameTest },
    { "env", &EnvTest },
    { "iswspace-null", &IswspaceNullTest },
    { "wcsncpy-read-overflow", &WcsncpyReadOverflowTest },
    { "memmem-oob", &MemmemOobTest },
    { "strtod_long", &StrtodLongTest },
    { "getpwnam_r-crash", &GetpwnamRCrashTest },
    { "putenv-doublefree", &PutenvDoublefreeTest },
    { "sigreturn", &SigreturnTest },
    { "main", &MainTest },
    { "fnmatch", &FnmatchTest },
    { "iconv", &IconvTest },
    { "tgkill", &TgkillTest },
    { "poll", &PollTest },
    { "lrand48-signextend", &Lrand48SignextendTest },
    { "scanf-nullbyte-char", &ScanfNullbyteCharTest },
    { "scanf-match-literal-eof", &ScanfMatchLiteralEofTest },
    { "setvbuf-unget", &SetvbufUngetTest },
    { "clock_gettime", &ClockGettimeTest },
    { "memmem-oob-read", &MemmemOobReadTest },
    { "getpwnam_r-errno", &GetpwnamRErrnoTest },
    { "regexec-nosub", &RegexecNosubTest },
    { "dn_expand-empty", &DnExpandEmptyTest },
    { "scanf-bytes-consumed", &ScanfBytesConsumedTest },
    { "wcsstr-false-negative", &WcsstrFalseNegativeTest },
    { "fgets-eof", &FgetsEofTest },
    { "sscanf-eof", &SscanfEofTest },
    { "regex-escaped-high-byte", &RegexEscapedHighByteTest },
    { "regex-negated-range", &RegexNegatedRangeTest },
    { "malloc-0", &Malloc0Test },
    { "malloc-pressure", &MallocPressureTest },
    { "regex-backref-0", &RegexBackref0Test },
    { "printf-fmt-g-round", &PrintfFmtGRoundTest },
    { "printf-fmt-g-zeros", &PrintfFmtGZerosTest },
    { "sched_cpualloc", &SchedCpuallocTest },
    { "inet_ntop-v4mapped", &InetNtopV4mappedTest },
    { "setjmp", &SetjmpTest },
    { "mbsrtowcs-overflow", &MbsrtowcsOverflowTest },
    { "rewind-clear-error", &RewindClearErrorTest },
    { "syscall-sign-extend", &SyscallSignExtendTest },
    { "string_strcspn", &StringStrcspnTest },
    { "uselocale-0", &Uselocale0Test },
    { "printf-1e9-oob", &Printf1e9OobTest },
    { "strtod_simple", &StrtodSimpleTest },
    { "pthread_gettid_np", &PthreadGettidNpTest },
    { "search_insque", &SearchInsqueTest },
    { "mkstemp-failure", &MkstempFailureTest },
    { "printf-fmt-n", &PrintfFmtNTest },
    { "regex-ere-backref", &RegexEreBackrefTest },
    { "pthread_exit-cancel", &PthreadExitCancelTest },
    { "sched_setscheduler", &SchedSetschedulerTest },
    { "langinfo", &LanginfoTest },
    { "strverscmp", &StrverscmpTest },
    { "fgetwc-buffering", &FgetwcBufferingTest },
    { "mkdtemp-failure", &MkdtempFailureTest },
    { "sscanf_long", &SscanfLongTest },
    { "tls_init", &TlsInitTest },
    { "sigprocmask-internal", &SigprocmaskInternalTest },
    { "regex-bracket-icase", &RegexBracketIcaseTest },
    { "dn_expand-ptr-0", &DnExpandPtr0Test },
    { "search_lsearch", &SearchLsearchTest },
    { "rlimit-open-files", &RlimitOpenFilesTest },
    { "inet_pton-empty-last-field", &InetPtonEmptyLastFieldTest },
    { "setpriority", &SetpriorityTest },
    { "vwarn", &VwarnTest },
    { "get_phys_pages", &GetPhysPagesTest },
    { "setpgrp", &SetpgrpTest },
    { "vwarnx", &VwarnxTest },
    { "get_avphys_pages", &GetAvphysPagesTest },
    { "issetugid", &IssetugidTest },
    { "atexit", &AtexitTest },
    { "verr", &VerrTest },
    { "__h_errno_location", &HErrnoLocationTest },
    { "readahead", &ReadaheadTest },
    { "verrx", &VerrxTest },
    { "getdtablesize", &GetdtablesizeTest },
    { "get_nprocs", &GetNprocsTest },
    { "__flt_rounds", &FltRoundsTest },
    { "gethostname", &GethostnameTest },
    { "sigpending", &SigpendingTest },
    { "sched_getcpu", &SchedGetcpuTest },
    { "supplementSetjmp", &SupplementSetjmpTest },
    { "ftw", &FtwTest },
    { "__gmtime64", &Gmtime64Test },
    { "wcsftime", &WcsftimeTest },
    { "string_memcpy", &StringMemcpyTest },
    { "device_api_version", &DeviceApiVersionTest },

    { "__aeabi_memclr", &AeabiMemclrTest },
    { "__aeabi_memcpy", &AeabiMemcpyTest },
    { "__aeabi_memmove", &AeabiMemmoveTest },
    { "__aeabi_read_tp", &AeabiReadTpTest },
    { "__ctype_get_mb_cur_max", &CtypeGetMbCurMaxTest },
    { "__fbufsize", &FbufsizeTest },
    { "__flbf", &FlbfTest },
    { "__fpclassifyf", &FpclassifyfTest },
    { "__fpclassifyl", &FpclassifylTest },
    { "__libc_current_sigrtmax", &LibcCurrentSigrtmaxTest },
    { "__libc_current_sigrtmin", &LibcCurrentSigrtminTest },
    { "__sched_cpucount", &SchedCpucountTest },
    { "__signbitf", &SignbitfTest },
    { "__signbitl", &SignbitlTest },
    { "__sigtimedwait_time64", &SigtimedwaitTime64Test },
    { "_longjmp", &LongjmpTest },
    { "abs", &AbsTest },
    { "acos", &AcosTest },
    { "acosh", &AcoshTest },
    { "acoshf", &AcoshfTest },
    { "acosl", &AcoslTest },
    { "alarm", &AlarmTest },
    { "aligned_alloc", &AlignedAllocTest },
    { "application_target_sdk_version_test", &ApplicationTargetSdkVersionTestTest },
    { "argv", &ArgvTest },
    { "asin", &AsinTest },
    { "asinf", &AsinfTest },
    { "asinh", &AsinhTest },
    { "asinhf", &AsinhfTest },
    { "asinl", &AsinlTest },
    { "at_quick_exit", &AtQuickExitTest },
    { "atan", &AtanTest },
    { "atan2", &Atan2Test },
    { "atan2f", &Atan2fTest },
    { "atan2l", &Atan2lTest },
    { "atanf", &AtanfTest },
    { "atanh", &AtanhTest },
    { "atanhf", &AtanhfTest },
    { "atanhl", &AtanhlTest },
    { "atanl", &AtanlTest },
    { "atof", &AtofTest },
    { "atoi", &AtoiTest },
    { "atoll", &AtollTest },
    { "brk", &BrkTest },
    { "bsearch", &BsearchTest },
    { "bzero", &BzeroTest },
    { "c16rtomb", &C16rtombTest },
    { "c32rtomb", &C32rtombTest },
    { "capget", &CapgetTest },
    { "cbrt", &CbrtTest },
    { "cbrtf", &CbrtfTest },
    { "cbrtl", &CbrtlTest },
    { "ceil", &CeilTest },
    { "ceilf", &CeilfTest },
    { "ceill", &CeillTest },
    { "cfgetispeed", &CfgetispeedTest },
    { "cfgetospeed", &CfgetospeedTest },
    { "cfmakeraw", &CfmakerawTest },
    { "cfsetispeed", &CfsetispeedTest },
    { "cfsetospeed", &CfsetospeedTest },
    { "chdir", &ChdirTest },
    { "clearerr", &ClearerrTest },
    { "clock", &ClockTest },
    { "clock_getcpuclockid", &ClockGetcpuclockidTest },
    { "clone", &CloneTest },
    { "cnd_init", &CndInitTest },
    { "cnd_signal", &CndSignalTest },
    { "copysign", &CopysignTest },
    { "copysignf", &CopysignfTest },
    { "copysignl", &CopysignlTest },
    { "cos", &CosTest },
    { "cosf", &CosfTest },
    { "cosh", &CoshTest },
    { "coshf", &CoshfTest },
    { "coshl", &CoshlTest },
    { "cosl", &CoslTest },
    { "crypt", &CryptTest },
    { "ctermid", &CtermidTest },
    { "ctime", &CtimeTest },
    { "ctime_r", &CtimeRTest },
    { "daemon-failure", &DaemonFailureTest },
    { "difftime_sup", &DifftimeSupTest },
    { "dn_comp", &DnCompTest },
    { "dn_skipname", &DnSkipnameTest },
    { "drand48", &Drand48Test },
    { "drem", &DremTest },
    { "dremf", &DremfTest },
    { "duplocale_sup", &DuplocaleSupTest },
    { "epoll_create", &EpollCreateTest },
    { "epoll_create1", &EpollCreate1Test },
    { "epoll_ctl", &EpollCtlTest },
    { "epoll_pwait", &EpollPwaitTest },
    { "epoll_wait", &EpollWaitTest },
    { "erand48", &Erand48Test },
    { "erf", &ErfTest },
    { "erfc", &ErfcTest },
    { "erfcf", &ErfcfTest },
    { "erff", &ErffTest },
    { "erfl", &ErflTest },
    { "eventfd", &EventfdTest },
    { "eventfd_read", &EventfdReadTest },
    { "eventfd_write", &EventfdWriteTest },
    { "execl", &ExeclTest },
    { "exp", &ExpTest },
    { "exp2", &Exp2Test },
    { "exp2f", &Exp2fTest },
    { "exp2l", &Exp2lTest },
    { "expf", &ExpfTest },
    { "expl", &ExplTest },
    { "expm1", &Expm1Test },
    { "expm1f", &Expm1fTest },
    { "expm1l", &Expm1lTest },
    { "fabs", &FabsTest },
    { "fabsf", &FabsfTest },
    { "fabsl", &FabslTest },
    { "fanotify_init", &FanotifyInitTest },
    { "fdiml", &FdimlTest },
    { "feholdexcept", &FeholdexceptTest },
    { "fexecve", &FexecveTest },
    { "fexecverely", &FexecverelyTest },
    { "fflush", &FflushTest },
    { "ffs", &FfsTest },
    { "ffsl", &FfslTest },
    { "ffsll", &FfsllTest },
    { "finitef", &FinitefTest },
    { "floor", &FloorTest },
    { "floorf", &FloorfTest },
    { "floorl", &FloorlTest },
    { "fmax", &FmaxTest },
    { "fmaxf", &FmaxfTest },
    { "fmaxl", &FmaxlTest },
    { "fpathconf", &FpathconfTest },
    { "freeaddrinfo", &FreeaddrinfoTest },
    { "freeifaddrs", &FreeifaddrsTest },
    { "frexp", &FrexpTest },
    { "frexpf", &FrexpfTest },
    { "frexpl", &FrexplTest },
    { "gai_strerror", &GaiStrerrorTest },
    { "getauxval", &GetauxvalTest },
    { "getcwd", &GetcwdTest },
    { "getdomainname", &GetdomainnameTest },
    { "getentropy", &GetentropyTest },
    { "getgrent", &GetgrentTest },
    { "getgrgid", &GetgrgidTest },
    { "getgrgid_r", &GetgrgidRTest },
    { "getgrnam", &GetgrnamTest },
    { "getgrnam_r", &GetgrnamRTest },
    { "getgrouplist", &GetgrouplistTest },
    { "getgroups", &GetgroupsTest },
    { "gethostbyaddr", &GethostbyaddrTest },
    { "gethostbyaddr_r", &GethostbyaddrRTest },
    { "gethostbyname2_r", &Gethostbyname2RTest },
    { "gethostent", &GethostentTest },
    { "getifaddrs", &GetifaddrsTest },
    { "getitimer", &GetitimerTest },
    { "getloadavg", &GetloadavgTest },
    { "getlogin", &GetloginTest },
    { "getlogin_r", &GetloginRTest },
    { "getnameinfo", &GetnameinfoTest },
    { "getnetent", &GetnetentTest },
    { "getopt", &GetoptTest },
    { "getopt_long", &GetoptLongTest },
    { "getopt_long_only", &GetoptLongOnlyTest },
    { "getpgid", &GetpgidTest },
    { "getpgrp", &GetpgrpTest },
    { "getppid", &GetppidTest },
    { "getrandom", &GetrandomTest },
    { "getresuid", &GetresuidTest },
    { "getrlimit", &GetrlimitTest },
    { "getservbyname", &GetservbynameTest },
    { "getservbyport", &GetservbyportTest },
    { "getsid", &GetsidTest },
    { "getsubopt", &GetsuboptTest },
    { "hasmntopt", &HasmntoptTest },
    { "hcreate_r", &HcreateRTest },
    { "hdestroy", &HdestroyTest },
    { "hsearch_r", &HsearchRTest },
    { "hstrerror", &HstrerrorTest },
    { "htonl", &HtonlTest },
    { "htons", &HtonsTest },
    { "hypot", &HypotTest },
    { "hypotf", &HypotfTest },
    { "hypotl", &HypotlTest },
    { "iconv-roundtrips", &IconvRoundtripsTest },
    { "iconv_open", &IconvOpenTest },
    { "iconv_test", &IconvTestTest },
    { "if_indextoname", &IfIndextonameTest },
    { "if_nameindex", &IfNameindexTest },
    { "ilogb", &IlogbTest },
    { "ilogbf", &IlogbfTest },
    { "ilogbl", &IlogblTest },
    { "imaxabs", &ImaxabsTest },
    { "imaxdiv", &ImaxdivTest },
    { "index", &IndexTest },
    { "inet_aton", &InetAtonTest },
    { "inet_lnaof", &InetLnaofTest },
    { "inet_makeaddr", &InetMakeaddrTest },
    { "inet_netof", &InetNetofTest },
    { "inet_network", &InetNetworkTest },
    { "inet_ntoa", &InetNtoaTest },
    { "inotify_init1", &InotifyInit1Test },
    { "invalid_param_b", &InvalidParamBTest },
    { "isalnum", &IsalnumTest },
    { "isalpha", &IsalphaTest },
    { "isascii", &IsasciiTest },
    { "isblank", &IsblankTest },
    { "iscntrl", &IscntrlTest },
    { "isdigit", &IsdigitTest },
    { "isgraph", &IsgraphTest },
    { "isless", &IslessTest },
    { "islower", &IslowerTest },
    { "isprint", &IsprintTest },
    { "ispunct", &IspunctTest },
    { "isspace", &IsspaceTest },
    { "isupper", &IsupperTest },
    { "iswalhpa", &IswalhpaTest },
    { "iswalnum", &IswalnumTest },
    { "iswctype", &IswctypeTest },
    { "iswctype_l", &IswctypeLTest },
    { "iswgraph", &IswgraphTest },
    { "isxdigit", &IsxdigitTest },
    { "kill", &KillTest },
    { "killpg", &KillpgTest },
    { "labs", &LabsTest },
    { "langinfo_sup", &LanginfoSupTest },
    { "large_size_test", &LargeSizeTestTest },
    { "lcong48", &Lcong48Test },
    { "ldiv", &LdivTest },
    { "link", &LinkTest },
    { "llabs", &LlabsTest },
    { "lldiv", &LldivTest },
    { "localeconv", &LocaleconvTest },
    { "localeconv_multithread", &LocaleconvMultithreadTest },
    { "login_tty", &LoginTtyTest },
    { "lrand48", &Lrand48Test },
    { "malloc-free-performance", &MallocFreePerformanceTest },
    { "malloc-multi-thread-performance", &MallocMultiThreadPerformanceTest },
    { "malloc_check_from_ptr", &MallocCheckFromPtrTest },
    { "malloc_usable_size", &MallocUsableSizeTest },
    { "mbc", &MbcTest },
    { "mblen", &MblenTest },
    { "mbrlen", &MbrlenTest },
    { "mbrtoc16", &Mbrtoc16Test },
    { "mbrtoc32", &Mbrtoc32Test },
    { "mbsinit", &MbsinitTest },
    { "mbsnrtowcs", &MbsnrtowcsTest },
    { "mbstowcs", &MbstowcsTest },
    { "mbtowc", &MbtowcTest },
    { "memalign", &MemalignTest },
    { "memccpy", &MemccpyTest },
    { "memchr", &MemchrTest },
    { "memfd_create", &MemfdCreateTest },
    { "memmove", &MemmoveTest },
    { "mempcpy", &MempcpyTest },
    { "mktemp", &MktempTest },
    { "mktime_sup", &MktimeSupTest },
    { "mlock", &MlockTest },
    { "mlock2", &Mlock2Test },
    { "mprotect", &MprotectTest },
    { "mrand48", &Mrand48Test },
    { "mtx_init", &MtxInitTest },
    { "mtx_lock", &MtxLockTest },
    { "munlock", &MunlockTest },
    { "nan", &NanTest },
    { "nanf", &NanfTest },
    { "nanl", &NanlTest },
    { "nativehook_test", &NativehookTestTest },
    { "newlocale", &NewlocaleTest },
    { "ohos_dfx_log", &OhosDfxLogTest },
    { "open_wmemstream", &OpenWmemstreamTest },
    { "pathconf", &PathconfTest },
    { "pause", &PauseTest },
    { "personality", &PersonalityTest },
    { "pipe2", &Pipe2Test },
    { "posix_memalign", &PosixMemalignTest },
    { "posix_spawn", &PosixSpawnTest },
    { "posix_spawnattr_getflags", &PosixSpawnattrGetflagsTest },
    { "posix_spawnattr_getpgroup", &PosixSpawnattrGetpgroupTest },
    { "posix_spawnattr_getsigdefault", &PosixSpawnattrGetsigdefaultTest },
    { "posix_spawnattr_getsigmask", &PosixSpawnattrGetsigmaskTest },
    { "posix_spawnattr_setflags", &PosixSpawnattrSetflagsTest },
    { "posix_spawnattr_setpgroup", &PosixSpawnattrSetpgroupTest },
    { "posix_spawnattr_setsigdefault", &PosixSpawnattrSetsigdefaultTest },
    { "posix_spawnattr_setsigmask", &PosixSpawnattrSetsigmaskTest },
    { "posix_spawnp", &PosixSpawnpTest },
    { "prctl", &PrctlTest },
    { "printf", &PrintfTest },
    { "prlimit", &PrlimitTest },
    { "proto", &ProtoTest },
    { "pselect", &PselectTest },
    { "psiginfo", &PsiginfoTest },
    { "psignal", &PsignalTest },
    { "pthread_atfork", &PthreadAtforkTest },
    { "pthread_attr_destroy", &PthreadAttrDestroyTest },
    { "pthread_attr_get", &PthreadAttrGetTest },
    { "pthread_attr_getstack_test", &PthreadAttrGetstackTestTest },
    { "pthread_attr_init", &PthreadAttrInitTest },
    { "pthread_attr_setguardsize", &PthreadAttrSetguardsizeTest },
    { "pthread_attr_setinheritsched", &PthreadAttrSetinheritschedTest },
    { "pthread_attr_setschedparam", &PthreadAttrSetschedparamTest },
    { "pthread_attr_setschedpolicy", &PthreadAttrSetschedpolicyTest },
    { "pthread_attr_setscope", &PthreadAttrSetscopeTest },
    { "pthread_attr_setstack", &PthreadAttrSetstackTest },
    { "pthread_attr_setstacksize_test", &PthreadAttrSetstacksizeTestTest },
    { "pthread_barrier_destroy", &PthreadBarrierDestroyTest },
    { "pthread_barrier_init", &PthreadBarrierInitTest },
    { "pthread_barrierattr_init", &PthreadBarrierattrInitTest },
    { "pthread_barrierattr_setpshared", &PthreadBarrierattrSetpsharedTest },
    { "pthread_cond_broadcast", &PthreadCondBroadcastTest },
    { "pthread_cond_destroy", &PthreadCondDestroyTest },
    { "pthread_cond_signal", &PthreadCondSignalTest },
    { "pthread_cond_wait", &PthreadCondWaitTest },
    { "pthread_condattr_destroy_test", &PthreadCondattrDestroyTestTest },
    { "pthread_condattr_init_test", &PthreadCondattrInitTestTest },
    { "pthread_condattr_setclock", &PthreadCondattrSetclockTest },
    { "pthread_condattr_setclock_sup", &PthreadCondattrSetclockSupTest },
    { "pthread_condattr_setpshared", &PthreadCondattrSetpsharedTest },
    { "pthread_getcpuclockid", &PthreadGetcpuclockidTest },
    { "pthread_getname_np", &PthreadGetnameNpTest },
    { "pthread_key_delete", &PthreadKeyDeleteTest },
    { "pthread_mutex_destroy", &PthreadMutexDestroyTest },
    { "pthread_mutex_init_test", &PthreadMutexInitTestTest },
    { "pthread_mutex_trylock", &PthreadMutexTrylockTest },
    { "pthread_mutexattr_destroy", &PthreadMutexattrDestroyTest },
    { "pthread_mutexattr_setprotocol", &PthreadMutexattrSetprotocolTest },
    { "pthread_mutexattr_setpshared", &PthreadMutexattrSetpsharedTest },
    { "pthread_mutexattr_settype", &PthreadMutexattrSettypeTest },
    { "pthread_rwlock_destroy_test", &PthreadRwlockDestroyTestTest },
    { "pthread_rwlock_rdlock_sup", &PthreadRwlockRdlockSupTest },
    { "pthread_rwlock_tryrdlock", &PthreadRwlockTryrdlockTest },
    { "pthread_rwlock_trywrlock", &PthreadRwlockTrywrlockTest },
    { "pthread_rwlockattr_destroy", &PthreadRwlockattrDestroyTest },
    { "pthread_rwlockattr_init", &PthreadRwlockattrInitTest },
    { "pthread_rwlockattr_setpshared", &PthreadRwlockattrSetpsharedTest },
    { "pthread_sigmask_test", &PthreadSigmaskTestTest },
    { "ptsname", &PtsnameTest },
    { "putc_unlocked", &PutcUnlockedTest },
    { "putchar", &PutcharTest },
    { "putchar_unlocked", &PutcharUnlockedTest },
    { "putenv", &PutenvTest },
    { "puts", &PutsTest },
    { "putwchar", &PutwcharTest },
    { "quick_exit", &QuickExitTest },
    { "quotactl", &QuotactlTest },
    { "raise-race", &RaiseRaceTest },
    { "rand", &RandTest },
    { "rand_r", &RandRTest },
    { "readdir", &ReaddirTest },
    { "realloc", &ReallocTest },
    { "realpath", &RealpathTest },
    { "regexec", &RegexecTest },
    { "rint_ext", &RintExtTest },
    { "sched_getaffinity", &SchedGetaffinityTest },
    { "sched_getparam", &SchedGetparamTest },
    { "sched_scheduler", &SchedSchedulerTest },
    { "sched_setaffinity", &SchedSetaffinityTest },
    { "sched_yield", &SchedYieldTest },
    { "search_hsearch", &SearchHsearchTest },
    { "seed48", &Seed48Test },
    { "sendmsg", &SendmsgTest },
    { "setfsgid", &SetfsgidTest },
    { "setfsuid", &SetfsuidTest },
    { "setgrent", &SetgrentTest },
    { "setlocale", &SetlocaleTest },
    { "setlogmask", &SetlogmaskTest },
    { "setprotoent", &SetprotoentTest },
    { "setpwent", &SetpwentTest },
    { "setsid", &SetsidTest },
    { "sigaction", &SigactionTest },
    { "sigaltstack", &SigaltstackTest },
    { "sigignore", &SigignoreTest },
    { "signalfd", &SignalfdTest },
    { "significand", &SignificandTest },
    { "significandf", &SignificandfTest },
    { "sigqueue", &SigqueueTest },
    { "sigwait", &SigwaitTest },
    { "sigwaitinfo", &SigwaitinfoTest },
    { "sleep", &SleepTest },
    { "socketpair", &SocketpairTest },
    { "sprintf", &SprintfTest },
    { "srand", &SrandTest },
    { "srand48", &Srand48Test },
    { "strcasecmp", &StrcasecmpTest },
    { "strcasestr", &StrcasestrTest },
    { "strcat", &StrcatTest },
    { "strchrnul", &StrchrnulTest },
    { "strcoll", &StrcollTest },
    { "strdup", &StrdupTest },
    { "strerror", &StrerrorTest },
    { "strerror_r", &StrerrorRTest },
    { "strftime", &StrftimeTest },
    { "string_strstr", &StringStrstrTest },
    { "strlen_test", &StrlenTestTest },
    { "strndup", &StrndupTest },
    { "strnlen", &StrnlenTest },
    { "strptime", &StrptimeTest },
    { "strsep", &StrsepTest },
    { "strsignal", &StrsignalTest },
    { "strtod_l", &StrtodLTest },
    { "strtoimax", &StrtoimaxTest },
    { "strtol", &StrtolTest },
    { "strtold", &StrtoldTest },
    { "strtoumax", &StrtoumaxTest },
    { "swscanf", &SwscanfTest },
    { "sys_queue", &SysQueueTest },
    { "sysconf", &SysconfTest },
    { "sysinfo", &SysinfoTest },
    { "tempnam", &TempnamTest },
    { "thrd_yield", &ThrdYieldTest },
    { "timer_delete", &TimerDeleteTest },
    { "timerfd_create", &TimerfdCreateTest },
    { "times", &TimesTest },
    { "tmpnam", &TmpnamTest },
    { "toascii", &ToasciiTest },
    { "towctrans", &TowctransTest },
    { "tss_set", &TssSetTest },
    { "udiv", &UdivTest },
    { "umask", &UmaskTest },
    { "uname", &UnameTest },
    { "unittest_backtrace", &UnittestBacktraceTest },
    { "unittest_fatal_message_assert_fail", &UnittestFatalMessageAssertFailTest },
    { "uselocale", &UselocaleTest },
    { "usleep", &UsleepTest },
    { "vasprintf", &VasprintfTest },
    { "vmsplice", &VmspliceTest },
    { "vprintf", &VprintfTest },
    { "vsnprintf", &VsnprintfTest },
    { "vsprintf", &VsprintfTest },
    { "vsscanf", &VsscanfTest },
    { "vswprintf", &VswprintfTest },
    { "vswscanf", &VswscanfTest },
    { "vwprintf", &VwprintfTest },
    { "waitid", &WaitidTest },
    { "wcpcpy", &WcpcpyTest },
    { "wcscasecmp", &WcscasecmpTest },
    { "wcscasecmp_l", &WcscasecmpLTest },
    { "wcschr", &WcschrTest },
    { "wcscmp", &WcscmpTest },
    { "wcscoll", &WcscollTest },
    { "wcscspn", &WcscspnTest },
    { "wcsftime_l", &WcsftimeLTest },
    { "wcslen", &WcslenTest },
    { "wcsncasecmp", &WcsncasecmpTest },
    { "wcsncasecmp_l", &WcsncasecmpLTest },
    { "wcsncat", &WcsncatTest },
    { "wcsncmp", &WcsncmpTest },
    { "wcsnlen", &WcsnlenTest },
    { "wcsrchr", &WcsrchrTest },
    { "wcsrtombs", &WcsrtombsTest },
    { "wcsspn", &WcsspnTest },
    { "wcsstr", &WcsstrTest },
    { "wcstod", &WcstodTest },
    { "wcstod_l", &WcstodLTest },
    { "wcstof", &WcstofTest },
    { "wcstok", &WcstokTest },
    { "wcstol", &WcstolTest },
    { "wcstold", &WcstoldTest },
    { "wcstoll", &WcstollTest },
    { "wcstombs", &WcstombsTest },
    { "wcstoull", &WcstoullTest },
    { "wcswcs", &WcswcsTest },
    { "wcswidth", &WcswidthTest },
    { "wcsxfrm", &WcsxfrmTest },
    { "wctob", &WctobTest },
    { "wctomb", &WctombTest },
    { "wctrans", &WctransTest },
    { "wctype", &WctypeTest },
    { "wcwidth", &WcwidthTest },
    { "wmemchr", &WmemchrTest },
    { "wmemcmp", &WmemcmpTest },
    { "wmemcpy", &WmemcpyTest },
    { "wmemmove", &WmemmoveTest },
    { "wmemset", &WmemsetTest },
    { "wprintf", &WprintfTest },
    { "writev", &WritevTest },
};
} // namespace

static int (*FindByName(const std::string& name))()
{
    auto it = kTestRegistry.find(name);
    if (it == kTestRegistry.end()) {
        return nullptr;
    }
    return it->second;
}

static int RunByNameForked(const std::string& name)
{
    auto* testFunc = FindByName(name);
    if (testFunc == nullptr) {
        return -K_RUN_TEST_NOT_FOUND;
    }

    pid_t pid = fork();
    if (pid < 0) {
        return -K_RUN_TEST_FORK_FAILED;
    }
    if (pid == 0) {
        OHPrintf("start testcase,name=%s,t_state=%d", name.c_str(), T_STATUS);
        int childRc = K_CHILD_EXIT_CAP;
        try {
            childRc = testFunc();
            OHPrintf("end testcase,name=%s,t_state=%d", name.c_str(), T_STATUS);
        } catch (...) {
            OHPrintf("end testcase,name=%s,t_state=%d", name.c_str(), T_STATUS);
            _exit(K_CHILD_EXIT_CAP);
        }
        if (childRc < 0) {
            _exit(K_CHILD_EXIT_CAP);
        }
        if (childRc > K_CHILD_EXIT_CAP) {
            _exit(K_CHILD_EXIT_CAP);
        }
        _exit(childRc);
    }

    int status = 0;
    if (waitpid(pid, &status, 0) < 0) {
        return -K_RUN_TEST_WAITPID_FAILED;
    }
    if (WIFEXITED(status)) {
        return WEXITSTATUS(status);
    }
    if (WIFSIGNALED(status)) {
        return K_SIGNAL_EXIT_BASE + WTERMSIG(status);
    }
    return -K_RUN_TEST_UNKNOWN_EXIT;
}

static napi_value RunTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        size_t argc = 1;
        napi_value args[1] = { nullptr };
        napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
        if (argc < 1) {
            napi_throw_type_error(env, nullptr, "Argument missing");
            return nullptr;
        }

        size_t len = 0;
        napi_status st = napi_get_value_string_utf8(env, args[0], nullptr, 0, &len);
        if (st != napi_ok) {
            napi_throw_type_error(env, nullptr, "Argument must be a string");
            return nullptr;
        }

        std::string name;
        name.resize(len + 1); // keep an extra '\0' for safety
        napi_get_value_string_utf8(env, args[0], &name[0], name.size(), &len);
        name.resize(len);

        int rc = RunByNameForked(name);
        napi_value result;
        napi_create_int32(env, rc, &result);
        return result;
    });
}

struct AsyncRunTestContext {
    napi_env env;
    napi_async_work work;
    napi_deferred deferred;
    std::string name;
    int rc;
};

static void ExecuteRunTestAsync(napi_env env, void* data)
{
    (void)env;
    auto* ctx = static_cast<AsyncRunTestContext*>(data);
    ctx->rc = RunByNameForked(ctx->name);
}

static void CompleteRunTestAsync(napi_env env, napi_status status, void* data)
{
    auto* ctx = static_cast<AsyncRunTestContext*>(data);
    napi_value result = nullptr;
    if (status == napi_ok) {
        napi_create_int32(env, ctx->rc, &result);
        napi_resolve_deferred(env, ctx->deferred, result);
    } else {
        napi_value msg = nullptr;
        napi_create_string_utf8(env, "runTestAsync failed", NAPI_AUTO_LENGTH, &msg);
        napi_reject_deferred(env, ctx->deferred, msg);
    }
    napi_delete_async_work(env, ctx->work);
    delete ctx;
}

static napi_value RunTestAsync(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        OHPrintf("start testcase,22222333");

        size_t argc = 1;
        napi_value args[1] = { nullptr };
        napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
        if (argc < 1) {
            napi_throw_type_error(env, nullptr, "Argument missing");
            return nullptr;
        }

        size_t len = 0;
        napi_status st = napi_get_value_string_utf8(env, args[0], nullptr, 0, &len);
        if (st != napi_ok) {
            napi_throw_type_error(env, nullptr, "Argument must be a string");
            return nullptr;
        }

        auto* ctx = new AsyncRunTestContext();
        ctx->env = env;
        ctx->rc = -1;
        ctx->name.resize(len + 1);
        napi_get_value_string_utf8(env, args[0], &ctx->name[0], ctx->name.size(), &len);
        ctx->name.resize(len);

        napi_value promise = nullptr;
        napi_create_promise(env, &ctx->deferred, &promise);

        napi_value resourceName = nullptr;
        napi_create_string_utf8(env, "runTestAsync", NAPI_AUTO_LENGTH, &resourceName);
        napi_create_async_work(env, nullptr, resourceName, ExecuteRunTestAsync, CompleteRunTestAsync, ctx, &ctx->work);
        napi_queue_async_work(env, ctx->work);

        return promise;
    });
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "runTest", nullptr, RunTestAsync, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "runTestAsync", nullptr, RunTestAsync, nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = nullptr,
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
