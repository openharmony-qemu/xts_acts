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
import { describe, beforeAll, beforeEach, it, expect, Level } from '@ohos/hypium'
import mindSporeLite from '@ohos.ai.mindSporeLite';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

export default function coverageSupplementTest() {
  describe('CoverageSupplementTest', () => {
    beforeAll(() => {
      let dir = globalThis.abilityContext.filesDir + "/";
      try {
        let ml_face_model_file = dir + "ml_face_isface.ms";
        globalThis.context.resourceManager.getRawFileContent("ml_face_isface.ms", (error: BusinessError, model_buffer: Uint8Array) => {
          if (error != null) {
            console.log(
              "[rawfile_copy_to_sandbox] ml_face_isface.ms is copy " +
              "failed:${error.code}, message: ${error.message}.");
          } else {
            let file = fs.openSync(ml_face_model_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
            fs.writeSync(file.fd, model_buffer.buffer);
            fs.closeSync(file);
            console.log("[rawfile_copy_to_sandbox] ml_face_isface.ms is copy success");
          }
        });

        let ml_ocr_model_file = dir + "ml_ocr_cn.ms";
        globalThis.context.resourceManager.getRawFileContent("ml_ocr_cn.ms", (error: BusinessError, model_buffer: Uint8Array) => {
          if (error != null) {
            console.log(
              "[rawfile_copy_to_sandbox] ml_ocr_cn.ms is copy " +
              "failed:${error.code}, message: ${error.message}.");
          } else {
            let file = fs.openSync(ml_ocr_model_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
            fs.writeSync(file.fd, model_buffer.buffer);
            fs.closeSync(file);
            console.log("[rawfile_copy_to_sandbox] ml_ocr_cn.ms is copy success");
          }
        });

        let lenet_train_model_file = dir + "lenet_train.ms";
        globalThis.context.resourceManager.getRawFileContent("lenet_train.ms", (error: BusinessError, model_buffer: Uint8Array) => {
          if (error != null) {
            console.log(
              "[rawfile_copy_to_sandbox] lenet_train.ms is copy " +
              "failed:${error.code}, message: ${error.message}.");
          } else {
            let file = fs.openSync(lenet_train_model_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
            fs.writeSync(file.fd, model_buffer.buffer);
            fs.closeSync(file);
            console.log("[rawfile_copy_to_sandbox] lenet_train.ms is copy success");
          }
        });

      } catch (error) {
        console.info("[rawfile_copy_to_sandbox] getRawFileDescriptor api run failed" + error);
      }

      console.info("[rawfile_copy_to_sandbox] sandbox path:" + dir);
    })

    beforeEach(async () => {
      let dir = globalThis.abilityContext.filesDir + "/";

      let ml_face_model = dir + "ml_face_isface.ms";
      await fs.access(ml_face_model).then(async (res) => {
        if (res) {
          console.info("ml_face_isface.ms file exists");
        }
      }).catch((err: BusinessError) => {
        console.info("ml_face_isface.ms file does not exists! access failed with error message: " +
        err.message + ", error code: " + err.code);
      });

      let ml_ocr_model = dir + "ml_ocr_cn.ms";
      await fs.access(ml_ocr_model).then(async (res) => {
        if (res) {
          console.info("ml_ocr_cn.ms file exists");
        }
      }).catch((err: BusinessError) => {
        console.info("ml_ocr_cn.ms file does not exists! access failed with error message: " +
        err.message + ", error code: " + err.code);
      });

      let lenet_train_model = dir + "lenet_train.ms";
      await fs.access(lenet_train_model).then(async (res) => {
        if (res) {
          console.info("lenet_train.ms file exists");
        }
      }).catch((err: BusinessError) => {
        console.info("lenet_train.ms file does not exists! access failed with error message: " +
        err.message + ", error code: " + err.code);
      });
    });


    // 4. loadTrainModelFromFile 测试用例
    /**
     * @tc.name   loadTrainModelFromFileLossNameEmptyArray001
     * @tc.number CoverageSupplementTest_008
     * @tc.desc   loadTrainModelFromFile TrainCfg lossName empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileLossNameEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplementTest: loadTrainModelFromFileLossNameEmptyArray001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.lossName = [];

        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];

        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFileLossNameEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    // 6. loadTrainModelFromFd 测试用例
    /**
     * @tc.name   loadTrainModelFromFdFDModelNull001
     * @tc.number CoverageSupplementTest_013
     * @tc.desc   loadTrainModelFromFd model null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdFDModelNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplementTest: loadTrainModelFromFdFDModelNull001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(null, trainCfg, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFdFDModelNull001 error: " + JSON.stringify(error));
      }
    });

    // 8. Model.runStep 测试用例
    /**
     * @tc.name   modelRunStepInputsNull001
     * @tc.number CoverageSupplementTest_017
     * @tc.desc   Model runStep inputs null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelRunStepInputsNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplementTest: modelRunStepInputsNull001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.runStep(null);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelRunStepInputsNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelRunStepInputsEmptyArray001
     * @tc.number CoverageSupplementTest_018
     * @tc.desc   Model runStep inputs empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelRunStepInputsEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplementTest: modelRunStepInputsEmptyArray001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.runStep([]);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelRunStepInputsEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    // 9. Model.updateWeights 测试用例
    /**
     * @tc.name   modelUpdateWeightsWeightsNull001
     * @tc.number CoverageSupplementTest_019
     * @tc.desc   Model updateWeights weights null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelUpdateWeightsWeightsNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplementTest: modelUpdateWeightsWeightsNull001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.updateWeights(null);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelUpdateWeightsWeightsNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelUpdateWeightsWeightsEmptyArray001
     * @tc.number CoverageSupplementTest_020
     * @tc.desc   Model updateWeights weights empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelUpdateWeightsWeightsEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplementTest: modelUpdateWeightsWeightsEmptyArray001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.updateWeights([]);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelUpdateWeightsWeightsEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    // 11. Model.resize 测试用例
    /**
     * @tc.name   modelResizeInputsNull001
     * @tc.number CoverageSupplementTest_024
     * @tc.desc   Model resize inputs null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelResizeInputsNull001', Level.LEVEL1, () => {
      console.log("CoverageSupplementTest: modelResizeInputsNull001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          if (msliteModel !== null) {
            let new_dim: number[][] = [[48, 48]];
            let ret = msliteModel.resize(null, new_dim);
            expect(ret).assertFalse();
          }
        });
      } catch (error) {
        console.log("modelResizeInputsNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelResizeDimsNull001
     * @tc.number CoverageSupplementTest_025
     * @tc.desc   Model resize dims null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelResizeDimsNull001', Level.LEVEL1, () => {
      console.log("CoverageSupplementTest: modelResizeDimsNull001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          if (msliteModel !== null) {
            let modelInputs: mindSporeLite.MSTensor[] = msliteModel.getInputs();
            if (modelInputs.length > 0) {
              let ret = msliteModel.resize(modelInputs, null);
              expect(ret).assertFalse();
            }
          }
        });
      } catch (error) {
        console.log("modelResizeDimsNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFdModelNull001
     * @tc.number CoverageSupplement2Test_030
     * @tc.desc   loadModelFromFd model invalid fd test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdModelNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadModelFromFdModelNull001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let msliteModel = await mindSporeLite.loadModelFromFd(null, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadModelFromFdModelNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFdModelUndefined001
     * @tc.number CoverageSupplement2Test_031
     * @tc.desc   loadModelFromFd model undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdModelUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadModelFromFdModelUndefined001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let msliteModel = await mindSporeLite.loadModelFromFd(undefined, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadModelFromFdModelUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFdContextNull001
     * @tc.number CoverageSupplement2Test_032
     * @tc.desc   loadModelFromFd context null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadModelFromFdContextNull001");
      try {
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, null);
        fs.closeSync(file);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadModelFromFdContextNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFdContextUndefined001
     * @tc.number CoverageSupplement2Test_033
     * @tc.desc   loadModelFromFd context undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadModelFromFdContextUndefined001");
      try {
        let model_file = globalThis.abilityContext.filesDirDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, undefined);
        fs.closeSync(file);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadModelFromFdContextUndefined001 error: " + JSON.stringify(error));
      }
    });

    // 3. loadModelFromFd API 测试 - Context + Callback 版本 - 基础测试
    /**
     * @tc.name   loadModelFromFdContextCallbackNormal001
     * @tc.number CoverageSupplement2Test_036
     * @tc.desc   loadModelFromFd Context Callback normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextCallbackNormal001', Level.LEVEL1, (done: Function) => {
      console.log("CoverageSupplement2Test: loadModelFromFdContextCallbackNormal001");
      try {
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        mindSporeLite.loadModelFromFd(file.fd, context, (msliteModel: mindSporeLite.Model) => {
          fs.closeSync(file);
          expect(msliteModel !== null).assertTrue();
          done();
        });
      } catch (error) {
        console.log("loadModelFromFdContextCallbackNormal001 error: " + JSON.stringify(error));
        done();
      }
    });

    // 4. loadTrainModelFromFile API 测试 - Context 属性覆盖
    /**
     * @tc.name   loadTrainModelFromFileContextPrecisionModeEmptyString001
     * @tc.number CoverageSupplement2Test_037
     * @tc.desc   loadTrainModelFromFile Context precisionMode empty string test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileContextPrecisionModeEmptyString001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromFileContextPrecisionModeEmptyString001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.precisionMode = "";
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        expect(msliteModel).not().assertUndefined();
        expect(msliteModel).not().assertNull();
      } catch (error) {
        console.log("loadTrainModelFromFileContextPrecisionModeEmptyString001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFileModelNull001
     * @tc.number CoverageSupplement2Test_040
     * @tc.desc   loadTrainModelFromFile model null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileModelNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromFileModelNull001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(null, trainCfg, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFileModelNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFileModelUndefined001
     * @tc.number CoverageSupplement2Test_041
     * @tc.desc   loadTrainModelFromFile model undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileModelUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromFileModelUndefined001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(undefined, trainCfg, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFileModelUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFileTrainCfgNull001
     * @tc.number CoverageSupplement2Test_042
     * @tc.desc   loadTrainModelFromFile trainCfg null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileTrainCfgNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromFileTrainCfgNull001");
      try {
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, null, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFileTrainCfgNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFileTrainCfgUndefined001
     * @tc.number CoverageSupplement2Test_043
     * @tc.desc   loadTrainModelFromFile trainCfg undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileTrainCfgUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromFileTrainCfgUndefined001");
      try {
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, undefined, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFileTrainCfgUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFileContextNull001
     * @tc.number CoverageSupplement2Test_044
     * @tc.desc   loadTrainModelFromFile context null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileContextNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromFileContextNull001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, null);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFileContextNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFileContextUndefined001
     * @tc.number CoverageSupplement2Test_045
     * @tc.desc   loadTrainModelFromFile context undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileContextUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromFileContextUndefined001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, undefined);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFileContextUndefined001 error: " + JSON.stringify(error));
      }
    });

    // 5. loadTrainModelFromBuffer API 测试 - Context 属性覆盖
    /**
     * @tc.name   loadTrainModelFromBufferContextPrecisionModeEmptyString001
     * @tc.number CoverageSupplement2Test_046
     * @tc.desc   loadTrainModelFromBuffer Context precisionMode empty string test.
     * @tc.type     FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromBufferContextPrecisionModeEmptyString001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromBufferContextPrecisionModeEmptyString001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.precisionMode = "";
        let syscontext: common.Context = globalThis.context;
        let modelName = 'lenet_train.ms';
        syscontext.resourceManager.getRawFileContent(modelName, (error: BusinessError, model_buffer: Uint8Array) => {
          if (error == null) {
            mindSporeLite.loadTrainModelFromBuffer(model_buffer.buffer, trainCfg, context).then((msliteModel: mindSporeLite.Model) => {
              expect(msliteModel).not().assertUndefined();
              expect(msliteModel).not().assertNull();
            }).catch((err: BusinessError) => {
            });
          }
        });
      } catch (error) {
        console.log("loadTrainModelFromBufferContextPrecisionModeEmptyString001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromBufferModelNull001
     * @tc.number CoverageSupplement2Test_049
     * @tc.desc   loadTrainModelFromBuffer model null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromBufferModelNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromBufferModelNull001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(null, trainCfg, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromBufferModelNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromBufferModelUndefined001
     * @tc.number CoverageSupplement2Test_050
     * @tc.desc   loadTrainModelFromBuffer model undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromBufferModelUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromBufferModelUndefined001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(undefined, trainCfg, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromBufferModelUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromBufferTrainCfgNull001
     * @tc.number CoverageSupplement2Test_051
     * @tc.desc   loadTrainModelFromBuffer trainCfg null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromBufferTrainCfgNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromBufferTrainCfgNull001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let syscontext: common.Context = globalThis.context
        let modelBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent("lenet_train.ms");
        let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer, null, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromBufferTrainCfgNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromBufferTrainCfgUndefined001
     * @tc.number CoverageSupplement2Test_052
     * @tc.desc   loadTrainModelFromBuffer trainCfg undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromBufferTrainCfgUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromBufferTrainCfgUndefined001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let syscontext: common.Context = globalThis.context
        let modelBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent("lenet_train.ms");
        let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer, undefined, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromBufferTrainCfgUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromBufferContextNull001
     * @tc.number CoverageSupplement2Test_053
     * @tc.desc   loadTrainModelFromBuffer context null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromBufferContextNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromBufferContextNull001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let syscontext: common.Context = globalThis.context
        let modelBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent("lenet_train.ms");
        let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer, trainCfg, null);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromBufferContextNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFromContextUndefined001
     * @tc.number CoverageSupplement2Test_054
     * @tc.desc   loadTrainModelFromFromBuffer context undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFromContextUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromFromContextUndefined001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let syscontext: common.Context = globalThis.context
        let modelBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent("lenet_train.ms");
        let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer, trainCfg, undefined);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFromContextUndefined001 error: " + JSON.stringify(error));
      }
    });

    // 6. loadTrainModelFromFd API 测试 - Context 属性覆盖
    /**
     * @tc.name   loadTrainModelFromFdContextPrecisionModeEmptyString001
     * @tc.number CoverageSupplement2Test_055
     * @tc.desc   loadTrainModelFromFd Context precisionMode empty string test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdContextPrecisionModeEmptyString001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromFdContextPrecisionModeEmptyString001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        context.cpu = {};
        context.cpu.precisionMode = "";
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, trainCfg, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertUndefined();
        expect(msliteModel).not().assertNull();
      } catch (error) {
        console.log("loadTrainModelFromFdContextPrecisionModeEmptyString001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFdModelNull001
     * @tc.number CoverageSupplement2Test_058
     * @tc.desc   loadTrainModelFromFd model invalid fd test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdModelNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromFdModelNull001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(null, trainCfg, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFdModelNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFdModelUndefined001
     * @tc.number CoverageSupplement2Test_059
     * @tc.desc   loadTrainModelFromFd model undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdModelUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromFdModelUndefined001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(undefined, trainCfg, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFdModelUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFdTrainCfgNull001
     * @tc.number CoverageSupplement2Test_060
     * @tc.desc   loadTrainModelFromFd trainCfg null test.
     * * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdTrainCfgNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromFdTrainCfgNull001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, null, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFdTrainCfgNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFdTrainCfgUndefined001
     * @tc.number CoverageSupplement2Test_061
     * @tc.desc   loadTrainModelFromFd trainCfg undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdTrainCfgUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromFdTrainCfgUndefined001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, undefined, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFdTrainCfgUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFdContextNull001
     * @tc.number CoverageSupplement2Test_062
     * @tc.desc   loadTrainModelFromFd context null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdContextNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromFdContextNull001001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, trainCfg, null);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFdContextNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFdContextUndefined001
     * @tc.number CoverageSupplement2Test_063
     * @tc.desc   loadTrainModelFromFd context undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdContextUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromFdContextUndefined001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, trainCfg, undefined);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFdContextUndefined001 error: " + JSON.stringify(error));
      }
    });

    // 7. Model.predict API 测试 - Promise 版本 - 参数覆盖
    /**
     * @tc.name   modelPredictPromiseInputsNull001
     * @tc.number CoverageSupplement2Test_067
     * @tc.desc   Model predict Promise inputs null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelPredictPromiseInputsNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelPredictPromiseInputsNull001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_ocr_cn.ms";
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        if (msliteModel !== null) {
          let modelOutputs = await msliteModel.predict(null);
          expect(modelOutputs).assertUndefined();
        }
      } catch (error) {
        console.log("modelPredictPromiseInputsNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelPredictPromiseInputsUndefined001
     * @tc.number CoverageSupplement2Test_068
     * @tc.desc   Model predict Promise inputs undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelPredictPromiseInputsUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelPredictPromiseInputsUndefined001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_ocr_cn.ms";
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        if (msliteModel !== null) {
          let modelOutputs = await msliteModel.predict(undefined);
          expect(modelOutputs).assertUndefined();
        }
      } catch (error) {
        console.log("modelPredictPromiseInputsUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelPredictPromiseInputsEmptyArray001
     * @tc.number CoverageSupplement2Test_069
     * @tc.desc   Model predict Promise inputs empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelPredictPromiseInputsEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelPredictPromiseInputsEmptyArray001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_ocr_cn.ms";
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        if (msliteModel !== null) {
          let modelOutputs = await msliteModel.predict([]);
          expect(modelOutputs).assertUndefined();
        }
      } catch (error) {
        console.log("modelPredictPromiseInputsEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    // 8. Model.resize API 测试 - 参数覆盖
    /**
     * @tc.name   modelResizeInputsUndefined001
     * @tc.number CoverageSupplement2Test_070
     * @tc.desc   Model resize inputs undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelResizeInputsUndefined001', Level.LEVEL1, () => {
      console.log("CoverageSupplement2Test: modelResizeInputsUndefined001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          if (msliteModel !== null) {
            let new_dim: number[][] = [[48, 48]];
            let ret = msliteModel.resize(undefined, new_dim);
            expect(ret).assertFalse();
          }
        });
      } catch (error) {
        console.log("modelResizeInputsUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelResizeDimsUndefined001
     * @tc.number CoverageSupplement2Test_071
     * @tc.desc   Model resize dims undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelResizeDimsUndefined001', Level.LEVEL1, () => {
      console.log("CoverageSupplement2Test: modelResizeDimsUndefined001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        mindSporeLite.loadModelFromFile(model_file, context, (mslite: mindSporeLite.Model) => {
          if (mslite !== null) {
            let modelInputs: mindSporeLite.MSTensor[] = mslite.getInputs();
            if (modelInputs.length > 0) {
              let ret = mslite.resize(modelInputs, undefined);
              expect(ret).assertFalse();
            }
          }
        });
      } catch (error) {
        console.log("modelResizeDimsUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelResizeInputsEmptyArray001
     * @tc.number CoverageSupplement2Test_072
     * @tc.desc   Model resize inputs empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelResizeInputsEmptyArray001', Level.LEVEL1, () => {
      console.log("CoverageSupplement2Test: modelResizeInputsEmptyArray001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        mindSporeLite.loadModelFromFile(model_file, context, (mslite: mindSporeLite.Model) => {
          if (mslite !== null) {
            let new_dim: number[][] = [[48, 48]];
            let ret = mslite.resize([], new_dim);
            expect(ret).assertFalse();
          }
        });
      } catch (error) {
        console.log("modelResizeInputsEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelResizeDimsEmptyArray001
     * @tc.number CoverageSupplement2Test_073
     * @tc.desc   Model resize dims empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelResizeDimsEmptyArray001', Level.LEVEL1, () => {
      console.log("CoverageSupplement2Test: modelResizeDimsEmptyArray001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        mindSporeLite.loadModelFromFile(model_file, context, (mslite: mindSporeLite.Model) => {
          if (mslite !== null) {
            let modelInputs: mindSporeLite.MSTensor[] = mslite.getInputs();
            if (modelInputs.length > 0) {
              let ret = mslite.resize(modelInputs, []);
            expect(ret).assertFalse();
            }
          }
        });
      } catch (error) {
        console.log("modelResizeDimsEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    // 9. Model.runStep API 测试 - 参数覆盖
    /**
     * @tc.name   modelRunStepInputsUndefined001
     * @tc.number CoverageSupplement2Test_074
     * @tc.desc   Model runStep inputs undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelRunStepInputsUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelRunStepInputsUndefined001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.runStep(undefined);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelRunStepInputsUndefined001 error: " + JSON.stringify(error));
      }
    });

    // 10. Model.updateWeights API 测试 - 参数覆盖
    /**
     * @tc.name   modelUpdateWeightsWeightsUndefined001
     * @tc.number CoverageSupplement2Test_075
     * @tc.desc   Model updateWeights weights undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelUpdateWeightsWeightsUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelUpdateWeightsWeightsUndefined001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.updateWeights(undefined);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelUpdateWeightsWeightsUndefined001 error: " + JSON.stringify(error));
      }
    });

    // 11. Model.setupVirtualBatch API 测试 - 参数覆盖
    /**
     * @tc.name   modelSetupVirtualBatchVirtualBatchMultiplierNull001
     * @tc.number CoverageSupplement2Test_076
     * @tc.desc   Model setupVirtualBatch virtualBatchMultiplier null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelSetupVirtualBatchVirtualBatchMultiplierNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelSetupVirtualBatchVirtualBatchMultiplierNull001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.setupVirtualBatch(null, -1, -1);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelSetupVirtualBatchVirtualBatchMultiplierNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelSetupVirtualBatchVirtualBatchMultiplierUndefined001
     * @tc.number CoverageSupplement2Test_077
     * @tc.desc   Model setupVirtualBatch virtualBatchMultiplier undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelSetupVirtualBatchVirtualBatchMultiplierUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelSetupVirtualBatchVirtualBatchMultiplierUndefined001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel) {
          let ret = msliteModel.setupVirtualBatch(undefined, -1, -1);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelSetupVirtualBatchVirtualBatchMultiplierUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelSetupVirtualBatchLrNull001
     * @tc.number CoverageSupplement2Test_078
     * @tc.desc   Model setupVirtualBatch lr null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelSetupVirtualBatchLrNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelSetupVirtualBatchLrNull001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.setupVirtualBatch(2, null, -1);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelSetupVirtualBatchLrNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelSetupVirtualBatchLrUndefined001
     * @tc.number CoverageSupplement2Test_079
     * @tc.desc   Model setupVirtualBatch lr undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelSetupVirtualBatchLrUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelSetupVirtualBatchLrUndefined001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.setupVirtualBatch(2, undefined, -1);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelSetupVirtualBatchLrUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelSetupVirtualBatchMomentumNull001
     * @tc.number CoverageSupplement2Test_080
     * @tc.desc   Model setupVirtualBatch momentum null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelSetupVirtualBatchMomentumNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelSetupVirtualBatchMomentumNull001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.setupVirtualBatch(2, -1, null);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelSetupVirtualBatchMomentumNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelSetupVirtualBatchMomentumUndefined001
     * @tc.number CoverageSupplement2Test_081
     * @tc.desc   Model setupVirtualBatch momentum undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelSetupVirtualBatchMomentumUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelSetupVirtualBatchMomentumUndefined001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.setupVirtualBatch(2, -1, undefined);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelSetupVirtualBatchMomentumUndefined001 error: " + JSON.stringify(error));
      }
    });

    // 12. Model.exportModel API 测试 - 参数覆盖
    /**
     * @tc.name   modelExportModelModelFileNull001
     * @tc.number CoverageSupplement2Test_082
     * @tc.desc   Model exportModel modelFile null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelExportModelModelFileNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelExportModelModelFileNull001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.exportModel(null, mindSporeLite.QuantizationType.NO_QUANT, true);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelExportModelModelFileNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelExportModelModelFileUndefined001
     * @tc.number CoverageSupplement2Test_083
     * @tc.desc   Model exportModel modelFile undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelExportModelModelFileUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelExportModelModelFileUndefined001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.exportModel(undefined, mindSporeLite.QuantizationType.NO_QUANT, true);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelExportModelModelFileUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelExportModelOutputTensorNameNull001
     * @tc.number CoverageSupplement2Test_084
     * @tc.desc   Model exportModel outputTensorName null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelExportModelOutputTensorNameNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelExportModelOutputTensorNameNull001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let path: string = globalThis.abilityContext.filesDir + "/test_export_model.ms";
          let ret = msliteModel.exportModel(path, mindSporeLite.QuantizationType.NO_QUANT, true, null);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelExportModelOutputTensorNameNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelExportModelOutputTensorNameUndefined001
     * @tc.number CoverageSupplement2Test_085
     * @tc.desc   Model exportModel outputTensorName undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelExportModelOutputTensorNameUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelExportModelOutputTensorNameUndefined001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let path: string = globalThis.abilityContext.filesDir + "/test_export_model.ms";
          let ret = msliteModel.exportModel(path, mindSporeLite.QuantizationType.NO_QUANT, true, undefined);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelExportModelOutputTensorNameUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelExportModelOutputTensorNameEmptyArray001
     * @tc.number CoverageSupplement2Test_086
     * @tc.desc   Model exportModel outputTensorName empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelExportModelOutputTensorNameEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelExportModelOutputTensorNameEmptyArray001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let path: string = globalThis.abilityContext.filesDir + "/test_export_model.ms";
          let ret = msliteModel.exportModel(path, mindSporeLite.QuantizationType.NO_QUANT, true, []);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelExportModelOutputTensorNameEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    // 13. Model.exportWeightsCollaborateWithMicro API 测试 - 参数覆盖
    /**
     * @tc.name   modelExportWeightsCollaborateWithMicroWeightFileNull001
     * @tc.number CoverageSupplement2Test_087
     * @tc.desc   Model exportWeightsCollaborateWithMicro weightFile null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelExportWeightsCollaborateWithMicroWeightFileNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelExportWeightsCollaborateWithMicroWeightFileNull001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.lossName = ["CrossEntropy"];
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.exportWeightsCollaborateWithMicro(null, true);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelExportWeightsCollaborateWithMicroWeightFileNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelExportWeightsCollaborateWithMicroWeightFileUndefined001
     * @tc.number CoverageSupplement2Test_088
     * @tc.desc   Model exportWeightsCollaborateWithMicro weightFile undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelExportWeightsCollaborateWithMicroWeightFileUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelExportWeightsCollaborateWithMicroWeightFileUndefined001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.lossName = ["CrossEntropy"];
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.exportWeightsCollaborateWithMicro(undefined, true);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelExportWeightsCollaborateWithMicroWeightFileUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelExportWeightsCollaborateWithMicroChangeableWeightsNameNull001
     * @tc.number CoverageSupplement2Test_089
     * @tc.desc   Model exportWeightsCollaborateWithMicro changeableWeightsName null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelExportWeightsCollaborateWithMicroChangeableWeightsNameNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelExportWeightsCollaborateWithMicroChangeableWeightsNameNull001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.lossName = ["CrossEntropy"];
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let path: string = globalThis.abilityContext.filesDir + "/test_export_weights.bin";
          let ret = msliteModel.exportWeightsCollaborateWithMicro(path, true, false, null);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelExportWeightsCollaborateWithMicroChangeableWeightsNameNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelExportWeightsCollaborateWithMicroChangeableWeightsNameUndefined001
     * @tc.number CoverageSupplement2Test_090
     * @tc.desc   Model exportWeightsCollaborateWithMicro changeableWeightsName undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelExportWeightsCollaborateWithMicroChangeableWeightsNameUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelExportWeightsCollaborateWithMicroChangeableWeightsNameUndefined001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.lossName = ["CrossEntropy"];
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let path: string = globalThis.abilityContext.filesDir + "/test_export_weights.bin";
          let ret = msliteModel.exportWeightsCollaborateWithMicro(path, true, false, undefined);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelExportWeightsCollaborateWithMicroChangeableWeightsNameUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelExportWeightsCollaborateWithMicroChangeableWeightsNameEmptyArray001
     * @tc.number CoverageSupplement2Test_091
     * @tc.desc   Model exportWeightsCollaborateWithMicro changeableWeightsName empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  1
     */
    it('modelExportWeightsCollaborateWithMicroChangeableWeightsNameEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelExportWeightsCollaborateWithMicroChangeableWeightsNameEmptyArray001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.lossName = ["CrossEntropy"];
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let path: string = globalThis.abilityContext.filesDir + "/test_export_weights.bin";
          let ret = msliteModel.exportWeightsCollaborateWithMicro(path, true, false, []);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelExportWeightsCollaborateWithMicroChangeableWeightsNameEmptyArray001 error: " + JSON.stringify(error));
      }
    });

  })
}
