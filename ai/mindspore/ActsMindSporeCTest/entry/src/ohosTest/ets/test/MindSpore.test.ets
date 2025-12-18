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

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ModelBuild_0001
     * @tc.number SUB_AI_MindSpore_Train_ModelBuild_0001
     * @tc.desc   SUB_AI_MindSpore_Train_ModelBuild_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ModelBuild_0001', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ModelBuild(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ModelBuild_0002
     * @tc.number SUB_AI_MindSpore_Train_ModelBuild_0002
     * @tc.desc   SUB_AI_MindSpore_Train_ModelBuild_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ModelBuild_0002', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ModelBuild(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ModelBuild_0003
     * @tc.number SUB_AI_MindSpore_Train_ModelBuild_0003
     * @tc.desc   SUB_AI_MindSpore_Train_ModelBuild_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ModelBuild_0003', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ModelBuild(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ModelBuild_0004
     * @tc.number SUB_AI_MindSpore_Train_ModelBuild_0004
     * @tc.desc   SUB_AI_MindSpore_Train_ModelBuild_0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ModelBuild_0004', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ModelBuild(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ModelBuild_0005
     * @tc.number SUB_AI_MindSpore_Train_ModelBuild_0005
     * @tc.desc   SUB_AI_MindSpore_Train_ModelBuild_0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ModelBuild_0005', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ModelBuild(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportModel_0001
     * @tc.number SUB_AI_MindSpore_Train_ExportModel_0001
     * @tc.desc   SUB_AI_MindSpore_Train_ExportModel_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportModel_0001', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportModel(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportModel_0002
     * @tc.number SUB_AI_MindSpore_Train_ExportModel_0002
     * @tc.desc   SUB_AI_MindSpore_Train_ExportModel_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportModel_0002', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportModel(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportModel_0003
     * @tc.number SUB_AI_MindSpore_Train_ExportModel_0003
     * @tc.desc   SUB_AI_MindSpore_Train_ExportModel_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportModel_0003', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportModel(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportModel_0004
     * @tc.number SUB_AI_MindSpore_Train_ExportModel_0004
     * @tc.desc   SUB_AI_MindSpore_Train_ExportModel_0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportModel_0004', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportModel(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportModel_0005
     * @tc.number SUB_AI_MindSpore_Train_ExportModel_0005
     * @tc.desc   SUB_AI_MindSpore_Train_ExportModel_0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportModel_0005', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportModel(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportModel_0006
     * @tc.number SUB_AI_MindSpore_Train_ExportModel_0006
     * @tc.desc   SUB_AI_MindSpore_Train_ExportModel_0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportModel_0006', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportModel(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportModel_0007
     * @tc.number SUB_AI_MindSpore_Train_ExportModel_0007
     * @tc.desc   SUB_AI_MindSpore_Train_ExportModel_0007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportModel_0007', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportModel(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportModel_0008
     * @tc.number SUB_AI_MindSpore_Train_ExportModel_0008
     * @tc.desc   SUB_AI_MindSpore_Train_ExportModel_0008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportModel_0008', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportModel(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportModel_0009
     * @tc.number SUB_AI_MindSpore_Train_ExportModel_0009
     * @tc.desc   SUB_AI_MindSpore_Train_ExportModel_0009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportModel_0009', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportModel(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportModel_0010
     * @tc.number SUB_AI_MindSpore_Train_ExportModel_0010
     * @tc.desc   SUB_AI_MindSpore_Train_ExportModel_0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportModel_0010', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportModel(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportModel_0011
     * @tc.number SUB_AI_MindSpore_Train_ExportModel_0011
     * @tc.desc   SUB_AI_MindSpore_Train_ExportModel_0011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportModel_0011', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportModel(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportModel_0012
     * @tc.number SUB_AI_MindSpore_Train_ExportModel_0012
     * @tc.desc   SUB_AI_MindSpore_Train_ExportModel_0012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportModel_0012', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportModel(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportModel_0013
     * @tc.number SUB_AI_MindSpore_Train_ExportModel_0013
     * @tc.desc   SUB_AI_MindSpore_Train_ExportModel_0013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportModel_0013', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportModel(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportModel_0014
     * @tc.number SUB_AI_MindSpore_Train_ExportModel_0014
     * @tc.desc   SUB_AI_MindSpore_Train_ExportModel_0014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportModel_0014', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportModel(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportWeights_0001
     * @tc.number SUB_AI_MindSpore_Train_ExportWeights_0001
     * @tc.desc   SUB_AI_MindSpore_Train_ExportWeights_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportWeights_0001', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportWeights(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportWeights_0002
     * @tc.number SUB_AI_MindSpore_Train_ExportWeights_0002
     * @tc.desc   SUB_AI_MindSpore_Train_ExportWeights_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportWeights_0002', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportWeights(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportWeights_0003
     * @tc.number SUB_AI_MindSpore_Train_ExportWeights_0003
     * @tc.desc   SUB_AI_MindSpore_Train_ExportWeights_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportWeights_0003', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportWeights(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportWeights_0004
     * @tc.number SUB_AI_MindSpore_Train_ExportWeights_0004
     * @tc.desc   SUB_AI_MindSpore_Train_ExportWeights_0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportWeights_0004', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportWeights(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportWeights_0005
     * @tc.number SUB_AI_MindSpore_Train_ExportWeights_0005
     * @tc.desc   SUB_AI_MindSpore_Train_ExportWeights_0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportWeights_0005', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportWeights(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportWeights_0006
     * @tc.number SUB_AI_MindSpore_Train_ExportWeights_0006
     * @tc.desc   SUB_AI_MindSpore_Train_ExportWeights_0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportWeights_0006', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportWeights(5);
      expect(result).assertEqual(0);
    })

    // Context related test cases
    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0001
     * @tc.number SUB_AI_MindSpore_ContextCreate_0001
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0001', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0002
     * @tc.number SUB_AI_MindSpore_ContextCreate_0002
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0002', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0003
     * @tc.number SUB_AI_MindSpore_ContextCreate_0003
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0003', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0004
     * @tc.number SUB_AI_MindSpore_ContextCreate_0004
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0004', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0005
     * @tc.number SUB_AI_MindSpore_ContextCreate_0005
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0005', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0006
     * @tc.number SUB_AI_MindSpore_ContextCreate_0006
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0006', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0007
     * @tc.number SUB_AI_MindSpore_ContextCreate_0007
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0007', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0008
     * @tc.number SUB_AI_MindSpore_ContextCreate_0008
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0008', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0009
     * @tc.number SUB_AI_MindSpore_ContextCreate_0009
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0009', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0010
     * @tc.number SUB_AI_MindSpore_ContextCreate_0010
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0010', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0011
     * @tc.number SUB_AI_MindSpore_ContextCreate_0011
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0011', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0012
     * @tc.number SUB_AI_MindSpore_ContextCreate_0012
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0012', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0013
     * @tc.number SUB_AI_MindSpore_ContextCreate_0013
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0013', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0014
     * @tc.number SUB_AI_MindSpore_ContextCreate_0014
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0014', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0015
     * @tc.number SUB_AI_MindSpore_ContextCreate_0015
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0015
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0015', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0016
     * @tc.number SUB_AI_MindSpore_ContextCreate_0016
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0016', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0017
     * @tc.number SUB_AI_MindSpore_ContextCreate_0017
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0017
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0017', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0018
     * @tc.number SUB_AI_MindSpore_ContextCreate_0018
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0018', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0019
     * @tc.number SUB_AI_MindSpore_ContextCreate_0019
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0019', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0020
     * @tc.number SUB_AI_MindSpore_ContextCreate_0020
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0020', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(19);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0021
     * @tc.number SUB_AI_MindSpore_ContextCreate_0021
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0021
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0021', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(20);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0022
     * @tc.number SUB_AI_MindSpore_ContextCreate_0022
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0022
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0022', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(21);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0023
     * @tc.number SUB_AI_MindSpore_ContextCreate_0023
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0023
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0023', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(22);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0024
     * @tc.number SUB_AI_MindSpore_ContextCreate_0024
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0024', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(23);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0025
     * @tc.number SUB_AI_MindSpore_ContextCreate_0025
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0025
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0025', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(24);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0026
     * @tc.number SUB_AI_MindSpore_ContextCreate_0026
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0026
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0026', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(25);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0027
     * @tc.number SUB_AI_MindSpore_ContextCreate_0027
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0027
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0027', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(26);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0028
     * @tc.number SUB_AI_MindSpore_ContextCreate_0028
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0028
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0028', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(27);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0029
     * @tc.number SUB_AI_MindSpore_ContextCreate_0029
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0029
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0029', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(28);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0030
     * @tc.number SUB_AI_MindSpore_ContextCreate_0030
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0030
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0030', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(29);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0031
     * @tc.number SUB_AI_MindSpore_ContextCreate_0031
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0031
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0031', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(30);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0032
     * @tc.number SUB_AI_MindSpore_ContextCreate_0032
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0032
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0032', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(31);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0033
     * @tc.number SUB_AI_MindSpore_ContextCreate_0033
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0033
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0033', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(32);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0034
     * @tc.number SUB_AI_MindSpore_ContextCreate_0034
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0034
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0034', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(33);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0035
     * @tc.number SUB_AI_MindSpore_ContextCreate_0035
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0035
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0035', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(34);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0036
     * @tc.number SUB_AI_MindSpore_ContextCreate_0036
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0036
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0036', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(35);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0037
     * @tc.number SUB_AI_MindSpore_ContextCreate_0037
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0037
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0037', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(36);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0038
     * @tc.number SUB_AI_MindSpore_ContextCreate_0038
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0038
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0038', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(37);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0039
     * @tc.number SUB_AI_MindSpore_ContextCreate_0039
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0039
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0039', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(38);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0040
     * @tc.number SUB_AI_MindSpore_ContextCreate_0040
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0040
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0040', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(39);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0041
     * @tc.number SUB_AI_MindSpore_ContextCreate_0041
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0041
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0041', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(40);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0042
     * @tc.number SUB_AI_MindSpore_ContextCreate_0042
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0042
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0042', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(41);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0043
     * @tc.number SUB_AI_MindSpore_ContextCreate_0043
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0043
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0043', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(42);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0044
     * @tc.number SUB_AI_MindSpore_ContextCreate_0044
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0044
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0044', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(43);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0045
     * @tc.number SUB_AI_MindSpore_ContextCreate_0045
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0045
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0045', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(44);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0046
     * @tc.number SUB_AI_MindSpore_ContextCreate_0046
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0046
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0046', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(45);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0047
     * @tc.number SUB_AI_MindSpore_ContextCreate_0047
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0047', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(46);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0048
     * @tc.number SUB_AI_MindSpore_ContextCreate_0048
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0048', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(47);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0049
     * @tc.number SUB_AI_MindSpore_ContextCreate_0049
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0049
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0049', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(48);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0050
     * @tc.number SUB_AI_MindSpore_ContextCreate_0050
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0050', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(49);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0051
     * @tc.number SUB_AI_MindSpore_ContextCreate_0051
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0051
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0051', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(50);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0052
     * @tc.number SUB_AI_MindSpore_ContextCreate_0052
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0052
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0052', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(51);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0053
     * @tc.number SUB_AI_MindSpore_ContextCreate_0053
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0053
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0053', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(52);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0054
     * @tc.number SUB_AI_MindSpore_ContextCreate_0054
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0054
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0054', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(53);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0055
     * @tc.number SUB_AI_MindSpore_ContextCreate_0055
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0055
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0055', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(54);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0056
     * @tc.number SUB_AI_MindSpore_ContextCreate_0056
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0056
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0056', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(55);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0057
     * @tc.number SUB_AI_MindSpore_ContextCreate_0057
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0057
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0057', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(56);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0058
     * @tc.number SUB_AI_MindSpore_ContextCreate_0058
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0058
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0058', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(57);
      expect(result).assertEqual(0);
    })

  })
}