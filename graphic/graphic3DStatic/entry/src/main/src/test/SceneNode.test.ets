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
import { ToneMappingType, ToneMappingSettings, PostProcessSettings, Vec3, Color, Quaternion, Position3,  Scale3, NodeType, Node, LightType,DirectionalLight, Scene } from '@ohos.graphics.scene'
import { $rawfile, Resource } from '@ohos.arkui.component'
import { describe, it, expect, TestType, Size, Level } from '../../../hypium/index'

export default function sceneNodeTest() {
  describe('sceneNodeTest', ()=> {
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0110
     * @tc.name      : testCamEnabled
     * @tc.desc      : Used to set whether the camera is visible
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCamEnabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void)=> {
      let msg = "============================testCamEnabled";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load();
        let rf = scene.getResourceFactory();
        let cam = await rf.createCamera({ name: "Camera1"});
        expect(cam != null).assertTrue();
        cam.enabled = true;
        expect(cam.enabled).assertTrue();
        cam.enabled = false;
        expect(cam.enabled).assertFalse();
        console.info(msg + " Succeed in cam.enabled ");
        done();
      } catch (err) {
        console.info(msg + " Failed in testCamEnabled " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0120
     * @tc.name      : testPostProcess
     * @tc.desc      : Used to post-processing Settings
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPostProcess', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void)=> {
      let msg = "============================testPostProcess";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load();
        let rf = scene.getResourceFactory();
        let cam = await rf.createCamera({ name: "Camera1"})
        let post: PostProcessSettings;
        let toneMap: ToneMappingSettings;
        let toneMapType: ToneMappingType;
        expect(ToneMappingType.ACES).assertEqual(0);
        expect(ToneMappingType.ACES_2020).assertEqual(1);
        expect(ToneMappingType.FILMIC).assertEqual(2);
        toneMapType = ToneMappingType.FILMIC;
        post = {};
        cam.postProcess = post;
        post = {toneMapping: {exposure: 0.5, type: toneMapType}}
        cam.postProcess = post;
        expect(cam.postProcess?.toneMapping?.exposure).assertEqual(0.5);
        expect(cam.postProcess?.toneMapping?.type).assertEqual(ToneMappingType.FILMIC);
        console.info(msg + " cam.postProcess is not null ");
        toneMap = {};
        post = { toneMapping: toneMap }
        cam.postProcess = post;
        done();
      } catch (err) {
        console.info(msg + " Failed in testPostProcess " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0130
     * @tc.name      : testLightColor
     * @tc.desc      : Used to set light color
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testLightColor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void)=> {
      let msg = "============================testLightColor";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load();
        let rf = scene.getResourceFactory();
        let lig = await rf.createLight({ name: "Light" }, LightType.DIRECTIONAL)
        let color: Color = { r: 2, g: 2, b: 2, a: 2 };
        expect(lig != null).assertTrue();
        console.info(msg + " lig is not null ");
        lig.color = color;
        expect(lig.color.r).assertEqual(2);
        console.info(msg + " Succeed in lig.color = { r: 2, g: 2, b: 2, a: 2 } ");
        done();
      } catch (err) {
        console.info(msg + " Failed in testLightColor " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0140
     * @tc.name      : testLigEnabled
     * @tc.desc      : Used to set whether the light is visible
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testLigEnabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void)=> {
      let msg = "============================testLigEnabled";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load();
        let rf = scene.getResourceFactory();
        let lig = await rf.createLight({ name: "Light" }, LightType.DIRECTIONAL);
        lig.enabled = true;
        expect(lig.enabled).assertTrue();
        console.info(msg + " Succeed in lig.enabled = true ");
        lig.enabled = false;
        expect(lig.enabled).assertFalse();
        console.info(msg + " Succeed in lig.enabled = false ");
        done();
      } catch (err) {
        console.info(msg + " Failed in testLigEnabled " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0150
     * @tc.name      : testLigShadowEnabled
     * @tc.desc      : Used to set whether the shadow is visible
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testLigShadowEnabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void)=> {
      let msg = "============================testLigShadowEnabled";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load();
        let rf = scene.getResourceFactory();
        let lig = await rf.createLight({ name: "Light" }, LightType.DIRECTIONAL);
        lig.shadowEnabled = true;
        expect(lig.shadowEnabled).assertTrue();
        console.info(msg + " Succeed in lig.shadowEnabled = true ");
        lig.shadowEnabled = false;
        expect(lig.shadowEnabled).assertFalse();
        console.info(msg + " Succeed in lig.shadowEnabled = false ");
        done();
      } catch (err) {
        console.info(msg + " Failed in testLigShadowEnabled " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0160
     * @tc.name      : testLigIntensity
     * @tc.desc      : Used to set light intensity
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testLigIntensity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void)=> {
      let msg = "============================testLigIntensity";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load();
        let rf = scene.getResourceFactory();
        let lig: DirectionalLight = await rf.createLight({ name: "Light" }, LightType.DIRECTIONAL) as DirectionalLight;
        lig.intensity = 1000;
        expect(lig.intensity).assertEqual(1000);
        console.info(msg + " Succeed in lig.intensity = 1000 ");
        done();
      } catch (err) {
        console.info(msg + " Failed in testLigIntensity " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0170
     * @tc.name      : testNodeType
     * @tc.desc      : Used to get nodeType
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testNodeType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void)=> {
      let msg = "============================testNodeType";
      console.info(msg + ' begin ');
      try {
        let resource: Resource = $rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb")
        let scene = await Scene.load(resource);
        let rf = scene.getResourceFactory();
        let lig = await rf.createLight({ name: "Light" }, LightType.DIRECTIONAL);
        let cam = await rf.createCamera({ name: "Camera1" })
        expect(lig.nodeType).assertEqual(NodeType.LIGHT);
        console.info(msg + " lig.nodeType is " + JSON.stringify(lig.nodeType));
        expect(cam.nodeType).assertEqual(NodeType.CAMERA);
        console.info(msg + " cam.nodeType is " + JSON.stringify(cam.nodeType));
        let node = scene.getNodeByPath('rootNode_/Scene')
        expect(node?.nodeType).assertEqual(NodeType.NODE);
        done();
      } catch (err) {
        console.info(msg + " Failed in testNodeType " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0180
     * @tc.name      : testGetNodeByPath
     * @tc.desc      : Used to load the resource through the incoming resource path
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetNodeByPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void)=> {
      let msg = "============================testGetNodeByPath";
      console.info(msg + ' begin ');
      try {
        let resource: Resource = $rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb")
        let scene = await Scene.load(resource);
        let sceneNode: Node = scene.getNodeByPath('rootNode_/Scene') as Node;
        expect(sceneNode != null).assertTrue();
        console.info(msg + " succeed in sceneNode ");
        let node: Node = sceneNode.getNodeByPath('node_damagedHelmet_-6514') as Node;
        expect(node != null).assertTrue();
        console.info(msg + " succeed in getNodeByPath ");
        done();
      } catch (err) {
        console.info(msg + " Failed in testGetNodeByPath " +
        JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0190
     * @tc.name      : testPosition
     * @tc.desc      : Used to set node position
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPosition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void)=> {
      let msg = "============================testPosition";
      console.info(msg + ' begin ');
      try {
        let vec3: Vec3;
        let position: Position3;
        let scene = await Scene.load();
        let rf = scene.getResourceFactory();
        let node: Node = await rf.createCamera({ name: "Camera1" }) as Node;
        expect(node != null).assertTrue();
        console.info(msg + " node is not null ");
        vec3 = { x: 5, y: 5, z: 5 };
        position = vec3;
        node.position = position;
        expect(node.position.x).assertEqual(5);
        expect(node.position.y).assertEqual(5);
        expect(node.position.z).assertEqual(5);
        console.info(msg + " Succeed in node.position ");
        done();
      } catch (err) {
        console.info(msg + " Failed in testPosition " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0200
     * @tc.name      : testRotation
     * @tc.desc      : Used to set node Rotation
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testRotation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void)=> {
      let msg = "============================testRotation";
      console.info(msg + ' begin ');
      try {
        let rotation: Quaternion;
        let scene = await Scene.load();
        let rf = scene.getResourceFactory();
        let node: Node = await rf.createCamera({ name: "Camera1" }) as Node;
        rotation = { x: 5, y: 5, z: 5, w: 5 };
        node.rotation = rotation;
        expect(node.rotation.x).assertEqual(5);
        expect(node.rotation.y).assertEqual(5);
        expect(node.rotation.z).assertEqual(5);
        expect(node.rotation.w).assertEqual(5);
        console.info(msg + " Succeed in node.rotation ");
        done();
      } catch (err) {
        console.info(msg + " Failed in testRotation " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0210
     * @tc.name      : testScale
     * @tc.desc      : Used to set node scale
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testScale', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void)=> {
      let msg = "============================testScale";
      console.info(msg + ' begin ');
      try {
        let scale: Scale3 = { x: 5, y: 5, z: 5 };
        let scene = await Scene.load();
        let rf = scene.getResourceFactory();
        let node: Node = await rf.createCamera({ name: "Camera1" }) as Node;
        node.scale = scale;
        expect(node.scale.x).assertEqual(5);
        expect(node.scale.y).assertEqual(5);
        expect(node.scale.z).assertEqual(5);
        console.info(msg + " Succeed in node.scale = scale ");
        done();
      } catch (err) {
        console.info(msg + " Failed in testScale " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0220
     * @tc.name      : testVisible
     * @tc.desc      : Used to set weather the node is visible
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testVisible', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void)=> {
      let msg = "============================testVisible";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load();
        let rf = scene.getResourceFactory();
        let node: Node = await rf.createCamera({ name: "Camera1" }) as Node;
        expect(node.visible).assertTrue();
        console.info(msg + " node?.visible is true ");
        node.visible = false;
        expect(node.visible).assertFalse();
        console.info(msg + " Succeed in node.visible set false");
        done();
      } catch (err) {
        console.info(msg + " Failed in node.visible set false " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
  })
}