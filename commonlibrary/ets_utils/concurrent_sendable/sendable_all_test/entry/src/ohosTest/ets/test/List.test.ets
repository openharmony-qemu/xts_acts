/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import BuiltinsSendableBasicTypeTest from './sendable/BuiltinsSendableBasicTypeTest.test';
import SendableDecoratorTest from './sendable/SendableDecoratorTest.test';
import BuiltinsSendableFunctionTest from './sendable/BuiltinsSendableFunctionTest.test';
import BuiltinsSendableCollectionsTest from './sendable/BuiltinsSendableCollectionsTest.test';
import BuiltinsSendableSharedModuleTest from './sendable/BuiltinsSendableSharedModuleTest.test';
import BuiltinsSendableConstraintTest from './sendable/BuiltinsSendableConstraintTest.test';
import BuiltinsSendableNestedTest from './sendable/BuiltinsSendableNestedTest.test';
import BuiltinsTaskPoolSendableTest from './sendable/BuiltinsTaskPoolSendableTest.test';
import BuiltinsWorkerSendableTest from './sendable/BuiltinsWorkerSendableTest.test';
import SharedCounterTaskCompleteTest from './sendable/SharedCounterTaskCompleteTest.test';
import SharedCounterRequestTest from './sendable/SharedCounterRequestTest.test';
import SharedCounterDownloadTest from './sendable/SharedCounterDownloadTest.test';
import SharedCounterResourceRefTest from './sendable/SharedCounterResourceRefTest.test';
import SharedCounterInventoryTest from './sendable/SharedCounterInventoryTest.test';
import SharedCounterIRTest from './sendable/SharedCounterIRTest.test';
import ResultCollectIRTest from './sendable/ResultCollectIRTest.test';
import ParallelComputeResultTest from './sendable/ParallelComputeResultTest.test';
import ImageResultCollectTest from './sendable/ImageResultCollectTest.test';
import BuiltinsErrorResultCollectTest from './sendable/BuiltinsErrorResultCollectTest.test';
import DataResultCollectTest from './sendable/DataResultCollectTest.test';
import TimeoutResultCollectTest from './sendable/TimeoutResultCollectTest.test';
import ImageCacheTest from './sendable/ImageCacheTest.test';
import DbQueryCacheTest from './sendable/DbQueryCacheTest.test';
import BuiltinsComputeResultCacheTest from './sendable/BuiltinsComputeResultCacheTest.test';
import BuiltinsApiResponseCacheTest from './sendable/BuiltinsApiResponseCacheTest.test';
import BuiltinsCacheIRTest from './sendable/BuiltinsCacheIRTest.test';
import BuiltinsSessionCacheTest from './sendable/BuiltinsSessionCacheTest.test';
import TaskDispatchQueueTest from './sendable/TaskDispatchQueueTest.test';
import PipelineQueueTest from './sendable/PipelineQueueTest.test';
import LogCollectorQueueTest from './sendable/LogCollectorQueueTest.test';
import BoundedQueueTest from './sendable/BoundedQueueTest.test';
import RequestBufferQueueTest from './sendable/RequestBufferQueueTest.test';
import QueueIRTest from './sendable/QueueIRTest.test';
import BuiltinsAsyncLockBasicTest from './sendable/BuiltinsAsyncLockBasicTest.test';
import ReadWriteLockTest from './sendable/ReadWriteLockTest.test';
import ConditionVariableTest from './sendable/ConditionVariableTest.test';
import ProducerConsumerCoordTest from './sendable/ProducerConsumerCoordTest.test';
import TaskQueueCoordTest from './sendable/TaskQueueCoordTest.test';
import ConnectionPoolLockTest from './sendable/ConnectionPoolLockTest.test';
import LockIRTest from './sendable/LockIRTest.test';
import BuiltinsDictModeTriggerTest from './sendable/BuiltinsDictModeTriggerTest.test';
import BuiltinsIROptimizationTest from './sendable/BuiltinsIROptimizationTest.test';
import BuiltinsIRReinforcementTest from './sendable/BuiltinsIRReinforcementTest.test';
import BuiltinsAppSettingsTest from './sendable/BuiltinsAppSettingsTest.test';
import BuiltinsConfigVersionTest from './sendable/BuiltinsConfigVersionTest.test';
import BuiltinsEnvironmentConfigTest from './sendable/BuiltinsEnvironmentConfigTest.test';
import BuiltinsWorkerConfigTest from './sendable/BuiltinsWorkerConfigTest.test';
import BuiltinsConfigStabilityTest from './sendable/BuiltinsConfigStabilityTest.test';
import BuiltinsConfigIRTest from './sendable/BuiltinsConfigIRTest.test';
import BuiltinsGlobalConfigTest from './sendable/BuiltinsGlobalConfigTest.test';
import OrderStateMachineTest from './sendable/OrderStateMachineTest.test';
import TaskStateMachineTest from './sendable/TaskStateMachineTest.test';
import DeviceStateMachineTest from './sendable/DeviceStateMachineTest.test';
import BuiltinsApprovalStateMachineTest from './sendable/BuiltinsApprovalStateMachineTest.test';
import ConcurrentStateTest from './sendable/ConcurrentStateTest.test';
import StateMachineIRTest from './sendable/StateMachineIRTest.test';
import StateMachineStabilityTest from './sendable/StateMachineStabilityTest.test';
import BatchProgressTest from './sendable/BatchProgressTest.test';
import UploadProgressTest from './sendable/UploadProgressTest.test';
import MultiStageProgressTest from './sendable/MultiStageProgressTest.test';
import MultiTaskProgressTest from './sendable/MultiTaskProgressTest.test';
import DataProcessProgressTest from './sendable/DataProcessProgressTest.test';
import ProgressIRTest from './sendable/ProgressIRTest.test';
import EventSubscribeTest from './sendable/EventSubscribeTest.test';
import EventPublishTest from './sendable/EventPublishTest.test';
import MultiThreadEventTest from './sendable/MultiThreadEventTest.test';
import EventHandlerConcurrentTest from './sendable/EventHandlerConcurrentTest.test';
import EventQueueTest from './sendable/EventQueueTest.test';
import EventErrorTest from './sendable/EventErrorTest.test';
import EventBusIRTest from './sendable/EventBusIRTest.test';
import ConnectionPoolInitTest from './sendable/ConnectionPoolInitTest.test';
import ConnectionAcquireTest from './sendable/ConnectionAcquireTest.test';
import ConnectionCapacityTest from './sendable/ConnectionCapacityTest.test';
import ConnectionWaitQueueTest from './sendable/ConnectionWaitQueueTest.test';
import ConnectionTimeoutTest from './sendable/ConnectionTimeoutTest.test';
import ConnectionStatsTest from './sendable/ConnectionStatsTest.test';
import ConnectionPoolIRTest from './sendable/ConnectionPoolIRTest.test';
import ServiceRegistryTest from './sendable/ServiceRegistryTest.test';
import MetricsCollectorTest from './sendable/MetricsCollectorTest.test';
import RateLimiterTest from './sendable/RateLimiterTest.test';
import ServiceMonitorTest from './sendable/ServiceMonitorTest.test';
import ServiceHotUpdateTest from './sendable/ServiceHotUpdateTest.test';
import SlidingWindowLimiterTest from './sendable/SlidingWindowLimiterTest.test';
import BuiltinsDynamicThresholdTest from './sendable/BuiltinsDynamicThresholdTest.test';
import BuiltinsIDGeneratorTest from './sendable/BuiltinsIDGeneratorTest.test';
import BuiltinsLazyLoaderTest from './sendable/BuiltinsLazyLoaderTest.test';
import BuiltinsDependencyChainTest from './sendable/BuiltinsDependencyChainTest.test';
import BuiltinsSharedModuleGCTest from './sendable/BuiltinsSharedModuleGCTest.test';
import BuiltinsServiceSingletonTest from './sendable/BuiltinsServiceSingletonTest.test';
import BuiltinsServiceLifecycleTest from './sendable/BuiltinsServiceLifecycleTest.test';
import BuiltinsMetricsAggregationTest from './sendable/BuiltinsMetricsAggregationTest.test';
import BuiltinsWorkerIntegrationTest from './sendable/BuiltinsWorkerIntegrationTest.test';
import BuiltinsTaskPoolIntegrationTest from './sendable/BuiltinsTaskPoolIntegrationTest.test';
import BuiltinsSharedModuleNestedTest from './sendable/BuiltinsSharedModuleNestedTest.test';
import BuiltinsSharedModuleStabilityTest from './sendable/BuiltinsSharedModuleStabilityTest.test';
import BuiltinsSharedHeapGCTest from './sendable/BuiltinsSharedHeapGCTest.test';
import BuiltinsMultiThreadRefGCTest from './sendable/BuiltinsMultiThreadRefGCTest.test';
import BuiltinsSendableLifecycleTest from './sendable/BuiltinsSendableLifecycleTest.test';
import BuiltinsConcurrentGCTest from './sendable/BuiltinsConcurrentGCTest.test';
import BuiltinsRefCountGCTest from './sendable/BuiltinsRefCountGCTest.test';
import BuiltinsMemoryLeakGCTest from './sendable/BuiltinsMemoryLeakGCTest.test';
import BuiltinsHeapIsolationTest from './sendable/BuiltinsHeapIsolationTest.test';
import BuiltinsPostGCStateTest from './sendable/BuiltinsPostGCStateTest.test';
import BuiltinsSharedModuleGCTest2 from './sendable/BuiltinsSharedModuleGCTest2.test';
import BuiltinsBatchCreateDestroyTest from './sendable/BuiltinsBatchCreateDestroyTest.test';
import BuiltinsWorkerTaskPoolGCTest from './sendable/BuiltinsWorkerTaskPoolGCTest.test';
import AsonSendableTest from './sendable/AsonSendableTest.test';
import FreezeSendableTest from './sendable/FreezeSendableTest.test';
import IsSendableTest from './sendable/IsSendableTest.test';
import MakeObservedSendableTest from './sendable/MakeObservedSendableTest.test';
import UseSharedModuleTest from './sendable/UseSharedModuleTest.test';

