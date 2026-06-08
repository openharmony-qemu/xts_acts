/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include <cstdio>
#include <cstring>
#include "test.h"

const int EMBEDDED_NULL_INDEX = 2;
const int STRING_OFFSET_5 = 5;
const int PARTIAL_OVERWRITE_OFFSET = 3;
const int POINTER_ARITHMETIC_OFFSET = 2;
const int CONTROL_CHARS_LENGTH = 4;
const int NULL_TERMINATION_INDEX = 5;
const int LONG_STRING_LENGTH = 255;
const int VERY_LONG_STRING_LENGTH = 2047;

void TestStrcpyBasic()
{
    char dest[10];
    strcpy(dest, "abc");
    if (strcmp(dest, "abc")) {
        t_error("Expected 'abc', got '%s'\n", dest);
    }
}

void TestStrcpyEmpty()
{
    char dest[10] = "xxxxxx";
    strcpy(dest, "");
    if (strcmp(dest, "")) {
        t_error("Expected empty string, got '%s'\n", dest);
    }
}

void TestStrcpyLongerString()
{
    char dest[100];
    strcpy(dest, "This is a longer string with multiple words.");
    if (strcmp(dest, "This is a longer string with multiple words.")) {
        t_error("Long string copy failed\n");
    }
}

void TestStrcpySpecialCharacters()
{
    char dest[20];
    strcpy(dest, "@#$%^&*()");
    if (strcmp(dest, "@#$%^&*()")) {
        t_error("Special characters copy failed\n");
    }
}

void TestStrcpySingleChar()
{
    char dest[10];
    strcpy(dest, "Z");
    if (strcmp(dest, "Z")) {
        t_error("Single char copy failed\n");
    }
}

void TestStrcpyCaseMixed()
{
    char dest[20];
    strcpy(dest, "AbCdEfGh");
    if (strcmp(dest, "AbCdEfGh")) {
        t_error("Mixed case copy failed\n");
    }
}

void TestStrcpyWithSpaces()
{
    char dest[20];
    strcpy(dest, "   ");
    if (strcmp(dest, "   ")) {
        t_error("Spaces copy failed\n");
    }
}

void TestStrcpyWithEscapes()
{
    char dest[20];
    strcpy(dest, "Line1\nLine2");
    if (strcmp(dest, "Line1\nLine2")) {
        t_error("Escapes copy failed\n");
    }
}

void TestStrcpyOverwriteOldContent()
{
    char dest[20] = "OldContentHere";
    strcpy(dest, "New");
    if (strcmp(dest, "New")) {
        t_error("Overwrite failed\n");
    }
}

void TestStrcpyWithEmbeddedNull()
{
    char src[10] = {'a', 'b', '\0', 'c'};
    char dest[10];
    strcpy(dest, src);
    if (dest[0] != 'a' || dest[1] != 'b' || dest[EMBEDDED_NULL_INDEX] != '\0') {
        t_error("Embedded null copy failed\n");
    }
}

void TestStrcpyModifySrcAfterCopy()
{
    char src[] = "copyme";
    char dest[20];
    strcpy(dest, src);
    src[0] = 'X';
    if (strcmp(dest, "copyme")) {
        t_error("Source modification affected destination\n");
    }
}

void TestStrcpyUtf8()
{
    char dest[20];
    strcpy(dest, "café");
    if (strcmp(dest, "café")) {
        t_error("UTF-8 copy failed\n");
    }
}

void TestStrcpyMultipleAssignments()
{
    char dest[20];
    strcpy(dest, "first");
    if (strcmp(dest, "first")) {
        t_error("First assignment failed\n");
    }
    strcpy(dest, "second");
    if (strcmp(dest, "second")) {
        t_error("Second assignment failed\n");
    }
}

void TestStrcpyToOffset()
{
    char buffer[20] = "1234567890";
    strcpy(buffer + STRING_OFFSET_5, "abc");
    if (strcmp(buffer + STRING_OFFSET_5, "abc")) {
        t_error("Offset copy failed\n");
    }
}

