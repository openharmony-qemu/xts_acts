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

/**
 * Create a UTF-8 string from a given string
 * @param str input string
 * @returns created string
 */
export const createStringUtf8: (str: string) => string;

/**
 * Test napi_create_string_utf8 with invalid data
 * @returns status code
 */
export const createStringUtf8InvalidData: () => number;

/**
 * Create string and verify it can be retrieved correctly
 * @param str input string
 * @returns true if verification passed
 */
export const createStringUtf8AndVerify: (str: string) => boolean;

/**
 * Create external ASCII string
 * @param str input string
 * @returns created external string
 */
export const createExternalStringAscii: (str: string) => string;

/**
 * Test napi_create_external_string_ascii with null str
 * @returns status code
 */
export const createExternalStringAsciiNullStr: () => number;

/**
 * Test napi_create_external_string_ascii with non-ASCII characters
 * @param str input string (may contain non-ASCII chars)
 * @returns status code
 */
export const createExternalStringAsciiNonAscii: (str: string) => number;

/**
 * Create external UTF-16 string
 * @param str input string
 * @returns created external string
 */
export const createExternalStringUtf16: (str: string) => string;

/**
 * Test napi_create_external_string_utf16 with null parameter
 * @returns status code
 */
export const createExternalStringUtf16NullParam: () => number;

/**
 * Get buffer string UTF16 in critical scope
 * @param str input string
 * @returns retrieved string
 */
export const getBufferStringUtf16InCriticalScope: (str: string) => boolean;

/**
 * Test napi_get_buffer_string_utf16 with null parameter
 * @returns status code
 */
export const getBufferStringUtf16InCriticalScopeNull: () => number;

/**
 * Get value string latin1
 * @param str input string
 * @returns retrieved string
 */
export const getValueStringLatin1: (str: string) => string;

/**
 * Test napi_get_value_string_latin1 with null parameter
 * @returns status code
 */
export const getValueStringLatin1NullParam: () => number;

/**
 * Test napi_create_external_string_ascii - verify return value
 * @param str input string
 * @returns true if verification passed
 */
export const createExternalStringAsciiVerifyReturn: (str: string) => boolean;

/**
 * Test napi_create_external_string_utf16 - verify return value
 * @param str input string
 * @returns true if type and content verification passed
 */
export const createExternalStringUtf16VerifyReturn: (str: string) => boolean;

/**
 * Test napi_create_external_string_utf16 - abnormal scenario
 * @returns status code
 */
export const createExternalStringUtf16Abnormal: () => number;

/**
 * Test napi_create_external_string_utf16 - combined usage
 * @param str input string
 * @returns true if combined test passed
 */
export const createExternalStringUtf16Combined: (str: string) => boolean;

/**
 * Test napi_get_buffer_string_utf16_in_critical_scope - verify return value
 * @param str input string
 * @returns true if data matches
 */
export const getBufferStringUtf16VerifyReturn: (str: string) => boolean;

/**
 * Test napi_get_buffer_string_utf16_in_critical_scope - abnormal scenario
 * @returns status code
 */
export const getBufferStringUtf16Abnormal: () => number;

/**
 * Test napi_get_buffer_string_utf16_in_critical_scope - combined usage
 * @param str input string
 * @returns true if combined test passed
 */
export const getBufferStringUtf16Combined: (str: string) => boolean;

/**
 * Test napi_get_value_string_latin1 - abnormal scenario
 * @param str input string
 * @returns true if abnormal case detected
 */
export const getValueStringLatin1Abnormal: (str: string) => boolean;

/**
 * Check if external string finalize was called
 * NOTE: not exercised by any ets test in current scope; retained as a debug/observation hook
 * (allows probing engine-driven finalize of external strings which is GC-timing dependent).
 * @returns true if finalize was called
 */
export const isExternalFinalizeCalled: () => boolean;

/**
 * Test napi_create_external_string_ascii - normal scenario (ArkTS usage)
 * @returns created string
 */
export const createExternalStringAsciiNormalUsage: () => string;

/**
 * Test napi_create_external_string_ascii - combined with finalize
 * @returns true if finalize was called correctly
 */
export const createExternalStringAsciiWithFinalize: () => boolean;

/**
 * Test napi_create_string_utf8 - abnormal scenario (invalid UTF8)
 * @returns true if abnormal cases handled correctly
 */
export const createStringUtf8AbnormalScenario: () => boolean;

/**
 * Test napi_get_buffer_string_utf16_in_critical_scope - abnormal parameters (NULL)
 * @returns true if NULL params return error
 */
export const getBufferStringUtf16AbnormalParams: () => boolean;

/**
 * Test napi_get_buffer_string_utf16_in_critical_scope - normal scenario (direct memory access)
 * @param str input string
 * @returns true if all characters match
 */
export const getBufferStringUtf16NormalScenario: (str: string) => boolean;

/**
 * Test napi_get_value_string_latin1 - abnormal parameters (NULL, non-string)
 * @returns true if invalid params handled correctly
 */
export const getValueStringLatin1AbnormalParams: () => boolean;
