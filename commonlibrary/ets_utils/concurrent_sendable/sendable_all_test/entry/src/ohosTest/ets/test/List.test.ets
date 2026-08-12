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

import SendableBasicTypeTest from './sendable/SendableBasicTypeTest.test';
import SendableDecoratorTest from './sendable/SendableDecoratorTest.test';
import SendableFunctionTest from './sendable/SendableFunctionTest.test';
import SendableCollectionsTest from './sendable/SendableCollectionsTest.test';
import SendableSharedModuleTest from './sendable/SendableSharedModuleTest.test';
import SendableConstraintTest from './sendable/SendableConstraintTest.test';
import SendableNestedTest from './sendable/SendableNestedTest.test';
import TaskPoolSendableTest from './sendable/TaskPoolSendableTest.test';
import WorkerSendableTest from './sendable/WorkerSendableTest.test';
import SharedCounterTaskCompleteTest from './sendable/SharedCounterTaskCompleteTest.test';
import SharedCounterRequestTest from './sendable/SharedCounterRequestTest.test';
import SharedCounterDownloadTest from './sendable/SharedCounterDownloadTest.test';
import SharedCounterResourceRefTest from './sendable/SharedCounterResourceRefTest.test';
import SharedCounterInventoryTest from './sendable/SharedCounterInventoryTest.test';
import SharedCounterIRTest from './sendable/SharedCounterIRTest.test';
import ResultCollectIRTest from './sendable/ResultCollectIRTest.test';
import ParallelComputeResultTest from './sendable/ParallelComputeResultTest.test';
import ImageResultCollectTest from './sendable/ImageResultCollectTest.test';
import ErrorResultCollectTest from './sendable/ErrorResultCollectTest.test';
import DataResultCollectTest from './sendable/DataResultCollectTest.test';
import TimeoutResultCollectTest from './sendable/TimeoutResultCollectTest.test';
import ImageCacheTest from './sendable/ImageCacheTest.test';
import DbQueryCacheTest from './sendable/DbQueryCacheTest.test';
import ComputeResultCacheTest from './sendable/ComputeResultCacheTest.test';
import ApiResponseCacheTest from './sendable/ApiResponseCacheTest.test';
import CacheIRTest from './sendable/CacheIRTest.test';
import SessionCacheTest from './sendable/SessionCacheTest.test';
import TaskDispatchQueueTest from './sendable/TaskDispatchQueueTest.test';
import PipelineQueueTest from './sendable/PipelineQueueTest.test';
import LogCollectorQueueTest from './sendable/LogCollectorQueueTest.test';
import BoundedQueueTest from './sendable/BoundedQueueTest.test';
import RequestBufferQueueTest from './sendable/RequestBufferQueueTest.test';
import QueueIRTest from './sendable/QueueIRTest.test';
import AsyncLockBasicTest from './sendable/AsyncLockBasicTest.test';
import ReadWriteLockTest from './sendable/ReadWriteLockTest.test';
import ConditionVariableTest from './sendable/ConditionVariableTest.test';
import ProducerConsumerCoordTest from './sendable/ProducerConsumerCoordTest.test';
import TaskQueueCoordTest from './sendable/TaskQueueCoordTest.test';
import ConnectionPoolLockTest from './sendable/ConnectionPoolLockTest.test';
import LockIRTest from './sendable/LockIRTest.test';
import DictModeTriggerTest from './sendable/DictModeTriggerTest.test';
import IROptimizationTest from './sendable/IROptimizationTest.test';
import IRReinforcementTest from './sendable/IRReinforcementTest.test';
import AppSettingsTest from './sendable/AppSettingsTest.test';
import ConfigVersionTest from './sendable/ConfigVersionTest.test';
import EnvironmentConfigTest from './sendable/EnvironmentConfigTest.test';
import WorkerConfigTest from './sendable/WorkerConfigTest.test';
import ConfigStabilityTest from './sendable/ConfigStabilityTest.test';
import ConfigIRTest from './sendable/ConfigIRTest.test';
import GlobalConfigTest from './sendable/GlobalConfigTest.test';
import OrderStateMachineTest from './sendable/OrderStateMachineTest.test';
import TaskStateMachineTest from './sendable/TaskStateMachineTest.test';
import DeviceStateMachineTest from './sendable/DeviceStateMachineTest.test';
import ApprovalStateMachineTest from './sendable/ApprovalStateMachineTest.test';
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
import DynamicThresholdTest from './sendable/DynamicThresholdTest.test';
import IDGeneratorTest from './sendable/IDGeneratorTest.test';
import LazyLoaderTest from './sendable/LazyLoaderTest.test';
import DependencyChainTest from './sendable/DependencyChainTest.test';
import SharedModuleGCTest from './sendable/SharedModuleGCTest.test';
import ServiceSingletonTest from './sendable/ServiceSingletonTest.test';
import ServiceLifecycleTest from './sendable/ServiceLifecycleTest.test';
import MetricsAggregationTest from './sendable/MetricsAggregationTest.test';
import WorkerIntegrationTest from './sendable/WorkerIntegrationTest.test';
import TaskPoolIntegrationTest from './sendable/TaskPoolIntegrationTest.test';
import SharedModuleNestedTest from './sendable/SharedModuleNestedTest.test';
import SharedModuleStabilityTest from './sendable/SharedModuleStabilityTest.test';
import SharedHeapGCTest from './sendable/SharedHeapGCTest.test';
import MultiThreadRefGCTest from './sendable/MultiThreadRefGCTest.test';
import SendableLifecycleTest from './sendable/SendableLifecycleTest.test';
import ConcurrentGCTest from './sendable/ConcurrentGCTest.test';
import RefCountGCTest from './sendable/RefCountGCTest.test';
import MemoryLeakGCTest from './sendable/MemoryLeakGCTest.test';
import HeapIsolationTest from './sendable/HeapIsolationTest.test';
import PostGCStateTest from './sendable/PostGCStateTest.test';
import SharedModuleGCTest2 from './sendable/SharedModuleGCTest2.test';
import BatchCreateDestroyTest from './sendable/BatchCreateDestroyTest.test';
import WorkerTaskPoolGCTest from './sendable/WorkerTaskPoolGCTest.test';
import AsonSendableTest from './sendable/AsonSendableTest.test';
import FreezeSendableTest from './sendable/FreezeSendableTest.test';
import IsSendableTest from './sendable/IsSendableTest.test';
import MakeObservedSendableTest from './sendable/MakeObservedSendableTest.test';
import UseSharedModuleTest from './sendable/UseSharedModuleTest.test';

