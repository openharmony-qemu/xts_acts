'use static';
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

import setExpectedFrameRateRangeTest from './AnimatorResultTest/setExpectedFrameRateRangeTest.test'
import AnimatorResultTest from './AnimatorResultTest/AnimatorResultTest.test'
import setPolyToPoly from './SetPolyToPoly1.test'
import SymbolGlyphTest from './SymbolGlyphTest/SymbolGlyphTest.test'
import ParticleTest from './ParticleTest/ParticleTest.test'
import ParticleAnimatorTest from './Particle/ParticleAnimatorTest.test'
import APIParticleEmitter from './APIParticleEmitter.test'
import animateToTest from './AnimatorResultTest/animateToTest.test'
import ParticleAttributeTest from './Particle/ParticleAttributeTest.test'
import CurvePage from './CurvePage.test'
import SimpleAnimatorOptionsPage from './SimpleAnimatorOptionsPage.test'
import Blur from './Blur.test'
import ParticlePage from './Particle.test'


export default function testsuite() {
  AnimatorResultTest() // 2 pass 2 1117sdk App died
  setExpectedFrameRateRangeTest() // 1 pass 1
  setPolyToPoly(); // 1 pass 1
  SymbolGlyphTest(); // 4 pass 4
  ParticleTest(); // 4 pass 4
  ParticleAnimatorTest(); // 1 Particle
  animateToTest(); // 1 pass 1
  ParticleAttributeTest(); // 1 Particle
  SimpleAnimatorOptionsPage(); // 4 pass 4
  Blur(); // 1 pass 1
  APIParticleEmitter(); // 1 Particle
  ParticlePage(); // 1 Particle
  CurvePage(); // 4 pass 4
}