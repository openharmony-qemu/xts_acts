'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import * as SceneTest from "../ets/scene";
import * as SceneNodeTest from "../ets/sceneNodeParameters";

export default function graphics3dTest(): void {
  describe("ActsGraphics3DTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    let sResFactory: SceneTest.SceneResourceFactory = SceneTest.getSceneResourceFactory();
    let sNodePara: SceneNodeTest.SceneNodeParameters = SceneNodeTest.getSceneNodeParameters();
    let sResPara: SceneTest.SceneResourceParameters = SceneTest.getSceneResourceParameters();

    /**
     * @tc.number    SUB_Taihe_Graphics3D_CameraSync_STATIC_0100
     * @tc.name      test_Graphics3D_CameraSync_Static_0001
     * @tc.desc      createCameraPro sync returns camera with correct fov
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Graphics3D_CameraSync_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Graphics3D_CameraSync_Static_0001 start');
      let param = sNodePara;
      let info = SceneTest.getCamera();
      let err: BusinessError = new BusinessError();
      try {
        info = sResFactory.createCameraPro(param);
      } catch (e) {
        err = e as BusinessError;
      }
      console.log("createCamera is: " + info.fov);
      expect(info.fov).assertEqual(5.24f);
      console.log('test_Graphics3D_CameraSync_Static_0001 done');
      done();
      console.log('test_Graphics3D_CameraSync_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Graphics3D_CameraPromise_STATIC_0100
     * @tc.name      test_Graphics3D_CameraPromise_Static_0001
     * @tc.desc      createCamera promise returns camera with correct fov
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Graphics3D_CameraPromise_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Graphics3D_CameraPromise_Static_0001 start');
      let param = sNodePara;
      let info = SceneTest.getCamera();
      let err: BusinessError = new BusinessError();
      try {
        info = await sResFactory.createCamera(param) as SceneTest.Camera;
      } catch (e) {
        err = e as BusinessError;
      }
      console.log("createCamera is: " + info.fov);
      expect(info.fov).assertEqual(5.24f);
      console.log('test_Graphics3D_CameraPromise_Static_0001 done');
      done();
      console.log('test_Graphics3D_CameraPromise_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Graphics3D_CameraCallback_STATIC_0100
     * @tc.name      test_Graphics3D_CameraCallback_Static_0001
     * @tc.desc      createCamera callback returns camera with correct fov
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Graphics3D_CameraCallback_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Graphics3D_CameraCallback_Static_0001 start');
      let param = sNodePara;
      let info = SceneTest.getCamera();
      let err: BusinessError = new BusinessError();
      try {
        info = await new Promise<SceneTest.Camera>((resolve: (data: SceneTest.Camera) => void, reject: (err: Error) => void): void => {
          sResFactory.createCamera(
            param,
            (error: BusinessError | null, data: SceneTest.Camera | undefined): void => {
              if (error != null && error.code !== 0) {
                reject(error as Error);
              } else {
                resolve(data as SceneTest.Camera);
              }
            });
        });
      } catch (e) {
        err = e as BusinessError;
      }
      console.log("createCamera is: " + info.fov);
      expect(info.fov).assertEqual(5.24f);
      console.log('test_Graphics3D_CameraCallback_Static_0001 done');
      done();
      console.log('test_Graphics3D_CameraCallback_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Graphics3D_LightSync_STATIC_0100
     * @tc.name      test_Graphics3D_LightSync_Static_0001
     * @tc.desc      createLightPro sync returns light with correct intensity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Graphics3D_LightSync_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Graphics3D_LightSync_Static_0001 start');
      let param = sNodePara;
      let lightType = SceneTest.LightType.SPOT;
      let info = SceneTest.getLight();
      let err: BusinessError = new BusinessError();
      try {
        info = sResFactory.createLightPro(param, lightType);
      } catch (e) {
        err = e as BusinessError;
      }
      console.log("createLightPro is: " + info.intensity);
      expect(info.intensity).assertEqual(5.24f);
      console.log('test_Graphics3D_LightSync_Static_0001 done');
      done();
      console.log('test_Graphics3D_LightSync_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Graphics3D_LightPromise_STATIC_0100
     * @tc.name      test_Graphics3D_LightPromise_Static_0001
     * @tc.desc      createLight promise returns light with correct intensity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Graphics3D_LightPromise_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Graphics3D_LightPromise_Static_0001 start');
      let param = sNodePara;
      let lightType = SceneTest.LightType.SPOT;
      let info = SceneTest.getLight();
      let err: BusinessError = new BusinessError();
      try {
        info = await sResFactory.createLight(param, lightType) as SceneTest.Light;
      } catch (e) {
        err = e as BusinessError;
      }
      console.log("createLightPro is: " + info.intensity);
      expect(info.intensity).assertEqual(5.24f);
      console.log('test_Graphics3D_LightPromise_Static_0001 done');
      done();
      console.log('test_Graphics3D_LightPromise_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Graphics3D_LightCallback_STATIC_0100
     * @tc.name      test_Graphics3D_LightCallback_Static_0001
     * @tc.desc      createLight callback returns light with correct intensity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Graphics3D_LightCallback_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Graphics3D_LightCallback_Static_0001 start');
      let param = sNodePara;
      let lightType = SceneTest.LightType.SPOT;
      let info = SceneTest.getLight();
      let err: BusinessError = new BusinessError();
      try {
        info = await new Promise<SceneTest.Light>((resolve: (data: SceneTest.Light) => void, reject: (err: Error) => void): void => {
          sResFactory.createLight(
            param, lightType,
            (error: BusinessError | null, data: SceneTest.Light | undefined): void => {
              if (error != null && error.code !== 0) {
                reject(error as Error);
              } else {
                resolve(data as SceneTest.Light);
              }
            });
        });
      } catch (e) {
        err = e as BusinessError;
      }
      console.log("createLightPro is: " + info.intensity);
      expect(info.intensity).assertEqual(5.24f);
      console.log('test_Graphics3D_LightCallback_Static_0001 done');
      done();
      console.log('test_Graphics3D_LightCallback_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Graphics3D_NodeSync_STATIC_0100
     * @tc.name      test_Graphics3D_NodeSync_Static_0001
     * @tc.desc      createNodePro sync returns node with visible=true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Graphics3D_NodeSync_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Graphics3D_NodeSync_Static_0001 start');
      let param = sNodePara;
      let info = SceneTest.getNode();
      let err: BusinessError = new BusinessError();
      try {
        info = sResFactory.createNodePro(param);
      } catch (e) {
        err = e as BusinessError;
      }
      console.log("createNode is: " + info.visible);
      expect(info.visible).assertEqual(true);
      console.log('test_Graphics3D_NodeSync_Static_0001 done');
      done();
      console.log('test_Graphics3D_NodeSync_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Graphics3D_NodePromise_STATIC_0100
     * @tc.name      test_Graphics3D_NodePromise_Static_0001
     * @tc.desc      createNode promise returns node with visible=true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Graphics3D_NodePromise_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Graphics3D_NodePromise_Static_0001 start');
      let param = sNodePara;
      let info = SceneTest.getNode();
      let err: BusinessError = new BusinessError();
      try {
        info = await sResFactory.createNode(param) as SceneTest.Node;
      } catch (e) {
        err = e as BusinessError;
      }
      console.log("createNode is: " + info.visible);
      expect(info.visible).assertEqual(true);
      console.log('test_Graphics3D_NodePromise_Static_0001 done');
      done();
      console.log('test_Graphics3D_NodePromise_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Graphics3D_NodeCallback_STATIC_0100
     * @tc.name      test_Graphics3D_NodeCallback_Static_0001
     * @tc.desc      createNode callback returns node with visible=true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Graphics3D_NodeCallback_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Graphics3D_NodeCallback_Static_0001 start');
      let param = sNodePara;
      let info = SceneTest.getNode();
      let err: BusinessError = new BusinessError();
      try {
        info = await new Promise<SceneTest.Node>((resolve: (data: SceneTest.Node) => void, reject: (err: Error) => void): void => {
          sResFactory.createNode(
            param,
            (error: BusinessError | null, data: SceneTest.Node | undefined): void => {
              if (error != null && error.code !== 0) {
                reject(error as Error);
              } else {
                resolve(data as SceneTest.Node);
              }
            });
        });
      } catch (e) {
        err = e as BusinessError;
      }
      console.log("createNode is: " + info.visible);
      expect(info.visible).assertEqual(true);
      console.log('test_Graphics3D_NodeCallback_Static_0001 done');
      done();
      console.log('test_Graphics3D_NodeCallback_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Graphics3D_MaterialSync_STATIC_0100
     * @tc.name      test_Graphics3D_MaterialSync_Static_0001
     * @tc.desc      createMaterialPro sync returns material with correct materialType
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Graphics3D_MaterialSync_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Graphics3D_MaterialSync_Static_0001 start');
      let param = sResPara;
      let materialType = SceneTest.MaterialType.SHADER;
      let info = SceneTest.getMaterial();
      let err: BusinessError = new BusinessError();
      try {
        info = sResFactory.createMaterialPro(param, materialType);
      } catch (e) {
        err = e as BusinessError;
      }
      console.log("createMaterial is: " + info.materialType);
      expect(info.materialType).assertEqual(122 as byte);
      console.log('test_Graphics3D_MaterialSync_Static_0001 done');
      done();
      console.log('test_Graphics3D_MaterialSync_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Graphics3D_MaterialPromise_STATIC_0100
     * @tc.name      test_Graphics3D_MaterialPromise_Static_0001
     * @tc.desc      createMaterial promise returns material with correct materialType
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Graphics3D_MaterialPromise_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Graphics3D_MaterialPromise_Static_0001 start');
      let param = sResPara;
      let materialType = SceneTest.MaterialType.SHADER;
      let info = SceneTest.getMaterial();
      let err: BusinessError = new BusinessError();
      try {
        info = await sResFactory.createMaterial(param, materialType) as SceneTest.Material;
      } catch (e) {
        err = e as BusinessError;
      }
      console.log("createMaterial is: " + info.materialType);
      expect(info.materialType).assertEqual(122 as byte);
      console.log('test_Graphics3D_MaterialPromise_Static_0001 done');
      done();
      console.log('test_Graphics3D_MaterialPromise_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Graphics3D_MaterialCallback_STATIC_0100
     * @tc.name      test_Graphics3D_MaterialCallback_Static_0001
     * @tc.desc      createMaterial callback returns material with correct materialType
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Graphics3D_MaterialCallback_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Graphics3D_MaterialCallback_Static_0001 start');
      let param = sResPara;
      let materialType = SceneTest.MaterialType.SHADER;
      let info = SceneTest.getMaterial();
      let err: BusinessError = new BusinessError();
      try {
        info = await new Promise<SceneTest.Material>((resolve: (data: SceneTest.Material) => void, reject: (err: Error) => void): void => {
          sResFactory.createMaterial(
            param, materialType,
            (error: BusinessError | null, data: SceneTest.Material | undefined): void => {
              if (error != null && error.code !== 0) {
                reject(error as Error);
              } else {
                resolve(data as SceneTest.Material);
              }
            });
        });
      } catch (e) {
        err = e as BusinessError;
      }
      console.log("createMaterial is: " + info.materialType);
      expect(info.materialType).assertEqual(122 as byte);
      console.log('test_Graphics3D_MaterialCallback_Static_0001 done');
      done();
      console.log('test_Graphics3D_MaterialCallback_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Graphics3D_ShaderSync_STATIC_0100
     * @tc.name      test_Graphics3D_ShaderSync_Static_0001
     * @tc.desc      createShaderPro sync returns shader with correct inputs size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Graphics3D_ShaderSync_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Graphics3D_ShaderSync_Static_0001 start');
      let param = sResPara;
      let info = SceneTest.getShader();
      let err: BusinessError = new BusinessError();
      try {
        info = sResFactory.createShaderPro(param);
      } catch (e) {
        err = e as BusinessError;
      }
      console.log("createShader is: " + info.inputs);
      expect(info.inputs.size).assertEqual(1);
      console.log('test_Graphics3D_ShaderSync_Static_0001 done');
      done();
      console.log('test_Graphics3D_ShaderSync_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Graphics3D_ShaderPromise_STATIC_0100
     * @tc.name      test_Graphics3D_ShaderPromise_Static_0001
     * @tc.desc      createShader promise returns shader with correct inputs size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Graphics3D_ShaderPromise_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Graphics3D_ShaderPromise_Static_0001 start');
      let param = sResPara;
      let info = SceneTest.getShader();
      let err: BusinessError = new BusinessError();
      try {
        info = await sResFactory.createShader(param) as SceneTest.Shader;
      } catch (e) {
        err = e as BusinessError;
      }
      console.log("createShader is: " + info.inputs);
      expect(info.inputs.size).assertEqual(1);
      console.log('test_Graphics3D_ShaderPromise_Static_0001 done');
      done();
      console.log('test_Graphics3D_ShaderPromise_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Graphics3D_ShaderCallback_STATIC_0100
     * @tc.name      test_Graphics3D_ShaderCallback_Static_0001
     * @tc.desc      createShader callback returns shader with correct inputs size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Graphics3D_ShaderCallback_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Graphics3D_ShaderCallback_Static_0001 start');
      let param = sResPara;
      let info = SceneTest.getShader();
      let err: BusinessError = new BusinessError();
      try {
        info = await new Promise<SceneTest.Shader>((resolve: (data: SceneTest.Shader) => void, reject: (err: Error) => void): void => {
          sResFactory.createShader(
            param,
            (error: BusinessError | null, data: SceneTest.Shader | undefined): void => {
              if (error != null && error.code !== 0) {
                reject(error as Error);
              } else {
                resolve(data as SceneTest.Shader);
              }
            });
        });
      } catch (e) {
        err = e as BusinessError;
      }
      console.log("createShader is: " + info.inputs);
      expect(info.inputs.size).assertEqual(1);
      console.log('test_Graphics3D_ShaderCallback_Static_0001 done');
      done();
      console.log('test_Graphics3D_ShaderCallback_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Graphics3D_ImageSync_STATIC_0100
     * @tc.name      test_Graphics3D_ImageSync_Static_0001
     * @tc.desc      createImagePro sync returns image with correct width
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Graphics3D_ImageSync_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Graphics3D_ImageSync_Static_0001 start');
      let param = sResPara;
      let info = SceneTest.getImage();
      let err: BusinessError = new BusinessError();
      try {
        info = sResFactory.createImagePro(param);
      } catch (e) {
        err = e as BusinessError;
      }
      console.log("createImage is: " + info.width);
      expect(info.width).assertEqual(800);
      console.log('test_Graphics3D_ImageSync_Static_0001 done');
      done();
      console.log('test_Graphics3D_ImageSync_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Graphics3D_ImagePromise_STATIC_0100
     * @tc.name      test_Graphics3D_ImagePromise_Static_0001
     * @tc.desc      createImage promise returns image with correct height
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Graphics3D_ImagePromise_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Graphics3D_ImagePromise_Static_0001 start');
      let param = sResPara;
      let info = SceneTest.getImage();
      let err: BusinessError = new BusinessError();
      try {
        info = await sResFactory.createImage(param) as SceneTest.Image;
      } catch (e) {
        err = e as BusinessError;
      }
      console.log("createImage is: " + info);
      expect(info.height).assertEqual(600);
      console.log('test_Graphics3D_ImagePromise_Static_0001 done');
      done();
      console.log('test_Graphics3D_ImagePromise_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Graphics3D_ImageCallback_STATIC_0100
     * @tc.name      test_Graphics3D_ImageCallback_Static_0001
     * @tc.desc      createImage callback returns image with correct height
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Graphics3D_ImageCallback_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Graphics3D_ImageCallback_Static_0001 start');
      let param = sResPara;
      let info = SceneTest.getImage();
      let err: BusinessError = new BusinessError();
      try {
        info = await new Promise<SceneTest.Image>((resolve: (data: SceneTest.Image) => void, reject: (err: Error) => void): void => {
          sResFactory.createImage(
            param,
            (error: BusinessError | null, data: SceneTest.Image | undefined): void => {
              if (error != null && error.code !== 0) {
                reject(error as Error);
              } else {
                resolve(data as SceneTest.Image);
              }
            });
        });
      } catch (e) {
        err = e as BusinessError;
      }
      console.log("createImage is: " + info);
      expect(info.height).assertEqual(600);
      console.log('test_Graphics3D_ImageCallback_Static_0001 done');
      done();
      console.log('test_Graphics3D_ImageCallback_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Graphics3D_EnvironmentSync_STATIC_0100
     * @tc.name      test_Graphics3D_EnvironmentSync_Static_0001
     * @tc.desc      createEnvironmentPro sync returns environment with correct backgroundType
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Graphics3D_EnvironmentSync_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Graphics3D_EnvironmentSync_Static_0001 start');
      let param = sResPara;
      let info = SceneTest.getEnvironment();
      let err: BusinessError = new BusinessError();
      try {
        info = sResFactory.createEnvironmentPro(param);
      } catch (e) {
        err = e as BusinessError;
      }
      console.log("createEnvironment is: " + info);
      expect(info.backgroundType).assertEqual(0);
      console.log('test_Graphics3D_EnvironmentSync_Static_0001 done');
      done();
      console.log('test_Graphics3D_EnvironmentSync_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Graphics3D_EnvironmentPromise_STATIC_0100
     * @tc.name      test_Graphics3D_EnvironmentPromise_Static_0001
     * @tc.desc      createEnvironment promise returns environment with correct backgroundType
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Graphics3D_EnvironmentPromise_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Graphics3D_EnvironmentPromise_Static_0001 start');
      let param = sResPara;
      let info = SceneTest.getEnvironment();
      let err: BusinessError = new BusinessError();
      try {
        info = await sResFactory.createEnvironment(param) as SceneTest.Environment;
      } catch (e) {
        err = e as BusinessError;
      }
      console.log("createEnvironment is: " + info);
      expect(info.backgroundType).assertEqual(0);
      console.log('test_Graphics3D_EnvironmentPromise_Static_0001 done');
      done();
      console.log('test_Graphics3D_EnvironmentPromise_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Graphics3D_EnvironmentCallback_STATIC_0100
     * @tc.name      test_Graphics3D_EnvironmentCallback_Static_0001
     * @tc.desc      createEnvironment callback returns environment with correct backgroundType
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Graphics3D_EnvironmentCallback_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Graphics3D_EnvironmentCallback_Static_0001 start');
      let param = sResPara;
      let info = SceneTest.getEnvironment();
      let err: BusinessError = new BusinessError();
      try {
        info = await new Promise<SceneTest.Environment>((resolve: (data: SceneTest.Environment) => void, reject: (err: Error) => void): void => {
          sResFactory.createEnvironment(
            param,
            (error: BusinessError | null, data: SceneTest.Environment | undefined): void => {
              if (error != null && error.code !== 0) {
                reject(error as Error);
              } else {
                resolve(data as SceneTest.Environment);
              }
            });
        });
      } catch (e) {
        err = e as BusinessError;
      }
      console.log("createEnvironment is: " + info);
      expect(info.backgroundType).assertEqual(0);
      console.log('test_Graphics3D_EnvironmentCallback_Static_0001 done');
      done();
      console.log('test_Graphics3D_EnvironmentCallback_Static_0001 end');
    });
  })
}