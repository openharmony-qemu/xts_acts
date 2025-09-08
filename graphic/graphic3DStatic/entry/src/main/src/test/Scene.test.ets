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
import { NodeType, Scene, SceneNodeParameters, SceneResourceFactory, SceneResourceParameters, RenderParameters, Camera, Light, LightType} from '@ohos.graphics.scene'
import { $rawfile } from '@ohos.arkui.component'
import { describe, it, expect, TestType, Size, Level } from '../../../hypium/index'

export default function sceneTest() {
  describe('sceneTest', ()=> {
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0010
     * @tc.name      : testSceneLoad
     * @tc.desc      : Used to load the resource through the incoming resource path
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSceneLoad', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void)=> {
      let msg = "============================testSceneLoad";
      console.info(msg + ' begin ');
      try {
        let scene: Scene = await Scene.load();
        expect(scene != undefined).assertTrue();
        console.info(msg + " succeed in Scene.load() ");
        scene= await Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb"));
        expect(scene != undefined).assertTrue();
        console.info(msg + " succeed in Scene.load(uri) ");
        done();
      } catch (err) {
        console.info(msg + 'Failed in testSceneLoad ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0020
     * @tc.name      : testGetNodeByPath
     * @tc.desc      : Nodes are obtained from paths
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetNodeByPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void)=> {
      let msg = "============================testGetNodeByPath";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb"));
        let node = scene.getNodeByPath('rootNode_/Scene/node_damagedHelmet_-6514');
        console.info(msg + " succeed in getNodeByPath " + JSON.stringify(node));
        expect(node != null).assertTrue();
        node = scene.getNodeByPath('rootNode_/Scene/node_damagedHelmet_-6514', NodeType.GEOMETRY);
        console.info(msg + " succeed in getNodeByPath " + JSON.stringify(node));
        expect(node != null).assertTrue();
        console.info(msg + " node != null")
        expect(node?.nodeType).assertEqual(NodeType.GEOMETRY);
        done();
      } catch (err) {
        console.info(msg + " Failed in testGetNodeByPath " +
        JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0030
     * @tc.name      : testGetResourceFactory
     * @tc.desc      : Used to get the Scene Asset Factory object
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetResourceFactory', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void)=> {
      let msg = "============================testGetResourceFactory";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb"));
        let rf: SceneResourceFactory = scene.getResourceFactory();
        expect(rf != undefined).assertTrue();
        console.info(msg + " Succeed in scene.getResourceFactory() ");
        done();
      } catch (err) {
        console.info(msg + " Failed in testGetResourceFactory " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0040
     * @tc.name      : testDestroy
     * @tc.desc      : Used to destroy the scene and release all scene resources
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testDestroy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void)=> {
      let msg = "============================testDestroy";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb"));
        scene?.destroy();
        console.info(msg + " Succeed in scene.destroy() ");
        done();
      } catch (err) {
        console.info(msg + " Failed in testDestroy " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0050
     * @tc.name      : testSceneResourceParameters
     * @tc.desc      : Used to provide the name of the scene asset and the path to the asset file required for the 3D scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSceneResourceParameters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void)=> {
      let msg = "============================testSceneResourceParameters";
      console.info(msg + ' begin ');
      try {
        let imageParameters: SceneResourceParameters = { name: "Cube" }
        expect(imageParameters?.name).assertEqual("Cube");
        done();
      } catch (err) {
        console.info(msg + " Failed in testSceneResourceParameters " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0060
     * @tc.name      : testSceneNodeParameters
     * @tc.desc      : A scene node parameter object, which is used to provide a name and path in the scene node hierarchy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSceneNodeParameters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void)=> {
      let msg = "============================testSceneNodeParameters";
      console.info(msg + ' begin ');
      try {
        let nodeParameters: SceneNodeParameters = { name: "Helmet" }
        expect(nodeParameters.name).assertEqual("Helmet");
        done();
      } catch (err) {
        console.info(msg + " Failed in testSceneNodeParameters " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0070
     * @tc.name      : testSceneRenderFrame
     * @tc.desc      : Used to see if the scene is single-frame
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSceneRenderFrame', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void)=> {
      let msg = "============================testSceneRenderFrame";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb"));
        expect(scene.renderFrame()).assertTrue();
        scene.renderFrame({ alwaysRender: true });
        expect(scene.renderFrame()).assertTrue();
        scene.renderFrame({ alwaysRender: false });
        expect(scene.renderFrame()).assertTrue();
        console.info(msg + " Succeed in scene?.renderFrame() ");
        done();
      } catch (err) {
        console.info(msg + " Failed in testSceneRenderFrame " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0080
     * @tc.name      : testRenderParameters
     * @tc.desc      : Used to set if the scene is single-frame
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testRenderParameters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void)=> {
      let msg = "============================testRenderParameters";
      console.info(msg + ' begin ');
      try {
        let RenderParameters: RenderParameters = { alwaysRender: true};
        expect(RenderParameters.alwaysRender).assertTrue();
        console.info(msg + " Succeed in RenderParameters.alwaysRender is true ");
        RenderParameters = { alwaysRender: false}
        expect(RenderParameters.alwaysRender).assertFalse();
        console.info(msg + " Succeed in RenderParameters.alwaysRender is false ");
        done();
      } catch (err) {
        console.info(msg + " Failed in testRenderParameters " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0090
     * @tc.name      : testCreateCamera
     * @tc.desc      : Used to create a camera
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateCamera', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void)=> {
      let msg = "============================testCreateCamera";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load();
        let rf = scene.getResourceFactory();
        let cam: Camera = await rf.createCamera({ name: "Camera1" })
        expect(cam != null).assertTrue();
        console.info(msg + " cam is not null ");
        done();
      } catch (err) {
        console.info(msg + " Failed in testCreateCamera " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0100
     * @tc.name      : testCreateLight
     * @tc.desc      : Used to create a camera
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateLight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void)=> {
      let msg = "============================testCreateLight";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load();
        let rf = scene.getResourceFactory();
        let lig: Light = await rf.createLight({ name: "Light" }, LightType.DIRECTIONAL);
        expect(lig != null).assertTrue();
        console.info(msg + " DIRECTIONAL is not null ");
        lig = await rf.createLight({ name: "Light" }, LightType.SPOT);
        expect(lig != null).assertTrue();
        console.info(msg + " SPOT is not null ");
        done();
      } catch (err) {
        console.info(msg + " Failed in testCreateLight " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
  })
}