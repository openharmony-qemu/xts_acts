/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
 * ArkTS 精度对比工具，移植自 ActsMindSporeCTest/OhosCommonTest.cpp 的 C 语言实现：
 *   - ReadTestDataFile / GetDimInfo  (读取 HISI .t/.output 文件)
 *   - AllCloseFloat / AllCloseInt8   (按 atol + rtol*|b| 容差逐元素比较)
 *   - CompFp32WithTData / CompUint8WithTData  (从 .output 文件加载标杆并对比)
 *
 * 标杆文件 (.output) 二进制格式（与 C 端一致）：
 *   [uint32 dimSize][uint32 dim[0]]...[uint32 dim[dimSize-1]][raw data]
 *   dimSize 之后紧跟每个维度数值，最后是连续的 float32 或 uint8 数据。
 */

const FAIL_PRINT_LIMIT: number = 100;
const PREVIEW_ELEMENT_LIMIT: number = 10;
const DEFAULT_RTOL: number = 1e-05;
const DEFAULT_ATOL: number = 1e-08;
const EPSILON_OFFSET: number = 1.0;
const QUANT_TOL_THRESHOLD: number = 0.04;
const FLOAT32_BYTE_SIZE: number = 4;
const UINT32_BYTE_SIZE: number = 4;
const MAX_HEAD_SIZE: number = 50;

/** 以小端字节序读取 4 字节为无符号 32 位整数（避免依赖 DataView 的类型限制）。 */
function readUint32LE(buffer: Uint8Array, offset: number): number {
  let b0: number = buffer[offset];
  let b1: number = buffer[offset + 1];
  let b2: number = buffer[offset + 2];
  let b3: number = buffer[offset + 3];
  return ((b0) | (b1 << 8) | (b2 << 16) | (b3 << 24)) >>> 0;
}

export interface CompareStats {
  failCount: number;
  tol: number;
  tol1: number;
  tol2: number;
  nanOccurInAccuray: boolean;
  sum: number;
  rtol: number;
  atol: number;
}

export interface PrintStatsParams {
  count: number;
  sumAll: number;
  maximum: number;
  minimum: number;
}

export interface CompareResult {
  pass: boolean;
  failCount: number;
  avgTol: number;
  avgAbsDiff: number;
  avgRelDiff: number;
  maximum: number;
  minimum: number;
}

export interface ReadTestDataResult {
  dimInfo: number[];
  data: ArrayBuffer;
  dataSize: number;
}

function createInitialStats(rtol: number, atol: number): CompareStats {
  let stats: CompareStats = {
    failCount: 0,
    tol: 0,
    tol1: 0,
    tol2: 0,
    nanOccurInAccuray: false,
    sum: 0.0,
    rtol: rtol,
    atol: atol,
  };
  return stats;
}

function formatIndex(idx: number): string {
  if (idx < 10) {
    return '0' + idx.toString();
  }
  return idx.toString();
}

function processFloatElement(aVal: number, bVal: number, idx: number, stats: CompareStats): void {
  let diff: number = Math.abs(aVal - bVal);
  if (Number.isNaN(aVal) || Number.isNaN(bVal) || !Number.isFinite(aVal) || !Number.isFinite(bVal)) {
    stats.failCount++;
    stats.nanOccurInAccuray = true;
    if (stats.failCount < FAIL_PRINT_LIMIT) {
      console.info('     i = ' + formatIndex(idx) + ':   ' + aVal + '  |  ' + bVal);
    }
  } else if (diff > (stats.atol + stats.rtol * Math.abs(bVal))) {
    stats.tol += diff / (Math.abs(bVal) + EPSILON_OFFSET);
    stats.tol1 += diff;
    stats.tol2 += diff / Math.abs(bVal);
    stats.failCount++;
    if (stats.failCount < FAIL_PRINT_LIMIT) {
      console.info('     i = ' + formatIndex(idx) + ':   ' + aVal + '  |  ' + bVal);
    }
  }
}

function checkFloatFinalResult(stats: CompareStats, isQuant: boolean): boolean {
  if (stats.nanOccurInAccuray) {
    console.info('\n[PrecisionCompare] eval output include some NAN/INF');
    return false;
  }
  if (stats.failCount > 0) {
    console.info('\n *** These data compare failed: atol = ' + stats.atol + ', rtol = ' + stats.rtol + '\n');
    if (isQuant && stats.failCount > 0 && (stats.tol / stats.failCount) < QUANT_TOL_THRESHOLD) {
      return true;
    }
    return false;
  }
  return true;
}

