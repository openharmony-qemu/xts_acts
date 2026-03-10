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
import {
  Camera,
  Light,
  Material,
  PolygonMode,
  Environment,
  Quaternion,
  RenderingPipelineType,
  Scene,
  SceneResourceFactory,
  NodeType,
  LightType,
  MaterialType
} from '@ohos.graphics.scene'
import { $rawfile, Resource } from '@ohos.arkui.component'
import { describe, expect, it, Level, Size, TestType } from '../../../hypium/index'

export default function scenePostProcessSettingsTest() {
  describe('scenePostProcessSettingsTest', () => {
    /**
     * @tc.name   testCameraMsaa
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1010
     * @tc.desc   Test Camera.msaa property getter and setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCameraMsaa', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testCameraMsaa";
      console.info(msg + ' begin ');
      try {
        let sceneUri: Resource = $rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb");
        let scene = await Scene.load(sceneUri);
        expect(scene != null).assertTrue();
        
        let rf: SceneResourceFactory = scene.getResourceFactory();
        let camera: Camera = await rf.createCamera({ name: "TestCamera" });
        expect(camera != null).assertTrue();
        
        camera.msaa = true;
        expect(camera.msaa).assertTrue();
        console.info(msg + " msaa set to true successfully");
        
        camera.msaa = false;
        expect(camera.msaa).assertFalse();
        console.info(msg + " msaa set to false successfully");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testCameraRenderingPipeline
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1020
     * @tc.desc   Test Camera.renderingPipeline property getter and setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCameraRenderingPipeline', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testCameraRenderingPipeline";
      console.info(msg + ' begin ');
      try {
        let sceneUri: Resource = $rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb");
        let scene = await Scene.load(sceneUri);
        expect(scene != null).assertTrue();
        
        let rf: SceneResourceFactory = scene.getResourceFactory();
        let camera: Camera = await rf.createCamera({ name: "TestCamera" });
        expect(camera != null).assertTrue();
        
        camera.renderingPipeline = RenderingPipelineType.FORWARD;
        expect(camera.renderingPipeline).assertEqual(RenderingPipelineType.FORWARD);
        console.info(msg + " renderingPipeline set to FORWARD successfully");
        
        camera.renderingPipeline = RenderingPipelineType.FORWARD_LIGHTWEIGHT;
        expect(camera.renderingPipeline).assertEqual(RenderingPipelineType.FORWARD_LIGHTWEIGHT);
        console.info(msg + " renderingPipeline set to FORWARD_LIGHTWEIGHT successfully");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testLightIntensity
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1030
     * @tc.desc   Test Light.intensity property getter and setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLightIntensity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testLightIntensity";
      console.info(msg + ' begin ');
      try {
        let sceneUri: Resource = $rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb");
        let scene = await Scene.load(sceneUri);
        expect(scene != null).assertTrue();
        
        let rf: SceneResourceFactory = scene.getResourceFactory();
        let light: Light = await rf.createLight({ name: "TestLight" }, LightType.DIRECTIONAL);
        expect(light != null).assertTrue();
        
        light.intensity = 1000.0;
        expect(light.intensity).assertEqual(1000.0);
        console.info(msg + " intensity set to 1000.0 successfully");
        
        light.intensity = 0.0;
        expect(light.intensity).assertEqual(0.0);
        console.info(msg + " intensity set to 0.0 successfully");
        
        light.intensity = 500.5;
        expect(light.intensity).assertEqual(500.5);
        console.info(msg + " intensity set to 500.5 successfully");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testMaterialPolygonMode
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1040
     * @tc.desc   Test Material.polygonMode property getter and setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMaterialPolygonMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testMaterialPolygonMode";
      console.info(msg + ' begin ');
      try {
        let sceneUri: Resource = $rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb");
        let scene = await Scene.load(sceneUri);
        expect(scene != null).assertTrue();
        
        let rf: SceneResourceFactory = scene.getResourceFactory();
        let material = await rf.createMaterial({ name: "TestMaterial" }, MaterialType.SHADER);
        expect(material != null).assertTrue();
        
        material.polygonMode = PolygonMode.FILL;
        expect(material.polygonMode).assertEqual(PolygonMode.FILL);
        console.info(msg + " polygonMode set to FILL successfully");
        
        material.polygonMode = PolygonMode.LINE;
        expect(material.polygonMode).assertEqual(PolygonMode.LINE);
        console.info(msg + " polygonMode set to LINE successfully");
        
        material.polygonMode = PolygonMode.POINT;
        expect(material.polygonMode).assertEqual(PolygonMode.POINT);
        console.info(msg + " polygonMode set to POINT successfully");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testEnvironmentEnvironmentRotation
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1050
     * @tc.desc   Test Environment.environmentRotation property getter and setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnvironmentEnvironmentRotation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testEnvironmentEnvironmentRotation";
      console.info(msg + ' begin ');
      try {
        let sceneUri: Resource = $rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb");
        let scene = await Scene.load(sceneUri);
        expect(scene != null).assertTrue();
        
        let env: Environment = scene.environment;
        expect(env != null).assertTrue();
        
        let rotation: Quaternion = { x: 0, y: 0, z: 0, w: 1 };
        env.environmentRotation = rotation;
        expect(env.environmentRotation.x).assertEqual(0);
        expect(env.environmentRotation.y).assertEqual(0);
        expect(env.environmentRotation.z).assertEqual(0);
        expect(env.environmentRotation.w).assertEqual(1);
        console.info(msg + " environmentRotation set successfully");
        
        let rotation2: Quaternion = { x: 0.5, y: 0.5, z: 0.5, w: 0.5 };
        env.environmentRotation = rotation2;
        expect(env.environmentRotation.x).assertEqual(0.5);
        expect(env.environmentRotation.y).assertEqual(0.5);
        console.info(msg + " environmentRotation updated successfully");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
  })
}
