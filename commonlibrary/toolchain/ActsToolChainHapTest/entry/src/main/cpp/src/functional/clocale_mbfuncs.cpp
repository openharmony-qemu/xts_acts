#include <stdio.h>
#include <string.h>
#include <wchar.h>
#include <wctype.h>
#include <stdlib.h>
#include <locale.h>
#include <langinfo.h>
#include <limits.h>
#include "test.h"

#define MAP_SIZE 257
#define CHAR_RANGE 256
#define MAX_ERRORS 50
#define UNICODE_MAX 0x110000
#define EXPECTED_SIZE 255
#define HIGH_BYTE_START 128

int ClocaleMbfuncsTest(void)
{
    int i, j;
    mbstate_t st, st2;
    wchar_t wc, map[MAP_SIZE], wtmp[MAP_SIZE];
    char s[MB_LEN_MAX * CHAR_RANGE];
    size_t rv;
    int c;
    int ni_errors = 0;

    setlocale(LC_CTYPE, "C");

    if (MB_CUR_MAX != 1) {
        t_error("MB_CUR_MAX = %d, expected 1\n", static_cast<int>(MB_CUR_MAX));
    }

    for (i = 0; i < CHAR_RANGE; i++) {
        st = (mbstate_t){0};
        char ch = static_cast<char>(i);
        if (mbrtowc(&wc, &ch, 1, &st) != !!i)
            t_error("mbrtowc failed to convert byte %.2x to wchar_t\n", i);
        if ((map[i] = btowc(i)) == WEOF) {
            t_error("btowc failed to convert byte %.2x to wchar_t\n", i);
            continue;
        }
        for (j = 0; j < i; j++) {
            if (map[j] == map[i])
                t_error("bytes %.2x and %.2x map to same wchar_t %.4x\n", j, i, static_cast<unsigned>(map[i]));
        }
    }

    for (i = 0; i < CHAR_RANGE; i++) {
        if (map[i] == WEOF) {
            continue;
        }
        if (wctob(map[i]) != i)
            t_error("wctob failed to convert wchar_t %.4x back to byte %.2x\n", static_cast<unsigned>(map[i]), i);
    }

    /* covering whole 32-bit range would be too slow... maybe add random high tests? */
    for (i = 0; i < UNICODE_MAX; i++) {
        if (wcschr(map + 1, i)) {
            continue;
        }
        if ((c = wctob(i)) != WEOF && ni_errors++ < MAX_ERRORS)
            t_error("wctob accepted non-image wchar_t %.4x as byte %.2x\n", i, c);
        st = (mbstate_t){0};
        if (wcrtomb(s, i, &st) != -1 && ni_errors++ < MAX_ERRORS)
            t_error("wcrtomb accepted non-image wchar_t %.4x\n", i);
    }
    if (ni_errors > MAX_ERRORS) {
        t_error("additional %d non-image errors (not printed)\n", ni_errors);
    }

    map[CHAR_RANGE] = 0;
    st = (mbstate_t){0};
    const wchar_t* srcWc = map + 1;
    if ((rv = wcsrtombs(s, &srcWc, sizeof s, &st)) != EXPECTED_SIZE)
        t_error("wcsrtombs returned %zd, expected 255\n", rv);
    const char* srcMb = s;
    if ((rv = mbsrtowcs(wtmp, &srcMb, CHAR_RANGE, &st)) != EXPECTED_SIZE)
        t_error("mbsrtowcs returned %zd, expected 255\n", rv);
    if (memcmp(map + 1, wtmp, CHAR_RANGE * sizeof(*map)))
        t_error("wcsrtombs/mbsrtowcs round trip failed\n");

    for (i = HIGH_BYTE_START; i < CHAR_RANGE; i++) {
        if (iswalnum(map[i])) {
            t_error("iswalnum returned true for %.4x (%.2x)\n", map[i], i);
        }
        if (iswalpha(map[i])) {
            t_error("iswalpha returned true for %.4x (%.2x)\n", map[i], i);
        }
        if (iswblank(map[i])) {
            t_error("iswblank returned true for %.4x (%.2x)\n", map[i], i);
        }
        if (iswcntrl(map[i])) {
            t_error("iswcntrl returned true for %.4x (%.2x)\n", map[i], i);
        }
        if (iswdigit(map[i])) {
            t_error("iswdigit returned true for %.4x (%.2x)\n", map[i], i);
        }
        if (iswgraph(map[i])) {
            t_error("iswgraph returned true for %.4x (%.2x)\n", map[i], i);
        }
        if (iswlower(map[i])) {
            t_error("iswlower returned true for %.4x (%.2x)\n", map[i], i);
        }
        if (iswprint(map[i])) {
            t_error("iswprint returned true for %.4x (%.2x)\n", map[i], i);
        }
        if (iswpunct(map[i])) {
            t_error("iswpunct returned true for %.4x (%.2x)\n", map[i], i);
        }
        if (iswspace(map[i])) {
            t_error("iswspace returned true for %.4x (%.2x)\n", map[i], i);
        }
        if (iswupper(map[i])) {
            t_error("iswupper returned true for %.4x (%.2x)\n", map[i], i);
        }
        if (iswxdigit(map[i])) {
            t_error("iswxdigit returned true for %.4x (%.2x)\n", map[i], i);
        }
    }

    return g_tStatus;
}
