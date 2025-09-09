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
import { Vec4, SceneResource, Animation, EnvironmentBackgroundType, Environment, Scene,Vec2, Rect} from '@ohos.graphics.scene'
import { $rawfile, Resource } from '@ohos.arkui.component'
import { describe, it, expect, TestType, Size, Level } from '../../../hypium/index'

export default function sceneResourcesTest() {
  describe('sceneResourcesTest', ()=> {
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0230
     * @tc.name      : testAnimationStart
     * @tc.desc      : Used to play animation
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testAnimationStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void)=> {
      let msg = "============================testAnimationStart";
      console.info(msg + ' begin ');
      try {
        let resource: Resource = $rawfile("gltf/BrainStem/glTF/BrainStem.glb")
        let scene = await Scene.load(resource);
        console.info(msg + " Succeed in  sceneLoad ");
        let anim: Animation = scene.animations[0];
        expect(anim != null).assertTrue();
        console.info(msg + " Succeed in scene.animations[0] ");
        anim.start();
        anim.progress;
        expect(anim.running).assertTrue();
        console.info(msg + " Succeed in testAnimationStart ");
        done();
      } catch (err) {
        console.info(msg + " Failed in testAnimationStart  " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0240
     * @tc.name      : testAnimationStop
     * @tc.desc      : Used to stop animation
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testAnimationStop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void)=> {
      let msg = "============================testAnimationStop";
      console.info(msg + ' begin ');
      try {
        let resource: Resource = $rawfile("gltf/BrainStem/glTF/BrainStem.glb")
        let scene = await Scene.load(resource);
        let anim: Animation = scene.animations[0];
        anim.start();
        expect(anim.running).assertTrue();
        console.info(msg + " anim is running ");
        anim.stop();
        expect(anim.running).assertFalse();
        console.info(msg + " anim is stopping ");
        done();
      } catch (err) {
        console.info(msg + " Failed in testAnimationStop " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0250
     * @tc.name      : testAnimationFinished
     * @tc.desc      : Used to the callback function that is executed at the end of the animation playback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testAnimationFinished', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void)=> {
      let msg = "============================testAnimationFinished";
      console.info(msg + ' begin ');
      try {
        let resource: Resource = $rawfile("gltf/BrainStem/glTF/BrainStem.glb")
        let scene = await Scene.load(resource);
        let anim: Animation = scene.animations[0];
        let finishFlag = false;
        anim.onFinished(() => {
          console.info(msg + " Succeed in anim.finish() ");
          finishFlag = true;
        })
        anim.start();
        expect(anim.running).assertTrue();
        console.info(msg + " anim is running ");
        anim.restart();
        expect(anim.running).assertTrue();
        console.info(msg + " anim is running ");
        done();
      } catch (err) {
        console.info(msg + " Failed in testAnimationFinished " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0260
     * @tc.name      : testEnvironmentIndirectDiffuseFactor
     * @tc.desc      : Used to set environment indirectDiffuseFactor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testEnvironmentIndirectDiffuseFactor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void)=> {
      let msg = "============================testEnvironmentIndirectDiffuseFactor";
      console.info(msg + ' begin ');
      try {
        let resource: Resource = $rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb")
        let scene = await Scene.load(resource);
        expect(scene != undefined).assertTrue();
        console.info(msg + " get scene success ");
        let env: Environment = scene.environment;
        let vec4: Vec4 = {x:1, y:40, z:1, w:1}
        env.indirectDiffuseFactor = vec4;
        expect(env.indirectDiffuseFactor.y).assertEqual(40);
        console.info(msg + " Succeed in env.indirectDiffuseFactor ");
        done();
      } catch (err) {
        console.info(msg + " Failed in testEnvironmentIndirectDiffuseFactor " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0270
     * @tc.name      : testEnvironmentIndirectSpecularFactor
     * @tc.desc      : Used to set environment indirectSpecularFactor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testEnvironmentIndirectSpecularFactor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void)=> {
      let msg = "============================testEnvironmentIndirectSpecularFactor";
      console.info(msg + ' begin ');
      try {
        let resource: Resource = $rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb")
        let scene = await Scene.load(resource);
        let env: Environment = scene.environment;
        let vec4: Vec4 = {x:1, y:40, z:1, w:1}
        env.indirectSpecularFactor = vec4;
        expect(env.indirectSpecularFactor.y).assertEqual(40);
        console.info(msg + " Succeed in env.indirectSpecularFactor ");
        done();
      } catch (err) {
        console.info(msg + " Failed in testEnvironmentIndirectSpecularFactor " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0280
     * @tc.name      : testEnvironmentBackgroundType
     * @tc.desc      : Used to set environment BackgroundType
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testEnvironmentBackgroundType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void)=> {
      let msg = "============================testEnvironmentBackgroundType";
      console.info(msg + ' begin ');
      try {
        let resource: Resource = $rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb")
        let scene = await Scene.load(resource);
        let env: Environment = scene.environment;
        let scr: SceneResource;
        env.backgroundType = EnvironmentBackgroundType.BACKGROUND_NONE;
        expect(env.backgroundType).assertEqual(EnvironmentBackgroundType.BACKGROUND_NONE);
        console.info(msg + " Succeed in Environment environmentImage set NONE ");
        env.backgroundType = EnvironmentBackgroundType.BACKGROUND_IMAGE;
        expect(env.backgroundType).assertEqual(EnvironmentBackgroundType.BACKGROUND_IMAGE);
        console.info(msg + " Succeed in Environment environmentImage set envImage1 IMAGE ");
        env.backgroundType = EnvironmentBackgroundType.BACKGROUND_CUBEMAP;
        expect(env.backgroundType).assertEqual(EnvironmentBackgroundType.BACKGROUND_CUBEMAP);
        console.info(msg + " Succeed in Environment environmentImage set envImage2 CUBEMAP ");
        env.backgroundType = EnvironmentBackgroundType.BACKGROUND_EQUIRECTANGULAR;
        expect(env.backgroundType).assertEqual(EnvironmentBackgroundType.BACKGROUND_EQUIRECTANGULAR);
        console.info(msg + " Succeed in Environment environmentImage set envImage3 EQUIRECTANGULAR ");
        scr = env;
        scr.destroy();
        done();
      } catch (err) {
        console.info(msg + " Failed in testEnvironmentBackgroundType " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0290
     * @tc.name      : testSceneResourceType
     * @tc.desc      : Used to set testSceneResourceType
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSceneResourceType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void)=> {
      let msg = "============================testSceneResourceType";
      console.info(msg + ' begin ');
      try {
        let vec2: Vec2 = { x: 1.1, y: 1.1 };
        let rect: Rect  = { x: 1.1, y: 1.1 };
        expect(vec2.x).assertEqual(1.1);
        expect(rect.x).assertEqual(1.1);
        done();
      } catch (err) {
        console.info(msg + " Failed in testSceneResourceType " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
  })
}