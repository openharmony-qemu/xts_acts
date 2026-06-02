/*
 * Copyright (c) 2026 RKH Corp.
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

import ArrayInheritanceTest from './collections/ArrayInheritanceTest.test'
import MapInheritanceTest from './collections/MapInheritanceTest.test'
import SetInheritanceTest from './collections/SetInheritanceTest.test'
import BitVectorTest from './bitVector/BitVectorTest.test'
import ArrayBufferTest from './arrayBuffer/ArrayBufferTest.test'
import ContainerComboTest from './collections/ContainerComboTest.test'
import ConcurrentFactorComboTest from './collections/ConcurrentFactorComboTest.test'
import RealWorldComboTest from './collections/RealWorldComboTest.test'
import StressStabilityComboTest from './collections/StressStabilityComboTest.test'
import ConcatArrayImplTest from './concatArray/ConcatArrayImplTest.test'
import ConcatArrayConcurrentTest from './concatArray/ConcatArrayConcurrentTest.test'
import Float32ArrayTest from './floatArray/Float32ArrayTest.test'
import Int8ArrayTest from './intArray/Int8ArrayTest.test'
import Int16ArrayTest from './intArray/Int16ArrayTest.test'
import Int32ArrayTest from './intArray/Int32ArrayTest.test'
import Uint8ArrayTest from './intArray/Uint8ArrayTest.test'
import Uint8ClampedArrayCtorTest from './uintArray/Uint8ClampedArrayCtorTest.test'
import Uint8ClampedArrayMethodTest from './uintArray/Uint8ClampedArrayMethodTest.test'
import Uint8ClampedArrayConcurrentTest from './uintArray/Uint8ClampedArrayConcurrentTest.test'
import Uint16ArrayTest from './uintArray/Uint16ArrayTest.test'
import Uint32ArrayTest from './uintArray/Uint32ArrayTest.test'
export default function testsuite(): void {
  BitVectorTest()
  ArrayBufferTest()
  ArrayInheritanceTest()
  MapInheritanceTest()
  SetInheritanceTest()
  ContainerComboTest()
  ConcurrentFactorComboTest() 
  RealWorldComboTest()
  StressStabilityComboTest()
  ConcatArrayImplTest()
  ConcatArrayConcurrentTest()
  Float32ArrayTest()
  Int8ArrayTest()
  Int16ArrayTest()
  Int32ArrayTest()
  Uint8ArrayTest()
  Uint8ClampedArrayCtorTest()
  Uint8ClampedArrayMethodTest()
  Uint8ClampedArrayConcurrentTest()
  Uint16ArrayTest()
  Uint32ArrayTest()
}