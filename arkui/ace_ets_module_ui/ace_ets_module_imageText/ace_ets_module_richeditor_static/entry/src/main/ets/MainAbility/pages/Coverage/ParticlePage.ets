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
  Color,
  Stack
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct ParticlePage {
  private opts: Particles = {
    particles: [{
      emitter: {
        particle: {
          type: ParticleType.POINT,
          config: { radius: 3 },
          count: 10,
          lifetime: 2000
        },
        emitRate: 3,
        position: [0, 0]
      },
      color: {
        range: [Color.Blue, Color.Green]
      }
    }]
  };

  aboutToAppear(): void {
    try {
      AppStorage.setOrCreate<Router>('router', this.getUIContext().getRouter());
      AppStorage.setOrCreate('particle_global_ready', 'ready');
    } catch (error) {
      AppStorage.setOrCreate('particle_global_ready', 'failed');
      console.log('ParticlePage error ' + error);
    }
  }

  build() {
    Column() {
      Text('Particle')
        .id('particle_global_title')
        .fontSize(18)
      Stack() {
        Particle(this.opts)
          .id('particle_global')
          .width(120)
          .height(120)
      }
      .width(120)
      .height(120)
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
