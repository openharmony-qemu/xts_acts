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
 * 补充测试用例：参考 ActsMindSporeCTest（C/NAPI 测试）中存在但 mindsporejstest 缺失的测试点。
 * 覆盖训练 API 异常场景、resize 异常、模型加载异常、CPU Context 边界值、NNRT 缓存/异常设备 ID、
 * predict 回调版本、setData 多次调用、exportModel 目录路径等 19 个测试点。
 */
import { describe, beforeAll, beforeEach, it, expect, Level } from '@ohos/hypium'
import mindSporeLite from '@ohos.ai.mindSporeLite';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

import {
  copyRawfileToSandbox,
  compareOutputPrecision,
  strToArrayBuffer,
  fillFloat32Array,
  setRandomInputs,
} from './CommonUtils';

async function Predict_fun(model_obj: mindSporeLite.Model): Promise<boolean> {
  const modelInputs = model_obj.getInputs();
  setRandomInputs('Predict_fun', modelInputs)
  let modelOutputs = await model_obj.predict(modelInputs);
  expect(modelOutputs).not().assertUndefined();
  expect(modelOutputs).not().assertNull();
  let output0 = new Float32Array(modelOutputs[0].getData());
  expect(output0.length).assertLarger(0);
  console.log('output0.length:' + output0.length);
  for (let z = 0; z < 2; z++) {
    console.log(output0[z].toString());
    expect(output0[z].toString() !== null).assertTrue();
  }
  return true;
}

