/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import BuiltinsSendableBasicTypeTest from './sendable/BuiltinsSendableBasicTypeTest.test';
import BuiltinsSendableDecoratorTest from './sendable/BuiltinsSendableDecoratorTest.test';
import BuiltinsSendableFunctionTest from './sendable/BuiltinsSendableFunctionTest.test';
import BuiltinsSendableCollectionsTest from './sendable/BuiltinsSendableCollectionsTest.test';
import BuiltinsSendableSharedModuleTest from './sendable/BuiltinsSendableSharedModuleTest.test';
import BuiltinsSendableConstraintTest from './sendable/BuiltinsSendableConstraintTest.test';
import BuiltinsSendableNestedTest from './sendable/BuiltinsSendableNestedTest.test';
import BuiltinsTaskPoolSendableTest from './sendable/BuiltinsTaskPoolSendableTest.test';
import BuiltinsWorkerSendableTest from './sendable/BuiltinsWorkerSendableTest.test';
import BuiltinsSharedCounterTaskCompleteTest from './sendable/BuiltinsSharedCounterTaskCompleteTest.test';
import BuiltinsSharedCounterRequestTest from './sendable/BuiltinsSharedCounterRequestTest.test';
import BuiltinsSharedCounterDownloadTest from './sendable/BuiltinsSharedCounterDownloadTest.test';
import BuiltinsSharedCounterResourceRefTest from './sendable/BuiltinsSharedCounterResourceRefTest.test';
import BuiltinsSharedCounterInventoryTest from './sendable/BuiltinsSharedCounterInventoryTest.test';
import BuiltinsSharedCounterIRTest from './sendable/BuiltinsSharedCounterIRTest.test';
import BuiltinsResultCollectIRTest from './sendable/BuiltinsResultCollectIRTest.test';
import BuiltinsParallelComputeResultTest from './sendable/BuiltinsParallelComputeResultTest.test';
import BuiltinsImageResultCollectTest from './sendable/BuiltinsImageResultCollectTest.test';
import BuiltinsErrorResultCollectTest from './sendable/BuiltinsErrorResultCollectTest.test';
import BuiltinsDataResultCollectTest from './sendable/BuiltinsDataResultCollectTest.test';
import BuiltinsTimeoutResultCollectTest from './sendable/BuiltinsTimeoutResultCollectTest.test';
import BuiltinsImageCacheTest from './sendable/BuiltinsImageCacheTest.test';
import BuiltinsDbQueryCacheTest from './sendable/BuiltinsDbQueryCacheTest.test';
import BuiltinsComputeResultCacheTest from './sendable/BuiltinsComputeResultCacheTest.test';
import BuiltinsApiResponseCacheTest from './sendable/BuiltinsApiResponseCacheTest.test';
import BuiltinsCacheIRTest from './sendable/BuiltinsCacheIRTest.test';
import BuiltinsSessionCacheTest from './sendable/BuiltinsSessionCacheTest.test';
import BuiltinsTaskDispatchQueueTest from './sendable/BuiltinsTaskDispatchQueueTest.test';
import BuiltinsPipelineQueueTest from './sendable/BuiltinsPipelineQueueTest.test';
import BuiltinsLogCollectorQueueTest from './sendable/BuiltinsLogCollectorQueueTest.test';
import BuiltinsBoundedQueueTest from './sendable/BuiltinsBoundedQueueTest.test';
import BuiltinsRequestBufferQueueTest from './sendable/BuiltinsRequestBufferQueueTest.test';
import BuiltinsQueueIRTest from './sendable/BuiltinsQueueIRTest.test';
import BuiltinsAsyncLockBasicTest from './sendable/BuiltinsAsyncLockBasicTest.test';
import BuiltinsReadWriteLockTest from './sendable/BuiltinsReadWriteLockTest.test';
import BuiltinsConditionVariableTest from './sendable/BuiltinsConditionVariableTest.test';
import BuiltinsProducerConsumerCoordTest from './sendable/BuiltinsProducerConsumerCoordTest.test';
import BuiltinsTaskQueueCoordTest from './sendable/BuiltinsTaskQueueCoordTest.test';
import BuiltinsConnectionPoolLockTest from './sendable/BuiltinsConnectionPoolLockTest.test';
import BuiltinsLockIRTest from './sendable/BuiltinsLockIRTest.test';
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
import BuiltinsOrderStateMachineTest from './sendable/BuiltinsOrderStateMachineTest.test';
import BuiltinsTaskStateMachineTest from './sendable/BuiltinsTaskStateMachineTest.test';
import BuiltinsDeviceStateMachineTest from './sendable/BuiltinsDeviceStateMachineTest.test';
import BuiltinsApprovalStateMachineTest from './sendable/BuiltinsApprovalStateMachineTest.test';
import BuiltinsConcurrentStateTest from './sendable/BuiltinsConcurrentStateTest.test';
import BuiltinsStateMachineIRTest from './sendable/BuiltinsStateMachineIRTest.test';
import BuiltinsStateMachineStabilityTest from './sendable/BuiltinsStateMachineStabilityTest.test';
import BuiltinsBatchProgressTest from './sendable/BuiltinsBatchProgressTest.test';
import BuiltinsUploadProgressTest from './sendable/BuiltinsUploadProgressTest.test';
import BuiltinsMultiStageProgressTest from './sendable/BuiltinsMultiStageProgressTest.test';
import BuiltinsMultiTaskProgressTest from './sendable/BuiltinsMultiTaskProgressTest.test';
import BuiltinsDataProcessProgressTest from './sendable/BuiltinsDataProcessProgressTest.test';
import BuiltinsProgressIRTest from './sendable/BuiltinsProgressIRTest.test';
import BuiltinsEventSubscribeTest from './sendable/BuiltinsEventSubscribeTest.test';
import BuiltinsEventPublishTest from './sendable/BuiltinsEventPublishTest.test';
import BuiltinsMultiThreadEventTest from './sendable/BuiltinsMultiThreadEventTest.test';
import BuiltinsEventHandlerConcurrentTest from './sendable/BuiltinsEventHandlerConcurrentTest.test';
import BuiltinsEventQueueTest from './sendable/BuiltinsEventQueueTest.test';
import BuiltinsEventErrorTest from './sendable/BuiltinsEventErrorTest.test';
import BuiltinsEventBusIRTest from './sendable/BuiltinsEventBusIRTest.test';
import BuiltinsConnectionPoolInitTest from './sendable/BuiltinsConnectionPoolInitTest.test';
import BuiltinsConnectionAcquireTest from './sendable/BuiltinsConnectionAcquireTest.test';
import BuiltinsConnectionCapacityTest from './sendable/BuiltinsConnectionCapacityTest.test';
import BuiltinsConnectionWaitQueueTest from './sendable/BuiltinsConnectionWaitQueueTest.test';
import BuiltinsConnectionTimeoutTest from './sendable/BuiltinsConnectionTimeoutTest.test';
import BuiltinsConnectionStatsTest from './sendable/BuiltinsConnectionStatsTest.test';
import BuiltinsConnectionPoolIRTest from './sendable/BuiltinsConnectionPoolIRTest.test';
import BuiltinsServiceRegistryTest from './sendable/BuiltinsServiceRegistryTest.test';
import BuiltinsMetricsCollectorTest from './sendable/BuiltinsMetricsCollectorTest.test';
import BuiltinsRateLimiterTest from './sendable/BuiltinsRateLimiterTest.test';
import BuiltinsServiceMonitorTest from './sendable/BuiltinsServiceMonitorTest.test';
import BuiltinsServiceHotUpdateTest from './sendable/BuiltinsServiceHotUpdateTest.test';
import BuiltinsSlidingWindowLimiterTest from './sendable/BuiltinsSlidingWindowLimiterTest.test';
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
  BuiltinsSendableDecoratorTest()
  BuiltinsSendableFunctionTest()
  BuiltinsSendableCollectionsTest()
  BuiltinsSendableSharedModuleTest()
  BuiltinsSendableConstraintTest()
  BuiltinsSendableNestedTest()
  BuiltinsTaskPoolSendableTest()
  BuiltinsWorkerSendableTest()
  BuiltinsSharedCounterTaskCompleteTest()
  BuiltinsSharedCounterRequestTest()
  BuiltinsSharedCounterDownloadTest()
  BuiltinsSharedCounterResourceRefTest()
  BuiltinsSharedCounterInventoryTest()
  BuiltinsSharedCounterIRTest()
  BuiltinsResultCollectIRTest()
  BuiltinsParallelComputeResultTest()
  BuiltinsImageResultCollectTest()
  BuiltinsErrorResultCollectTest()
  BuiltinsDataResultCollectTest()
  BuiltinsTimeoutResultCollectTest()
  BuiltinsImageCacheTest()
  BuiltinsDbQueryCacheTest()
  BuiltinsComputeResultCacheTest()
  BuiltinsApiResponseCacheTest()
  BuiltinsCacheIRTest()
  BuiltinsSessionCacheTest()
  BuiltinsTaskDispatchQueueTest()
  BuiltinsPipelineQueueTest()
  BuiltinsLogCollectorQueueTest()
  BuiltinsBoundedQueueTest()
  BuiltinsRequestBufferQueueTest()
  BuiltinsQueueIRTest()
  BuiltinsAsyncLockBasicTest()
  BuiltinsReadWriteLockTest()
  BuiltinsConditionVariableTest()
  BuiltinsProducerConsumerCoordTest()
  BuiltinsTaskQueueCoordTest()
  BuiltinsConnectionPoolLockTest()
  BuiltinsLockIRTest()
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
  BuiltinsOrderStateMachineTest()
  BuiltinsTaskStateMachineTest()
  BuiltinsDeviceStateMachineTest()
  BuiltinsApprovalStateMachineTest()
  BuiltinsConcurrentStateTest()
  BuiltinsStateMachineIRTest()
  BuiltinsStateMachineStabilityTest()
  BuiltinsBatchProgressTest()
  BuiltinsUploadProgressTest()
  BuiltinsMultiStageProgressTest()
  BuiltinsMultiTaskProgressTest()
  BuiltinsDataProcessProgressTest()
  BuiltinsProgressIRTest()
  BuiltinsEventSubscribeTest()
  BuiltinsEventPublishTest()
  BuiltinsMultiThreadEventTest()
  BuiltinsEventHandlerConcurrentTest()
  BuiltinsEventQueueTest()
  BuiltinsEventErrorTest()
  BuiltinsEventBusIRTest()
  BuiltinsConnectionPoolInitTest()
  BuiltinsConnectionAcquireTest()
  BuiltinsConnectionCapacityTest()
  BuiltinsConnectionWaitQueueTest()
  BuiltinsConnectionTimeoutTest()
  BuiltinsConnectionStatsTest()
  BuiltinsConnectionPoolIRTest()
  BuiltinsServiceRegistryTest()
  BuiltinsMetricsCollectorTest()
  BuiltinsRateLimiterTest()
  BuiltinsServiceMonitorTest()
  BuiltinsServiceHotUpdateTest()
  BuiltinsSlidingWindowLimiterTest()
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
