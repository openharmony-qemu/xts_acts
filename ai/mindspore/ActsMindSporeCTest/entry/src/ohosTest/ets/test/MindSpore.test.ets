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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import libMindSpore from 'libmindspore.so';
import Utils, { Log } from './Utils.test';

const fileArr = [
  "aiy_vision_classifier_plants_V1_3.ms",
  "aiy_vision_classifier_plants_V1_3_offline_model.ms",
  "aiy_vision_classifier_plants_V1_3.input",
  "aiy_vision_classifier_plants_V1_3_0.input",
  "aiy_vision_classifier_plants_V1_30.output",
  "ml_face_isface.ms",
  "ml_face_isface_r13.ms",
  "ml_face_isface_offline_model.ms",
  "ml_face_isface.input",
  "ml_face_isface_0.input",
  "ml_face_isface0.output",
  "ml_Hand_deploy.ms",
  "ml_Hand_deploy_0.input",
  "ml_Hand_deploy0.output",
  "ml_ocr_cn.ms",
  "ml_ocr_cn_offline_model.ms",
  "ml_ocr_cn_0.input",
  "ml_ocr_cn0.output",
  "ml_headpose_pb2tflite.ms",
  "ml_headpose_pb2tflite_offline_model.ms",
  "ml_headpose_pb2tflite_0.input",
  "ml_headpose_pb2tflite_1.input",
  "ml_headpose_pb2tflite_2.input",
  "ml_headpose_pb2tflite0.output",
  "tinynet.om.ms",
  "lenet_train.ms",
  "lenet_train_0.input",
  "lenet_train_1.input",
  "lenet_train_infer_0.input",
  "lenet_train_infer_1.input",
  "lenet_train_infer0.output",
  "lenet_train_train_0.input",
  "lenet_train_train_1.input",
  "xiaoyi_train_codegen.ms",
  "test_model_0.input",
  "test_model0.output",
  "test_model.om.ms",
  "test_model_param",
  "ml_face_isface.om.ms",
  "ml_face_isface_quant_0.input",
  "ml_face_isface_quant0.output",
  "ml_face_isface_quant.ms",
  "invalid_content.config",
  "ml_face_isface.config"
]


export default function MindSporeTest() {
  describe('ActsMindSporeTest', () => {
    beforeAll(async () => {
      let context = getContext()
      for (let i = 0; i < fileArr.length; i++) {
        const fileName = fileArr[i];
        Utils.copyRawfileToFilesDirSync(fileName, context);
      }
      Log.info(`[rawfile_copy_to_sandbox] sandbox path: ${context.filesDir}/`);
      await Utils.sleep(500)
    })

    beforeEach(async () => {
      let context = getContext()
      for (let i = 0; i < fileArr.length; i++) {
        const fileName = fileArr[i];
        if (Utils.fileCheckSync(fileName, context)) {
          Log.info(`MindSporeDemo ${fileName} file exists`);
        } else {
          Log.info(`MindSporeDemo ${fileName} file does not exists!`);
        }
      }
      await Utils.sleep(500)
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
     * @tc.name   SUB_AI_MindSpore_Train_UpdateWeights_0001
     * @tc.number SUB_AI_MindSpore_Train_UpdateWeights_0001
     * @tc.desc   SUB_AI_MindSpore_Train_UpdateWeights_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_UpdateWeights_0001', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_UpdateWeights(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_UpdateWeights_0002
     * @tc.number SUB_AI_MindSpore_Train_UpdateWeights_0002
     * @tc.desc   SUB_AI_MindSpore_Train_UpdateWeights_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_UpdateWeights_0002', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_UpdateWeights(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_UpdateWeights_0003
     * @tc.number SUB_AI_MindSpore_Train_UpdateWeights_0003
     * @tc.desc   SUB_AI_MindSpore_Train_UpdateWeights_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_UpdateWeights_0003', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_UpdateWeights(2);
      expect(result).assertEqual(0);
    })
    /**
     * @tc.name   SUB_AI_MindSpore_Train_UpdateWeights_0004
     * @tc.number SUB_AI_MindSpore_Train_UpdateWeights_0004
     * @tc.desc   SUB_AI_MindSpore_Train_UpdateWeights_0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_UpdateWeights_0004', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_UpdateWeights(3);
      expect(result).assertEqual(0);
    })
    /**
     * @tc.name   SUB_AI_MindSpore_Train_UpdateWeights_0005
     * @tc.number SUB_AI_MindSpore_Train_UpdateWeights_0005
     * @tc.desc   SUB_AI_MindSpore_Train_UpdateWeights_0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_UpdateWeights_0005', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_UpdateWeights(4);
      expect(result).assertEqual(0);
    })
    /**
     * @tc.name   SUB_AI_MindSpore_Train_UpdateWeights_0006
     * @tc.number SUB_AI_MindSpore_Train_UpdateWeights_0006
     * @tc.desc   SUB_AI_MindSpore_Train_UpdateWeights_0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_UpdateWeights_0006', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_UpdateWeights(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_SetLearningRate_0001
     * @tc.number SUB_AI_MindSpore_Train_SetLearningRate_0001
     * @tc.desc   SUB_AI_MindSpore_Train_SetLearningRate_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_SetLearningRate_0001', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_SetLearningRate(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_SetLearningRate_0002
     * @tc.number SUB_AI_MindSpore_Train_SetLearningRate_0002
     * @tc.desc   SUB_AI_MindSpore_Train_SetLearningRate_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_SetLearningRate_0002', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_SetLearningRate(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_SetupVirtualBatch_0001
     * @tc.number SUB_AI_MindSpore_Train_SetupVirtualBatch_0001
     * @tc.desc   SUB_AI_MindSpore_Train_SetupVirtualBatch_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_SetupVirtualBatch_0001', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_SetupVirtualBatch(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_SetOptimizationLevel_0001
     * @tc.number SUB_AI_MindSpore_Train_SetOptimizationLevel_0001
     * @tc.desc   SUB_AI_MindSpore_Train_SetOptimizationLevel_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_SetOptimizationLevel_0001', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_SetOptimizationLevel(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_TrainCfg_0001
     * @tc.number SUB_AI_MindSpore_Train_TrainCfg_0001
     * @tc.desc   SUB_AI_MindSpore_Train_TrainCfg_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_TrainCfg_0001', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_TrainCfg(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_TrainCfg_0002
     * @tc.number SUB_AI_MindSpore_Train_TrainCfg_0002
     * @tc.desc   SUB_AI_MindSpore_Train_TrainCfg_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_TrainCfg_0002', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_TrainCfg(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_TrainCfg_0003
     * @tc.number SUB_AI_MindSpore_Train_TrainCfg_0003
     * @tc.desc   SUB_AI_MindSpore_Train_TrainCfg_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_TrainCfg_0003', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_TrainCfg(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_TrainCfg_0004
     * @tc.number SUB_AI_MindSpore_Train_TrainCfg_0004
     * @tc.desc   SUB_AI_MindSpore_Train_TrainCfg_0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_TrainCfg_0004', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_TrainCfg(3);
      expect(result).assertEqual(0);
    })

  })
}