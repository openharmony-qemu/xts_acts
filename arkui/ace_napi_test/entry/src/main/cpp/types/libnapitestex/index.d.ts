/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

export const CreateBufferCopy: () => object;
export const IsBuffer: (buffer) => boolean;
export const GetBufferInfo: (buffer) => boolean;
export const CreateExternalBufferTest: () => object;
export const createBufferSizeZeroTest: () => object;
export const CreateBufferMaxLength: () => object;
export const CreateBufferExceedMaxLength: () => object;
export const CreateBufferInvalidEnv: () => object;
export const CreateBufferInvalidData: () => object;
export const CreateBufferInvalidResult: () => object;
export const CreateInt32Test: () => object;
export const GetBufferInfoNonBuffer: (object) => object;
export const TestMultipleOperations: () => object;
export const TestExternalArrayBuffer: () => object;
export const TestArrayBufferThreadSafety: () => boolean;
export const TestArrayBufferComparison: () => number;
export const NapiArrayBufferTest01: () => boolean;
export const NapiArrayBufferTest02: () => boolean;
export const NapiArrayBufferTest03: () => boolean;
export const NapiArrayBufferTest04: () => boolean;
export const NapiArrayBufferTest05: () => boolean;
export const NapiArrayBufferTest06: () => boolean;
export const NapiArrayBufferTest07: () => boolean;
export const NapiBigIntTest01: () => boolean;
export const NapiBigIntTest02: () => boolean;
export const NapiBigIntTest03: () => boolean;
export const NapiBigIntTest04: () => boolean;
export const NapiBigIntTest05: () => boolean;
export const NapiBigIntTest06: () => boolean;
export const NapiBigIntTest07: () => boolean;
export const NapiBigIntTest08: () => boolean;
export const NapiBigIntTest09: () => boolean;
export const NapiBigIntTest10: () => boolean;
export const NapiBigIntTest11: () => boolean;
export const NapiBigIntTest12: () => boolean;
export const NapiBigIntTest13: () => boolean;
export const NapiBigIntTest14: () => boolean;
export const NapiBigIntTest15: () => boolean;
export const NapiBigIntTest16: () => boolean;
export const NapiBigIntTest17: () => boolean;
// Date test functions
export const testCreateDate: (timestamp: number) => Date;
export const testGetDateValue: (dateValue: Date) => number;
export const testIsDate: (value: string | number | TestObject) => boolean;
// Interface for date value retrieval with error handling
export interface DateValueWithErrorResult {
  isDateStatus: number;
  getDateStatus: number;
  isDate: boolean;
  timestamp: number;
  errorDescription: string;
}

// Interface for date value retrieval only
export interface DateValueOnlyResult {
  status: number;
  value?: number;
}

// Interface for date creation with min timestamp
export interface DateMinTimestampResult {
  createStatus: number;
  getStatus: number;
  timestamp: number;
}

// Interface for date creation with max timestamp
export interface DateMaxTimestampResult {
  createStatus: number;
  getStatus: number;
  timestamp: number;
}

// Interface for multiple date operations
export interface MultipleDateOperationsResult {
  dateA: Date;
  dateB: Date;
  timestampA: number;
  timestampB: number;
  modifiedTimestampA: number;
}

// Interface for bulk date creation
export interface BulkDateCreationResult {
  success: boolean;
  totalCreated: number;
  totalVerified: number;
  totalTimestamps: number;
  executionTime: number;
}

export interface TestObject {
  test: string;
}

// Date value retrieval with error handling
export const testGetDateValueWithError: (value: string | number | TestObject) => DateValueWithErrorResult;

// Date value retrieval only
export const testGetDateValueOnly: (value: string | number | TestObject) => DateValueOnlyResult;

// Date creation with minimum timestamp
export const testCreateDateWithMinTimestamp: () => DateMinTimestampResult;

// Date creation with maximum timestamp
export const testCreateDateWithMaxTimestamp: () => DateMaxTimestampResult;

// Multiple date operations
export const testMultipleDateOperations: () => MultipleDateOperationsResult;

// Bulk date creation
export const testBulkDateCreation: (count: number) => BulkDateCreationResult;
// Interface for individual thread result in concurrent date creation
export interface ConcurrentDateThreadResult {
  threadId: number;
  createStatus: number;
  isDate: boolean;
  timestamp: number;
  originalTimestamp: number;
}

// Interface for concurrent date creation test result
export interface ConcurrentDateCreationResult {
  success: boolean;
  threadResults: Array<ConcurrentDateThreadResult>;
  totalThreads: number;
}

// Concurrent date creation test
export const testConcurrentDateCreation: () => ConcurrentDateCreationResult;

// Interface for individual thread result in shared date object read test
export interface SharedDateReadThreadResult {
  threadId: number;
  isDateStatus: number;
  isDate: boolean;
  getDateStatus: number;
  timestamp: number;
}

// Interface for shared date object read test result
export interface SharedDateObjectReadResult {
  success: boolean;
  threadResults: Array<SharedDateReadThreadResult>;
  totalThreads: number;
  originalTimestamp: number;
}

// Shared date object read test
export const testSharedDateObjectRead: () => SharedDateObjectReadResult;

// Interface for individual thread result in high concurrency stress test
export interface StressTestThreadResult {
  threadId: number;
  totalOperations: number;
  successfulOperations: number;
  failedOperations: number;
  executionTime: number;
  memoryUsage: number;
}

// Interface for high concurrency date stress test result
export interface HighConcurrencyDateStressResult {
  success: boolean;
  threadResults: Array<StressTestThreadResult>;
  totalThreads: number;
  overallSuccess: boolean;
  totalOperations: number;
  totalSuccessfulOperations: number;
  totalFailedOperations: number;
  overallExecutionTime: number;
  peakMemoryUsage: number;
}

// High concurrency date stress test
export const testHighConcurrencyDateStress: () => HighConcurrencyDateStressResult;

// Interface for individual thread result in cross-thread date passing test
export interface CrossThreadDatePassingThreadResult {
  threadId: number;
  operation: string;
  isDateStatus: number;
  isDate: boolean;
  getDateStatus: number;
  timestamp: number;
  originalTimestamp: number;
}

// Interface for cross-thread date passing test result
export interface CrossThreadDatePassingResult {
  success: boolean;
  threadResults: Array<CrossThreadDatePassingThreadResult>;
  totalThreads: number;
  originalTimestamp: number;
}

// Interface for individual thread result in thread safety error handling test
export interface ThreadSafetyErrorHandlingThreadResult {
  threadId: number;
  operation: string;
  apiStatus: number;
  expectedStatus: number;
  isSuccess: boolean;
  errorDescription: string;
}

// Interface for thread safety error handling test result
export interface ThreadSafetyErrorHandlingResult {
  success: boolean;
  threadResults: Array<ThreadSafetyErrorHandlingThreadResult>;
  totalThreads: number;
  overallSuccess: boolean;
}

// Cross-thread date passing test
export const testCrossThreadDatePassing: () => CrossThreadDatePassingResult;

// Thread safety error handling test
export const testThreadSafetyErrorHandling: () => ThreadSafetyErrorHandlingResult;