function printFloatStats(stats: CompareStats, params: PrintStatsParams): void {
  console.info('     ......');
  console.info('\n *** Total fail_count: ' + stats.failCount);
  if (stats.failCount !== 0) {
    let avgTol: number = stats.tol / stats.failCount;
    let avgAbsDiff: number = stats.tol1 / stats.failCount;
    let avgRelDiff: number = stats.tol2 / stats.failCount;
    console.info('\n     fabs(a[i] - b[i])/(fabs(b[i])+1) : ' + avgTol);
    console.info('\n     fabs(a[i] - b[i]) : ' + avgAbsDiff);
    console.info('\n     fabs(a[i] - b[i])/fabs(b[i]) : ' + avgRelDiff);
  }
  let avg: number = params.count > 0 ? (stats.sum / params.count) : 0.0;
  console.info('\n     avg : ' + avg);
  console.info('\n     min : ' + params.minimum);
  console.info('\n     max :  ' + params.maximum + '\n');
}

/**
 * AllCloseFloat：参考 C 端 AllCloseFloat 实现。
 * 使用 atol + rtol*|b| 作为容差，逐元素比较两个 float 数组。
 *
 * @param actual   实际输出（float 数组视图）
 * @param expected 标杆期望输出（float 数组视图）
 * @param count    比较元素个数
 * @param rTol     相对容差
 * @param aTol     绝对容差
 * @param isQuant  是否为量化模型（量化场景下采用宽松阈值）
 */
export function allCloseFloat(
  actual: Float32Array,
  expected: Float32Array,
  count: number,
  rTol: number = DEFAULT_RTOL,
  aTol: number = DEFAULT_ATOL,
  isQuant: boolean = false,
): CompareResult {
  let stats: CompareStats = createInitialStats(rTol, aTol);
  let sumAll: number = 0;
  let maximum: number = 0;
  let minimum: number = 0;
  let actualCount: number = count;

  if (actual.length < actualCount || expected.length < actualCount) {
    console.info('[PrecisionCompare] allCloseFloat: input length is shorter than count, clamp to min length');
    actualCount = Math.min(actual.length, expected.length, actualCount);
  }

  for (let i = 0; i < actualCount; ++i) {
    let diff: number = Math.abs(actual[i] - expected[i]);
    let denom: number = aTol + rTol * Math.abs(expected[i]);
    if (denom === 0.0) {
      denom = EPSILON_OFFSET;
    }
    let normDiff: number = diff / denom;
    stats.sum += normDiff;
    sumAll += normDiff;
    maximum = Math.max(maximum, normDiff);
    minimum = Math.min(minimum, normDiff);
    processFloatElement(actual[i], expected[i], i, stats);
  }

  let params: PrintStatsParams = {
    count: actualCount,
    sumAll: sumAll,
    maximum: maximum,
    minimum: minimum,
  };
  printFloatStats(stats, params);
  let pass: boolean = checkFloatFinalResult(stats, isQuant);

  return {
    pass: pass,
    failCount: stats.failCount,
    avgTol: stats.failCount !== 0 ? stats.tol / stats.failCount : 0,
    avgAbsDiff: stats.failCount !== 0 ? stats.tol1 / stats.failCount : 0,
    avgRelDiff: stats.failCount !== 0 ? stats.tol2 / stats.failCount : 0,
    maximum: maximum,
    minimum: minimum,
  };
}

function processInt8Element(aVal: number, bVal: number, idx: number, stats: CompareStats): void {
  if (Number.isNaN(aVal) || Number.isNaN(bVal) || !Number.isFinite(aVal) || !Number.isFinite(bVal)) {
    stats.failCount++;
    stats.nanOccurInAccuray = true;
    if (stats.failCount < FAIL_PRINT_LIMIT) {
      console.info('     i = ' + formatIndex(idx) + ':   ' + aVal + '  |  ' + bVal);
    }
  } else if (Math.abs(aVal - bVal) > 0) {
    stats.tol += Math.abs(aVal - bVal) / (Math.abs(bVal) + EPSILON_OFFSET);
    stats.tol1 += Math.abs(aVal - bVal);
    stats.tol2 += Math.abs(aVal - bVal) / Math.abs(bVal);
    stats.failCount++;
    if (stats.failCount < FAIL_PRINT_LIMIT) {
      console.info('     i = ' + formatIndex(idx) + ':   ' + aVal + '  |  ' + bVal);
    }
  }
}