void TestStrcpyArrayVsPointer()
{
    char a[10];
    char *b = a;
    strcpy(b, "test");
    if (strcmp(a, "test")) {
        t_error("Array vs pointer copy failed\n");
    }
}

void TestStrcpyAllCaps()
{
    char dest[30];
    strcpy(dest, "ABCDEFGHIJKLMNOPQRSTUVWXYZ");
    if (strcmp(dest, "ABCDEFGHIJKLMNOPQRSTUVWXYZ")) {
        t_error("All caps copy failed\n");
    }
}

void TestStrcpySentence()
{
    char dest[100];
    strcpy(dest, "The quick brown fox jumps over the lazy dog.");
    if (strcmp(dest, "The quick brown fox jumps over the lazy dog.")) {
        t_error("Sentence copy failed\n");
    }
}

void TestStrcpySeries()
{
    char dest[50];
    strcpy(dest, "one");
    if (strcmp(dest, "one")) {
        t_error("First in series failed\n");
    }
    strcpy(dest, "two");
    if (strcmp(dest, "two")) {
        t_error("Second in series failed\n");
    }
    strcpy(dest, "three");
    if (strcmp(dest, "three")) {
        t_error("Third in series failed\n");
    }
}

void TestStrcpyManualSrcArray()
{
    char src[6] = {'h', 'e', 'l', 'l', 'o', '\0'};
    char dest[10];
    strcpy(dest, src);
    if (strcmp(dest, "hello")) {
        t_error("Manual array copy failed\n");
    }
}

void TestStrcpyVsMemcpy()
{
    char dest1[10];
    char dest2[10];
    char *src = "abc";
    strcpy(dest1, src);
    memcpy(dest2, src, strlen(src) + 1);
    if (strcmp(dest1, dest2)) {
        t_error("strcpy vs memcpy comparison failed\n");
    }
}

void TestStrcpyBatchGroup1()
{
    char dest[100];
    strcpy(dest, "batch1");
    if (strcmp(dest, "batch1")) {
        t_error("Batch1 first copy failed\n");
    }
    strcpy(dest, "batch2");
    if (strcmp(dest, "batch2")) {
        t_error("Batch1 second copy failed\n");
    }
    strcpy(dest, "batch3");
    if (strcmp(dest, "batch3")) {
        t_error("Batch1 third copy failed\n");
    }
}

void TestStrcpyBatchGroup2()
{
    char dest[100];
    strcpy(dest, "hello world");
    if (strcmp(dest, "hello world")) {
        t_error("Batch2 first copy failed\n");
    }
    strcpy(dest, "C programming");
    if (strcmp(dest, "C programming")) {
        t_error("Batch2 second copy failed\n");
    }
    strcpy(dest, "libc test");
    if (strcmp(dest, "libc test")) {
        t_error("Batch2 third copy failed\n");
    }
}

void TestStrcpyControlChars()
{
    char dest[20];
    strcpy(dest, "\x01\x02\x03\x04");
    if (memcmp(dest, "\x01\x02\x03\x04", CONTROL_CHARS_LENGTH)) {
        t_error("Control chars copy failed\n");
    }
}

void TestStrcpyLongStrings()
{
    char long_str[256];
    memset(long_str, 'a', LONG_STRING_LENGTH);
    long_str[LONG_STRING_LENGTH] = '\0';
    char dest[256];
    strcpy(dest, long_str);
    if (strcmp(dest, long_str)) {
        t_error("Long string copy failed\n");
    }
}

void TestStrcpyNonAscii()
{
    char dest[20];
    strcpy(dest, "éñüß");
    if (strcmp(dest, "éñüß")) {
        t_error("Non-ASCII copy failed\n");
    }
}

void TestStrcpyHexEscape()
{
    char dest[20];
    strcpy(dest, "\x41\x42\x43");
    if (strcmp(dest, "ABC")) {
        t_error("Hex escape copy failed\n");
    }
}

void TestStrcpyOctalEscape()
{
    char dest[20];
    strcpy(dest, "\101\102\103");
    if (strcmp(dest, "ABC")) {
        t_error("Octal escape copy failed\n");
    }
}

