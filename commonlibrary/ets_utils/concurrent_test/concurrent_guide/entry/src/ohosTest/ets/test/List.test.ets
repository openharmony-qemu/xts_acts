/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import AsyncLockTest from './arktsUtils/AsyncLockTest.test'
import ConditionVariableTest from './arktsUtils/ConditionVariableTest.test'
import CollectionsTest from './arktsUtils/CollectionsTest.test'
import ASONTest from './arktsUtils/ASONTest.test'
import SendableLruCacheTest from './arktsUtils/SendableLruCacheTest.test'
import CancelTaskTest from './concurrencyOverview/CancelTaskTest.test'
import AsyncConcurrencyTest from './concurrencyOverview/AsyncConcurrencyTest.test'
import CommonLibraryFaqTest from './concurrencyOverview/CommonLibraryFaqTest.test'
import ConcurrencyFaqTest from './concurrencyOverview/ConcurrencyFaqTest.test'
import ConcurrencyOverviewTest from './concurrencyOverview/ConcurrencyOverviewTest.test'
import InterthreadCommunicationTest from './concurrencyOverview/InterthreadCommunicationTest.test'
import WorkerCommunicationOverviewTest from './concurrencyOverview/WorkerCommunicationTest.test'
import MultithreadDevelopTest from './concurrencyOverview/MultithreadDevelopTest.test'
import BatchDatabaseOpsTest from './nativeNapi/BatchDatabaseOpsTest.test'
import ConcurrentLoadingModulesTest from './nativeNapi/ConcurrentLoadingModulesTest.test'
import GlobalConfigurationTest from './nativeNapi/GlobalConfigurationTest.test'
import SendableDefineTest from './nativeNapi/SendableDefineTest.test'
import InterthreadSharedTest from './nativeNapi/InterthreadSharedTest.test'
import ArrayBufferTest from './objectTransfer/ArrayBufferTest.test'
import BufferTest from './objectTransfer/BufferTest.test'
import ContainerObjectTest from './objectTransfer/ContainerObjectTest.test'
import NormalObjectTest from './objectTransfer/NormalObjectTest.test'
import SerializableViewTest from './objectTransfer/SerializableViewTest.test'
import SharedArrayBufferTest from './objectTransfer/SharedArrayBufferTest.test'
import TransferableObjectTest from './objectTransfer/TransferableObjectTest.test'
import SendableGuideTest from './sendable/SendableGuideTest.test'
import SendableConstraintsTest from './sendable/SendableConstraintsTest.test'
import SendableTransGuideTest from './sendable/SendableTransGuideTest.test'
import SendableFreezeTest from './sendable/SendableFreezeTest.test'
import ArktsSendableTest from './sendable/ArktsSendableTest.test'
import SendableModuleTest from './sendable/SendableModuleTest.test'
import MakeObservedSendableTest from './sendable/MakeObservedSendableTest.test'
import TaskpoolIntroductionTest from './taskpool/TaskpoolIntroductionTest.test'
import TaskpoolAsyncRunnerTest from './taskpool/TaskpoolAsyncRunnerTest.test'
import TaskpoolCommunicationTest from './taskpool/TaskpoolCommunicationTest.test'
import TaskpoolVsWorkerTest from './taskpool/TaskpoolVsWorkerTest.test'
import TaskpoolWaterflowTest from './taskpool/TaskpoolWaterflowTest.test'
import TaskTypeTest from './taskType/TaskTypeTest.test'
import WorkerIntroductionTest from './worker/WorkerIntroductionTest.test'
import WorkerCommunicationTest from './worker/WorkerCommunicationTest.test'
import WorkerSendableTest from './worker/WorkerSendableTest.test'
import WorkerInvokeTest from './worker/WorkerInvokeTest.test'
import WorkerTaskpoolTest from './worker/WorkerTaskpoolTest.test'

export default function testsuite(): void {
  AsyncLockTest()
  ConditionVariableTest()
  CollectionsTest()
  ASONTest()
  SendableLruCacheTest()
  CancelTaskTest()
  AsyncConcurrencyTest()
  CommonLibraryFaqTest()
  ConcurrencyFaqTest()
  ConcurrencyOverviewTest()
  InterthreadCommunicationTest()
  MultithreadDevelopTest()
  WorkerCommunicationOverviewTest()
  BatchDatabaseOpsTest()
  ConcurrentLoadingModulesTest()
  GlobalConfigurationTest()
  SendableDefineTest()
  InterthreadSharedTest()
  ArrayBufferTest()
  BufferTest()
  ContainerObjectTest()
  NormalObjectTest()
  SerializableViewTest()
  SharedArrayBufferTest()
  TransferableObjectTest()
  SendableGuideTest()
  SendableConstraintsTest()
  SendableTransGuideTest()
  SendableFreezeTest()
  ArktsSendableTest()
  SendableModuleTest()
  MakeObservedSendableTest()
  TaskpoolIntroductionTest()
  TaskpoolAsyncRunnerTest()
  TaskpoolCommunicationTest()
  TaskpoolVsWorkerTest()
  TaskpoolWaterflowTest()
  TaskTypeTest()
  WorkerIntroductionTest()
  WorkerCommunicationTest()
  WorkerSendableTest()
  WorkerInvokeTest()
  WorkerTaskpoolTest()
}
