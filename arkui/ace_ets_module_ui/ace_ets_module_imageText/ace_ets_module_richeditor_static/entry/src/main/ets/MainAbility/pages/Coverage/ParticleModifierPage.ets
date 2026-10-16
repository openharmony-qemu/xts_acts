'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
  Entry,
  Component,
  Column,
  Text,
  Particle,
  Particles,
  ParticleType,
  ParticleAttribute,
  Color,
  Stack
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { ParticleModifier } from '@ohos.arkui.modifier';

class MyParticleModifier extends ParticleModifier {
  applyNormalAttribute(instance: ParticleAttribute): void {
  }
}

@Entry
@Component
struct ParticleModifierPage {
  @State particleMod: ParticleModifier = new MyParticleModifier()
    .backgroundColor('#EEEEA500');
  @State readyText: string = 'init';
  private opts: Particles = {
    particles: [{
      emitter: {
        particle: {
          type: ParticleType.POINT,
          config: { radius: 4 },
          count: 20,
          lifetime: 3000
        },
        emitRate: 5,
        position: [0, 0]
      },
      color: {
        range: [Color.Red, Color.Yellow]
      }
    }]
  };

  aboutToAppear(): void {
    try {
      AppStorage.setOrCreate<Router>('router', this.getUIContext().getRouter());
      AppStorage.setOrCreate('particle_page_ready', 'ready');
      this.readyText = 'ready';
    } catch (error) {
      AppStorage.setOrCreate('particle_page_ready', 'failed');
      this.readyText = 'failed';
      console.log('ParticleModifierPage error ' + error);
    }
  }

  build() {
    Column() {
      Text('ParticleModifier')
        .id('particle_title')
        .fontSize(18)
      Stack() {
        Text()
          .width('40%')
          .height(120)
          .backgroundColor(Color.Black)
        Particle(this.opts)
          .width('40%')
          .height(120)
          .id('particle_with_modifier')
          .attributeModifier(this.particleMod as MyParticleModifier)
      }
      .width('100%')
      .height(140)
      Particle(this.opts)
        .width('40%')
        .height(120)
        .id('particle_undefined_modifier')
        .attributeModifier(undefined)
      Text(this.readyText)
        .id('particle_ready_text')
        .fontSize(14)
    }
    .width('100%')
    .height('100%')
  }
}
