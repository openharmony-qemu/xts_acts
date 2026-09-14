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
import fs from '@ohos.file.fs';
import common from '@ohos.app.ability.common';
import mindSporeLite from '@ohos.ai.mindSporeLite';
import {
  compFp32WithTData,
  compUint8WithTData,
  CompareResult,
} from './PrecisionCompare';

/** 默认精度容差（与 C 端 ActsMindSporeValues::DEFAULT_TOLERANCE 一致） */
export const DEFAULT_TOLERANCE: number = 0.01;

/**
 * 比对模型推理输出与 rawfile 下标杆文件的精度（参考 C 端 CompareResult 实现）。
 * 标杆文件名规律：{modelName}{i}.output，i 为输出 tensor 索引。
 *
 * @param syscontext     上下文，用于访问 rawfile
 * @param modelName      模型名（如 'lenet_train_infer'），不传 .output 后缀
 * @param actualOutputs  模型推理输出的 MSTensor 数组
 * @param rTol           相对容差（可选，默认 DEFAULT_TOLERANCE）
 * @param aTol           绝对容差（可选，默认 DEFAULT_TOLERANCE）
 * @param isQuant        是否为量化模型（可选，默认 false；true 时走 uint8 路径）
 * @returns true 表示所有输出 tensor 都通过精度对比
 */
export async function compareOutputPrecision(
  syscontext: common.Context,
  modelName: string,
  actualOutputs: mindSporeLite.MSTensor[],
  rTol: number = DEFAULT_TOLERANCE,
  aTol: number = DEFAULT_TOLERANCE,
  isQuant: boolean = false,
): Promise<boolean> {
  let allPass: boolean = true;
  for (let i = 0; i < actualOutputs.length; i++) {
    let outputName: string = modelName + i.toString() + '.output';
    console.log('==========MSLITE CompWithTData: ' + outputName + '==========');
    let expectedBuffer: Uint8Array;
    try {
      expectedBuffer = await syscontext.resourceManager.getRawFileContent(outputName);
    } catch (e) {
      console.log('==========MSLITE no expected file: ' + outputName + '==========');
      allPass = false;
      continue;
    }
    let actualData: ArrayBuffer = actualOutputs[i].getData();
    let cmpResult: CompareResult;
    if (isQuant) {
      let actualUint8: Uint8Array = new Uint8Array(actualData);
      cmpResult = compUint8WithTData(actualUint8, expectedBuffer, rTol, aTol, isQuant);
    } else {
      let actualFloat: Float32Array = new Float32Array(actualData);
      cmpResult = compFp32WithTData(actualFloat, expectedBuffer, rTol, aTol, isQuant);
    }
    console.log('==========MSLITE [' + outputName + '] pass=' + cmpResult.pass +
      ', failCount=' + cmpResult.failCount +
      ', avgTol=' + cmpResult.avgTol +
      ', avgAbsDiff=' + cmpResult.avgAbsDiff +
      ', avgRelDiff=' + cmpResult.avgRelDiff +
      ', max=' + cmpResult.maximum +
      ', min=' + cmpResult.minimum + '==========');
    if (!cmpResult.pass) {
      allPass = false;
    }
  }
  return allPass;
}


