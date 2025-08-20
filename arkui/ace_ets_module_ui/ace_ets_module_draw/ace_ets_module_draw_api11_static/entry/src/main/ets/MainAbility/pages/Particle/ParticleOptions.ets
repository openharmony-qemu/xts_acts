/**
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
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Canvas,
  OffscreenCanvas,
  Scroll,
  Stack,
  Particle,
  ParticleType,
  ParticleEmitterShape,
  ParticleUpdater,
  Curve,
  Alignment,
  ParticleOptions,
  ParticlePropertyOptions,
  ParticlePropertyUpdaterConfigs,
  ParticlePropertyAnimation,
  ParticleTuple
} from '@ohos.arkui.component';

@Entry
@Component
struct ParticleOptions1 {
  build() {
    Stack() {
      Text()
        .width(300).height(300).backgroundColor(Color.Black)
      Particle({
        particles: [
          {
            emitter: {
              particle: {
                type: ParticleType.POINT, 
                config: {
                  radius: 10
                },
                count: 500, 
                lifetime: 10000
              },
              emitRate: 10, 
              position: [0, 0],
              shape: ParticleEmitterShape.RECTANGLE
            },
            color: {
              range: [Color.Red, Color.Yellow], 
              updater: {
                type: ParticleUpdater.CURVE, 
                config: [
                  {
                    from: Color.White, 
                    to: Color.Pink, 
                    startMillis: 0, 
                    endMillis: 3000, 
                    curve: Curve.EaseIn
                  },
                  {
                    from: Color.Pink,
                    to: Color.Orange,
                    startMillis: 3000,
                    endMillis: 5000,
                    curve: Curve.EaseIn
                  },
                  {
                    from: Color.Orange,
                    to: Color.Pink,
                    startMillis: 5000,
                    endMillis: 8000,
                    curve: Curve.EaseIn
                  },
                ]
              }
            },
            opacity: {
              range: [0.0, 0.0], 
              updater: {
                type: ParticleUpdater.CURVE, 
                config: [
                  {
                    from: 0.0,
                    to: 1.0,
                    startMillis: 0,
                    endMillis: 3000,
                    curve: Curve.EaseIn
                  } as ParticlePropertyAnimation<number>,
                  {
                    from: 1.0,
                    to: 0.0,
                    startMillis: 5000,
                    endMillis: 10000,
                    curve: Curve.EaseIn
                  } as ParticlePropertyAnimation<number>
                ]
              }
            },
            scale: {
              range: [0.0, 0.0],
              updater: {
                type: ParticleUpdater.CURVE,
                config: [
                  {
                    from: 0.0,
                    to: 0.5,
                    startMillis: 0,
                    endMillis: 3000,
                    curve: Curve.EaseIn
                  } as ParticlePropertyAnimation<number>
                ]
              }
            },
            acceleration: {
              
              speed: {
                range: [3, 9],
                updater: {
                  type: ParticleUpdater.RANDOM,
                  config: [1, 20] as ParticleTuple<Double, Double>
                }
              },
              angle: {
                range: [90, 90]
              }
            }

          }
        ]
      }).width(300).height(300).id("Particle_Options")
    }.width("100%").height("100%").align(Alignment.Center)
  }
}