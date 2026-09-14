/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import mindSporeLite from '@ohos.ai.mindSporeLite';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import {
  comparePrecisionAbs,
  cosineSimilarity,
  allCloseFloat,
  allCloseInt8,
  readTestDataFile,
  compFp32WithTData,
  compUint8WithTData,
  CompareResult,
} from './PrecisionCompare';
import { copyRawfileToSandbox } from './CommonUtils';

/** 默认精度容差（与 C 端 ActsMindSporeValues::DEFAULT_TOLERANCE 一致） */
const DEFAULT_TOLERANCE: number = 0.01;

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
async function compareOutputPrecision(
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

function printTensors(tensors: mindSporeLite.MSTensor[], label: string): void {
  for (let i = 0; i < tensors.length; i++) {
    let printStr = tensors[i].name + ', ';
    printStr += tensors[i].shape + ', ';
    printStr += tensors[i].dtype + ', ';
    printStr += tensors[i].dataSize + ', ';
    printStr += tensors[i].getData();
    console.log('==========MSLITE ' + label + '===========', printStr);
  }
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      try {
      let dir = globalThis.abilityContext.filesDir + '/';
      try {
        await globalThis.context.resourceManager.getRawFileList('')
          .then((value: Array<string>) => {
            console.info(`getRawFileList, result: ${JSON.stringify(value)}`);
          })
          .catch((error: BusinessError) => {
            console.error(`promise getRawFileList failed, error code: ${error.code}, message: ${error.message}.`);
          });
        await copyRawfileToSandbox(globalThis.context, dir,
          ['ml_face_isface.ms', 'ml_face_isface_0.input', 'ml_ocr_cn.ms', 'lenet_train.ms']);
      } catch (error) {
        console.info('[rawfile_copy_to_sandbox] getRawFileDescriptor api run failed' + error);
      }

      console.info('[rawfile_copy_to_sandbox] sandbox path:' + dir);
      } catch (error) {
        console.error('beforeAll failed: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    })
    beforeEach(async () => {
      try {
      let dir = globalThis.abilityContext.filesDir + '/';

      let ml_face_model = dir + 'ml_face_isface.ms';
      await fs.access(ml_face_model).then(async (res) => {
        if (res) {
          console.info('ml_face_isface.ms file exists');
        }
      }).catch((err: BusinessError) => {
        console.info('ml_face_isface.ms file does not exists! access failed with error message: ' +
          err.message + ', error code: ' + err.code);
      });

      let mnet_caffemodel_bin_file = dir + 'ml_face_isface_0.input';
      await fs.access(mnet_caffemodel_bin_file).then(async (res) => {
        if (res) {
          console.info('ml_face_isface_0.input file exists');
        }
      }).catch((err: BusinessError) => {
        console.info('ml_face_isface_0.input file does not exist! access failed with error message: ' +
          err.message + ', error code: ' + err.code);
      });

      let ml_ocr_model = dir + 'ml_ocr_cn.ms';
      await fs.access(ml_ocr_model).then(async (res) => {
        if (res) {
          console.info('ml_ocr_cn.ms file exists');
        }
      }).catch((err: BusinessError) => {
        console.info('ml_ocr_cn.ms file does not exists! access failed with error message: ' +
          err.message + ', error code: ' + err.code);
      });
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      } catch (error) {
        console.error('beforeEach failed: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_PrecisionCompare_0001
     * @tc.number SUB_AI_MindSpore_ArkTS_PrecisionCompare_0001
     * @tc.desc   验证 compFp32WithTData 可正确解析 rawfile 下的 .output 标杆文件并与推理输出做精度对比
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_PrecisionCompare_0001', Level.LEVEL0, async () => {
      try {
      console.log('==========MSLITE PrecisionCompare_0001 start===========');
      let syscontext: common.Context = globalThis.context;
      let inputBuffer0: Uint8Array = await syscontext.resourceManager.getRawFileContent('lenet_train_infer_0.input');
      let inputBuffer1: Uint8Array = await syscontext.resourceManager.getRawFileContent('lenet_train_infer_1.input');
      let expectedBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent('lenet_train_infer0.output');
      console.log('==========MSLITE expected file byteLength: ' + expectedBuffer.byteLength + '==========');

      let parsed = readTestDataFile(expectedBuffer, true);
      expect(parsed.dataSize).assertLarger(0);
      let expectedFloat: Float32Array = new Float32Array(parsed.data);
      console.log('==========MSLITE expected dataSize=' + parsed.dataSize + ', floatLen=' + expectedFloat.length + '==========');
      for (let i = 0; i < Math.min(expectedFloat.length, 10); i++) {
        console.log('==========MSLITE expected[' + i + ']=' + expectedFloat[i] + '==========');
      }

      let model_file = globalThis.abilityContext.filesDir + '/' + 'lenet_train.ms';
      let cfg: mindSporeLite.TrainCfg = {};
      let context: mindSporeLite.Context = {};
      context.target = ['cpu'];
      context.cpu = {};
      context.cpu.threadNum = 1;
      context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
      let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
      expect(msliteModel !== null).assertTrue();
      msliteModel.trainMode = true;
      const modelInputs = msliteModel.getInputs();
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      let path: string = globalThis.abilityContext.filesDir;
      ret = msliteModel.exportModel(path + '/lenet_train_infer.ms', mindSporeLite.QuantizationType.NO_QUANT, true);
      expect(ret).assertTrue();

      let predictModel = await mindSporeLite.loadModelFromFile(path + '/lenet_train_infer.ms');
      expect(predictModel !== null).assertTrue();
      predictModel.trainMode = false;
      const predictInputs = predictModel.getInputs();
      predictInputs[0].setData(inputBuffer0.buffer);
      let modelOutputs = await predictModel.predict(predictInputs);
      expect(modelOutputs !== null).assertTrue();
      let actualFloat: Float32Array = new Float32Array(modelOutputs[0].getData());
      for (let i = 0; i < Math.min(actualFloat.length, 10); i++) {
        console.log('==========MSLITE actual[' + i + ']=' + actualFloat[i] + '==========');
      }

      console.log('==========MSLITE compareOutputPrecision===========');
      let pass: boolean = await compareOutputPrecision(syscontext, 'lenet_train_infer', modelOutputs);
      expect(pass).assertTrue();

      let selfCmp: CompareResult = allCloseFloat(expectedFloat, expectedFloat, expectedFloat.length, DEFAULT_TOLERANCE, DEFAULT_TOLERANCE, false);
      expect(selfCmp.pass).assertTrue();
      expect(selfCmp.failCount).assertEqual(0);

      let tampered: Float32Array = expectedFloat.slice();
      tampered[0] = tampered[0] + 10.0;
      let badCmp: CompareResult = allCloseFloat(tampered, expectedFloat, expectedFloat.length, DEFAULT_TOLERANCE, DEFAULT_TOLERANCE, false);
      expect(badCmp.pass).assertFalse();
      expect(badCmp.failCount).assertLarger(0);

      let uint8SelfCmp: CompareResult = allCloseInt8(new Uint8Array([1, 2, 3]), new Uint8Array([1, 2, 3]), 3, DEFAULT_TOLERANCE, DEFAULT_TOLERANCE, false);
      expect(uint8SelfCmp.pass).assertTrue();
      console.log('==========MSLITE PrecisionCompare_0001 end===========');
      } catch (error) {
        console.error('SUB_AI_MindSpore_ArkTS_PrecisionCompare_0001 failed: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_PrecisionCompare_0002
     * @tc.number SUB_AI_MindSpore_ArkTS_PrecisionCompare_0002
     * @tc.desc   验证 compUint8WithTData / readTestDataFile(isFloat=false) 对 uint8 标杆的解析与对比能力
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_PrecisionCompare_0002', Level.LEVEL0, async () => {
      console.log('==========MSLITE PrecisionCompare_0002 start===========');
      let headerSize: number = 8;
      let header: Uint8Array = new Uint8Array(headerSize);
      header[0] = 1; header[1] = 0; header[2] = 0; header[3] = 0;
      header[4] = 4; header[5] = 0; header[6] = 0; header[7] = 0;
      let data: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      let merged: Uint8Array = new Uint8Array(header.length + data.length);
      merged.set(header, 0);
      merged.set(data, header.length);

      let parsed = readTestDataFile(merged, false);
      expect(parsed.dataSize).assertEqual(4);
      let expectedUint8: Uint8Array = new Uint8Array(parsed.data);
      expect(expectedUint8.length).assertEqual(4);

      let actualUint8: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      let cmpRes: CompareResult = compUint8WithTData(actualUint8, merged, DEFAULT_TOLERANCE, DEFAULT_TOLERANCE, false);
      console.log('==========MSLITE uint8 precision result: pass=' + cmpRes.pass + ', failCount=' + cmpRes.failCount + '==========');
      expect(cmpRes.pass).assertTrue();

      let badUint8: Uint8Array = new Uint8Array([11, 21, 31, 41]);
      let badRes: CompareResult = compUint8WithTData(badUint8, merged, DEFAULT_TOLERANCE, DEFAULT_TOLERANCE, false);
      expect(badRes.pass).assertFalse();
      console.log('==========MSLITE PrecisionCompare_0002 end===========');
    })


    // 正常场景：模拟器，ModelBuild，调用buffer方法，正常推理
    /**
     * @tc.name   Test_load_model_param_model_buffer_emulator
     * @tc.number Test_load_model_param_model_buffer_emulator
     * @tc.desc   Test_load_model_param_model_buffer_emulator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_load_model_param_model_buffer_emulator', Level.LEVEL0, async () => {
      try {
      console.log('MSLITE api test: loadModel param model file.Test_load_model_param_model_buffer');
      let modelName = 'ml_face_isface.ms';
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let modelBuffer = await syscontext.resourceManager.getRawFileContent(modelName);
      let context: mindSporeLite.Context = {};
      context.target = ['cpu'];
      let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      expect(modelInputs[0].name.toString()).assertEqual('data');
      expect(modelInputs[0].shape.toString()).assertEqual('1,48,48,3');;
      expect(modelInputs[0].elementNum.toString()).assertEqual('6912');
      expect(modelInputs[0].dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      expect(modelInputs[0].format).assertEqual(mindSporeLite.Format.NHWC);
      expect(modelInputs[0].dataSize.toString()).assertEqual('27648');
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('==========MSLITE compareOutputPrecision===========');
      let pass: boolean = await compareOutputPrecision(syscontext, 'ml_face_isface', modelOutputs);
      expect(pass).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      console.log('=========MSLITE new Float32Array end=====');
      } catch (error) {
        console.error('Test_load_model_param_model_buffer_emulator failed: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    });

    // 正常场景：模拟器，ModelBuild，调用fd方法，正常推理
    /**
     * @tc.name   Test_load_model_param_model_fd_emulator
     * @tc.number Test_load_model_param_model_fd_emulator
     * @tc.desc   Test_load_model_param_model_fd_emulator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_load_model_param_model_fd_emulator', Level.LEVEL0, async () => {
      try {
      console.log('MSLITE api test: loadModel param model file.Test_load_model_param_model_fd');
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      console.log('=========MSLITE loadModel start=====');
      let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
      let msliteModel = await mindSporeLite.loadModelFromFd(file.fd);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      fs.closeSync(file);
      const modelInputs = msliteModel.getInputs();
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('==========MSLITE compareOutputPrecision===========');
      let pass: boolean = await compareOutputPrecision(syscontext, 'ml_face_isface', modelOutputs);
      expect(pass).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      console.log('=========MSLITE new Float32Array end=====');
      } catch (error) {
        console.error('Test_load_model_param_model_fd_emulator failed: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    });

    // 正常场景：模拟器，ModelBuild，调用loadModelFromFile方法，正常推理
    /**
     * @tc.name   Test_load_model_param_model_path_emulator
     * @tc.number Test_load_model_param_model_path_emulator
     * @tc.desc   Test_load_model_param_model_path_emulator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_load_model_param_model_path_emulator', Level.LEVEL0, async () => {
      try {
      console.log('MSLITE api test: loadModel param model file.Test_load_model_param_model_path');
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let context: mindSporeLite.Context = {};
      context.target = ['cpu'];
      context.cpu = {};
      context.cpu.threadNum = 1;
      console.log('=========MSLITE loadModel start=====');
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('==========MSLITE compareOutputPrecision===========');
      let pass: boolean = await compareOutputPrecision(syscontext, 'ml_face_isface', modelOutputs);
      expect(pass).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      console.log('=========MSLITE new Float32Array end=====');
      } catch (error) {
        console.error('Test_load_model_param_model_path_emulator failed: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    });

    //正常场景：模拟器，Context设置CPU，4线程
    /**
     * @tc.name   Test_load_model_param_model_path_settings_threads_emulator_001
     * @tc.number Test_load_model_param_model_path_settings_threads_emulator_001
     * @tc.desc   Test_load_model_param_model_path_settings_threads_emulator_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_load_model_param_model_path_settings_threads_emulator_001', Level.LEVEL0, async () => {
      try {
      console.log('MSLITE api test: loadModel param model file.Test_load_model_param_model_path_settings_threads_001');
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let context: mindSporeLite.Context = {};
      context.target = ['cpu'];
      context.cpu = {
        'threadNum': 4,
      };
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('==========MSLITE compareOutputPrecision===========');
      let pass: boolean = await compareOutputPrecision(syscontext, 'ml_face_isface', modelOutputs);
      expect(pass).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      console.log('=========MSLITE new Float32Array end=====');
      } catch (error) {
        console.error('Test_load_model_param_model_path_settings_threads_emulator_001 failed: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    });

    //正常场景：模拟器，Context设置CPU，2线程
    /**
     * @tc.name   Test_load_model_param_model_path_settings_threads_emulator_002
     * @tc.number Test_load_model_param_model_path_settings_threads_emulator_002
     * @tc.desc   Test_load_model_param_model_path_settings_threads_emulator_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_load_model_param_model_path_settings_threads_emulator_002', Level.LEVEL0, async () => {
      try {
      console.log('MSLITE api test: loadModel param model file.Test_load_model_param_model_path_settings_threads_002');
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let context: mindSporeLite.Context = {};
      context.target = ['cpu'];
      context.cpu = {
        'threadNum': 2,
      };
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('==========MSLITE compareOutputPrecision===========');
      let pass: boolean = await compareOutputPrecision(syscontext, 'ml_face_isface', modelOutputs);
      expect(pass).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      console.log('=========MSLITE new Float32Array end=====');
      } catch (error) {
        console.error('Test_load_model_param_model_path_settings_threads_emulator_002 failed: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    });

    //正常场景：模拟器，Context设置CPU，1线程
    /**
     * @tc.name   Test_load_model_param_model_path_settings_threads_emulator_003
     * @tc.number Test_load_model_param_model_path_settings_threads_emulator_003
     * @tc.desc   Test_load_model_param_model_path_settings_threads_emulator_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_load_model_param_model_path_settings_threads_emulator_003', Level.LEVEL0, async () => {
      try {
      console.log('MSLITE api test: loadModel param model file.Test_load_model_param_model_path_settings_threads_003');
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let context: mindSporeLite.Context = {};
      context.target = ['cpu'];
      context.cpu = {
        'threadNum': 1,
      };
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('==========MSLITE compareOutputPrecision===========');
      let pass: boolean = await compareOutputPrecision(syscontext, 'ml_face_isface', modelOutputs);
      expect(pass).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      console.log('=========MSLITE new Float32Array end=====');
      } catch (error) {
        console.error('Test_load_model_param_model_path_settings_threads_emulator_003 failed: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    });

    //正常场景：模拟器，Context设置CPU，0线程
    /**
     * @tc.name   Test_load_model_param_model_path_settings_threads_emulator_004
     * @tc.number Test_load_model_param_model_path_settings_threads_emulator_004
     * @tc.desc   Test_load_model_param_model_path_settings_threads_emulator_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_load_model_param_model_path_settings_threads_emulator_004', Level.LEVEL0, async () => {
      try {
      console.log('MSLITE api test: loadModel param model file.Test_load_model_param_model_path_settings_threads_004');
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let context: mindSporeLite.Context = {};
      context.target = ['cpu'];
      context.cpu = {
        'threadNum': 0,
      };
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('==========MSLITE compareOutputPrecision===========');
      let pass: boolean = await compareOutputPrecision(syscontext, 'ml_face_isface', modelOutputs);
      expect(pass).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      console.log('=========MSLITE new Float32Array end=====');
      } catch (error) {
        console.error('Test_load_model_param_model_path_settings_threads_emulator_004 failed: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    });

    //异常场景：模拟器，ModelBuild，调用model path方法，path为空
    /**
     * @tc.name   Test_load_model_param_model_path_is_None_emulator_001
     * @tc.number Test_load_model_param_model_path_is_None_emulator_001
     * @tc.desc   Test_load_model_param_model_path_is_None_emulator_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_load_model_param_model_path_is_None_emulator_001', Level.LEVEL0, async (done: Function) => {
      console.log('MSLITE api test: loadModel param model file.Test_load_model_param_model_path_is_None_001');
      let model_file = '';
      let context: mindSporeLite.Context = {};
      context.target = ['cpu'];
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
      console.log('=========MSLITE loadModel end=====');
      expect(msliteModel).assertUndefined();
      done();
    });

    //异常场景：模拟器，ModelBuild，调用buffer方法，modelBuffer为None
    /**
     * @tc.name   Test_load_model_param_model_buffer_is_None_emulator_001
     * @tc.number Test_load_model_param_model_buffer_is_None_emulator_001
     * @tc.desc   Test_load_model_param_model_buffer_is_None_emulator_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_load_model_param_model_buffer_is_None_emulator_001', Level.LEVEL0, async (done: Function) => {
      console.log('MSLITE api test: loadModel param model file.Test_load_model_param_model_buffer_is_None_001');
      let context: mindSporeLite.Context = {};
      context.target = ['cpu'];
      let msliteModel = await mindSporeLite.loadModelFromBuffer(null, context);
      console.log('=========MSLITE loadModel end=====');
      expect(msliteModel).assertUndefined();
      done();
    });

    //异常场景：模拟器，ModelBuild，context为null
    /**
     * @tc.name   Test_load_model_param_model_path_context_is_None_emulator_001
     * @tc.number Test_load_model_param_model_path_context_is_None_emulator_001
     * @tc.desc   Test_load_model_param_model_path_context_is_None_emulator_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_load_model_param_model_path_context_is_None_emulator_001', Level.LEVEL0, async (done: Function) => {
      console.log('MSLITE api test: loadModel param model file.Test_load_model_param_model_path_context_is_None_001');
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file, null);
      expect(msliteModel).assertUndefined();
      console.log('=========MSLITE loadModel end=====');
      done();
    });

    // 正常场景：模拟器，ModelResize，shape与之前一致
    /**
     * @tc.name   Test_load_model_param_model_path_resize_emulator_001
     * @tc.number Test_load_model_param_model_path_resize_emulator_001
     * @tc.desc   Test_load_model_param_model_path_resize_emulator_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_load_model_param_model_path_resize_emulator_001', Level.LEVEL0, async () => {
      try {
      console.log('MSLITE api test: loadModel param model file.Test_load_model_param_model_path_resize_001');
      let inputName = 'ml_ocr_cn_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_ocr_cn.ms';
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      console.log('=========MSLITE resize start=====');
      let new_dim = new Array([1, 32, 512, 1]);
      let resize_result = msliteModel.resize(modelInputs, new_dim);
      expect(resize_result).assertTrue();
      console.log('=========MSLITE resize success=====');
      const modelInputs2 = msliteModel.getInputs();
      modelInputs2[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs2);
      expect(modelOutputs !== null).assertTrue();
      console.log('==========MSLITE compareOutputPrecision===========');
      let pass: boolean = await compareOutputPrecision(syscontext, 'ml_ocr_cn', modelOutputs);
      expect(pass).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      console.log('=========MSLITE new Float32Array end=====');
      } catch (error) {
        console.error('Test_load_model_param_model_path_resize_emulator_001 failed: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    });

    // 正常场景：模拟器，ModelResize，shape与之前不一致
    /**
     * @tc.name   Test_load_model_param_model_path_resize_emulator_002
     * @tc.number Test_load_model_param_model_path_resize_emulator_002
     * @tc.desc   Test_load_model_param_model_path_resize_emulator_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_load_model_param_model_path_resize_emulator_002', Level.LEVEL0, async () => {
      try {
      console.log('MSLITE api test: loadModel param model file.Test_load_model_param_model_path_resize_002');
      let inputName = 'ml_ocr_cn_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_ocr_cn.ms';
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      expect(modelInputs[0].name.toString()).assertEqual('data');
      let input_shape = modelInputs[0].shape;

      expect(input_shape.toString()).assertEqual('1,32,512,1');
      let input_elementNum = modelInputs[0].elementNum;

      expect(input_elementNum.toString()).assertEqual('16384');
      expect(modelInputs[0].dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      expect(modelInputs[0].format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;

      expect(input_dataSize.toString()).assertEqual('65536');
      console.log('=========MSLITE resize start=====');
      let new_dim = new Array([1, 64, 256, 1]);
      let resize_result = msliteModel.resize(modelInputs, new_dim);
      expect(resize_result).assertTrue();
      console.log('=========MSLITE resize success=====');
      const modelInputs2 = msliteModel.getInputs();
      let input_name2 = modelInputs2[0].name;
      console.log(input_name2.toString());
      expect(input_name2.toString()).assertEqual('data');
      let input_shape2 = modelInputs2[0].shape;
      console.log(input_shape2.toString());
      expect(input_shape2.toString()).assertEqual('1,64,256,1');
      let input_elementNum2 = modelInputs2[0].elementNum;
      console.log(input_elementNum2.toString());
      expect(input_elementNum2.toString()).assertEqual('16384');
      let input_dtype2 = modelInputs2[0].dtype;
      console.log(input_dtype2.toString());
      expect(input_dtype2).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      let input_format2 = modelInputs2[0].format;
      console.log(input_format2.toString());
      expect(input_format2).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize2 = modelInputs2[0].dataSize;
      console.log(input_dataSize2.toString());
      expect(input_dataSize2.toString()).assertEqual('65536');
      modelInputs2[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs2);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      console.log('=========MSLITE new Float32Array end=====');
      } catch (error) {
        console.error('Test_load_model_param_model_path_resize_emulator_002 failed: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    });

    // 异常场景：模拟器，ModelResize，shape为三维
    /**
     * @tc.name   Test_load_model_param_model_path_resize_emulator_003
     * @tc.number Test_load_model_param_model_path_resize_emulator_003
     * @tc.desc   Test_load_model_param_model_path_resize_emulator_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_load_model_param_model_path_resize_emulator_003', Level.LEVEL0, async () => {
      try {
      console.log('MSLITE api test: loadModel param model file.Test_load_model_param_model_path_resize_003');
      let inputName = 'ml_ocr_cn_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_ocr_cn.ms';
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      console.log('=========MSLITE resize start=====');
      let new_dim = new Array([1, 32, 1]);
      let resize_result = msliteModel.resize(modelInputs, new_dim);
      expect(resize_result).assertFalse;
      console.log('=========MSLITE resize failed=====');
      } catch (error) {
        console.error('Test_load_model_param_model_path_resize_emulator_003 failed: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    });

    // 异常场景：模拟器，ModelResize，不支持resize的模型
    /**
     * @tc.name   Test_load_model_param_model_path_resize_emulator_004
     * @tc.number Test_load_model_param_model_path_resize_emulator_004
     * @tc.desc   Test_load_model_param_model_path_resize_emulator_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_load_model_param_model_path_resize_emulator_004', Level.LEVEL0, async () => {
      try {
      console.log('MSLITE api test: loadModel param model file.Test_load_model_param_model_path_resize_004');
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      console.log('=========MSLITE resize start=====');
      let new_dim = new Array([1, 96, 96, 1]);
      let resize_result = msliteModel.resize(modelInputs, new_dim);
      expect(resize_result).assertFalse();
      console.log('=========MSLITE resize failed=====');
      } catch (error) {
        console.error('Test_load_model_param_model_path_resize_emulator_004 failed: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    });

    // 异常场景：模拟器，ModelResize，shape值有负数
    /**
     * @tc.name   Test_load_model_param_model_path_resize_emulator_005
     * @tc.number Test_load_model_param_model_path_resize_emulator_005
     * @tc.desc   Test_load_model_param_model_path_resize_emulator_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_load_model_param_model_path_resize_emulator_005', Level.LEVEL0, async () => {
      try {
      console.log('MSLITE api test: loadModel param model file.Test_load_model_param_model_path_resize_005');
      let inputName = 'ml_ocr_cn_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_ocr_cn.ms';
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      console.log('=========MSLITE resize start=====');
      let new_dim = new Array([1, -32, 32, 1]);
      let resize_result = msliteModel.resize(modelInputs, new_dim);
      expect(resize_result).assertFalse();
      console.log('=========MSLITE resize failed=====');
      } catch (error) {
        console.error('Test_load_model_param_model_path_resize_emulator_005 failed: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    });

    // 正常场景：模拟器，ModelResize，resize动态shape模型
    /**
     * @tc.name   Test_load_model_param_model_path_resize_emulator_006
     * @tc.number Test_load_model_param_model_path_resize_emulator_006
     * @tc.desc   Test_load_model_param_model_path_resize_emulator_006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_load_model_param_model_path_resize_emulator_006', Level.LEVEL0, async () => {
      try {
      console.log('MSLITE api test: loadModel param model file.Test_load_model_param_model_path_resize_emulator_006');
      let modelName = 'bert_tiny_dynamic.ms';
      let inputName0 = 'bert_tiny_dynamic_0.input';
      let inputName1 = 'bert_tiny_dynamic_1.input';
      let inputName2 = 'bert_tiny_dynamic_2.input';
      let syscontext: common.Context = globalThis.context;
      let inputBuffer0: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName0);
      let inputBuffer1: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName1);
      let inputBuffer2: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName2);

      let modelBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(modelName);
      let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      for (let modelInput of modelInputs) {
        console.log(modelInput.name.toString());
        console.log(modelInput.shape.toString());
        console.log(modelInput.elementNum.toString());
        console.log(modelInput.dtype.toString());
        console.log(modelInput.format.toString());
        console.log(modelInput.dataSize.toString());
      }
      let newDim = new Array([1, 8], [1, 8], [1, 8]);
      console.log('=========resize start=====');
      let resizeResult = msliteModel.resize(modelInputs, newDim);
      console.log('=========resize end=====');
      expect(resizeResult).assertTrue();
      const modelInputs2 = msliteModel.getInputs();
      modelInputs2[0].setData(inputBuffer0.buffer);
      modelInputs2[1].setData(inputBuffer1.buffer);
      modelInputs2[2].setData(inputBuffer2.buffer);
      let modelOutputs = await msliteModel.predict(modelInputs2);
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(modelOutputs !== null).assertTrue();
      console.log('==========MSLITE compareOutputPrecision===========');
      let pass: boolean = await compareOutputPrecision(syscontext, 'bert_tiny_dynamic', modelOutputs);
      expect(pass).assertTrue();
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
      } catch (error) {
        console.error('Test_load_model_param_model_path_resize_emulator_006 failed: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    })
    // 正常场景：模拟器，Build一次，Predict多次
    /**
     * @tc.name   Test_load_model_param_model_path_much_predict_emulator_001
     * @tc.number Test_load_model_param_model_path_much_predict_emulator_001
     * @tc.desc   Test_load_model_param_model_path_much_predict_emulator_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_load_model_param_model_path_much_predict_emulator_001', Level.LEVEL0, async () => {
      try {
      console.log('MSLITE api test: loadModel param model file.Test_load_model_param_model_path_much_predict_001');
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let num = 0;
      for (let i = 0; i < 10; i++) {
        let modelOutputs = await msliteModel.predict(modelInputs);
        expect(modelOutputs !== null).assertTrue();
        console.log('==========MSLITE compareOutputPrecision===========');
        let pass: boolean = await compareOutputPrecision(syscontext, 'ml_face_isface', modelOutputs);
        expect(pass).assertTrue();
        console.log('=========MSLITE new Float32Array start=====');
        let output0 = new Float32Array(modelOutputs[0].getData());
        expect(output0.length).assertLarger(0);
        console.log('output0.length:' + output0.length);
        for (let z = 0; z < 2; z++) {
          console.log(output0[z].toString());
          expect(output0[z].toString() !== null).assertTrue();
        }
        console.log('=========MSLITE new Float32Array end=====');
        console.log('=========i.toString()=====');
        console.log(i.toString());
        ++num;
        console.log('=========num.toString()=====');
        console.log(num.toString());
      }
      } catch (error) {
        console.error('Test_load_model_param_model_path_much_predict_emulator_001 failed: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    });

    // 异常场景：模拟器，Build多次
    /**
     * @tc.name   Test_load_model_param_model_path_much_build_emulator_001
     * @tc.number Test_load_model_param_model_path_much_build_emulator_001
     * @tc.desc   Test_load_model_param_model_path_much_build_emulator_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_load_model_param_model_path_much_build_emulator_001', Level.LEVEL0, async () => {
      try {
      console.log('MSLITE api test: loadModel param model file.Test_load_model_param_model_path_much_build_001');
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      for (let i = 0; i < 10; i++) {
        mindSporeLite.loadModelFromFile(model_file);
      }
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('==========MSLITE compareOutputPrecision===========');
      let pass: boolean = await compareOutputPrecision(syscontext, 'ml_face_isface', modelOutputs);
      expect(pass).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      console.log('=========MSLITE new Float32Array end=====');
      } catch (error) {
        console.error('Test_load_model_param_model_path_much_build_emulator_001 failed: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    });

    // 正常场景：模拟器，单输入模型
    /**
     * @tc.name   Test_load_model_param_model_path_model_emulator_001
     * @tc.number Test_load_model_param_model_path_model_emulator_001
     * @tc.desc   Test_load_model_param_model_path_model_emulator_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_load_model_param_model_path_model_emulator_001', Level.LEVEL0, async () => {
      try {
      console.log('MSLITE api test: loadModel param model file.Test_load_model_param_model_path_model_001');
      let modelName = 'ml_face_isface.ms';
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let modelBuffer = await syscontext.resourceManager.getRawFileContent(modelName);
      let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      modelInputs[0].setData(inputBuffer.buffer);
      let Inputs2 = new Float32Array(modelInputs[0].getData());
      for (let i = 0; i < 5; i++) {
        console.log(Inputs2[i].toString());
      }
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      console.log('=========MSLITE new Float32Array end=====');
      } catch (error) {
        console.error('Test_load_model_param_model_path_model_emulator_001 failed: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    });

    // 正常场景：模拟器，多输入模型
    /**
     * @tc.name   Test_load_model_param_model_path_model_emulator_002
     * @tc.number Test_load_model_param_model_path_model_emulator_002
     * @tc.desc   Test_load_model_param_model_path_model_emulator_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_load_model_param_model_path_model_emulator_002', Level.LEVEL0, async () => {
      try {
      console.log('MSLITE api test: loadModel param model file.Test_load_model_param_model_path_model_002');
      let modelName = 'ml_video_edit_face_cutout_portraitSeg_deconv.ms';
      let inputName01 = 'ml_video_edit_face_cutout_portraitSeg_deconv_0.input';
      let inputName02 = 'ml_video_edit_face_cutout_portraitSeg_deconv_1.input';
      let syscontext: common.Context = globalThis.context;
      let inputBuffer01 = await syscontext.resourceManager.getRawFileContent(inputName01);
      let inputBuffer02 = await syscontext.resourceManager.getRawFileContent(inputName02);
      console.log('=========MSLITE success, input01 bin bytelength: ' + inputBuffer01.byteLength);
      console.log('=========MSLITE success, input02 bin bytelength: ' + inputBuffer02.byteLength);
      let modelBuffer = await syscontext.resourceManager.getRawFileContent(modelName);
      let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      console.log(modelInputs[0].name);
      expect(modelInputs[0].name.toString()).assertEqual('a');
      console.log(modelInputs[0].shape.toString());
      expect(modelInputs[0].shape.toString()).assertEqual('1,512,512,3');
      console.log(modelInputs[0].elementNum.toString());
      expect(modelInputs[0].elementNum.toString()).assertEqual('786432');
      expect(modelInputs[0].dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      expect(modelInputs[0].format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;

      expect(input_dataSize.toString()).assertEqual('3145728');
      console.log(modelInputs[1].name);
      expect(modelInputs[1].name.toString()).assertEqual('b');
      console.log(modelInputs[1].shape.toString());
      expect(modelInputs[1].shape.toString()).assertEqual('1,512,512,1');
      console.log(modelInputs[1].elementNum.toString());
      expect(modelInputs[1].elementNum.toString()).assertEqual('262144');
      console.log(modelInputs[1].dtype.toString());
      expect(modelInputs[1].dtype.toString()).assertEqual('43');
      console.log(modelInputs[1].format.toString());
      expect(modelInputs[1].format.toString()).assertEqual('1');
      console.log(modelInputs[1].dataSize.toString());
      expect(modelInputs[1].dataSize.toString()).assertEqual('1048576');
      modelInputs[0].setData(inputBuffer01.buffer);
      modelInputs[1].setData(inputBuffer02.buffer);
      let Inputs2 = new Float32Array(modelInputs[0].getData());
      for (let i = 0; i < 5; i++) {
        console.log(Inputs2[i].toString());
      }
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      console.log('=========MSLITE new Float32Array end=====');
      } catch (error) {
        console.error('Test_load_model_param_model_path_model_emulator_002 failed: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    });

    // 正常场景：模拟器，输入为uint8模型
    /**
     * @tc.name   Test_load_model_param_model_path_model_emulator_003
     * @tc.number Test_load_model_param_model_path_model_emulator_003
     * @tc.desc   Test_load_model_param_model_path_model_emulator_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_load_model_param_model_path_model_emulator_003', Level.LEVEL0, async () => {
      try {
      console.log('MSLITE api test: loadModel param model file.Test_load_model_param_model_path_model_003');
      let modelName = 'aiy_vision_classifier_plants_V1_3.ms';
      let inputName = 'aiy_vision_classifier_plants_V1_3_0.input';
      let syscontext: common.Context = globalThis.context;
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let modelBuffer = await syscontext.resourceManager.getRawFileContent(modelName);
      let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      console.log(modelInputs[0].name);
      expect(modelInputs[0].name.toString()).assertEqual('module/hub_input/images_uint8');
      console.log(modelInputs[0].shape.toString());
      expect(modelInputs[0].shape.toString()).assertEqual('1,224,224,3');
      console.log(modelInputs[0].elementNum.toString());
      expect(modelInputs[0].elementNum.toString()).assertEqual('150528');
      console.log(modelInputs[0].dtype.toString());
      expect(modelInputs[0].dtype.toString()).assertEqual('37');
      console.log(modelInputs[0].format.toString());
      expect(modelInputs[0].format.toString()).assertEqual('1');
      console.log(modelInputs[0].dataSize.toString());
      expect(modelInputs[0].dataSize.toString()).assertEqual('150528');
      modelInputs[0].setData(inputBuffer.buffer);
      let Inputs2 = new Uint8Array(modelInputs[0].getData());
      for (let i = 0; i < 5; i++) {
        console.log(Inputs2[i].toString());
      }
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('==========MSLITE compareOutputPrecision===========');
      let pass: boolean = await compareOutputPrecision(syscontext, 'aiy_vision_classifier_plants_V1_3', modelOutputs, DEFAULT_TOLERANCE, DEFAULT_TOLERANCE, true);
      expect(pass).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Uint8Array(modelOutputs[0].getData());
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      console.log('=========MSLITE new Float32Array end=====');
      } catch (error) {
        console.error('Test_load_model_param_model_path_model_emulator_003 failed: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    });

    // 正常场景：模拟器，多输入单输出
    /**
     * @tc.name   Test_load_model_param_model_path_model_emulator_004
     * @tc.number Test_load_model_param_model_path_model_emulator_004
     * @tc.desc   Test_load_model_param_model_path_model_emulator_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_load_model_param_model_path_model_emulator_004', Level.LEVEL0, async () => {
      try {
      console.log('MSLITE api test: loadModel param model file.Test_load_model_param_model_path_model_004');
      let modelName = 'ml_headpose_pb2tflite.ms';
      let inputName01 = 'ml_headpose_pb2tflite_0.input';
      let inputName02 = 'ml_headpose_pb2tflite_1.input';
      let inputName03 = 'ml_headpose_pb2tflite_2.input';
      let syscontext: common.Context = globalThis.context;
      let inputBuffer01 = await syscontext.resourceManager.getRawFileContent(inputName01);
      let inputBuffer02 = await syscontext.resourceManager.getRawFileContent(inputName02);
      let inputBuffer03 = await syscontext.resourceManager.getRawFileContent(inputName03);
      console.log('=========MSLITE success, input01 bin bytelength: ' + inputBuffer01.byteLength);
      console.log('=========MSLITE success, input02 bin bytelength: ' + inputBuffer02.byteLength);
      console.log('=========MSLITE success, input03 bin bytelength: ' + inputBuffer03.byteLength);
      let modelBuffer = await syscontext.resourceManager.getRawFileContent(modelName);
      let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      console.log(modelInputs[0].name);
      expect(modelInputs[0].name.toString()).assertEqual('input_1');
      console.log(modelInputs[0].shape.toString());
      expect(modelInputs[0].shape.toString()).assertEqual('1,64,64,3');
      console.log(modelInputs[0].elementNum.toString());
      expect(modelInputs[0].elementNum.toString()).assertEqual('12288');
      expect(modelInputs[0].dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      expect(modelInputs[0].format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;

      expect(input_dataSize.toString()).assertEqual('49152');
      console.log(modelInputs[1].name);
      expect(modelInputs[1].name.toString()).assertEqual('batch_normalization_8/batchnorm/add');
      console.log(modelInputs[1].shape.toString());
      expect(modelInputs[1].shape.toString()).assertEqual('16');
      console.log(modelInputs[1].elementNum.toString());
      expect(modelInputs[1].elementNum.toString()).assertEqual('16');
      console.log(modelInputs[1].dtype.toString());
      expect(modelInputs[1].dtype.toString()).assertEqual('43');
      console.log(modelInputs[1].format.toString());
      expect(modelInputs[1].format.toString()).assertEqual('1');
      console.log(modelInputs[1].dataSize.toString());
      expect(modelInputs[1].dataSize.toString()).assertEqual('64');
      console.log(modelInputs[2].name);
      expect(modelInputs[2].name.toString()).assertEqual('batch_normalization_1/batchnorm/add');
      console.log(modelInputs[2].shape.toString());
      expect(modelInputs[2].shape.toString()).assertEqual('16');
      console.log(modelInputs[2].elementNum.toString());
      expect(modelInputs[2].elementNum.toString()).assertEqual('16');
      console.log(modelInputs[2].dtype.toString());
      expect(modelInputs[2].dtype.toString()).assertEqual('43');
      console.log(modelInputs[2].format.toString());
      expect(modelInputs[2].format.toString()).assertEqual('1');
      console.log(modelInputs[2].dataSize.toString());
      expect(modelInputs[2].dataSize.toString()).assertEqual('64');
      modelInputs[0].setData(inputBuffer01.buffer);
      modelInputs[1].setData(inputBuffer02.buffer);
      modelInputs[2].setData(inputBuffer03.buffer);
      let Inputs2 = new Float32Array(modelInputs[0].getData());
      for (let i = 0; i < 5; i++) {
        console.log(Inputs2[i].toString());
      }
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('==========MSLITE compareOutputPrecision===========');
      let pass: boolean = await compareOutputPrecision(syscontext, 'ml_headpose_pb2tflite', modelOutputs, 0.02, 0.02);
      expect(pass).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      console.log('=========MSLITE new Float32Array end=====');
      } catch (error) {
        console.error('Test_load_model_param_model_path_model_emulator_004 failed: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    });

    // 正常场景：模拟器，调用loadModelFromFile callback接口设置context
    /**
     * @tc.name   Test_load_model_param_model_path_callback_emulator
     * @tc.number Test_load_model_param_model_path_callback_emulator
     * @tc.desc   Test_load_model_param_model_path_callback_emulator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_load_model_param_model_path_callback_emulator', Level.LEVEL0, async (done: Function) => {
      console.log('MSLITE api test: loadModel param model file.Test_load_model_param_model_path_callback_emulator');
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      console.log('=========MSLITE loadModel start=====');
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let context: mindSporeLite.Context = {};
      context.target = ['cpu'];
      context.cpu = {
        'threadNum': 4,
      }
      mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
        console.log('=========MSLITE loadModel end=====');
        expect(msliteModel !== null).assertTrue();
        console.log('=========MSLITE loadModel end=====');
        let modelInputs: mindSporeLite.MSTensor[] = msliteModel.getInputs();
        expect(modelInputs[0].name.toString()).assertEqual('data');
        expect(modelInputs[0].shape.toString()).assertEqual('1,48,48,3');
        expect(modelInputs[0].elementNum.toString()).assertEqual('6912');
        expect(modelInputs[0].dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
        expect(modelInputs[0].format).assertEqual(mindSporeLite.Format.NHWC);
        expect(modelInputs[0].dataSize.toString()).assertEqual('27648');
        modelInputs[0].setData(inputBuffer.buffer);
        console.log('=========MSLITE predict start=====');
        msliteModel.predict(modelInputs, async (modelOutputs: mindSporeLite.MSTensor[]) => {
          expect(modelOutputs !== null).assertTrue();
          console.log('=========MSLITE new Float32Array start=====');
          let output0 = new Float32Array(modelOutputs[0].getData());
          expect(output0.length).assertLarger(0);
          console.log('output0.length:' + output0.length);
          for (let i = 0; i < 2; i++) {
            console.log(output0[i].toString());
            expect(output0[i].toString() !== null).assertTrue();
          }
          console.log('=========MSLITE new Float32Array end=====');
          console.log('==========MSLITE compareOutputPrecision===========');
          let pass: boolean = await compareOutputPrecision(syscontext, 'ml_face_isface', modelOutputs);
          expect(pass).assertTrue();
          done();
        })
      })
    });

    // 正常场景：模拟器，调用loadModelFromBuffer callback接口设置context
    /**
     * @tc.name   Test_load_model_param_model_buffer_callback_emulator
     * @tc.number Test_load_model_param_model_buffer_callback_emulator
     * @tc.desc   Test_load_model_param_model_buffer_callback_emulator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_load_model_param_model_buffer_callback_emulator', Level.LEVEL0, async (done: Function) => {
      console.log('MSLITE api test: loadModel param model file.Test_load_model_param_model_buffer_callback_emulator');
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      console.log('=========MSLITE loadModel start=====');
      let modelName = 'ml_face_isface.ms';
      let model_buffer = await syscontext.resourceManager.getRawFileContent(modelName);
      let context: mindSporeLite.Context = {};
      context.target = ['cpu'];
      context.cpu = {
        'threadNum': 4,
      }
      mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context, (msliteModel: mindSporeLite.Model) => {
        expect(msliteModel !== null).assertTrue();
        console.log('=========MSLITE loadModel end=====');
        let modelInputs: mindSporeLite.MSTensor[] = msliteModel.getInputs();
        let input_name = modelInputs[0].name;
        console.log(input_name.toString());
        expect(input_name.toString()).assertEqual('data');
        let input_shape = modelInputs[0].shape;
        console.log(input_shape.toString());
        expect(input_shape.toString()).assertEqual('1,48,48,3')
        let input_elementNum = modelInputs[0].elementNum;
        console.log(input_elementNum.toString());
        expect(input_elementNum.toString()).assertEqual('6912');
        let input_dtype = modelInputs[0].dtype;
        console.log(input_dtype.toString());
        expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
        let input_format = modelInputs[0].format;
        console.log(input_format.toString());
        expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
        let input_dataSize = modelInputs[0].dataSize;
        console.log(input_dataSize.toString());
        expect(input_dataSize.toString()).assertEqual('27648');
        modelInputs[0].setData(inputBuffer.buffer);
        console.log('=========MSLITE predict start=====');
        msliteModel.predict(modelInputs, async (modelOutputs: mindSporeLite.MSTensor[]) => {
          expect(modelOutputs !== null).assertTrue();
          console.log('=========MSLITE new Float32Array start=====');
          let output0 = new Float32Array(modelOutputs[0].getData());
          expect(output0.length).assertLarger(0);
          console.log('output0.length:' + output0.length);
          for (let i = 0; i < 2; i++) {
            console.log(output0[i].toString());
            expect(output0[i].toString() !== null).assertTrue();
          }
          console.log('=========MSLITE new Float32Array end=====');
          console.log('==========MSLITE compareOutputPrecision===========');
          let pass: boolean = await compareOutputPrecision(syscontext, 'ml_face_isface', modelOutputs);
          expect(pass).assertTrue();
          done();
        })
      })
    });

    // 正常场景：模拟器，调用loadModelFromFd callback接口设置context
    /**
     * @tc.name   Test_load_model_param_model_fd_callback_emulator
     * @tc.number Test_load_model_param_model_fd_callback_emulator
     * @tc.desc   Test_load_model_param_model_fd_callback_emulator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_load_model_param_model_fd_callback_emulator', Level.LEVEL0, async (done: Function) => {
      console.log('MSLITE api test: loadModel param model file.Test_load_model_param_model_fd_callback_emulator');
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      console.log('=========MSLITE loadModel start=====');
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
      let context:mindSporeLite.Context={};
      context.target = ['cpu'];
      context.cpu = {
        'threadNum': 4,
      }
      mindSporeLite.loadModelFromFd(file.fd, (msliteModel: mindSporeLite.Model) => {
        expect(msliteModel !== null).assertTrue();
        fs.closeSync(file);
        console.log('=========MSLITE loadModel end=====');
        let modelInputs: mindSporeLite.MSTensor[] = msliteModel.getInputs();
        let input_name = modelInputs[0].name;
        console.log(input_name.toString());
        expect(input_name.toString()).assertEqual('data');
        let input_shape = modelInputs[0].shape;
        console.log(input_shape.toString());
        expect(input_shape.toString()).assertEqual('1,48,48,3')
        let input_elementNum = modelInputs[0].elementNum;
        console.log(input_elementNum.toString());
        expect(input_elementNum.toString()).assertEqual('6912');
        let input_dtype = modelInputs[0].dtype;
        console.log(input_dtype.toString());
        expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
        let input_format = modelInputs[0].format;
        console.log(input_format.toString());
        expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
        let input_dataSize = modelInputs[0].dataSize;
        console.log(input_dataSize.toString());
        expect(input_dataSize.toString()).assertEqual('27648');
        modelInputs[0].setData(inputBuffer.buffer);
        console.log('=========MSLITE predict start=====');
        msliteModel.predict(modelInputs, async (modelOutputs: mindSporeLite.MSTensor[]) => {
          expect(modelOutputs !== null).assertTrue();
          console.log('=========MSLITE new Float32Array start=====');
          let output0 = new Float32Array(modelOutputs[0].getData());
          expect(output0.length).assertLarger(0);
          console.log('output0.length:' + output0.length);
          for (let i = 0; i < 2; i++) {
            console.log(output0[i].toString());
            expect(output0[i].toString() !== null).assertTrue();
          }
          console.log('=========MSLITE new Float32Array end=====');
          console.log('==========MSLITE compareOutputPrecision===========');
          let pass: boolean = await compareOutputPrecision(syscontext, 'ml_face_isface', modelOutputs);
          expect(pass).assertTrue();
          done();
        })
      })
    });

    // 正常场景：模拟器，调用loadModelFromFile callback接口未设置context
    /**
     * @tc.name   Test_load_model_param_model_path_callback_no_context_emulator
     * @tc.number Test_load_model_param_model_path_callback_no_context_emulator
     * @tc.desc   Test_load_model_param_model_path_callback_no_context_emulator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_load_model_param_model_path_callback_no_context_emulator', Level.LEVEL0, async (done: Function) => {
      console.log('MSLITE api test: loadModel param model file.Test_load_model_param_model_path_callback_no_context_emulator');
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      console.log('=========MSLITE loadModel start=====');
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      mindSporeLite.loadModelFromFile(model_file, (msliteModel: mindSporeLite.Model) => {
        expect(msliteModel !== null).assertTrue();
        console.log('=========MSLITE loadModel end=====');
        let modelInputs: mindSporeLite.MSTensor[] = msliteModel.getInputs();
        let input_name = modelInputs[0].name;
        console.log(input_name.toString());
        expect(input_name.toString()).assertEqual('data');
        let input_shape = modelInputs[0].shape;
        console.log(input_shape.toString());
        expect(input_shape.toString()).assertEqual('1,48,48,3')
        let input_elementNum = modelInputs[0].elementNum;
        console.log(input_elementNum.toString());
        expect(input_elementNum.toString()).assertEqual('6912');
        let input_dtype = modelInputs[0].dtype;
        console.log(input_dtype.toString());
        expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
        let input_format = modelInputs[0].format;
        console.log(input_format.toString());
        expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
        let input_dataSize = modelInputs[0].dataSize;
        console.log(input_dataSize.toString());
        expect(input_dataSize.toString()).assertEqual('27648');
        modelInputs[0].setData(inputBuffer.buffer);
        console.log('=========MSLITE predict start=====');
        msliteModel.predict(modelInputs, async (modelOutputs: mindSporeLite.MSTensor[]) => {
          expect(modelOutputs !== null).assertTrue();
          console.log('=========MSLITE new Float32Array start=====');
          let output0 = new Float32Array(modelOutputs[0].getData());
          expect(output0.length).assertLarger(0);
          console.log('output0.length:' + output0.length);
          for (let i = 0; i < 2; i++) {
            console.log(output0[i].toString());
            expect(output0[i].toString() !== null).assertTrue();
          }
          console.log('=========MSLITE new Float32Array end=====');
          console.log('==========MSLITE compareOutputPrecision===========');
          let pass: boolean = await compareOutputPrecision(syscontext, 'ml_face_isface', modelOutputs);
          expect(pass).assertTrue();
          done();
        })
      })
    });

    // 正常场景：模拟器，调用loadModelFromBuffer callback接口未设置context
    /**
     * @tc.name   Test_load_model_param_model_buffer_callback_no_context_emulator
     * @tc.number Test_load_model_param_model_buffer_callback_no_context_emulator
     * @tc.desc   Test_load_model_param_model_buffer_callback_no_context_emulator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_load_model_param_model_buffer_callback_no_context_emulator', Level.LEVEL0, async (done: Function) => {
      console.log('MSLITE api test: loadModel param model file.Test_load_model_param_model_buffer_callback_no_context_emulator');
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      console.log('=========MSLITE loadModel start=====');
      let modelName = 'ml_face_isface.ms';
      let model_buffer = await syscontext.resourceManager.getRawFileContent(modelName);
      mindSporeLite.loadModelFromBuffer(model_buffer.buffer, (msliteModel: mindSporeLite.Model) => {
        expect(msliteModel !== null).assertTrue();
        console.log('=========MSLITE loadModel end=====');
        let modelInputs: mindSporeLite.MSTensor[] = msliteModel.getInputs();
        let input_name = modelInputs[0].name;
        console.log(input_name.toString());
        expect(input_name.toString()).assertEqual('data');
        let input_shape = modelInputs[0].shape;
        console.log(input_shape.toString());
        expect(input_shape.toString()).assertEqual('1,48,48,3')
        let input_elementNum = modelInputs[0].elementNum;
        console.log(input_elementNum.toString());
        expect(input_elementNum.toString()).assertEqual('6912');
        let input_dtype = modelInputs[0].dtype;
        console.log(input_dtype.toString());
        expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
        let input_format = modelInputs[0].format;
        console.log(input_format.toString());
        expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
        let input_dataSize = modelInputs[0].dataSize;
        console.log(input_dataSize.toString());
        expect(input_dataSize.toString()).assertEqual('27648');
        modelInputs[0].setData(inputBuffer.buffer);
        console.log('=========MSLITE predict start=====');
        msliteModel.predict(modelInputs, async (modelOutputs: mindSporeLite.MSTensor[]) => {
          expect(modelOutputs !== null).assertTrue();
          console.log('=========MSLITE new Float32Array start=====');
          let output0 = new Float32Array(modelOutputs[0].getData());
          expect(output0.length).assertLarger(0);
          console.log('output0.length:' + output0.length);
          for (let i = 0; i < 2; i++) {
            console.log(output0[i].toString());
            expect(output0[i].toString() !== null).assertTrue();
          }
          console.log('=========MSLITE new Float32Array end=====');
          console.log('==========MSLITE compareOutputPrecision===========');
          let pass: boolean = await compareOutputPrecision(syscontext, 'ml_face_isface', modelOutputs);
          expect(pass).assertTrue();
          done();
        })
      })
    });

    // 正常场景：模拟器，调用loadModelFromFd callback接口未设置context
    /**
     * @tc.name   Test_load_model_param_model_fd_callback_no_context_emulator
     * @tc.number Test_load_model_param_model_fd_callback_no_context_emulator
     * @tc.desc   Test_load_model_param_model_fd_callback_no_context_emulator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_load_model_param_model_fd_callback_no_context_emulator', Level.LEVEL0, async (done: Function) => {
      console.log('MSLITE api test: loadModel param model file.Test_load_model_param_model_fd_callback_no_context_emulator');
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      console.log('=========MSLITE loadModel start=====');
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
      mindSporeLite.loadModelFromFd(file.fd, (msliteModel: mindSporeLite.Model) => {
        expect(msliteModel !== null).assertTrue();
        fs.closeSync(file);
        console.log('=========MSLITE loadModel end=====');
        let modelInputs: mindSporeLite.MSTensor[] = msliteModel.getInputs();
        let input_name = modelInputs[0].name;
        console.log(input_name.toString());
        expect(input_name.toString()).assertEqual('data');
        let input_shape = modelInputs[0].shape;
        console.log(input_shape.toString());
        expect(input_shape.toString()).assertEqual('1,48,48,3');
        let input_elementNum = modelInputs[0].elementNum;
        console.log(input_elementNum.toString());
        expect(input_elementNum.toString()).assertEqual('6912');
        let input_dtype = modelInputs[0].dtype;
        console.log(input_dtype.toString());
        expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
        let input_format = modelInputs[0].format;
        console.log(input_format.toString());
        expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
        let input_dataSize = modelInputs[0].dataSize;
        console.log(input_dataSize.toString());
        expect(input_dataSize.toString()).assertEqual('27648');
        modelInputs[0].setData(inputBuffer.buffer);
        console.log('=========MSLITE predict start=====');
        msliteModel.predict(modelInputs, async (modelOutputs: mindSporeLite.MSTensor[]) => {
          expect(modelOutputs !== null).assertTrue();
          console.log('=========MSLITE new Float32Array start=====');
          let output0 = new Float32Array(modelOutputs[0].getData());
          expect(output0.length).assertLarger(0);
          console.log('output0.length:' + output0.length);
          for (let i = 0; i < 2; i++) {
            console.log(output0[i].toString());
            expect(output0[i].toString() !== null).assertTrue();
          }
          console.log('=========MSLITE new Float32Array end=====');
          console.log('==========MSLITE compareOutputPrecision===========');
          let pass: boolean = await compareOutputPrecision(syscontext, 'ml_face_isface', modelOutputs);
          expect(pass).assertTrue();
          done();
        })
      })
    });
  })
}
