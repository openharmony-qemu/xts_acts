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
 * Check if a created object is a Buffer
 * @returns true if the object is a Buffer, false otherwise
 */
export const isBuffer: () => boolean;

/**
 * Test isBuffer after triggering a pending exception
 * @returns napi_status code (expected napi_pending_exception)
 */
export const isBufferAfterException: () => number;

/**
 * Test isBuffer on a non-Buffer object (number)
 * @returns status * 1000 + result flag
 */
export const isBufferOnNonBuffer: () => number;

/**
 * Test isBuffer on a normal Buffer (verifies returns true)
 * @returns status * 1000 + result flag
 */
export const isBufferOnSlice: () => number;

/**
 * Full flow: create buffer → isBuffer → write data → read back
 * @returns 0 on success, negative on failure
 */
export const createBufferAndVerify: () => number;