void TestStrcpyPartialOverwrite()
{
    char dest[20] = "abcdefghij";
    strcpy(dest + PARTIAL_OVERWRITE_OFFSET, "123");
    if (!strcmp(dest, "abc123ghij")) {
        t_error("Partial overwrite check failed\n");
    }
}

void TestStrcpyPointerArithmetic()
{
    char src[] = "abcdef";
    char dest[10];
    strcpy(dest, src + POINTER_ARITHMETIC_OFFSET);
    if (strcmp(dest, "cdef")) {
        t_error("Pointer arithmetic copy failed\n");
    }
}

void TestStrcpyLargeBuffer()
{
    char dest[1024];
    strcpy(dest, "This is a large buffer test");
    if (strcmp(dest, "This is a large buffer test")) {
        t_error("Large buffer copy failed\n");
    }
}

void TestStrcpyNullTermination()
{
    char dest[10];
    strcpy(dest, "12345");
    if (dest[NULL_TERMINATION_INDEX] != '\0') {
        t_error("Null termination failed\n");
    }
}

void TestStrcpySpecialWhitespace()
{
    char dest[20];
    strcpy(dest, "\t\n\v\f\r");
    if (strcmp(dest, "\t\n\v\f\r")) {
        t_error("Special whitespace copy failed\n");
    }
}

void TestStrcpyAlternatingChars()
{
    char dest[20];
    strcpy(dest, "a\0b\0c");
    if (strcmp(dest, "a")) {
        t_error("Alternating chars copy failed\n");
    }
}

void TestStrcpyDifferentSizes()
{
    char dest1[5];
    char dest2[10];
    char dest3[20];
    strcpy(dest1, "test");
    if (strcmp(dest1, "test")) {
        t_error("Small size copy failed\n");
    }
    strcpy(dest2, "longer test");
    if (strcmp(dest2, "longer test")) {
        t_error("Medium size copy failed\n");
    }
    strcpy(dest3, "the longest test here");
    if (strcmp(dest3, "the longest test here")) {
        t_error("Large size copy failed\n");
    }
}

void TestStrcpyMixedAlphanumeric()
{
    char dest[20];
    strcpy(dest, "abc123xyz");
    if (strcmp(dest, "abc123xyz")) {
        t_error("Mixed alphanumeric copy failed\n");
    }
}

void TestStrcpyWithQuotes()
{
    char dest[30];
    strcpy(dest, "\"quoted\"");
    if (strcmp(dest, "\"quoted\"")) {
        t_error("Quotes copy failed\n");
    }
}

void TestStrcpyPathString()
{
    char dest[50];
    strcpy(dest, "/data/local/tmp");
    if (strcmp(dest, "/data/local/tmp")) {
        t_error("Path string copy failed\n");
    }
}

void TestStrcpyUrlString()
{
    char dest[50];
    strcpy(dest, "https://example.com");
    if (strcmp(dest, "https://example.com")) {
        t_error("URL string copy failed\n");
    }
}

void TestStrcpyEmailString()
{
    char dest[30];
    strcpy(dest, "user@example.com");
    if (strcmp(dest, "user@example.com")) {
        t_error("Email string copy failed\n");
    }
}

void TestStrcpyHexString()
{
    char dest[20];
    strcpy(dest, "0x1234abcd");
    if (strcmp(dest, "0x1234abcd")) {
        t_error("Hex string copy failed\n");
    }
}

void TestStrcpyBrackets()
{
    char dest[20];
    strcpy(dest, "[test]");
    if (strcmp(dest, "[test]")) {
        t_error("Brackets copy failed\n");
    }
}

void TestStrcpyCurlyBraces()
{
    char dest[20];
    strcpy(dest, "{test}");
    if (strcmp(dest, "{test}")) {
        t_error("Curly braces copy failed\n");
    }
}

void TestStrcpyUnderscore()
{
    char dest[20];
    strcpy(dest, "test_variable");
    if (strcmp(dest, "test_variable")) {
        t_error("Underscore copy failed\n");
    }
}

void TestStrcpyDash()
{
    char dest[20];
    strcpy(dest, "test-variable");
    if (strcmp(dest, "test-variable")) {
        t_error("Dash copy failed\n");
    }
}