export default function testsuite(): void {
  SendableBasicTypeTest()
  SendableDecoratorTest()
  SendableFunctionTest()
  SendableCollectionsTest()
  SendableSharedModuleTest()
  SendableConstraintTest()
  SendableNestedTest()
  TaskPoolSendableTest()
  WorkerSendableTest()
  SharedCounterTaskCompleteTest()
  SharedCounterRequestTest()
  SharedCounterDownloadTest()
  SharedCounterResourceRefTest()
  SharedCounterInventoryTest()
  SharedCounterIRTest()
  ResultCollectIRTest()
  ParallelComputeResultTest()
  ImageResultCollectTest()
  ErrorResultCollectTest()
  DataResultCollectTest()
  TimeoutResultCollectTest()
  ImageCacheTest()
  DbQueryCacheTest()
  ComputeResultCacheTest()
  ApiResponseCacheTest()
  CacheIRTest()
  SessionCacheTest()
  TaskDispatchQueueTest()
  PipelineQueueTest()
  LogCollectorQueueTest()
  BoundedQueueTest()
  RequestBufferQueueTest()
  QueueIRTest()
  AsyncLockBasicTest()
  ReadWriteLockTest()
  ConditionVariableTest()
  ProducerConsumerCoordTest()
  TaskQueueCoordTest()
  ConnectionPoolLockTest()
  LockIRTest()
  DictModeTriggerTest()
  IROptimizationTest()
  IRReinforcementTest()
  AppSettingsTest()
  ConfigVersionTest()
  EnvironmentConfigTest()
  WorkerConfigTest()
  ConfigStabilityTest()
  ConfigIRTest()
  GlobalConfigTest()
  OrderStateMachineTest()
  TaskStateMachineTest()
  DeviceStateMachineTest()
  ApprovalStateMachineTest()
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
  DynamicThresholdTest()
  IDGeneratorTest()
  LazyLoaderTest()
  DependencyChainTest()
  SharedModuleGCTest()
  ServiceSingletonTest()
  ServiceLifecycleTest()
  MetricsAggregationTest()
  WorkerIntegrationTest()
  TaskPoolIntegrationTest()
  SharedModuleNestedTest()
  SharedModuleStabilityTest()
  SharedHeapGCTest()
  MultiThreadRefGCTest()
  SendableLifecycleTest()
  ConcurrentGCTest()
  RefCountGCTest()
  MemoryLeakGCTest()
  HeapIsolationTest()
  PostGCStateTest()
  SharedModuleGCTest2()
  BatchCreateDestroyTest()
  WorkerTaskPoolGCTest()
  AsonSendableTest()
  FreezeSendableTest()
  IsSendableTest()
  MakeObservedSendableTest()
  UseSharedModuleTest()
}