function checkInt8FinalResult(stats: CompareStats, isQuant: boolean): boolean {
  if (stats.nanOccurInAccuray) {
    console.info('\n[PrecisionCompare] eval output include some NAN/INF');
    return false;
  }
  if (stats.failCount > 0) {
    console.info('\n *** These data compare failed: atol = ' + stats.atol + ', rtol = ' + stats.rtol + '\n');
    if (isQuant && (stats.tol / stats.failCount) < QUANT_TOL_THRESHOLD) {
      return true;
    }
    return false;
  }
  return true;
}

/**
 * AllCloseInt8：参考 C 端 AllCloseInt8 实现，逐元素比较两个 uint8 数组。
 */
export function allCloseInt8(
  actual: Uint8Array,
  expected: Uint8Array,
  count: number,
  rTol: number = DEFAULT_RTOL,
  aTol: number = DEFAULT_ATOL,
  isQuant: boolean = false,
): CompareResult {
  let stats: CompareStats = createInitialStats(rTol, aTol);
  let sumAll: number = 0;
  let maximum: number = 0;
  let minimum: number = 0;
  let actualCount: number = count;

  if (actual.length < actualCount || expected.length < actualCount) {
    console.info('[PrecisionCompare] allCloseInt8: input length is shorter than count, clamp to min length');
    actualCount = Math.min(actual.length, expected.length, actualCount);
  }

  for (let i = 0; i < actualCount; ++i) {
    let diff: number = Math.abs(actual[i] - expected[i]);
    let denom: number = aTol + rTol * Math.abs(expected[i]);
    if (denom === 0.0) {
      denom = EPSILON_OFFSET;
    }
    let normDiff: number = diff / denom;
    stats.sum += normDiff;
    sumAll += normDiff;
    maximum = Math.max(maximum, normDiff);
    minimum = Math.min(minimum, normDiff);
    processInt8Element(actual[i], expected[i], i, stats);
  }

  let params: PrintStatsParams = {
    count: actualCount,
    sumAll: sumAll,
    maximum: maximum,
    minimum: minimum,
  };
  printFloatStats(stats, params);
  let pass: boolean = checkInt8FinalResult(stats, isQuant);

  return {
    pass: pass,
    failCount: stats.failCount,
    avgTol: stats.failCount !== 0 ? stats.tol / stats.failCount : 0,
    avgAbsDiff: stats.failCount !== 0 ? stats.tol1 / stats.failCount : 0,
    avgRelDiff: stats.failCount !== 0 ? stats.tol2 / stats.failCount : 0,
    maximum: maximum,
    minimum: minimum,
  };
}

/**
 * readTestDataFile：参考 C 端 ReadTestDataFile/GetDimInfo 实现。
 * 解析 HISI .output/.t 文件（dim 头 + raw 数据）。
 *
 * 文件格式：
 *   [uint32 dimSize][uint32 dim[0]] ... [uint32 dim[dimSize-1]][raw data]
 *
 * @param buffer  标杆文件的原始字节
 * @param isFloat true: 数据按 float32 解析；false: 按 uint8 解析
 */
export function readTestDataFile(buffer: Uint8Array, isFloat: boolean = true): ReadTestDataResult {
  let dimInfo: number[] = [];

  if (buffer.byteLength < UINT32_BYTE_SIZE) {
    console.info('[PrecisionCompare] readTestDataFile: file too small');
    let emptyResult: ReadTestDataResult = {
      dimInfo: dimInfo,
      data: new ArrayBuffer(0),
      dataSize: 0,
    };
    return emptyResult;
  }

  let dimSize: number = readUint32LE(buffer, 0);
  dimInfo.push(dimSize);

  let dataSize: number = 1;
  let offset: number = UINT32_BYTE_SIZE;
  for (let i = 0; i < dimSize && i < MAX_HEAD_SIZE; i++) {
    if (offset + UINT32_BYTE_SIZE > buffer.byteLength) {
      console.info('[PrecisionCompare] readTestDataFile: dim info exceeds file length');
      break;
    }
    let dimVal: number = readUint32LE(buffer, offset);
    dimInfo.push(dimVal);
    dataSize *= dimVal;
    offset += UINT32_BYTE_SIZE;
  }
  dimInfo.push(dataSize);

  let dataByteLen: number = isFloat ? dataSize * FLOAT32_BYTE_SIZE : dataSize;
  if (offset + dataByteLen > buffer.byteLength) {
    console.info('[PrecisionCompare] readTestDataFile: data section truncated, expect ' + dataByteLen + ' bytes');
    dataByteLen = Math.max(0, buffer.byteLength - offset);
  }

  let data: ArrayBuffer = buffer.buffer.slice(offset, offset + dataByteLen);
  console.info('[PrecisionCompare] readTestDataFile: dimInfo=(' + dimInfo.slice(0, dimSize + 1).join(', ') +
    '), dataSize=' + dataSize + ', byteLen=' + data.byteLength);
  let result: ReadTestDataResult = {
    dimInfo: dimInfo,
    data: data,
    dataSize: dataSize,
  };
  return result;
}