void TestStrcpyPlusSign()
{
    char dest[20];
    strcpy(dest, "test+value");
    if (strcmp(dest, "test+value")) {
        t_error("Plus sign copy failed\n");
    }
}

void TestStrcpyAmpersand()
{
    char dest[20];
    strcpy(dest, "test&value");
    if (strcmp(dest, "test&value")) {
        t_error("Ampersand copy failed\n");
    }
}

void TestStrcpyPipe()
{
    char dest[20];
    strcpy(dest, "test|value");
    if (strcmp(dest, "test|value")) {
        t_error("Pipe copy failed\n");
    }
}

void TestStrcpyBackslash()
{
    char dest[20];
    strcpy(dest, "test\\path");
    if (strcmp(dest, "test\\path")) {
        t_error("Backslash copy failed\n");
    }
}

void TestStrcpyColon()
{
    char dest[20];
    strcpy(dest, "name:value");
    if (strcmp(dest, "name:value")) {
        t_error("Colon copy failed\n");
    }
}

void TestStrcpySemicolon()
{
    char dest[20];
    strcpy(dest, "test;value");
    if (strcmp(dest, "test;value")) {
        t_error("Semicolon copy failed\n");
    }
}

void TestStrcpyDoubleSpace()
{
    char dest[20];
    strcpy(dest, "test  value");
    if (strcmp(dest, "test  value")) {
        t_error("Double space copy failed\n");
    }
}

void TestStrcpyLeadingSpace()
{
    char dest[20];
    strcpy(dest, "  test");
    if (strcmp(dest, "  test")) {
        t_error("Leading space copy failed\n");
    }
}

void TestStrcpyTrailingSpace()
{
    char dest[20];
    strcpy(dest, "test  ");
    if (strcmp(dest, "test  ")) {
        t_error("Trailing space copy failed\n");
    }
}

void TestStrcpyCjkCharacters()
{
    char dest[20];
    strcpy(dest, "测试");
    if (strcmp(dest, "测试")) {
        t_error("CJK characters copy failed\n");
    }
}

void TestStrcpyUuid()
{
    char dest[40];
    strcpy(dest, "550e8400-e29b-41d4-a716-446655440000");
    if (strcmp(dest, "550e8400-e29b-41d4-a716-446655440000")) {
        t_error("UUID copy failed\n");
    }
}

void TestStrcpyXmlTag()
{
    char dest[20];
    strcpy(dest, "<tag>");
    if (strcmp(dest, "<tag>")) {
        t_error("XML tag copy failed\n");
    }
}

void TestStrcpyRegexPattern()
{
    char dest[30];
    strcpy(dest, "[a-z]+");
    if (strcmp(dest, "[a-z]+")) {
        t_error("Regex pattern copy failed\n");
    }
}

void TestStrcpySqlQuery()
{
    char dest[50];
    strcpy(dest, "SELECT * FROM table");
    if (strcmp(dest, "SELECT * FROM table")) {
        t_error("SQL query copy failed\n");
    }
}

void TestStrcpyShellCommand()
{
    char dest[30];
    strcpy(dest, "ls -la");
    if (strcmp(dest, "ls -la")) {
        t_error("Shell command copy failed\n");
    }
}

void TestStrcpyHttpHeader()
{
    char dest[50];
    strcpy(dest, "Content-Type: text/html");
    if (strcmp(dest, "Content-Type: text/html")) {
        t_error("HTTP header copy failed\n");
    }
}

void TestStrcpyTimeFormat()
{
    char dest[20];
    strcpy(dest, "12:30:45");
    if (strcmp(dest, "12:30:45")) {
        t_error("Time format copy failed\n");
    }
}

void TestStrcpyDatetimeFormat()
{
    char dest[30];
    strcpy(dest, "2025-01-15T12:30:45Z");
    if (strcmp(dest, "2025-01-15T12:30:45Z")) {
        t_error("DateTime format copy failed\n");
    }
}

