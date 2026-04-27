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


#ifndef TEST_H
#define TEST_H
 
#include <stdint.h>
#include <unistd.h>
#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif


/* Note: g_tStatus is not thread-safe nor fork-safe */
extern volatile int g_tStatus;

#define T_LOC2(l) __FILE__ ":" #l
#define T_LOC1(l) T_LOC2(l)
#define t_error(...) TPrintf(T_LOC1(__LINE__) ": " __VA_ARGS__)

int TPrintf(const char *s, ...);

int TVmfill(void **, size_t *, int);
int t_memfill(void);

void t_fdfill(void);

void t_randseed(uint64_t s);
uint64_t t_randn(uint64_t n);
uint64_t t_randint(uint64_t a, uint64_t b);
void t_shuffle(uint64_t* p, size_t n);
void t_randrange(uint64_t* p, size_t n);
int t_choose(uint64_t n, size_t k, uint64_t* p);

char* t_pathrel(char* buf, size_t n, char* argv0, char* p);

int t_setrlim(int r, long lim);

int t_setutf8(void);

void check_log(const char* file, const char* pattern, bool regex_match);
void clear_log(const char* log_dir, const char* file_tag);
// Use the file_tag to match all the files in log_dir, and then check if the file contain pattern.
void find_and_check_file(const char* log_dir, const char* file_tag, const char* pattern, bool regex_match);

#define TEST_MODE 0666

#ifdef __cplusplus
}
#endif

#endif // TEST_H