/**
 * compFp32WithTData：参考 C 端 CompFp32WithTData 实现。
 * 将实际输出（Float32Array）与 .output 标杆文件做 fp32 精度对比。
 *
 * @param actualOutput     实际输出（按 float32 解释）
 * @param expectedBuffer   .output 标杆文件的原始字节（含 dim 头）
 * @param rTol             相对容差
 * @param aTol             绝对容差
 * @param isQuant          是否为量化场景
 */
export function compFp32WithTData(
  actualOutput: Float32Array,
  expectedBuffer: Uint8Array,
  rTol: number = DEFAULT_RTOL,
  aTol: number = DEFAULT_ATOL,
  isQuant: boolean = false,
): CompareResult {
  let parsed: ReadTestDataResult = readTestDataFile(expectedBuffer, true);
  if (parsed.dataSize === 0) {
    let emptyRes: CompareResult = {
      pass: false,
      failCount: 0,
      avgTol: 0,
      avgAbsDiff: 0,
      avgRelDiff: 0,
      maximum: 0,
      minimum: 0,
    };
    return emptyRes;
  }
  let expected: Float32Array = new Float32Array(parsed.data);

  console.info('[PrecisionCompare] expected output data:');
  let previewLen: number = Math.min(parsed.dataSize, PREVIEW_ELEMENT_LIMIT);
  let previewStr: string = '';
  for (let i = 0; i < previewLen; i++) {
    previewStr += expected[i].toFixed(4) + ' ';
  }
  console.info(previewStr);

  return allCloseFloat(actualOutput, expected, parsed.dataSize, rTol, aTol, isQuant);
}

/**
 * compUint8WithTData：参考 C 端 CompUint8WithTData 实现。
 * 将实际输出（Uint8Array）与 .output 标杆文件做 uint8 精度对比。
 */
export function compUint8WithTData(
  actualOutput: Uint8Array,
  expectedBuffer: Uint8Array,
  rTol: number = DEFAULT_RTOL,
  aTol: number = DEFAULT_ATOL,
  isQuant: boolean = false,
): CompareResult {
  let parsed: ReadTestDataResult = readTestDataFile(expectedBuffer, false);
  if (parsed.dataSize === 0) {
    let emptyRes: CompareResult = {
      pass: false,
      failCount: 0,
      avgTol: 0,
      avgAbsDiff: 0,
      avgRelDiff: 0,
      maximum: 0,
      minimum: 0,
    };
    return emptyRes;
  }
  let expected: Uint8Array = new Uint8Array(parsed.data);

  console.info('\n [PrecisionCompare] expected output data:\n');
  let previewLen: number = Math.min(parsed.dataSize, PREVIEW_ELEMENT_LIMIT);
  let previewStr: string = '';
  for (let i = 0; i < previewLen; i++) {
    previewStr += expected[i].toString() + ' ';
  }
  console.info(previewStr);

  return allCloseInt8(actualOutput, expected, parsed.dataSize, rTol, aTol, isQuant);
}

/**
 * comparePrecisionAbs：保留原有的简单绝对误差对比工具函数，便于向后兼容。
 */
export function comparePrecisionAbs(arr1: number[], arr2: number[], epsilon: number = 0.0001): boolean {
  if (arr1.length !== arr2.length) {
    return false;
  }
  for (let i = 0; i < arr1.length; i++) {
    if (Math.abs(arr1[i] - arr2[i]) > epsilon) {
      return false;
    }
  }
  return true;
}

/**
 * cosineSimilarity：余弦相似度，保留原有工具函数。
 */
export function cosineSimilarity(vec1: number[], vec2: number[]): number {
  if (vec1.length !== vec2.length) {
    throw new Error('Vectors must have the same length');
  }
  let dotProduct: number = 0;
  let vec1Magnitude: number = 0;
  let vec2Magnitude: number = 0;
  for (let i = 0; i < vec1.length; i++) {
    dotProduct += vec1[i] * vec2[i];
    vec1Magnitude += vec1[i] * vec1[i];
    vec2Magnitude += vec2[i] * vec2[i];
  }
  vec1Magnitude = Math.sqrt(vec1Magnitude);
  vec2Magnitude = Math.sqrt(vec2Magnitude);
  return dotProduct / (vec1Magnitude * vec2Magnitude);
}