export default function testsuite(): void {
  BuiltinsSendableBasicTypeTest()
  SendableDecoratorTest()
  BuiltinsSendableFunctionTest()
  BuiltinsSendableCollectionsTest()
  BuiltinsSendableSharedModuleTest()
  BuiltinsSendableConstraintTest()
  BuiltinsSendableNestedTest()
  BuiltinsTaskPoolSendableTest()
  BuiltinsWorkerSendableTest()
  SharedCounterTaskCompleteTest()
  SharedCounterRequestTest()
  SharedCounterDownloadTest()
  SharedCounterResourceRefTest()
  SharedCounterInventoryTest()
  SharedCounterIRTest()
  ResultCollectIRTest()
  ParallelComputeResultTest()
  ImageResultCollectTest()
  BuiltinsErrorResultCollectTest()
  DataResultCollectTest()
  TimeoutResultCollectTest()
  ImageCacheTest()
  DbQueryCacheTest()
  BuiltinsComputeResultCacheTest()
  BuiltinsApiResponseCacheTest()
  BuiltinsCacheIRTest()
  BuiltinsSessionCacheTest()
  TaskDispatchQueueTest()
  PipelineQueueTest()
  LogCollectorQueueTest()
  BoundedQueueTest()
  RequestBufferQueueTest()
  QueueIRTest()
  BuiltinsAsyncLockBasicTest()
  ReadWriteLockTest()
  ConditionVariableTest()
  ProducerConsumerCoordTest()
  TaskQueueCoordTest()
  ConnectionPoolLockTest()
  LockIRTest()
  BuiltinsDictModeTriggerTest()
  BuiltinsIROptimizationTest()
  BuiltinsIRReinforcementTest()
  BuiltinsAppSettingsTest()
  BuiltinsConfigVersionTest()
  BuiltinsEnvironmentConfigTest()
  BuiltinsWorkerConfigTest()
  BuiltinsConfigStabilityTest()
  BuiltinsConfigIRTest()
  BuiltinsGlobalConfigTest()
  OrderStateMachineTest()
  TaskStateMachineTest()
  DeviceStateMachineTest()
  BuiltinsApprovalStateMachineTest()
  ConcurrentStateTest()
  StateMachineIRTest()
  StateMachineStabilityTest()
  BatchProgressTest()
  UploadProgressTest()
  MultiStageProgressTest()
  MultiTaskProgressTest()
  DataProcessProgressTest()
  ProgressIRTest()
  EventSubscribeTest()
  EventPublishTest()
  MultiThreadEventTest()
  EventHandlerConcurrentTest()
  EventQueueTest()
  EventErrorTest()
  EventBusIRTest()
  ConnectionPoolInitTest()
  ConnectionAcquireTest()
  ConnectionCapacityTest()
  ConnectionWaitQueueTest()
  ConnectionTimeoutTest()
  ConnectionStatsTest()
  ConnectionPoolIRTest()
  ServiceRegistryTest()
  MetricsCollectorTest()
  RateLimiterTest()
  ServiceMonitorTest()
  ServiceHotUpdateTest()
  SlidingWindowLimiterTest()
  BuiltinsDynamicThresholdTest()
  BuiltinsIDGeneratorTest()
  BuiltinsLazyLoaderTest()
  BuiltinsDependencyChainTest()
  BuiltinsSharedModuleGCTest()
  BuiltinsServiceSingletonTest()
  BuiltinsServiceLifecycleTest()
  BuiltinsMetricsAggregationTest()
  BuiltinsWorkerIntegrationTest()
  BuiltinsTaskPoolIntegrationTest()
  BuiltinsSharedModuleNestedTest()
  BuiltinsSharedModuleStabilityTest()
  BuiltinsSharedHeapGCTest()
  BuiltinsMultiThreadRefGCTest()
  BuiltinsSendableLifecycleTest()
  BuiltinsConcurrentGCTest()
  BuiltinsRefCountGCTest()
  BuiltinsMemoryLeakGCTest()
  BuiltinsHeapIsolationTest()
  BuiltinsPostGCStateTest()
  BuiltinsSharedModuleGCTest2()
  BuiltinsBatchCreateDestroyTest()
  BuiltinsWorkerTaskPoolGCTest()
  AsonSendableTest()
  FreezeSendableTest()
  IsSendableTest()
  MakeObservedSendableTest()
  UseSharedModuleTest()
}