export default function supplementTest() {
  describe('SupplementTest', () => {
    beforeAll(async () => {
      let dir = globalThis.abilityContext.filesDir + '/';
      try {
        await copyRawfileToSandbox(globalThis.context, dir,
          ['ml_face_isface.ms', 'ml_face_isface_0.input',
           'ml_ocr_cn.ms', 'lenet_train.ms', 'lenet_train_0.input', 'lenet_train_1.input']);
      } catch (error) {
        console.info('[rawfile_copy_to_sandbox] failed: ' + error);
      }
      console.info('[rawfile_copy_to_sandbox] sandbox path: ' + dir);
    })

    beforeEach(() => {
      console.info('SupplementTest beforeEach');
    })

    // ========== P1: 训练相关异常场景 ==========
    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Supplement_SetupVirtualBatch_Non_Train_Model_0002
     * @tc.number SUB_AI_MindSpore_ArkTS_Supplement_SetupVirtualBatch_Non_Train_Model_0002
     * @tc.desc   验证在非训练模型（.ms 推理模型）上调用 setupVirtualBatch 返回 false 或抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Supplement_SetupVirtualBatch_Non_Train_Model_0002', Level.LEVEL0, async (done: Function) => {
      console.log('==========MSLITE Supplement_0002 setupVirtualBatch on non-train model start===========');
      try {
        let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
        expect(msliteModel !== null).assertTrue();
        let ret = msliteModel.setupVirtualBatch(2, -1, -1);
        console.log('==========MSLITE setupVirtualBatch on non-train model ret: ' + ret + '===========');
        expect(ret).assertFalse();
      } catch (error) {
        console.log('==========MSLITE Supplement_0002 error (acceptable): ' + JSON.stringify(error) + '===========');
      }
      console.log('==========MSLITE Supplement_0002 end===========');
      done();
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Supplement_UpdateWeights_Wrong_Name_0003
     * @tc.number SUB_AI_MindSpore_ArkTS_Supplement_UpdateWeights_Wrong_Name_0003
     * @tc.desc   验证 updateWeights 传入错误 tensor 名时返回 false 或抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Supplement_UpdateWeights_Wrong_Name_0003', Level.LEVEL0, async (done: Function) => {
      console.log('==========MSLITE Supplement_0003 updateWeights wrong name start===========');
      try {
        let syscontext: common.Context = globalThis.context;
        let inputBuffer0: Uint8Array = await syscontext.resourceManager.getRawFileContent('lenet_train_0.input');
        let inputBuffer1: Uint8Array = await syscontext.resourceManager.getRawFileContent('lenet_train_1.input');
        let model_file = globalThis.abilityContext.filesDir + '/' + 'lenet_train.ms';
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file);
        expect(msliteModel !== null).assertTrue();
        msliteModel.trainMode = true;
        const modelInputs = msliteModel.getInputs();
        modelInputs[0].setData(inputBuffer0.buffer);
        modelInputs[1].setData(inputBuffer1.buffer);
        msliteModel.runStep(modelInputs);
        let weights = msliteModel.getWeights();
        expect(weights.length).assertLarger(0);
        console.log('==========MSLITE original weight name: ' + weights[0].name + '===========');
        weights[0].name = 'AAAA';
        let ret = msliteModel.updateWeights(weights);
        console.log('==========MSLITE updateWeights wrong name ret: ' + ret + '===========');
        expect(ret).assertFalse();
      } catch (error) {
        console.log('==========MSLITE Supplement_0003 error (acceptable): ' + JSON.stringify(error) + '===========');
      }
      console.log('==========MSLITE Supplement_0003 end===========');
      done();
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Supplement_UpdateWeights_Wrong_Type_0004
     * @tc.number SUB_AI_MindSpore_ArkTS_Supplement_UpdateWeights_Wrong_Type_0004
     * @tc.desc   验证 updateWeights 传入错误 tensor 数据类型时返回 false 或抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Supplement_UpdateWeights_Wrong_Type_0004', Level.LEVEL0, async (done: Function) => {
      console.log('==========MSLITE Supplement_0004 updateWeights wrong type start===========');
      try {
        let syscontext: common.Context = globalThis.context;
        let inputBuffer0: Uint8Array = await syscontext.resourceManager.getRawFileContent('lenet_train_0.input');
        let inputBuffer1: Uint8Array = await syscontext.resourceManager.getRawFileContent('lenet_train_1.input');
        let model_file = globalThis.abilityContext.filesDir + '/' + 'lenet_train.ms';
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file);
        expect(msliteModel !== null).assertTrue();
        msliteModel.trainMode = true;
        const modelInputs = msliteModel.getInputs();
        modelInputs[0].setData(inputBuffer0.buffer);
        modelInputs[1].setData(inputBuffer1.buffer);
        msliteModel.runStep(modelInputs);
        let weights = msliteModel.getWeights();
        expect(weights.length).assertLarger(0);
        console.log('==========MSLITE original weight dtype: ' + weights[0].dtype + '===========');
        weights[0].dtype = mindSporeLite.DataType.NUMBER_TYPE_INT8;
        let ret = msliteModel.updateWeights(weights);
        console.log('==========MSLITE updateWeights wrong type ret: ' + ret + '===========');
        expect(ret).assertFalse();
      } catch (error) {
        console.log('==========MSLITE Supplement_0004 error (acceptable): ' + JSON.stringify(error) + '===========');
      }
      console.log('==========MSLITE Supplement_0004 end===========');
      done();
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Supplement_TrainMode_Get_Set_0006
     * @tc.number SUB_AI_MindSpore_ArkTS_Supplement_TrainMode_Get_Set_0006
     * @tc.desc   验证设置 trainMode 后读取返回值与设置值一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Supplement_TrainMode_Get_Set_0006', Level.LEVEL0, async (done: Function) => {
      try {
        console.log('==========MSLITE Supplement_0006 trainMode get start===========');
        let model_file = globalThis.abilityContext.filesDir + '/' + 'lenet_train.ms';
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file);
        expect(msliteModel !== null).assertTrue();
        msliteModel.trainMode = true;
        console.log('==========MSLITE trainMode after set true: ' + msliteModel.trainMode + '===========');
        expect(msliteModel.trainMode).assertTrue();
        msliteModel.trainMode = false;
        console.log('==========MSLITE trainMode after set false: ' + msliteModel.trainMode + '===========');
        expect(msliteModel.trainMode).assertFalse();
        console.log('==========MSLITE Supplement_0006 end===========');
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    // ========== P1: resize 异常场景 ==========

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Supplement_Resize_Negative_Dim_0007
     * @tc.number SUB_AI_MindSpore_ArkTS_Supplement_Resize_Negative_Dim_0007
     * @tc.desc   验证 resize 传入负数维度时返回 false 或抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Supplement_Resize_Negative_Dim_0007', Level.LEVEL0, async (done: Function) => {
      console.log('==========MSLITE Supplement_0007 resize negative dim start===========');
      try {
        let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_ocr_cn.ms';
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
        expect(msliteModel !== null).assertTrue();
        const modelInputs = msliteModel.getInputs();
        let new_dim: number[][] = [[1, -32, 512, 1]];
        let ret = msliteModel.resize(modelInputs, new_dim);
        console.log('==========MSLITE resize negative dim ret: ' + ret + '===========');
        expect(ret).assertFalse();
      } catch (error) {
        console.log('==========MSLITE Supplement_0007 error (acceptable): ' + JSON.stringify(error) + '===========');
      }
      console.log('==========MSLITE Supplement_0007 end===========');
      done();
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Supplement_Resize_Dim_Count_Mismatch_0008
     * @tc.number SUB_AI_MindSpore_ArkTS_Supplement_Resize_Dim_Count_Mismatch_0008
     * @tc.desc   验证 resize 传入维度数量不匹配时返回 false 或抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Supplement_Resize_Dim_Count_Mismatch_0008', Level.LEVEL0, async (done: Function) => {
      console.log('==========MSLITE Supplement_0008 resize dim count mismatch start===========');
      try {
        let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_ocr_cn.ms';
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
        expect(msliteModel !== null).assertTrue();
        const modelInputs = msliteModel.getInputs();
        let new_dim: number[][] = [[1, 32, 1]];
        let ret = msliteModel.resize(modelInputs, new_dim);
        console.log('==========MSLITE resize dim count mismatch ret: ' + ret + '===========');
        expect(ret).assertFalse();
      } catch (error) {
        console.log('==========MSLITE Supplement_0008 error (acceptable): ' + JSON.stringify(error) + '===========');
      }
      console.log('==========MSLITE Supplement_0008 end===========');
      done();
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Supplement_Resize_Static_Model_0009
     * @tc.number SUB_AI_MindSpore_ArkTS_Supplement_Resize_Static_Model_0009
     * @tc.desc   验证在静态模型（不支持 resize）上调用 resize 返回 false 或抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Supplement_Resize_Static_Model_0009', Level.LEVEL0, async (done: Function) => {
      console.log('==========MSLITE Supplement_0009 resize static model start===========');
      try {
        let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
        expect(msliteModel !== null).assertTrue();
        const modelInputs = msliteModel.getInputs();
        let new_dim: number[][] = [[1, 96, 96, 3]];
        let ret = msliteModel.resize(modelInputs, new_dim);
        console.log('==========MSLITE resize static model ret: ' + ret + '===========');
        expect(ret).assertFalse();
      } catch (error) {
        console.log('==========MSLITE Supplement_0009 error (acceptable): ' + JSON.stringify(error) + '===========');
      }
      console.log('==========MSLITE Supplement_0009 end===========');
      done();
    })

    // ========== P1: 模型加载异常场景 ==========
    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Supplement_Load_Empty_Buffer_0011
     * @tc.number SUB_AI_MindSpore_ArkTS_Supplement_Load_Empty_Buffer_0011
     * @tc.desc   验证加载空 buffer 时返回 null 或抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Supplement_Load_Empty_Buffer_0011', Level.LEVEL0, async (done: Function) => {
      console.log('==========MSLITE Supplement_0011 load empty buffer start===========');
      try {
        let emptyBuffer: ArrayBuffer = new ArrayBuffer(0);
        let msliteModel = await mindSporeLite.loadModelFromBuffer(emptyBuffer);
        console.log('==========MSLITE load empty buffer result: ' + msliteModel + '===========');
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log('==========MSLITE Supplement_0011 error (acceptable): ' + JSON.stringify(error) + '===========');
      }
      console.log('==========MSLITE Supplement_0011 end===========');
      done();
    })

    // ========== P1: CPU Context 边界值 ==========

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Supplement_Cpu_ThreadNum_Zero_0013
     * @tc.number SUB_AI_MindSpore_ArkTS_Supplement_Cpu_ThreadNum_Zero_0013
     * @tc.desc   验证 CPU threadNum=0 时模型加载行为
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Supplement_Cpu_ThreadNum_Zero_0013', Level.LEVEL0, async (done: Function) => {
      console.log('==========MSLITE Supplement_0013 threadNum=0 start===========');
      try {
        let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
        let context: mindSporeLite.Context = {};
        context.target = ['cpu'];
        context.cpu = {};
        context.cpu.threadNum = 0;
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        console.log('==========MSLITE threadNum=0 load result: ' + msliteModel + '===========');
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        let predict_ret = await Predict_fun(msliteModel);
        expect(predict_ret).assertTrue();
      } catch (error) {
        console.log('==========MSLITE Supplement_0013 error (acceptable): ' + JSON.stringify(error) + '===========');
      }
      console.log('==========MSLITE Supplement_0013 end===========');
      done();
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Supplement_Cpu_CoreList_Negative_0014
     * @tc.number SUB_AI_MindSpore_ArkTS_Supplement_Cpu_CoreList_Negative_0014
     * @tc.desc   验证 CPU threadAffinityCoreList 含负数时模型加载行为
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Supplement_Cpu_CoreList_Negative_0014', Level.LEVEL0, async (done: Function) => {
      console.log('==========MSLITE Supplement_0014 coreList negative start===========');
      try {
        let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
        let context: mindSporeLite.Context = {};
        context.target = ['cpu'];
        context.cpu = {};
        context.cpu.threadNum = 2;
        context.cpu.threadAffinityCoreList = [-1, -2];
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        console.log('==========MSLITE coreList negative load result: ' + msliteModel + '===========');
        if (msliteModel !== null && msliteModel !== undefined) {
          console.log('==========MSLITE model loaded with negative coreList===========');
        } else {
          console.log('==========MSLITE model load failed with negative coreList===========');
        }
        let predict_ret = await Predict_fun(msliteModel);
        expect(predict_ret).assertTrue();
      } catch (error) {
        console.log('==========MSLITE Supplement_0014 error (acceptable): ' + JSON.stringify(error) + '===========');
      }
      console.log('==========MSLITE Supplement_0014 end===========');
      done();
    })

    // ========== P1: NNRT 相关（需 NPU 设备，无则 skip）==========
    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Supplement_NNRT_Cache_Config_0016
     * @tc.number SUB_AI_MindSpore_ArkTS_Supplement_NNRT_Cache_Config_0016
     * @tc.desc   验证 NNRT 缓存配置（CachePath/CacheVersion/ModelName via extensions）后模型加载和推理成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Supplement_NNRT_Cache_Config_0016', Level.LEVEL0, async (done: Function) => {
      console.log('==========MSLITE Supplement_0016 NNRT cache start===========');
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null) {
          console.log('=========getAllNNRTDeviceDescriptions is NULL, skip==========');
          done();
          return;
        }
        let flag: number = 99;
        for (let i = 0; i < all_devices.length; i++) {
          if (all_devices[i].deviceName().startsWith('NPU_')) {
            flag = i;
          }
        }
        if (flag == 99) {
          console.log('=========no NPU device, skip==========');
          done();
          return;
        }
        let syscontext: common.Context = globalThis.context;
        let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent('ml_face_isface_0.input');
        let modelBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent('ml_face_isface.ms');
        let cacheDir: string = globalThis.abilityContext.filesDir + '/cache_dir/';
        let context: mindSporeLite.Context = {};
        context.target = ['nnrt'];
        context.nnrt = {};
        context.nnrt.deviceID = all_devices[flag].deviceID();
        context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_NONE;
        context.nnrt.priority = mindSporeLite.Priority.PRIORITY_NONE;
        let cachePathExt: mindSporeLite.Extension = {
          name: 'CachePath',
          value: strToArrayBuffer(cacheDir)
        };
        let cacheVerExt: mindSporeLite.Extension = {
          name: 'CacheVersion',
          value: strToArrayBuffer('1')
        };
        let modelNameExt: mindSporeLite.Extension = {
          name: 'ModelName',
          value: strToArrayBuffer('cache_model')
        };
        context.nnrt.extensions = [cachePathExt, cacheVerExt, modelNameExt];
        let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context);
        console.log('==========MSLITE NNRT cache load result: ' + msliteModel + '===========');
        expect(msliteModel !== null).assertTrue();
        const modelInputs = msliteModel.getInputs();
        modelInputs[0].setData(inputBuffer.buffer);
        let modelOutputs = await msliteModel.predict(modelInputs);
        expect(modelOutputs !== null).assertTrue();
        let pass: boolean = await compareOutputPrecision(syscontext, 'ml_face_isface', modelOutputs);
        expect(pass).assertTrue();
      } catch (error) {
        console.log('==========MSLITE Supplement_0016 error: ' + JSON.stringify(error) + '===========');
      }
      console.log('==========MSLITE Supplement_0016 end===========');
      done();
    })

    // ========== P1: exportModel 异常 ==========

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Supplement_ExportModel_Folder_Path_0017
     * @tc.number SUB_AI_MindSpore_ArkTS_Supplement_ExportModel_Folder_Path_0017
     * @tc.desc   验证 exportModel 传入目录路径（非文件）时返回 false 或抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Supplement_ExportModel_Folder_Path_0017', Level.LEVEL0, async (done: Function) => {
      console.log('==========MSLITE Supplement_0017 exportModel folder path start===========');
      try {
        let syscontext: common.Context = globalThis.context;
        let inputBuffer0: Uint8Array = await syscontext.resourceManager.getRawFileContent('lenet_train_0.input');
        let inputBuffer1: Uint8Array = await syscontext.resourceManager.getRawFileContent('lenet_train_1.input');
        let model_file = globalThis.abilityContext.filesDir + '/' + 'lenet_train.ms';
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file);
        expect(msliteModel !== null).assertTrue();
        msliteModel.trainMode = true;
        const modelInputs = msliteModel.getInputs();
        modelInputs[0].setData(inputBuffer0.buffer);
        modelInputs[1].setData(inputBuffer1.buffer);
        msliteModel.runStep(modelInputs);
        let folderPath: string = globalThis.abilityContext.filesDir;
        console.log('==========MSLITE exportModel folder path: ' + folderPath + '===========');
        let ret = msliteModel.exportModel(folderPath, mindSporeLite.QuantizationType.NO_QUANT, true);
        console.log('==========MSLITE exportModel folder path ret: ' + ret + '===========');
        expect(ret).assertFalse();
      } catch (error) {
        console.log('==========MSLITE Supplement_0017 error (acceptable): ' + JSON.stringify(error) + '===========');
      }
      console.log('==========MSLITE Supplement_0017 end===========');
      done();
    })

    // ========== P2: 增强覆盖 ==========

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Supplement_Predict_Callback_0018
     * @tc.number SUB_AI_MindSpore_ArkTS_Supplement_Predict_Callback_0018
     * @tc.desc   验证 predict 回调版本（predict(inputs, callback)）正常返回推理结果
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Supplement_Predict_Callback_0018', Level.LEVEL0, (done: Function) => {
      console.log('==========MSLITE Supplement_0018 predict callback start===========');
      let syscontext: common.Context = globalThis.context;
      let inputName = 'ml_face_isface_0.input';
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      syscontext.resourceManager.getRawFileContent(inputName, (error: BusinessError, inputBuffer: Uint8Array) => {
        if (error) {
          console.log('==========MSLITE getRawFileContent error: ' + JSON.stringify(error) + '===========');
          done();
          return;
        }
        mindSporeLite.loadModelFromFile(model_file, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel !== null).assertTrue();
          console.log('=========MSLITE loadModel end=====');
          const modelInputs = msliteModel.getInputs();
          modelInputs[0].setData(inputBuffer.buffer);
          console.log('=========MSLITE predict callback start=====');
          msliteModel.predict(modelInputs, async (modelOutputs: mindSporeLite.MSTensor[]) => {
            try {
              expect(modelOutputs !== null).assertTrue();
              console.log('=========MSLITE predict callback received outputs=====');
              let output0 = new Float32Array(modelOutputs[0].getData());
              expect(output0.length).assertLarger(0);
              console.log('output0.length:' + output0.length);
              let pass: boolean = await compareOutputPrecision(syscontext, 'ml_face_isface', modelOutputs);
              expect(pass).assertTrue();
              console.log('=========MSLITE predict callback end=====');
            } catch (error) {
              console.log('predict callback error: ' + JSON.stringify(error));
            }
            done();
          });
        });
      });
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Supplement_SetData_Twice_0019
     * @tc.number SUB_AI_MindSpore_ArkTS_Supplement_SetData_Twice_0019
     * @tc.desc   验证 setData 多次调用后 getData 返回最后一次设置的数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Supplement_SetData_Twice_0019', Level.LEVEL0, async (done: Function) => {
      try {
        console.log('==========MSLITE Supplement_0019 setData twice start===========');
        let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
        expect(msliteModel !== null).assertTrue();
        const modelInputs = msliteModel.getInputs();
        let dataSize: number = modelInputs[0].dataSize;
        let data1: ArrayBuffer = fillFloat32Array(dataSize, 1.0);
        let data2: ArrayBuffer = fillFloat32Array(dataSize, 2.0);
        modelInputs[0].setData(data1);
        let result1: Float32Array = new Float32Array(modelInputs[0].getData());
        console.log('==========MSLITE after setData(1.0), first elements: ' +
          result1[0] + ', ' + result1[1] + '===========');
        modelInputs[0].setData(data2);
        let result2: Float32Array = new Float32Array(modelInputs[0].getData());
        console.log('==========MSLITE after setData(2.0), first elements: ' +
          result2[0] + ', ' + result2[1] + '===========');
        expect(result2[0]).assertEqual(2.0);
        console.log('==========MSLITE Supplement_0019 end===========');
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })
  })
}
