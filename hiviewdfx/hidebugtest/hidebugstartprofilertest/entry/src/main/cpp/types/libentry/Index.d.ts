/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
export const add: (a: number, b: number) => number;
export const stopProfiler: () => number;
export const testCreateProfilerOptions: () => number;
export const testDestroyProfilerOptionsNull: () => number;
export const testSetMaxAsyncNestingDepth: (depth: number) => number;
export const testSetMaxAsyncTaskStackDepth: (depth: number) => number;
export const testSetSampleIntervalBytes: (bytes: number) => number;
export const testSetStatisticsIntervalSec: (seconds: number) => number;
export const testSetMaxStackDepth: (depth: number) => number;
export const testSetFilterSize: (size: number) => number;
export const testSetMaxDurationSec: (seconds: number) => number;
export const testStartProfilerWithOptions: (resourceType: number, maxDuration: number) => number;
export const testStartProfilerWithOptionsNullOpts: (resourceType: number) => number;
export const testSetMaxAsyncNestingDepthNull: () => number;
export const testSetMaxAsyncTaskStackDepthNull: () => number;
export const testSetSampleIntervalBytesNull: () => number;
export const testSetStatisticsIntervalSecNull: () => number;
export const testSetMaxStackDepthNull: () => number;
export const testSetFilterSizeNull: () => number;
export const testSetMaxDurationSecNull: () => number;
export const testCreateAndDestroyProfilerOptions: () => number;
export const testSetAllOptionsBoundary: () => {
  maxAsyncNestingDepth: number,
  maxAsyncTaskStackDepth: number,
  sampleIntervalBytes: number,
  statisticsIntervalSec: number,
  maxStackDepth: number,
  filterSize: number,
  maxDurationSec: number
};
export const testDestroyProfilerOptionsNullReturnCode: () => number;
export const testStartProfilerWithOptionsNullCallback: (resourceType: number, maxDuration: number) => number;
export const testSetMaxDurationSecInvalidReturn: () => {
  zero: number,
  overMax: number
};
export const testGetProfilerOptionsDefaults: () => {
  maxDuration: number,
  filterSize: number,
  maxStackDepth: number,
  statisticsInterval: number,
  sampleInterval: number,
  maxAsyncNestingDepth: number,
  maxAsyncStackDepth: number
};
