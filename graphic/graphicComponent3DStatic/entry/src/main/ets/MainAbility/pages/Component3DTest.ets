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
import { Entry, Column, Component, Row, Text, Component3D, SceneOptions, ModelType } from '@ohos.arkui.component'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { $rawfile, Resource } from '@ohos.arkui.component'

@Entry
@Component
struct Component3DTest {
  scene: SceneOptions = { scene: $rawfile('gltf/DamagedHelmet/glTF/DamagedHelmet.gltf'), modelType: ModelType.SURFACE };

  aboutToAppear() {
    try {
      let router1: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router1);
    } catch (error) {
      console.log('error ' + error);
    }
  }

  build() {
    Row() {
      Column() {
        Text('GLTF Example')
        Component3D(this.scene)
          .id('Component3D_1')
          .shader($rawfile('assets/app/shaders/shader/London.shader'))
          .shaderImageTexture($rawfile('assets/London.jpg'))
          .customRender($rawfile('assets/app/rendernodegraphs/London.rng'), true)
          .shaderInputBuffer([1.0, 2.0])
          .environment($rawfile('gltf/Environment/glTF/Environment.gltf'))
          .renderWidth('90%').renderHeight('90%')
      }.width('100%')
    }
    .height('100%')
  }
}
