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
  NodeType,
  SceneResourceType,
  RenderingPipelineType,
  GeometryType,
  MaterialType,
  PolygonMode,
  CullMode,
  SamplerFilter,
  SamplerAddressMode
} from '@ohos.graphics.scene'
import { describe, expect, it, Level, Size, TestType } from '../../../hypium/index'

export default function sceneTypesTest() {
  describe('sceneTypesTest', () => {
    /**
     * @tc.name   testNodeTypeCustom
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1100
     * @tc.desc   Test NodeType.CUSTOM enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNodeTypeCustom', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testNodeTypeCustom";
      console.info(msg + ' begin ');
      try {
        // Verify enum value
        expect(NodeType.CUSTOM).assertEqual(255);
        console.info(msg + " NodeType.CUSTOM = 255 verified");
        
        // Verify distinct from other types
        expect(NodeType.CUSTOM != NodeType.NODE).assertTrue();
        expect(NodeType.CUSTOM != NodeType.GEOMETRY).assertTrue();
        expect(NodeType.CUSTOM != NodeType.CAMERA).assertTrue();
        expect(NodeType.CUSTOM != NodeType.LIGHT).assertTrue();
        console.info(msg + " NodeType.CUSTOM distinct from other types");
        
        // Verify greater than standard types
        expect(NodeType.CUSTOM > NodeType.NODE).assertTrue();
        expect(NodeType.CUSTOM > NodeType.GEOMETRY).assertTrue();
        console.info(msg + " NodeType.CUSTOM value range verified");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSceneResourceTypeEffect
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1110
     * @tc.desc   Test SceneResourceType.EFFECT enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneResourceTypeEffect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testSceneResourceTypeEffect";
      console.info(msg + ' begin ');
      try {
        // Verify enum value
        expect(SceneResourceType.EFFECT).assertEqual(9);
        console.info(msg + " SceneResourceType.EFFECT = 9 verified");
        
        // Verify distinct from other types
        expect(SceneResourceType.EFFECT != SceneResourceType.NODE).assertTrue();
        expect(SceneResourceType.EFFECT != SceneResourceType.GEOMETRY).assertTrue();
        expect(SceneResourceType.EFFECT != SceneResourceType.MATERIAL).assertTrue();
        expect(SceneResourceType.EFFECT != SceneResourceType.SHADER).assertTrue();
        console.info(msg + " SceneResourceType.EFFECT distinct from other types");
        
        // Verify value is in correct range (higher than standard types)
        expect(SceneResourceType.EFFECT > SceneResourceType.MESH).assertTrue();
        console.info(msg + " SceneResourceType.EFFECT value range verified");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testRenderingPipelineTypeForwardLightweight
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1120
     * @tc.desc   Test RenderingPipelineType.FORWARD_LIGHTWEIGHT enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRenderingPipelineTypeForwardLightweight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testRenderingPipelineTypeForwardLightweight";
      console.info(msg + ' begin ');
      try {
        // Verify enum value
        expect(RenderingPipelineType.FORWARD_LIGHTWEIGHT).assertEqual(0);
        console.info(msg + " RenderingPipelineType.FORWARD_LIGHTWEIGHT = 0 verified");
        
        // Verify less than FORWARD
        expect(RenderingPipelineType.FORWARD_LIGHTWEIGHT < RenderingPipelineType.FORWARD).assertTrue();
        console.info(msg + " FORWARD_LIGHTWEIGHT < FORWARD verified");
        
        // Verify distinct from other types
        expect(RenderingPipelineType.FORWARD_LIGHTWEIGHT != RenderingPipelineType.FORWARD).assertTrue();
        console.info(msg + " RenderingPipelineType values distinct");
        
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