export async function copyRawfileToSandbox(
  context: common.Context,
  sandboxDir: string,
  fileNames: string[],
): Promise<void> {
  for (let i = 0; i < fileNames.length; i++) {
    let name: string = fileNames[i];
    let targetPath: string = sandboxDir + name;
    try {
      let buffer: Uint8Array = await context.resourceManager.getRawFileContent(name);
      let file = fs.openSync(targetPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.writeSync(file.fd, buffer.buffer);
      fs.closeSync(file);
      console.log('[rawfile_copy_to_sandbox] ' + name + ' is copy success');
    } catch (e) {
      console.log('[rawfile_copy_to_sandbox] ' + name + ' is copy failed: ' + JSON.stringify(e));
    }
  }
}

/**
 * 获取 DataType 对应的单元素字节大小。
 *
 * @param dtype  mindSporeLite.DataType 枚举值
 * @returns       每个元素占用的字节数；未知类型返回 0
 */
function getDataTypeByteSize(dtype: mindSporeLite.DataType): number {
  switch (dtype) {
    case mindSporeLite.DataType.NUMBER_TYPE_INT8:
    case mindSporeLite.DataType.NUMBER_TYPE_UINT8:
      return 1;
    case mindSporeLite.DataType.NUMBER_TYPE_INT16:
    case mindSporeLite.DataType.NUMBER_TYPE_UINT16:
    case mindSporeLite.DataType.NUMBER_TYPE_FLOAT16:
      return 2;
    case mindSporeLite.DataType.NUMBER_TYPE_INT32:
    case mindSporeLite.DataType.NUMBER_TYPE_UINT32:
    case mindSporeLite.DataType.NUMBER_TYPE_FLOAT32:
      return 4;
    case mindSporeLite.DataType.NUMBER_TYPE_INT64:
    case mindSporeLite.DataType.NUMBER_TYPE_UINT64:
    case mindSporeLite.DataType.NUMBER_TYPE_FLOAT64:
      return 8;
    default:
      return 0;
  }
}

/**
 * 将 float32 值转换为 IEEE 754 半精度（float16）的 16 位无符号整数表示。
 * ArkTS 无原生 Float16Array，需手动按 IEEE 754 标准做位级转换。
 *
 * @param val  待转换的 float32 数值
 * @returns    float16 的 16 位无符号整数位表示
 */
function float32ToFloat16Bits(val: number): number {
  const buf: ArrayBuffer = new ArrayBuffer(4);
  const f32View: Float32Array = new Float32Array(buf);
  const u32View: Uint32Array = new Uint32Array(buf);
  f32View[0] = val;
  const bits: number = u32View[0];

  const sign: number = (bits >>> 31) & 0x1;
  const exponent: number = (bits >>> 23) & 0xFF;
  const mantissa: number = bits & 0x7FFFFF;

  let hSign: number = sign << 15;
  let hExponent: number = 0;
  let hMantissa: number = 0;

  if (exponent === 0xFF) {
    hExponent = 0x1F;
    hMantissa = mantissa !== 0 ? 0x200 : 0;
  } else if (exponent === 0) {
    hExponent = 0;
    hMantissa = 0;
  } else {
    const newExp: number = exponent - 127 + 15;
    if (newExp >= 0x1F) {
      hExponent = 0x1F;
      hMantissa = 0;
    } else if (newExp <= 0) {
      hExponent = 0;
      const shift: number = 14 - newExp;
      if (shift < 31) {
        hMantissa = (mantissa | 0x800000) >>> shift;
      }
    } else {
      hExponent = newExp;
      hMantissa = mantissa >>> 13;
    }
  }
  return hSign | (hExponent << 10) | hMantissa;
}

/**
 * 生成 [min, max) 区间内的随机浮点数。
 *
 * @param min  下界（包含）
 * @param max  上界（不包含）
 * @returns    随机浮点数
 */
function randomRange(min: number, max: number): number {
  return min + Math.random() * (max - min);
}

/**
 * 生成 [min, max] 闭区间内的随机整数（含两端）。
 *
 * @param min  下界（包含）
 * @param max  上界（包含）
 * @returns    随机整数
 */
function randomInt(min: number, max: number): number {
  return Math.floor(min + Math.random() * (max - min + 1));
}

/**
 * 为模型输入 tensors 生成随机数据并通过 setData 写入。
 *
 * 通过调用 MSTensor 的 shape、elementNum、dataSize、dtype 接口读取每个输入
 * tensor 的元信息，据此构造大小匹配的随机数据缓冲区，再调用 setData 写入。
 *
 * 随机范围与 MindSpore Lite 官方 benchmark 工具（benchmark_base.cc /
 * random_data_generator.cc）完全对齐：
 *
 *   - FLOAT32 / FLOAT64 / FLOAT16：[minVal, maxVal) 均匀分布，默认 [0.1, 1.0)。
 *     （minVal=0.1 避免 0 值导致 BatchNorm 除零或梯度消失）
 *   - INT8：       [-127, 127]（不含 -128，量化特殊值）
 *   - UINT8：      [0, 254]    （不含 255，量化特殊值）
 *   - INT16：      [0, 1]
 *   - INT32：      [0, 1]     （BERT token ID / attention mask 安全范围）
 *   - INT64：      [0, 1]
 *   - 未知类型：    顺序填充 0, 1, 2, ... % 256（与 C 端 default 分支一致）
 *
 * @param modelName  模型名称（仅用于日志标识）
 * @param inputs     模型输入 tensor 数组（由 model.getInputs() 获取）
 * @param minVal     浮点类型随机值下界（默认 0.1，与官方一致）
 * @param maxVal     浮点类型随机值上界（默认 1.0，与官方一致）
 * @returns          传入的 inputs 数组（已在原对象上通过 setData 写入随机数据）
 */
export function setRandomInputs(
  modelName: string,
  inputs: mindSporeLite.MSTensor[],
  minVal: number = 0.1,
  maxVal: number = 1.0,
): mindSporeLite.MSTensor[] {
  for (let i = 0; i < inputs.length; i++) {
    const tensor: mindSporeLite.MSTensor = inputs[i];
    const shape: number[] = tensor.shape;
    const elementNum: number = tensor.elementNum;
    const dataSize: number = tensor.dataSize;
    const dtype: mindSporeLite.DataType = tensor.dtype;
    const byteSize: number = getDataTypeByteSize(dtype);

    console.log('[setRandomInputs] ' + modelName + ' input' + i +
      ' name=' + tensor.name +
      ' shape=[' + shape.join(', ') + ']' +
      ' elementNum=' + elementNum +
      ' dataSize=' + dataSize +
      ' dtype=' + dtype +
      ' byteSize=' + byteSize);

    if (dataSize <= 0) {
      console.log('[setRandomInputs] skip tensor with dataSize=0');
      continue;
    }

    const buffer: ArrayBuffer = new ArrayBuffer(dataSize);

    if (byteSize === 0) {
      const u8View: Uint8Array = new Uint8Array(buffer);
      for (let j = 0; j < u8View.length; j++) {
        u8View[j] = j % 256;
      }
    } else {
      const count: number = Math.min(elementNum, Math.floor(dataSize / byteSize));
      switch (dtype) {
        case mindSporeLite.DataType.NUMBER_TYPE_FLOAT32: {
          const view: Float32Array = new Float32Array(buffer);
          for (let j = 0; j < count; j++) {
            view[j] = randomRange(minVal, maxVal);
          }
          break;
        }
        case mindSporeLite.DataType.NUMBER_TYPE_FLOAT64: {
          const view: Float64Array = new Float64Array(buffer);
          for (let j = 0; j < count; j++) {
            view[j] = randomRange(minVal, maxVal);
          }
          break;
        }
        case mindSporeLite.DataType.NUMBER_TYPE_FLOAT16: {
          const view: DataView = new DataView(buffer);
          for (let j = 0; j < count; j++) {
            const hBits: number = float32ToFloat16Bits(randomRange(minVal, maxVal));
            view.setUint16(j * 2, hBits, true);
          }
          break;
        }
        case mindSporeLite.DataType.NUMBER_TYPE_INT8: {
          const view: Int8Array = new Int8Array(buffer);
          for (let j = 0; j < count; j++) {
            view[j] = randomInt(-127, 127);
          }
          break;
        }
        case mindSporeLite.DataType.NUMBER_TYPE_UINT8: {
          const view: Uint8Array = new Uint8Array(buffer);
          for (let j = 0; j < count; j++) {
            view[j] = randomInt(0, 254);
          }
          break;
        }
        case mindSporeLite.DataType.NUMBER_TYPE_INT16: {
          const view: Int16Array = new Int16Array(buffer);
          for (let j = 0; j < count; j++) {
            view[j] = randomInt(0, 1);
          }
          break;
        }
        case mindSporeLite.DataType.NUMBER_TYPE_UINT16: {
          const view: Uint16Array = new Uint16Array(buffer);
          for (let j = 0; j < count; j++) {
            view[j] = randomInt(0, 1);
          }
          break;
        }
        case mindSporeLite.DataType.NUMBER_TYPE_INT32: {
          const view: Int32Array = new Int32Array(buffer);
          for (let j = 0; j < count; j++) {
            view[j] = randomInt(0, 1);
          }
          break;
        }
        case mindSporeLite.DataType.NUMBER_TYPE_UINT32: {
          const view: Uint32Array = new Uint32Array(buffer);
          for (let j = 0; j < count; j++) {
            view[j] = randomInt(0, 1);
          }
          break;
        }
        case mindSporeLite.DataType.NUMBER_TYPE_INT64: {
          const view: DataView = new DataView(buffer);
          for (let j = 0; j < count; j++) {
            const val: number = randomInt(0, 1);
            view.setInt32(j * 8, val, true);
            view.setInt32(j * 8 + 4, 0, true);
          }
          break;
        }
        case mindSporeLite.DataType.NUMBER_TYPE_UINT64: {
          const view: DataView = new DataView(buffer);
          for (let j = 0; j < count; j++) {
            const val: number = randomInt(0, 1);
            view.setUint32(j * 8, val, true);
            view.setUint32(j * 8 + 4, 0, true);
          }
          break;
        }
        default: {
          const u8View: Uint8Array = new Uint8Array(buffer);
          for (let j = 0; j < u8View.length; j++) {
            u8View[j] = j % 256;
          }
          break;
        }
      }
    }

    tensor.setData(buffer);
    console.log('[setRandomInputs] ' + modelName + ' input' + i + ' setData done, ' + dataSize + ' bytes');
  }
  return inputs;
}

/** 将 ASCII 字符串转换为 ArrayBuffer（用于 NNRT Extension.value） */
export function strToArrayBuffer(str: string): ArrayBuffer {
  let buf: ArrayBuffer = new ArrayBuffer(str.length);
  let view: Uint8Array = new Uint8Array(buf);
  for (let i = 0; i < str.length; i++) {
    view[i] = str.charCodeAt(i);
  }
  return buf;
}

/** 用指定 float 值填充 ArrayBuffer */
export function fillFloat32Array(size: number, value: number): ArrayBuffer {
  let buf: ArrayBuffer = new ArrayBuffer(size);
  let view: Float32Array = new Float32Array(buf);
  for (let i = 0; i < view.length; i++) {
    view[i] = value;
  }
  return buf;
}