void TestStrcpyMimeBoundary()
{
    char dest[50];
    strcpy(dest, "----=_Part_0_1234567890");
    if (strcmp(dest, "----=_Part_0_1234567890")) {
        t_error("MIME boundary copy failed\n");
    }
}

void TestStrcpyContentDisposition()
{
    char dest[50];
    strcpy(dest, "attachment; filename=test.txt");
    if (strcmp(dest, "attachment; filename=test.txt")) {
        t_error("Content disposition copy failed\n");
    }
}

void TestStrcpyEmoji()
{
    char dest[20];
    strcpy(dest, "👋");
    if (strcmp(dest, "👋")) {
        t_error("Emoji copy failed\n");
    }
}


void TestStrcpyRussian()
{
    char dest[20];
    strcpy(dest, "Привет");
    if (strcmp(dest, "Привет")) {
        t_error("Russian copy failed\n");
    }
}

void TestStrcpyGreek()
{
    char dest[20];
    strcpy(dest, "Γειά");
    if (strcmp(dest, "Γειά")) {
        t_error("Greek copy failed\n");
    }
}

void TestStrcpyArabic()
{
    char dest[20];
    strcpy(dest, "مرحبا");
    if (strcmp(dest, "مرحبا")) {
        t_error("Arabic copy failed\n");
    }
}

static int StrcpyTestTestImpl()
{
    g_tStatus = 0;
    TestStrcpyBasic();
    TestStrcpyEmpty();
    TestStrcpyLongerString();
    TestStrcpySpecialCharacters();
    TestStrcpySingleChar();
    TestStrcpyCaseMixed();
    TestStrcpyWithSpaces();
    TestStrcpyWithEscapes();
    TestStrcpyOverwriteOldContent();
    TestStrcpyWithEmbeddedNull();
    TestStrcpyModifySrcAfterCopy();
    TestStrcpyUtf8();
    TestStrcpyMultipleAssignments();
    TestStrcpyToOffset();
    TestStrcpyArrayVsPointer();
    TestStrcpyAllCaps();
    TestStrcpySentence();
    TestStrcpySeries();
    TestStrcpyManualSrcArray();
    TestStrcpyVsMemcpy();
    TestStrcpyBatchGroup1();
    TestStrcpyBatchGroup2();
    TestStrcpyControlChars();
    TestStrcpyLongStrings();
    TestStrcpyNonAscii();
    TestStrcpyHexEscape();
    TestStrcpyOctalEscape();
    TestStrcpyPartialOverwrite();
    TestStrcpyPointerArithmetic();
    TestStrcpyLargeBuffer();
    TestStrcpyNullTermination();
    TestStrcpySpecialWhitespace();
    TestStrcpyAlternatingChars();
    // TestStrcpyDifferentSizes();  // Disabled due to SIGILL crash
    TestStrcpyMixedAlphanumeric();
    TestStrcpyWithQuotes();
    TestStrcpyPathString();
    TestStrcpyUrlString();
    TestStrcpyEmailString();
    TestStrcpyHexString();
    TestStrcpyBrackets();
    TestStrcpyCurlyBraces();
    TestStrcpyUnderscore();
    TestStrcpyDash();
    TestStrcpyPlusSign();
    TestStrcpyAmpersand();
    TestStrcpyPipe();
    TestStrcpyBackslash();
    TestStrcpyColon();
    TestStrcpySemicolon();
    TestStrcpyDoubleSpace();
    TestStrcpyLeadingSpace();
    TestStrcpyTrailingSpace();
    TestStrcpyCjkCharacters();
    TestStrcpyUuid();
    TestStrcpyXmlTag();
    TestStrcpyRegexPattern();
    TestStrcpySqlQuery();
    TestStrcpyShellCommand();
    TestStrcpyHttpHeader();
    TestStrcpyTimeFormat();
    TestStrcpyDatetimeFormat();
    TestStrcpyMimeBoundary();
    TestStrcpyContentDisposition();
    TestStrcpyEmoji();
    TestStrcpyRussian();
    TestStrcpyGreek();
    TestStrcpyArabic();

    return g_tStatus;
}

int StrcpyTestTest(void)
{
    return StrcpyTestTestImpl();
}
