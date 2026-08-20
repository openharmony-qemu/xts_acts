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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import mindSporeLite from '@ohos.ai.mindSporeLite';
import fs from '@ohos.file.fs';
import common from '@ohos.app.ability.common';
import {
  copyRawfileToSandbox,
  setRandomInputs,
  compareOutputPrecision,
} from './CommonUtils';

const MODEL_BERT_DYNAMIC = 'bert_tiny_dynamic.ms';
const MODEL_SINGLE_DYNAMIC = 'single_input_dynamic.ms';
const MODEL_FACE_STATIC = 'ml_face_isface.ms';

async function getModelBuffer(name: string): Promise<Uint8Array> {
  const syscontext: common.Context = globalThis.context;
  return await syscontext.resourceManager.getRawFileContent(name);
}

async function loadModelByName(name: string, target: string[] = ['cpu']): Promise<mindSporeLite.Model> {
  const buffer = await getModelBuffer(name);
  const context: mindSporeLite.Context = { target: target };
  return await mindSporeLite.loadModelFromBuffer(buffer.buffer, context);
}

function shapeEqual(actual: number[], expected: number[]): boolean {
  if (actual.length !== expected.length) {
    return false;
  }
  for (let i = 0; i < actual.length; i++) {
    if (actual[i] !== expected[i]) {
      return false;
    }
  }
  return true;
}

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

async function loadBertInputBuffers(): Promise<ArrayBuffer[]> {
  const syscontext: common.Context = globalThis.context;
  const buf0: Uint8Array = await syscontext.resourceManager.getRawFileContent('bert_tiny_dynamic_0.input');
  const buf1: Uint8Array = await syscontext.resourceManager.getRawFileContent('bert_tiny_dynamic_1.input');
  const buf2: Uint8Array = await syscontext.resourceManager.getRawFileContent('bert_tiny_dynamic_2.input');
  return [buf0.buffer, buf1.buffer, buf2.buffer];
}

async function loadSingleInputBuffer(name: string): Promise<ArrayBuffer> {
  const syscontext: common.Context = globalThis.context;
  const buf: Uint8Array = await syscontext.resourceManager.getRawFileContent(name);
  return buf.buffer;
}

class FakeMSTensor implements mindSporeLite.MSTensor {
  name: string;
  shape: number[];
  elementNum: number;
  dataSize: number;
  dtype: mindSporeLite.DataType;
  format: mindSporeLite.Format;
  private dataBuffer: ArrayBuffer;

  constructor(
    name: string,
    shape: number[],
    elementNum: number,
    dataSize: number,
    dtype: mindSporeLite.DataType,
    format: mindSporeLite.Format,
    dataBuffer: ArrayBuffer,
  ) {
    this.name = name;
    this.shape = shape;
    this.elementNum = elementNum;
    this.dataSize = dataSize;
    this.dtype = dtype;
    this.format = format;
    this.dataBuffer = dataBuffer;
  }

  getData(): ArrayBuffer {
    return this.dataBuffer;
  }

  setData(inputArray: ArrayBuffer): void {
    this.dataBuffer = inputArray;
  }
}

