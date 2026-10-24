'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, beforeEach, afterAll, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from './Util.test';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog';
import { ModelType } from '@ohos.arkui.component'
import { $rawfile, Resource } from '@ohos.arkui.component'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function Component3DAttribute() {

  describe('Component3DAttributeTest', (): void => {
    hilog.info(domain, tag, '%{public}s', 'Component3DAttributeTest describe start');

    beforeAll(async (): Promise<void> => {
      console.info('Component3DAttributeTest beforeAll start');
      await UtilsTest.startAbility('com.example.component3d.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('Component3DAttributeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Component3DTest',
      };
      try {
        const routerInstance: Router = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('Component3DAttributeTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'Component3DTest') {
          console.info('Component3DAttributeTest pages.name: ' + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await UtilsTest.msSleep(3000);
          console.info('Component3DAttributeTest push success');
        }
      } catch (err) {
        console.error('Component3DAttributeTest push page error: ' + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testComponent3DShaderImageTexture_static_0100
     * @tc.number SUB_GRAPHIC_COMPONENT3D_STATIC_0100
     * @tc.desc   Test Component3D shaderImageTexture attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testComponent3DShaderImageTexture_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====testComponent3DShaderImageTexture_static_0100====';
        console.info(msg + ' begin');
        try {
          await UtilsTest.msSleep(1000);
          let strJson: string = inspector.getInspectorByKey('Component3D_1');
          let shaderImageTextureValue: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('shaderImageTexture');
          console.info(msg + ' shaderImageTexture: ' + shaderImageTextureValue);
          expect(shaderImageTextureValue).assertEqual('OhosRawFile://assets/London.jpg ');
          console.info(msg + ' END');
          done();
        } catch (err) {
          console.log(msg + ' Failed: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testComponent3DShaderInputBuffer_static_0100
     * @tc.number SUB_GRAPHIC_COMPONENT3D_STATIC_0200
     * @tc.desc   Test Component3D shaderInputBuffer attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testComponent3DShaderInputBuffer_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====testComponent3DShaderInputBuffer_static_0100====';
        console.info(msg + ' begin');
        try {
          await UtilsTest.msSleep(1000);
          let strJson: string = inspector.getInspectorByKey('Component3D_1');
          let shaderInputBufferValue: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('shaderInputBuffer');
          console.info(msg + ' shaderInputBuffer: ' + shaderInputBufferValue);
          expect(shaderInputBufferValue).assertEqual('1.000000 2.000000 ');
          console.info(msg + ' END');
          done();
        } catch (err) {
          console.log(msg + ' Failed: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testComponent3DCustomRender_static_0100
     * @tc.number SUB_GRAPHIC_COMPONENT3D_STATIC_0300
     * @tc.desc   Test Component3D customRender attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testComponent3DCustomRender_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====testComponent3DCustomRender_static_0100====';
        console.info(msg + ' begin');
        try {
          await UtilsTest.msSleep(1000);
          let strJson: string = inspector.getInspectorByKey('Component3D_1');
          let customRenderValue: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('customRender');
          console.info(msg + ' customRender: ' + customRenderValue);
          expect(customRenderValue).assertEqual('OhosRawFile://assets/app/rendernodegraphs/London.rng');
          console.info(msg + ' END');
          done();
        } catch (err) {
          console.log(msg + ' Failed: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testComponent3DEnvironment_static_0100
     * @tc.number SUB_GRAPHIC_COMPONENT3D_STATIC_0400
     * @tc.desc   Test Component3D environment attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testComponent3DEnvironment_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====testComponent3DEnvironment_static_0100====';
        console.info(msg + ' begin');
        try {
          await UtilsTest.msSleep(1000);
          let strJson: string = inspector.getInspectorByKey('Component3D_1');
          let environmentValue: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('environment');
          console.info(msg + ' environment: ' + environmentValue);
          expect(environmentValue).assertEqual('OhosRawFile://gltf/Environment/glTF/Environment.gltf');
          console.info(msg + ' END');
          done();
        } catch (err) {
          console.log(msg + ' Failed: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testComponent3DScene_static_0100
     * @tc.number SUB_GRAPHIC_COMPONENT3D_STATIC_0500
     * @tc.desc   Test Component3D scene attribute in SceneOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testComponent3DScene_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====testComponent3DScene_static_0100====';
        console.info(msg + ' begin');
        try {
          await UtilsTest.msSleep(1000);
          let strJson: string = inspector.getInspectorByKey('Component3D_1');
          let sceneValue: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('scene');
          console.info(msg + ' scene: ' + sceneValue);
          expect(sceneValue).assertEqual('OhosRawFile://gltf/DamagedHelmet/glTF/DamagedHelmet.gltf');
          console.info(msg + ' END');
          done();
        } catch (err) {
          console.log(msg + ' Failed: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testComponent3DModelTypeSurface_static_0100
     * @tc.number SUB_GRAPHIC_COMPONENT3D_STATIC_0600
     * @tc.desc   Test Component3D modelType attribute with SURFACE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testComponent3DModelTypeSurface_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====testComponent3DModelTypeSurface_static_0100====';
        console.info(msg + ' begin');
        try {
          await UtilsTest.msSleep(1000);
          let strJson: string = inspector.getInspectorByKey('Component3D_1');
          let modelTypeValue: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('modelType');
          console.info(msg + ' modelType: ' + modelTypeValue);
          expect(modelTypeValue).assertEqual('ModelType.SURFACE');
          console.info(msg + ' END');
          done();
        } catch (err) {
          console.log(msg + ' Failed: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testComponent3DShader_static_0100
     * @tc.number SUB_GRAPHIC_COMPONENT3D_STATIC_0700
     * @tc.desc   Test Component3D shader attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testComponent3DShader_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====testComponent3DShader_static_0100====';
        console.info(msg + ' begin');
        try {
          await UtilsTest.msSleep(1000);
          let strJson: string = inspector.getInspectorByKey('Component3D_1');
          let shaderValue: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('shader');
          console.info(msg + ' shader: ' + shaderValue);
          expect(shaderValue).assertEqual('OhosRawFile://assets/app/shaders/shader/London.shader');
          console.info(msg + ' END');
          done();
        } catch (err) {
          console.log(msg + ' Failed: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testComponent3DModelTypeTexture_static_0100
     * @tc.number SUB_GRAPHIC_COMPONENT3D_STATIC_0800
     * @tc.desc   Test Component3D modelType attribute with TEXTURE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testComponent3DModelTypeTexture_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====testComponent3DModelTypeTexture_static_0100====';
        console.info(msg + ' begin');
        try {
          let textureOptions: router.RouterOptions = {
            url: 'MainAbility/pages/Component3DTest1',
          };
          const routerInstance: Router = AppStorage.get<Router>('router') as Router;
          routerInstance.clear();
          let pages = routerInstance.getState();
          if (pages.name !== 'Component3DTest1') {
            routerInstance.replaceUrl(textureOptions);
            await UtilsTest.msSleep(3000);
            console.info(msg + ' navigate to Component3DTest1 success');
          }
          await UtilsTest.msSleep(1000);
          let strJson: string = inspector.getInspectorByKey('Component3D1_1');
          let modelTypeValue: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('modelType');
          console.info(msg + ' modelType: ' + modelTypeValue);
          expect(modelTypeValue).assertEqual('ModelType.TEXTURE');
          console.info(msg + ' END');
          done();
        } catch (err) {
          console.log(msg + ' Failed: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testComponent3DRenderWidth_static_0100
     * @tc.number SUB_GRAPHIC_COMPONENT3D_STATIC_0900
     * @tc.desc   Test Component3D renderWidth attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testComponent3DRenderWidth_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====testComponent3DRenderWidth_static_0100====';
        console.info(msg + ' begin');
        try {
          await UtilsTest.msSleep(1000);
          let strJson: string = inspector.getInspectorByKey('Component3D_1');
          let renderWidthValue: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('renderWidth');
          console.info(msg + ' renderWidth: ' + renderWidthValue);
          expect(Number(renderWidthValue) > 0).assertEqual(true);
          console.info(msg + ' END');
          done();
        } catch (err) {
          console.log(msg + ' Failed: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testComponent3DRenderHeight_static_0100
     * @tc.number SUB_GRAPHIC_COMPONENT3D_STATIC_1000
     * @tc.desc   Test Component3D renderHeight attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testComponent3DRenderHeight_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====testComponent3DRenderHeight_static_0100====';
        console.info(msg + ' begin');
        try {
          await UtilsTest.msSleep(1000);
          let strJson: string = inspector.getInspectorByKey('Component3D_1');
          let renderHeightValue: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('renderHeight');
          console.info(msg + ' renderHeight: ' + renderHeightValue);
          expect(Number(renderHeightValue) > 0).assertEqual(true);
          console.info(msg + ' END');
          done();
        } catch (err) {
          console.log(msg + ' Failed: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testComponent3DModelTypeEnum_static_0100
     * @tc.number SUB_GRAPHIC_COMPONENT3D_STATIC_1100
     * @tc.desc   Test ModelType enum values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testComponent3DModelTypeEnum_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let msg: string = '====testComponent3DModelTypeEnum_static_0100====';
        console.info(msg + ' begin');
        try {
          expect(ModelType.TEXTURE).assertEqual(0);
          console.info(msg + ' ModelType.TEXTURE = 0');
          expect(ModelType.SURFACE).assertEqual(1);
          console.info(msg + ' ModelType.SURFACE = 1');
          console.info(msg + ' END');
          done();
        } catch (err) {
          console.log(msg + ' Failed: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })
  })
}