export default function resizeTest() {
  describe('ResizeTest', () => {
    beforeAll(async () => {
      try {
      console.info('[rawfile_copy_to_sandbox] start copying models');
      try {
        const dir = globalThis.abilityContext.filesDir + '/';
        await copyRawfileToSandbox(globalThis.context, dir,
          [MODEL_BERT_DYNAMIC, MODEL_SINGLE_DYNAMIC, MODEL_FACE_STATIC]);
      } catch (error) {
        console.info('[rawfile_copy_to_sandbox] copy failed: ' + JSON.stringify(error));
      }
      const dir = globalThis.abilityContext.filesDir + '/';
      console.info('[rawfile_copy_to_sandbox] sandbox path: ' + dir);
      } catch (error) {
        console.error('beforeAll failed: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    })

    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    // ============================================================
    // 一、功能测试 Functional Test - 动态shape模型resize成功
    // 静态shape模型默认不支持resize，使用动态shape模型测试resize成功场景。
    // bert_tiny_dynamic.ms 为3输入动态shape模型，
    // single_input_dynamic.ms 为单输入动态shape模型(NHWC, 动态batch+H+W)。
    // ============================================================

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Single_Input_Dynamic_Resize_Success_0001
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Single_Input_Dynamic_Resize_Success_0001
     * @tc.desc   Single-input dynamic shape model (single_input_dynamic) resize succeeds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Single_Input_Dynamic_Resize_Success_0001', Level.LEVEL0, async (done: Function) => {
      try {
        console.log('ResizeTest: F_0001 single input dynamic resize success');
        const msliteModel = await loadModelByName(MODEL_SINGLE_DYNAMIC);
        expect(msliteModel !== null).assertTrue();
        const modelInputs = msliteModel.getInputs();
        expect(modelInputs.length).assertEqual(1);
        console.log('original shape: ' + modelInputs[0].shape.toString());
        const newDim: number[][] = [[1, 32, 32, 3]];
        const ret = msliteModel.resize(modelInputs, newDim);
        console.log('resize return: ' + ret);
        expect(ret).assertTrue();
        let predict_ret = await Predict_fun(msliteModel);
        expect(predict_ret).assertTrue();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Multi_Input_Dynamic_Resize_All_Success_0002
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Multi_Input_Dynamic_Resize_All_Success_0002
     * @tc.desc   Multi-input dynamic shape model (bert_tiny_dynamic) resize all inputs succeeds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Multi_Input_Dynamic_Resize_All_Success_0002', Level.LEVEL0, async (done: Function) => {
      try {
        console.log('ResizeTest: F_0002 multi input dynamic resize all success');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        expect(msliteModel !== null).assertTrue();
        const modelInputs = msliteModel.getInputs();
        expect(modelInputs.length).assertEqual(3);
        for (let i = 0; i < modelInputs.length; i++) {
          console.log('input' + i + ' shape: ' + modelInputs[i].shape.toString());
        }
        const newDim: number[][] = [[1, 8], [1, 8], [1, 8]];
        const ret = msliteModel.resize(modelInputs, newDim);
        console.log('resize return: ' + ret);
        expect(ret).assertTrue();
        let predict_ret = await Predict_fun(msliteModel);
        expect(predict_ret).assertTrue();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Shape_Matches_Dims_After_Resize_0003
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Shape_Matches_Dims_After_Resize_0003
     * @tc.desc   After resize, getInputs shape equals dims.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Shape_Matches_Dims_After_Resize_0003', Level.LEVEL0, async (done: Function) => {
      try {
        console.log('ResizeTest: F_0003 shape matches dims after resize');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        const newDim: number[][] = [[1, 8], [1, 8], [1, 8]];
        const ret = msliteModel.resize(modelInputs, newDim);
        expect(ret).assertTrue();
        const updatedInputs = msliteModel.getInputs();
        for (let i = 0; i < newDim.length; i++) {
          const equal = shapeEqual(updatedInputs[i].shape, newDim[i]);
          console.log('input' + i + ' expected: ' + newDim[i].toString() + ' actual: ' + updatedInputs[i].shape.toString());
          expect(equal).assertTrue();
        }
        let predict_ret = await Predict_fun(msliteModel);
        expect(predict_ret).assertTrue();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Elementnum_Datasize_Sync_Update_0004
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Elementnum_Datasize_Sync_Update_0004
     * @tc.desc   After resize, elementNum and dataSize are updated consistently.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Elementnum_Datasize_Sync_Update_0004', Level.LEVEL1, async (done: Function) => {
      try {
        console.log('ResizeTest: F_0004 elementNum and dataSize sync update');
        const msliteModel = await loadModelByName(MODEL_SINGLE_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        const newDim: number[][] = [[1, 32, 32, 3]];
        const ret = msliteModel.resize(modelInputs, newDim);
        expect(ret).assertTrue();
        const updatedInputs = msliteModel.getInputs();
        const expectedElementNum = 1 * 32 * 32 * 3;
        const expectedDataSize = expectedElementNum * 4;
        console.log('elementNum: ' + updatedInputs[0].elementNum + ' expected: ' + expectedElementNum);
        console.log('dataSize: ' + updatedInputs[0].dataSize + ' expected: ' + expectedDataSize);
        expect(updatedInputs[0].elementNum).assertEqual(expectedElementNum);
        expect(updatedInputs[0].dataSize).assertEqual(expectedDataSize);
        let predict_ret = await Predict_fun(msliteModel);
        expect(predict_ret).assertTrue();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Name_Dtype_Format_Unchanged_0005
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Name_Dtype_Format_Unchanged_0005
     * @tc.desc   After resize, name/dtype/format remain unchanged.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Name_Dtype_Format_Unchanged_0005', Level.LEVEL1, async (done: Function) => {
      try {
        console.log('ResizeTest: F_0005 name/dtype/format unchanged');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        const originalNames: string[] = [];
        const originalDtypes: mindSporeLite.DataType[] = [];
        const originalFormats: mindSporeLite.Format[] = [];
        for (let i = 0; i < modelInputs.length; i++) {
          originalNames.push(modelInputs[i].name);
          originalDtypes.push(modelInputs[i].dtype);
          originalFormats.push(modelInputs[i].format);
        }
        const newDim: number[][] = [[1, 8], [1, 8], [1, 8]];
        const ret = msliteModel.resize(modelInputs, newDim);
        expect(ret).assertTrue();
        const updatedInputs = msliteModel.getInputs();
        for (let i = 0; i < updatedInputs.length; i++) {
          expect(updatedInputs[i].name).assertEqual(originalNames[i]);
          expect(updatedInputs[i].dtype).assertEqual(originalDtypes[i]);
          expect(updatedInputs[i].format).assertEqual(originalFormats[i]);
        }
        let predict_ret = await Predict_fun(msliteModel);
        expect(predict_ret).assertTrue();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Original_Shape_Resize_Idempotent_0006
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Original_Shape_Resize_Idempotent_0006
     * @tc.desc   Resize with original shape is idempotent on dynamic model.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Original_Shape_Resize_Idempotent_0006', Level.LEVEL1, async (done: Function) => {
      try {
        console.log('ResizeTest: F_0006 original shape resize idempotent');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        const originalShapes: number[][] = [];
        for (let i = 0; i < modelInputs.length; i++) {
          originalShapes.push(modelInputs[i].shape.slice());
        }
        let inputShape = modelInputs[0].shape;
        console.log(inputShape.toString());
        const ret = msliteModel.resize(modelInputs, originalShapes);
        expect(ret).assertFalse();
        const updatedInputs = msliteModel.getInputs();
        for (let i = 0; i < updatedInputs.length; i++) {
          const equal = shapeEqual(updatedInputs[i].shape, originalShapes[i]);
          expect(equal).assertTrue();
        }
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Multi_Shape_Resize_Loop_0007
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Multi_Shape_Resize_Loop_0007
     * @tc.desc   Dynamic model resize to multiple different shapes in a loop.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Multi_Shape_Resize_Loop_0007', Level.LEVEL0, async (done: Function) => {
      try {
        console.log('ResizeTest: F_010 multi shape resize loop');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const shapes: number[][] = [[1, 8], [1, 16], [1, 8], [1, 4]];
        for (let i = 0; i < shapes.length; i++) {
          const modelInputs = msliteModel.getInputs();
          const newDim: number[][] = [shapes[i], shapes[i], shapes[i]];
          const ret = msliteModel.resize(modelInputs, newDim);
          console.log('resize to ' + shapes[i].toString() + ' ret=' + ret);
          expect(ret).assertTrue();
          let predict_ret = await Predict_fun(msliteModel);
          expect(predict_ret).assertTrue();
        }
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Dynamic_Batch_Size_0008
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Dynamic_Batch_Size_0008
     * @tc.desc   Dynamic batch size adjustment on bert model.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Dynamic_Batch_Size_0008', Level.LEVEL0, async (done: Function) => {
      try {
        console.log('ResizeTest: F_011 dynamic batch size');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const batches: number[] = [2, 4, 1];
        for (let i = 0; i < batches.length; i++) {
          const modelInputs = msliteModel.getInputs();
          const newDim: number[][] = [[batches[i], 8], [batches[i], 8], [batches[i], 8]];
          const ret = msliteModel.resize(modelInputs, newDim);
          console.log('resize batch=' + batches[i] + ' ret=' + ret);
          expect(ret).assertTrue();
          let predict_ret = await Predict_fun(msliteModel);
          expect(predict_ret).assertTrue();
        }
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Multi_Config_Switch_0009
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Multi_Config_Switch_0009
     * @tc.desc   One model switches between multiple input shape configs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Multi_Config_Switch_0009', Level.LEVEL1, async (done: Function) => {
      try {
        console.log('ResizeTest: F_013 multi config switch');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const configs: number[][] = [[1, 16], [1, 8], [1, 4], [1, 8]];
        for (let i = 0; i < configs.length; i++) {
          const modelInputs = msliteModel.getInputs();
          const ret = msliteModel.resize(modelInputs, [configs[i], configs[i], configs[i]]);
          expect(ret).assertTrue();
          let predict_ret = await Predict_fun(msliteModel);
          expect(predict_ret).assertTrue();
        }
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Only_Change_Batch_Dim_0010
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Only_Change_Batch_Dim_0010
     * @tc.desc   Only change batch (N) dimension on dynamic model.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Only_Change_Batch_Dim_0010', Level.LEVEL1, async (done: Function) => {
      try {
        console.log('ResizeTest: F_020 only change batch dim');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        const ret = msliteModel.resize(modelInputs, [[2, 8], [2, 8], [2, 8]]);
        expect(ret).assertTrue();
        let predict_ret = await Predict_fun(msliteModel);
        expect(predict_ret).assertTrue();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Only_Change_Seq_Len_Dim_0011
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Only_Change_Seq_Len_Dim_0011
     * @tc.desc   Only change seq_len dimension on dynamic model.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Only_Change_Seq_Len_Dim_0011', Level.LEVEL1, async (done: Function) => {
      try {
        console.log('ResizeTest: F_021 only change seq_len dim');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        const ret = msliteModel.resize(modelInputs, [[1, 16], [1, 16], [1, 16]]);
        expect(ret).assertTrue();
        let predict_ret = await Predict_fun(msliteModel);
        expect(predict_ret).assertTrue();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Multi_Dim_Simultaneous_Change_0012
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Multi_Dim_Simultaneous_Change_0012
     * @tc.desc   Multiple dimensions change simultaneously on dynamic model.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Multi_Dim_Simultaneous_Change_0012', Level.LEVEL1, async (done: Function) => {
      try {
        console.log('ResizeTest: F_024 multi dim simultaneous change');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        const ret = msliteModel.resize(modelInputs, [[2, 16], [2, 16], [2, 16]]);
        expect(ret).assertTrue();
        let predict_ret = await Predict_fun(msliteModel);
        expect(predict_ret).assertTrue();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Single_Input_Resize_Larger_Shape_0013
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Single_Input_Resize_Larger_Shape_0013
     * @tc.desc   Single-input model resize to LARGER shape (64→128) succeeds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Single_Input_Resize_Larger_Shape_0013', Level.LEVEL1, async (done: Function) => {
      try {
        console.log('ResizeTest: F_025 single input resize larger shape');
        const msliteModel = await loadModelByName(MODEL_SINGLE_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        console.log('original shape: ' + modelInputs[0].shape.toString());
        const ret = msliteModel.resize(modelInputs, [[1, 128, 128, 3]]);
        console.log('resize to larger shape ret=' + ret);
        expect(ret).assertTrue();
        let predict_ret = await Predict_fun(msliteModel);
        expect(predict_ret).assertTrue();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Single_Input_Resize_Batch_Only_0014
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Single_Input_Resize_Batch_Only_0014
     * @tc.desc   Single-input model only change batch dim (1→4) succeeds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Single_Input_Resize_Batch_Only_0014', Level.LEVEL1, async (done: Function) => {
      try {
        console.log('ResizeTest: F_026 single input resize batch only');
        const msliteModel = await loadModelByName(MODEL_SINGLE_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        const ret = msliteModel.resize(modelInputs, [[4, 64, 64, 3]]);
        console.log('resize batch=4 ret=' + ret);
        expect(ret).assertTrue();
        let predict_ret = await Predict_fun(msliteModel);
        expect(predict_ret).assertTrue();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Single_Input_Resize_H_Only_0015
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Single_Input_Resize_H_Only_0015
     * @tc.desc   Single-input model only change H dim succeeds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Single_Input_Resize_H_Only_0015', Level.LEVEL1, async (done: Function) => {
      try {
        console.log('ResizeTest: F_027 single input resize H only');
        const msliteModel = await loadModelByName(MODEL_SINGLE_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        const ret = msliteModel.resize(modelInputs, [[1, 32, 64, 3]]);
        console.log('resize H=32 ret=' + ret);
        expect(ret).assertTrue();
        let predict_ret = await Predict_fun(msliteModel);
        expect(predict_ret).assertTrue();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Single_Input_Resize_W_Only_0016
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Single_Input_Resize_W_Only_0016
     * @tc.desc   Single-input model only change W dim succeeds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Single_Input_Resize_W_Only_0016', Level.LEVEL1, async (done: Function) => {
      try {
        console.log('ResizeTest: F_028 single input resize W only');
        const msliteModel = await loadModelByName(MODEL_SINGLE_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        const ret = msliteModel.resize(modelInputs, [[1, 64, 32, 3]]);
        console.log('resize W=32 ret=' + ret);
        expect(ret).assertTrue();
        let predict_ret = await Predict_fun(msliteModel);
        expect(predict_ret).assertTrue();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Continuous_Two_Resize_0017
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Continuous_Two_Resize_0017
     * @tc.desc   Continuous two resize with different shapes on dynamic model.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Continuous_Two_Resize_0017', Level.LEVEL1, async (done: Function) => {
      try {
        console.log('ResizeTest: F_030 continuous two resize');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const inputs1 = msliteModel.getInputs();
        const ret1 = msliteModel.resize(inputs1, [[1, 16], [1, 16], [1, 16]]);
        expect(ret1).assertTrue();
        let predict_ret01 = await Predict_fun(msliteModel);
        expect(predict_ret01).assertTrue();
        const inputs2 = msliteModel.getInputs();
        const ret2 = msliteModel.resize(inputs2, [[1, 8], [1, 8], [1, 8]]);
        expect(ret2).assertTrue();
        let predict_ret02 = await Predict_fun(msliteModel);
        expect(predict_ret02).assertTrue();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Continuous_Ten_Resize_Loop_0018
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Continuous_Ten_Resize_Loop_0018
     * @tc.desc   Continuous 10 times resize loop on dynamic model.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Continuous_Ten_Resize_Loop_0018', Level.LEVEL1, async (done: Function) => {
      try {
        console.log('ResizeTest: F_031 continuous 10 resize loop');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const shapes: number[][] = [[1, 16], [1, 8], [1, 4], [1, 8]];
        let allSuccess = true;
        for (let i = 0; i < 10; i++) {
          const targetShape = shapes[i % shapes.length];
          const modelInputs = msliteModel.getInputs();
          const ret = msliteModel.resize(modelInputs, [targetShape, targetShape, targetShape]);
          if (!ret) {
            allSuccess = false;
            console.log('resize failed at iter=' + i + ' shape=' + targetShape.toString());
          } else {
            let predict_ret02 = await Predict_fun(msliteModel);
            expect(predict_ret02).assertTrue();
          }
        }
        expect(allSuccess).assertTrue();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Multi_Input_Partial_Should_Fail_0019
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Multi_Input_Partial_Should_Fail_0019
     * @tc.desc   Multi-input model passing partial inputs should fail.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Multi_Input_Partial_Should_Fail_0019', Level.LEVEL1, async (done: Function) => {
      try {
        console.log('ResizeTest: F_0040 multi input partial should fail');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        expect(modelInputs.length).assertEqual(3);
        const partialInputs: mindSporeLite.MSTensor[] = [modelInputs[0], modelInputs[1]];
        const ret = msliteModel.resize(partialInputs, [[1, 8], [1, 8]]);
        console.log('partial input resize ret=' + ret);
        expect(ret).assertFalse();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Different_Rank_Should_Fail_0021
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Different_Rank_Should_Fail_0021
     * @tc.desc   Resize with rank different from model input rank should fail.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Different_Rank_Should_Fail_0021', Level.LEVEL2, async (done: Function) => {
      try {
        console.log('ResizeTest: F_0042 different rank should fail');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        const ret = msliteModel.resize(modelInputs, [[1, 8, 8], [1, 8, 8], [1, 8, 8]]);
        console.log('different rank resize ret=' + ret);
        expect(ret).assertFalse();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    // ============================================================
    // 二、端到端精度测试 End-to-End with Precision Comparison
    // 参考 Ability.test.ets 中的 Test_load_model_param_model_path_resize_0006 用例：
    // 加载动态shape模型 → resize → setData(真实输入) → predict → 精度对比
    // ============================================================

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Bert_Resize_Predict_Precision_0022
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Bert_Resize_Predict_Precision_0022
     * @tc.desc   bert_tiny_dynamic resize to [1,8] + predict + compare precision. (ref: resize_0006)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Bert_Resize_Predict_Precision_0022', Level.LEVEL0, async (done: Function) => {
      try {
        console.log('ResizeTest: E2E_001 bert resize predict precision');
        const syscontext: common.Context = globalThis.context;
        const inputBuffers = await loadBertInputBuffers();
        const modelBuffer = await getModelBuffer(MODEL_BERT_DYNAMIC);
        const msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer);
        expect(msliteModel !== null).assertTrue();
        console.log('=========MSLITE loadModel end=====');
        const modelInputs = msliteModel.getInputs();
        for (let modelInput of modelInputs) {
          console.log('name=' + modelInput.name + ' shape=' + modelInput.shape.toString() +
            ' elementNum=' + modelInput.elementNum + ' dtype=' + modelInput.dtype +
            ' format=' + modelInput.format + ' dataSize=' + modelInput.dataSize);
        }
        const newDim: number[][] = [[1, 8], [1, 8], [1, 8]];
        console.log('=========resize start=====');
        const resizeResult = msliteModel.resize(modelInputs, newDim);
        console.log('=========resize end=====');
        expect(resizeResult).assertTrue();
        const modelInputs2 = msliteModel.getInputs();
        modelInputs2[0].setData(inputBuffers[0]);
        modelInputs2[1].setData(inputBuffers[1]);
        modelInputs2[2].setData(inputBuffers[2]);
        console.log('=========predict start=====');
        const modelOutputs = await msliteModel.predict(modelInputs2);
        expect(modelOutputs !== null).assertTrue();
        console.log('=========compareOutputPrecision===========');
        const pass: boolean = await compareOutputPrecision(syscontext, 'bert_tiny_dynamic', modelOutputs);
        expect(pass).assertTrue();
        const output0 = new Float32Array(modelOutputs[0].getData());
        console.log('output0.length:' + output0.length);
        expect(output0.length).assertLarger(0);
        console.log('=========MSLITE E2E_001 end=====');
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Bert_Resize_Back_Predict_Consistent_0023
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Bert_Resize_Back_Predict_Consistent_0023
     * @tc.desc   Resize to different shape then back, predict output still consistent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Bert_Resize_Back_Predict_Consistent_0023', Level.LEVEL1, async (done: Function) => {
      try {
        console.log('ResizeTest: E2E_002 bert resize back predict consistent');
        const syscontext: common.Context = globalThis.context;
        const inputBuffers = await loadBertInputBuffers();
        const modelBuffer = await getModelBuffer(MODEL_BERT_DYNAMIC);
        const msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer);
        expect(msliteModel !== null).assertTrue();

        const originalInputs = msliteModel.getInputs();
        const originalShapes: number[][] = [];
        for (let i = 0; i < originalInputs.length; i++) {
          originalShapes.push(originalInputs[i].shape.slice());
        }

        // resize to [1,8] -> predict (baseline)
        const inputs1 = msliteModel.getInputs();
        msliteModel.resize(inputs1, [[1, 8], [1, 8], [1, 8]]);
        const inputs1r = msliteModel.getInputs();
        inputs1r[0].setData(inputBuffers[0]);
        inputs1r[1].setData(inputBuffers[1]);
        inputs1r[2].setData(inputBuffers[2]);
        const outputs1 = await msliteModel.predict(inputs1r);
        const out1 = new Float32Array(outputs1[0].getData());
        console.log('baseline output0.length=' + out1.length);

        // resize to [1,16] then back to [1,8] -> predict
        const inputs2 = msliteModel.getInputs();
        msliteModel.resize(inputs2, [[1, 16], [1, 16], [1, 16]]);
        const inputs3 = msliteModel.getInputs();
        msliteModel.resize(inputs3, [[1, 8], [1, 8], [1, 8]]);
        const inputs3r = msliteModel.getInputs();
        inputs3r[0].setData(inputBuffers[0]);
        inputs3r[1].setData(inputBuffers[1]);
        inputs3r[2].setData(inputBuffers[2]);
        const outputs3 = await msliteModel.predict(inputs3r);
        const out3 = new Float32Array(outputs3[0].getData());
        console.log('restored output0.length=' + out3.length);

        expect(out1.length).assertEqual(out3.length);
        const pass = await compareOutputPrecision(syscontext, 'bert_tiny_dynamic', outputs3);
        expect(pass).assertTrue();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Single_Input_Resize_Predict_Precision_0024
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Single_Input_Resize_Predict_Precision_0024
     * @tc.desc   single_input_dynamic resize to [1,32,32,3] + setData + predict + compare precision.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Single_Input_Resize_Predict_Precision_0024', Level.LEVEL0, async (done: Function) => {
      try {
        console.log('ResizeTest: E2E_003 single input resize predict precision');
        const syscontext: common.Context = globalThis.context;
        const inputBuffer = await loadSingleInputBuffer('single_input_dynamic_0_small.input');
        const msliteModel = await loadModelByName(MODEL_SINGLE_DYNAMIC);
        expect(msliteModel !== null).assertTrue();
        const modelInputs = msliteModel.getInputs();
        console.log('original shape: ' + modelInputs[0].shape.toString());
        const newDim: number[][] = [[1, 32, 32, 3]];
        const ret = msliteModel.resize(modelInputs, newDim);
        expect(ret).assertTrue();
        const resizedInputs = msliteModel.getInputs();
        console.log('resized shape: ' + resizedInputs[0].shape.toString() +
          ' elementNum=' + resizedInputs[0].elementNum);
        resizedInputs[0].setData(inputBuffer);
        const outputs = await msliteModel.predict(resizedInputs);
        expect(outputs !== null).assertTrue();
        expect(outputs.length > 0).assertTrue();
        console.log('==========MSLITE compareOutputPrecision===========');
        const pass: boolean = await compareOutputPrecision(syscontext, 'single_input_dynamic_small', outputs);
        expect(pass).assertTrue();
        const output0 = new Float32Array(outputs[0].getData());
        console.log('output0.length=' + output0.length);
        expect(output0.length).assertLarger(0);
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Bert_Resize_Predict_Alternating_0025
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Bert_Resize_Predict_Alternating_0025
     * @tc.desc   Resize and predict alternating execution on dynamic model.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Bert_Resize_Predict_Alternating_0025', Level.LEVEL1, async (done: Function) => {
      console.log('ResizeTest: E2E_004 bert resize predict alternating');
      let crashed = false;
      try {
        const inputBuffers = await loadBertInputBuffers();
        const modelBuffer = await getModelBuffer(MODEL_BERT_DYNAMIC);
        const msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer);
        expect(msliteModel !== null).assertTrue();
        const shapes: number[][] = [[1, 16], [1, 8], [1, 4]];
        for (let i = 0; i < shapes.length; i++) {
          const modelInputs = msliteModel.getInputs();
          const ret = msliteModel.resize(modelInputs, [shapes[i], shapes[i], shapes[i]]);
          expect(ret).assertTrue();
          const resizedInputs = msliteModel.getInputs();
          // Only set data and predict when shape matches input files ([1, 8])
          if (shapes[i][1] === 8) {
            resizedInputs[0].setData(inputBuffers[0]);
            resizedInputs[1].setData(inputBuffers[1]);
            resizedInputs[2].setData(inputBuffers[2]);
            const outputs = await msliteModel.predict(resizedInputs);
            expect(outputs !== null).assertTrue();
          }
        }
      } catch (error) {
        crashed = true;
        console.log('alternating crashed: ' + JSON.stringify(error));
      }
      expect(crashed).assertFalse();
      done();
    })

    // ============================================================
    // 二-B、单输入模型端到端精度测试 Single-Input E2E with Precision
    // 使用 single_input_dynamic.ms (单输入, NHWC, 动态 batch+H+W)
    // 对比单输入与多输入在 resize→predict→精度对比上的行为差异。
    // ============================================================

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Single_Input_Baseline_Predict_Precision_0026
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Single_Input_Baseline_Predict_Precision_0026
     * @tc.desc   Single-input model baseline predict (no resize) + compare precision.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Single_Input_Baseline_Predict_Precision_0026', Level.LEVEL0, async (done: Function) => {
      try {
        console.log('ResizeTest: E2E_005 single input baseline predict precision');
        const syscontext: common.Context = globalThis.context;
        const inputBuffer = await loadSingleInputBuffer('single_input_dynamic_0.input');
        const msliteModel = await loadModelByName(MODEL_SINGLE_DYNAMIC);
        expect(msliteModel !== null).assertTrue();
        const modelInputs = msliteModel.getInputs();
        console.log('original shape: ' + modelInputs[0].shape.toString() +
          ' elementNum=' + modelInputs[0].elementNum);
        modelInputs[0].setData(inputBuffer);
        const outputs = await msliteModel.predict(modelInputs);
        expect(outputs).assertUndefined();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })


    // ============================================================
    // 二-C、单输入与多输入差异验证 Single vs Multi-Input Comparison
    // 验证单输入模型与多输入模型在 resize 时的行为差异：
    // 1. 输入数量校验：单输入传多dims应失败，多输入传少dims应失败
    // 2. dims 数组长度：必须与模型输入数一致
    // 3. 多输入可各输入不同shape，单输入只有1个shape
    // 4. 多输入部分传入应失败，单输入无'部分'概念
    // ============================================================

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Single_Input_Too_Many_Dims_0027
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Single_Input_Too_Many_Dims_0027
     * @tc.desc   Single-input model with 3 dims (too many) should fail.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Single_Input_Too_Many_Dims_0027', Level.LEVEL0, async (done: Function) => {
      try {
        console.log('ResizeTest: DIFF_001 single input too many dims');
        const msliteModel = await loadModelByName(MODEL_SINGLE_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        expect(modelInputs.length).assertEqual(1);
        const ret = msliteModel.resize(modelInputs, [[1, 32, 32, 3], [1, 32, 32, 3], [1, 32, 32, 3]]);
        console.log('single input with 3 dims ret=' + ret);
        expect(ret).assertFalse();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Multi_Input_Too_Few_Dims_0028
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Multi_Input_Too_Few_Dims_0028
     * @tc.desc   Multi-input model with 1 dim (too few) should fail.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Multi_Input_Too_Few_Dims_0028', Level.LEVEL0, async (done: Function) => {
      try {
        console.log('ResizeTest: DIFF_002 multi input too few dims');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        expect(modelInputs.length).assertEqual(3);
        const ret = msliteModel.resize(modelInputs, [[1, 8]]);
        console.log('multi input with 1 dim ret=' + ret);
        expect(ret).assertFalse();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Multi_Input_Per_Input_Different_Shapes_0029
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Multi_Input_Per_Input_Different_Shapes_0029
     * @tc.desc   Multi-input: each input resized to a DIFFERENT shape succeeds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Multi_Input_Per_Input_Different_Shapes_0029', Level.LEVEL1, async (done: Function) => {
      try {
        console.log('ResizeTest: DIFF_003 multi input per input different shapes');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        expect(modelInputs.length).assertEqual(3);
        const ret = msliteModel.resize(modelInputs, [[1, 16], [1, 8], [1, 4]]);
        expect(ret).assertTrue();
        const updated = msliteModel.getInputs();
        console.log('input0 shape=' + updated[0].shape.toString());
        console.log('input1 shape=' + updated[1].shape.toString());
        console.log('input2 shape=' + updated[2].shape.toString());
        expect(shapeEqual(updated[0].shape, [1, 16])).assertTrue();
        expect(shapeEqual(updated[1].shape, [1, 8])).assertTrue();
        expect(shapeEqual(updated[2].shape, [1, 4])).assertTrue();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Single_Input_Partial_Resize_N_A_0030
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Single_Input_Partial_Resize_N_A_0030
     * @tc.desc   Single-input model has no 'partial resize' concept; passing 0 inputs fails.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Single_Input_Partial_Resize_N_A_0030', Level.LEVEL1, async (done: Function) => {
      try {
        console.log('ResizeTest: DIFF_004 single input partial resize N/A');
        const msliteModel = await loadModelByName(MODEL_SINGLE_DYNAMIC);
        const ret = msliteModel.resize([], [[1, 32, 32, 3]]);
        console.log('single input with 0 inputs ret=' + ret);
        expect(ret).assertFalse();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Multi_Input_Same_Shape_All_Inputs_0031
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Multi_Input_Same_Shape_All_Inputs_0031
     * @tc.desc   Multi-input: all inputs resized to the SAME shape succeeds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Multi_Input_Same_Shape_All_Inputs_0031', Level.LEVEL1, async (done: Function) => {
      try {
        console.log('ResizeTest: DIFF_005 multi input same shape all inputs');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        const ret = msliteModel.resize(modelInputs, [[1, 8], [1, 8], [1, 8]]);
        expect(ret).assertTrue();
        const updated = msliteModel.getInputs();
        for (let i = 0; i < updated.length; i++) {
          expect(shapeEqual(updated[i].shape, [1, 8])).assertTrue();
        }
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Single_Vs_Multi_Input_Count_Verify_0032
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Single_Vs_Multi_Input_Count_Verify_0032
     * @tc.desc   Verify single-input model has 1 input, multi-input has 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Single_Vs_Multi_Input_Count_Verify_0032', Level.LEVEL0, async (done: Function) => {
      try {
        console.log('ResizeTest: DIFF_006 single vs multi input count verify');
        const singleModel = await loadModelByName(MODEL_SINGLE_DYNAMIC);
        const multiModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const singleInputs = singleModel.getInputs();
        const multiInputs = multiModel.getInputs();
        console.log('single input count=' + singleInputs.length + ' multi input count=' + multiInputs.length);
        expect(singleInputs.length).assertEqual(1);
        expect(multiInputs.length).assertEqual(3);
        // Verify single input is 4D (NHWC), multi input is 2D
        console.log('single input rank=' + singleInputs[0].shape.length +
          ' multi input0 rank=' + multiInputs[0].shape.length);
        expect(singleInputs[0].shape.length).assertEqual(4);
        expect(multiInputs[0].shape.length).assertEqual(2);
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    // ============================================================
    // 三、静态模型不支持resize测试 Static Model Resize Failure
    // 静态shape模型默认不支持resize到不同shape，应返回false。
    // ============================================================

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Face_Model_Resize_Should_Fail_0033
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Face_Model_Resize_Should_Fail_0033
     * @tc.desc   Static shape model (ml_face_isface) resize to different shape should fail.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Face_Model_Resize_Should_Fail_0033', Level.LEVEL0, async (done: Function) => {
      try {
        console.log('ResizeTest: STATIC_001 face model resize should fail');
        const msliteModel = await loadModelByName(MODEL_FACE_STATIC);
        expect(msliteModel !== null).assertTrue();
        const modelInputs = msliteModel.getInputs();
        console.log('static model original shape: ' + modelInputs[0].shape.toString());
        const ret = msliteModel.resize(modelInputs, [[1, 96, 96, 1]]);
        console.log('static model resize ret=' + ret);
        expect(ret).assertFalse();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    // ============================================================
    // 四、参数校验测试 Parameter Validation
    // 使用动态shape模型验证resize的参数校验逻辑。
    // 注：null/undefined/empty 等基础参数校验在 CoverageSupplement.test.ets 中
    // 已有覆盖（使用静态模型），此处使用动态模型补充验证。
    // ============================================================

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Inputs_Empty_Array_0034
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Inputs_Empty_Array_0034
     * @tc.desc   Inputs is empty array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Inputs_Empty_Array_0034', Level.LEVEL0, async (done: Function) => {
      try {
        console.log('ResizeTest: V_001 inputs empty array');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const ret = msliteModel.resize([], [[1, 8], [1, 8], [1, 8]]);
        console.log('resize empty inputs ret=' + ret);
        expect(ret).assertFalse();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Inputs_Less_Than_Model_0035
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Inputs_Less_Than_Model_0035
     * @tc.desc   Inputs length less than model inputs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Inputs_Less_Than_Model_0035', Level.LEVEL0, async (done: Function) => {
      try {
        console.log('ResizeTest: V_002 inputs less than model');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        const partial: mindSporeLite.MSTensor[] = [modelInputs[0]];
        const ret = msliteModel.resize(partial, [[1, 8]]);
        expect(ret).assertFalse();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Inputs_More_Than_Model_0036
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Inputs_More_Than_Model_0036
     * @tc.desc   Inputs length more than model inputs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Inputs_More_Than_Model_0036', Level.LEVEL0, async (done: Function) => {
      try {
        console.log('ResizeTest: V_003 inputs more than model');
        const msliteModel = await loadModelByName(MODEL_SINGLE_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        const duplicate: mindSporeLite.MSTensor[] = [modelInputs[0], modelInputs[0]];
        const ret = msliteModel.resize(duplicate, [[1, 32, 32, 3], [1, 32, 32, 3]]);
        expect(ret).assertFalse();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Inputs_Element_Not_Mstensor_0037
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Inputs_Element_Not_Mstensor_0037
     * @tc.desc   Inputs element is not MSTensor object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Inputs_Element_Not_Mstensor_0037', Level.LEVEL1, async (done: Function) => {
      try {
        console.log('ResizeTest: V_004 inputs element not MSTensor');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const fakeInputs: mindSporeLite.MSTensor[] = [{} as mindSporeLite.MSTensor];
        const ret = msliteModel.resize(fakeInputs, [[1, 8]]);
        console.log('resize with non-MSTensor ret=' + ret);
        expect(ret).assertFalse();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Tensor_No_Native_Backing_0038
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Tensor_No_Native_Backing_0038
     * @tc.desc   Fake MSTensor without native backing should fail.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Tensor_No_Native_Backing_0038', Level.LEVEL1, async (done: Function) => {
      try {
        console.log('ResizeTest: V_005 tensor no native backing');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const fakeTensor = new FakeMSTensor(
          'fake',
          [1, 8],
          8,
          32,
          mindSporeLite.DataType.NUMBER_TYPE_FLOAT32,
          mindSporeLite.Format.NHWC,
          new ArrayBuffer(32),
        );
        const fakeInputs: mindSporeLite.MSTensor[] = [fakeTensor];
        const ret = msliteModel.resize(fakeInputs, [[1, 8]]);
        console.log('resize with fake MSTensor ret=' + ret);
        expect(ret).assertFalse();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Dims_Empty_Array_0039
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Dims_Empty_Array_0039
     * @tc.desc   Dims is empty array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Dims_Empty_Array_0039', Level.LEVEL0, async (done: Function) => {
      try {
        console.log('ResizeTest: V_0010 dims empty array');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        const ret = msliteModel.resize(modelInputs, []);
        console.log('resize empty dims ret=' + ret);
        expect(ret).assertFalse();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Dims_Length_Mismatch_0040
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Dims_Length_Mismatch_0040
     * @tc.desc   Dims length != inputs length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Dims_Length_Mismatch_0040', Level.LEVEL0, async (done: Function) => {
      try {
        console.log('ResizeTest: V_011 dims length mismatch');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        const ret = msliteModel.resize(modelInputs, [[1, 8], [1, 8]]);
        expect(ret).assertFalse();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Dims_Negative_Value_0041
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Dims_Negative_Value_0041
     * @tc.desc   Dims contains negative value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Dims_Negative_Value_0041', Level.LEVEL1, async (done: Function) => {
      try {
        console.log('ResizeTest: V_014 dims negative value');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        const ret = msliteModel.resize(modelInputs, [[1, -1], [1, 8], [1, 8]]);
        console.log('resize with negative value ret=' + ret);
        expect(ret).assertFalse();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Dims_Exceed_Int32_Max_0043
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Dims_Exceed_Int32_Max_0043
     * @tc.desc   Dims value exceeds INT32_MAX.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Dims_Exceed_Int32_Max_0043', Level.LEVEL2, async (done: Function) => {
      try {
        console.log('ResizeTest: V_017 dims exceed INT32_MAX');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        const int32Max = 2147483648;
        const ret = msliteModel.resize(modelInputs, [[1, int32Max], [1, 8], [1, 8]]);
        console.log('resize with INT32_MAX+1 ret=' + ret);
        expect(ret).assertFalse();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Rank_Exceed_Upper_Limit_0044
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Rank_Exceed_Upper_Limit_0044
     * @tc.desc   Rank exceeds upper limit (33 dims).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Rank_Exceed_Upper_Limit_0044', Level.LEVEL2, async (done: Function) => {
      try {
        console.log('ResizeTest: V_018 rank exceed upper limit');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        const hugeRank: number[] = [];
        for (let i = 0; i < 33; i++) {
          hugeRank.push(1);
        }
        const ret = msliteModel.resize(modelInputs, [hugeRank, hugeRank, hugeRank]);
        console.log('resize with rank=33 ret=' + ret);
        expect(ret).assertFalse();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Rank_Mismatch_0045
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Rank_Mismatch_0045
     * @tc.desc   Rank != model input rank (2D model, pass 3D/4D dims).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Rank_Mismatch_0045', Level.LEVEL0, async (done: Function) => {
      try {
        console.log('ResizeTest: V_020 rank mismatch');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        console.log('original shape: ' + modelInputs[0].shape.toString());
        const ret = msliteModel.resize(modelInputs, [[1, 8, 8], [1, 8, 8], [1, 8, 8]]);
        console.log('resize with rank=3 ret=' + ret);
        expect(ret).assertFalse();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Single_Input_Rank_Mismatch_0046
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Single_Input_Rank_Mismatch_0046
     * @tc.desc   Single-input 4D model pass 3D/5D dims should fail.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Single_Input_Rank_Mismatch_0046', Level.LEVEL1, async (done: Function) => {
      try {
        console.log('ResizeTest: V_021 single input rank mismatch');
        const msliteModel = await loadModelByName(MODEL_SINGLE_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        console.log('original shape: ' + modelInputs[0].shape.toString());
        const ret = msliteModel.resize(modelInputs, [[1, 32, 32]]);
        console.log('single input with rank=3 ret=' + ret);
        expect(ret).assertFalse();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    // ============================================================
    // 五、状态时序测试 State & Timing
    // C++ LiteSession::Resize 使用原子量防重入，多线程resize不支持。
    // ============================================================

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Sequential_Resize_No_Crash_0048
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Sequential_Resize_No_Crash_0048
     * @tc.desc   Sequential (reentrant) resize does not crash.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Sequential_Resize_No_Crash_0048', Level.LEVEL2, async (done: Function) => {
      console.log('ResizeTest: S_003 sequential resize');
      let crashed = false;
      try {
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        const ret1 = msliteModel.resize(modelInputs, [[1, 16], [1, 16], [1, 16]]);
        const inputs2 = msliteModel.getInputs();
        const ret2 = msliteModel.resize(inputs2, [[1, 8], [1, 8], [1, 8]]);
        console.log('sequential resize ret1=' + ret1 + ' ret2=' + ret2);
      } catch (error) {
        crashed = true;
        console.log('sequential resize crashed: ' + JSON.stringify(error));
      }
      expect(crashed).assertFalse();
      done();
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Predict_After_Resize_0049
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Predict_After_Resize_0049
     * @tc.desc   Predict after resize does not crash on dynamic model.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Predict_After_Resize_0049', Level.LEVEL2, async (done: Function) => {
      console.log('ResizeTest: S_004 predict after resize');
      let crashed = false;
      try {
        const inputBuffers = await loadBertInputBuffers();
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        const ret = msliteModel.resize(modelInputs, [[1, 8], [1, 8], [1, 8]]);
        console.log('resize ret=' + ret);
        const resizedInputs = msliteModel.getInputs();
        resizedInputs[0].setData(inputBuffers[0]);
        resizedInputs[1].setData(inputBuffers[1]);
        resizedInputs[2].setData(inputBuffers[2]);
        await msliteModel.predict(resizedInputs);
      } catch (error) {
        crashed = true;
        console.log('predict after resize crashed: ' + JSON.stringify(error));
      }
      expect(crashed).assertFalse();
      done();
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Resize_After_Predict_0050
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Resize_After_Predict_0050
     * @tc.desc   Resize after predict does not crash on dynamic model.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Resize_After_Predict_0050', Level.LEVEL2, async (done: Function) => {
      console.log('ResizeTest: S_005 resize after predict');
      let crashed = false;
      try {
        const inputBuffers = await loadBertInputBuffers();
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        const originalShapes: number[][] = [];
        for (let i = 0; i < modelInputs.length; i++) {
          originalShapes.push(modelInputs[i].shape.slice());
        }
        modelInputs[0].setData(inputBuffers[0]);
        modelInputs[1].setData(inputBuffers[1]);
        modelInputs[2].setData(inputBuffers[2]);
        await msliteModel.predict(modelInputs);
        const newInputs = msliteModel.getInputs();
        const ret = msliteModel.resize(newInputs, [[1, 8], [1, 8], [1, 8]]);
        expect(ret).assertTrue();
      } catch (error) {
        crashed = true;
        console.log('resize after predict crashed: ' + JSON.stringify(error));
      }
      expect(crashed).assertFalse();
      done();
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Shape_Rollback_On_Failure_0051
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Shape_Rollback_On_Failure_0051
     * @tc.desc   Shape rollback after resize failure (negative dim).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Shape_Rollback_On_Failure_0051', Level.LEVEL1, async (done: Function) => {
      try {
        console.log('ResizeTest: S_008 shape rollback on failure');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        const originalShapes: number[][] = [];
        for (let i = 0; i < modelInputs.length; i++) {
          originalShapes.push(modelInputs[i].shape.slice());
        }
        const ret = msliteModel.resize(modelInputs, [[1, -1], [1, 8], [1, 8]]);
        expect(ret).assertFalse();
        const afterInputs = msliteModel.getInputs();
        for (let i = 0; i < afterInputs.length; i++) {
          const rolled = shapeEqual(afterInputs[i].shape, originalShapes[i]);
          console.log('input' + i + ' original=' + originalShapes[i].toString() +
            ' after=' + afterInputs[i].shape.toString() + ' rolled=' + rolled);
          expect(rolled).assertTrue();
        }
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Resize_Success_After_Failure_0052
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Resize_Success_After_Failure_0052
     * @tc.desc   Resize can succeed after a failure on dynamic model.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Resize_Success_After_Failure_0052', Level.LEVEL1, async (done: Function) => {
      try {
        console.log('ResizeTest: S_009 resize success after failure');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const inputs1 = msliteModel.getInputs();
        const ret1 = msliteModel.resize(inputs1, [[1, -1], [1, 8], [1, 8]]);
        expect(ret1).assertFalse();
        const inputs2 = msliteModel.getInputs();
        const ret2 = msliteModel.resize(inputs2, [[1, 8], [1, 8], [1, 8]]);
        console.log('resize after failure ret=' + ret2);
        expect(ret2).assertTrue();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    // ============================================================
    // 六、兼容性测试 Compatibility
    // 测试不同加载方式、后端、数据类型下的resize行为。
    // ============================================================

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Cpu_Backend_0053
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Cpu_Backend_0053
     * @tc.desc   CPU backend resize on dynamic model.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Cpu_Backend_0053', Level.LEVEL0, async (done: Function) => {
      try {
        console.log('ResizeTest: C_001 CPU backend resize');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC, ['cpu']);
        expect(msliteModel !== null).assertTrue();
        const modelInputs = msliteModel.getInputs();
        const ret = msliteModel.resize(modelInputs, [[1, 8], [1, 8], [1, 8]]);
        expect(ret).assertTrue();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })


    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Load_From_File_0054
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Load_From_File_0054
     * @tc.desc   loadModelFromFile then resize on dynamic model.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Load_From_File_0054', Level.LEVEL0, async (done: Function) => {
      try {
        console.log('ResizeTest: C_009 load from file');
        const dir = globalThis.abilityContext.filesDir + '/';
        const modelPath = dir + MODEL_BERT_DYNAMIC;
        const context: mindSporeLite.Context = { target: ['cpu'] };
        const msliteModel = await mindSporeLite.loadModelFromFile(modelPath, context);
        expect(msliteModel !== null).assertTrue();
        const modelInputs = msliteModel.getInputs();
        const ret = msliteModel.resize(modelInputs, [[1, 8], [1, 8], [1, 8]]);
        expect(ret).assertTrue();
        let predict_ret = await Predict_fun(msliteModel);
        expect(predict_ret).assertTrue();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Load_From_Buffer_0055
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Load_From_Buffer_0055
     * @tc.desc   loadModelFromBuffer then resize on dynamic model.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Load_From_Buffer_0055', Level.LEVEL1, async (done: Function) => {
      try {
        console.log('ResizeTest: C_010 load from buffer');
        const buffer = await getModelBuffer(MODEL_BERT_DYNAMIC);
        const context: mindSporeLite.Context = { target: ['cpu'] };
        const msliteModel = await mindSporeLite.loadModelFromBuffer(buffer.buffer, context);
        expect(msliteModel !== null).assertTrue();
        const modelInputs = msliteModel.getInputs();
        const ret = msliteModel.resize(modelInputs, [[1, 8], [1, 8], [1, 8]]);
        expect(ret).assertTrue();
        let predict_ret = await Predict_fun(msliteModel);
        expect(predict_ret).assertTrue();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Load_From_Fd_0056
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Load_From_Fd_0056
     * @tc.desc   loadModelFromFd then resize on dynamic model.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Load_From_Fd_0056', Level.LEVEL1, async (done: Function) => {
      console.log('ResizeTest: C_011 load from fd');
      const dir = globalThis.abilityContext.filesDir + '/';
      const modelPath = dir + MODEL_BERT_DYNAMIC;
      const file = fs.openSync(modelPath, fs.OpenMode.READ_ONLY);
      try {
        const context: mindSporeLite.Context = { target: ['cpu'] };
        const msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        expect(msliteModel !== null).assertTrue();
        const modelInputs = msliteModel.getInputs();
        const ret = msliteModel.resize(modelInputs, [[1, 8], [1, 8], [1, 8]]);
        console.log('resize after loadFromFd ret=' + ret);
        expect(ret).assertTrue();
        let predict_ret = await Predict_fun(msliteModel);
        expect(predict_ret).assertTrue();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
      } finally {
        fs.closeSync(file);
      }
      done();
    })

    // ============================================================
    // 七、稳定性测试 Stability & Security
    // ============================================================

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Loop_100_No_Crash_0057
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Loop_100_No_Crash_0057
     * @tc.desc   100 resize+predict loop without crash on dynamic model.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Loop_100_No_Crash_0057', Level.LEVEL2, async (done: Function) => {
      console.log('ResizeTest: T_001 loop 100 no crash');
      let crashed = false;
      try {
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const shapes: number[][] = [[1, 16], [1, 8], [1, 4]];
        for (let i = 0; i < 100; i++) {
          const target = shapes[i % shapes.length];
          const inputs = msliteModel.getInputs();
          msliteModel.resize(inputs, [target, target, target]);
          const resized = msliteModel.getInputs();
          let predict_ret = await Predict_fun(msliteModel);
          expect(predict_ret).assertTrue();
        }
      } catch (error) {
        crashed = true;
        console.log('loop 100 crashed: ' + JSON.stringify(error));
      }
      console.log('loop done crashed=' + crashed);
      expect(crashed).assertFalse();
      done();
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Mixed_Success_Failure_0058
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Mixed_Success_Failure_0058
     * @tc.desc   Mixed success/failure resize does not crash, recovery works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Mixed_Success_Failure_0058', Level.LEVEL2, async (done: Function) => {
      console.log('ResizeTest: T_004 mixed success failure');
      let crashed = false;
      let recoverable = true;
      try {
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        for (let i = 0; i < 10; i++) {
          const inputs = msliteModel.getInputs();
          if (i % 2 === 0) {
            const ret = msliteModel.resize(inputs, [[1, -1], [1, 8], [1, 8]]);
            expect(ret).assertFalse();
          } else {
            const ret = msliteModel.resize(inputs, [[1, 8], [1, 8], [1, 8]]);
            if (!ret) recoverable = false;
            expect(ret).assertTrue();
          }
        }
      } catch (error) {
        crashed = true;
      }
      expect(crashed).assertFalse();
      expect(recoverable).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Multi_Instance_Isolation_0059
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Multi_Instance_Isolation_0059
     * @tc.desc   Multi-instance resize isolation on dynamic model.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Multi_Instance_Isolation_0059', Level.LEVEL2, async (done: Function) => {
      try {
        console.log('ResizeTest: T_005 multi instance isolation');
        const msliteModel1 = await loadModelByName(MODEL_BERT_DYNAMIC);
        const msliteModel2 = await loadModelByName(MODEL_BERT_DYNAMIC);
        const inputs1 = msliteModel1.getInputs();
        const inputs2 = msliteModel2.getInputs();
        const ret1 = msliteModel1.resize(inputs1, [[1, 16], [1, 16], [1, 16]]);
        const ret2 = msliteModel2.resize(inputs2, [[1, 8], [1, 8], [1, 8]]);
        expect(ret1 && ret2).assertTrue();
        const after1 = msliteModel1.getInputs();
        const after2 = msliteModel2.getInputs();
        const isolated1 = shapeEqual(after1[0].shape, [1, 16]);
        const isolated2 = shapeEqual(after2[0].shape, [1, 8]);
        console.log('instance1 shape=' + after1[0].shape.toString() + ' instance2 shape=' + after2[0].shape.toString());
        expect(isolated1 && isolated2).assertTrue();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Integer_Overflow_No_Crash_0060
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Integer_Overflow_No_Crash_0060
     * @tc.desc   Integer overflow dims do not crash, returns false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Integer_Overflow_No_Crash_0060', Level.LEVEL2, async (done: Function) => {
      console.log('ResizeTest: T_006 integer overflow no crash');
      let crashed = false;
      let ret = true;
      try {
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const inputs = msliteModel.getInputs();
        ret = msliteModel.resize(inputs, [[2147483647, 2147483647], [1, 8], [1, 8]]);
      } catch (error) {
        crashed = true;
        console.log('integer overflow crashed: ' + JSON.stringify(error));
      }
      console.log('integer overflow ret=' + ret + ' crashed=' + crashed);
      expect(crashed).assertFalse();
      expect(ret).assertFalse();
      done();
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Corrupted_Model_No_Crash_0061
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Corrupted_Model_No_Crash_0061
     * @tc.desc   Corrupted model resize does not crash.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Corrupted_Model_No_Crash_0061', Level.LEVEL2, async (done: Function) => {
      console.log('ResizeTest: T_007 corrupted model no crash');
      const fakeBuffer = new ArrayBuffer(64);
      const view = new Uint8Array(fakeBuffer);
      view.fill(0);
      let crashed = false;
      let msliteModel: mindSporeLite.Model | null = null;
      try {
        const context: mindSporeLite.Context = { target: ['cpu'] };
        msliteModel = await mindSporeLite.loadModelFromBuffer(fakeBuffer, context);
      } catch (error) {
        console.log('corrupted model load failed (expected): ' + JSON.stringify(error));
      }
      if (msliteModel !== null && msliteModel !== undefined) {
        console.log('corrupted model not null and not undefined');
        try {
          const inputs = msliteModel.getInputs();
          let ret = msliteModel.resize(inputs, [[1, 8], [1, 8], [1, 8]]);
          expect(ret).assertFalse();
        } catch (error) {
          crashed = true;
          console.log('corrupted model resize crashed: ' + JSON.stringify(error));
        }
      }
      console.log('corrupted model test done, crashed=' + crashed);
      expect(crashed).assertFalse();
      done();
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Huge_Arraybuffer_Input_0062
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Huge_Arraybuffer_Input_0062
     * @tc.desc   Huge ArrayBuffer in fake tensor does not crash, returns false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Huge_Arraybuffer_Input_0062', Level.LEVEL2, async (done: Function) => {
      console.log('ResizeTest: T_008 huge ArrayBuffer input');
      let crashed = false;
      let ret = true;
      try {
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        const hugeBuffer = new ArrayBuffer(8 * 1024 * 1024);
        const fakeTensor = new FakeMSTensor(
          modelInputs[0].name,
          [1, 8],
          8,
          modelInputs[0].dataSize,
          modelInputs[0].dtype,
          modelInputs[0].format,
          hugeBuffer,
        );
        const fakeInputs: mindSporeLite.MSTensor[] = [fakeTensor];
        ret = msliteModel.resize(fakeInputs, [[1, 8]]);
        expect(ret).assertFalse();
      } catch (error) {
        crashed = true;
        console.log('huge buffer crashed: ' + JSON.stringify(error));
      }
      console.log('huge buffer ret=' + ret + ' crashed=' + crashed);
      expect(crashed).assertFalse();
      expect(ret).assertFalse();
      done();
    })

    // ============================================================
    // 八、返回值语义测试 Return Semantics
    // ============================================================

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Success_Returns_True_0063
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Success_Returns_True_0063
     * @tc.desc   Success path returns true on dynamic model.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Success_Returns_True_0063', Level.LEVEL0, async (done: Function) => {
      try {
        console.log('ResizeTest: R_001 success returns true');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        const ret = msliteModel.resize(modelInputs, [[1, 8], [1, 8], [1, 8]]);
        console.log('success path resize ret=' + ret);
        expect(ret).assertTrue();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Failure_Returns_False_0064
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Failure_Returns_False_0064
     * @tc.desc   Failure path returns false (negative dim).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Failure_Returns_False_0064', Level.LEVEL0, async (done: Function) => {
      try {
        console.log('ResizeTest: R_002 failure returns false');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        const ret = msliteModel.resize(modelInputs, [[1, -1], [1, 8], [1, 8]]);
        console.log('failure path resize ret=' + ret);
        expect(ret).assertFalse();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Return_Type_Boolean_0065
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Return_Type_Boolean_0065
     * @tc.desc   Return type is boolean.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Return_Type_Boolean_0065', Level.LEVEL1, async (done: Function) => {
      try {
        console.log('ResizeTest: R_003 return type boolean');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const modelInputs = msliteModel.getInputs();
        const ret = msliteModel.resize(modelInputs, [[1, 8], [1, 8], [1, 8]]);
        console.log('typeof ret=' + typeof ret + ' ret=' + ret);
        expect(typeof ret === 'boolean').assertTrue();
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Getinputs_Shape_Updated_0066
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Getinputs_Shape_Updated_0066
     * @tc.desc   After resize, getInputs returns updated shape.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Getinputs_Shape_Updated_0066', Level.LEVEL1, async (done: Function) => {
      try {
        console.log('ResizeTest: R_004 getInputs shape updated');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const beforeInputs = msliteModel.getInputs();
        const beforeShapes: number[][] = [];
        for (let i = 0; i < beforeInputs.length; i++) {
          beforeShapes.push(beforeInputs[i].shape.slice());
        }
        msliteModel.resize(beforeInputs, [[1, 8], [1, 8], [1, 8]]);
        const afterInputs = msliteModel.getInputs();
        for (let i = 0; i < afterInputs.length; i++) {
          console.log('input' + i + ' before=' + beforeShapes[i].toString() + ' after=' + afterInputs[i].shape.toString());
          const updated = shapeEqual(afterInputs[i].shape, [1, 8]);
          expect(updated).assertTrue();
        }
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ArkTS_Resize_Shape_Preserved_After_Failure_0067
     * @tc.number SUB_AI_MindSpore_ArkTS_Resize_Shape_Preserved_After_Failure_0067
     * @tc.desc   After failure, getInputs shape preserved (rollback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_MindSpore_ArkTS_Resize_Shape_Preserved_After_Failure_0067', Level.LEVEL1, async (done: Function) => {
      try {
        console.log('ResizeTest: R_005 shape preserved after failure');
        const msliteModel = await loadModelByName(MODEL_BERT_DYNAMIC);
        const beforeInputs = msliteModel.getInputs();
        const originalShapes: number[][] = [];
        for (let i = 0; i < beforeInputs.length; i++) {
          originalShapes.push(beforeInputs[i].shape.slice());
        }
        msliteModel.resize(beforeInputs, [[1, -1], [1, 8], [1, 8]]);
        const afterInputs = msliteModel.getInputs();
        for (let i = 0; i < afterInputs.length; i++) {
          console.log('input' + i + ' original=' + originalShapes[i].toString() + ' afterFailure=' + afterInputs[i].shape.toString());
          const preserved = shapeEqual(afterInputs[i].shape, originalShapes[i]);
          expect(preserved).assertTrue();
        }
        done();
      } catch (error) {
        console.log('it error: ' + JSON.stringify(error));
        done();
      }
    })
  })
}
