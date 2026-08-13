'use static';
/*
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

import { describe, expect, it, Level } from '../../../../hypium/index';
import { runStaticCoverageProbe } from './StaticCoverageProbe';

export default function StaticCoverageDecoratorTest(): void {
  describe('StaticCoverageDecoratorTest', (): void => {
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_OBSERVED_0074
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_OBSERVED_0074
     * @tc.desc   Verify static Annotation coverage for decorator.global.Observed
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_OBSERVED_0074',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          74, 'decorator#global#Observed#Annotation');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_TRACK_0075
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_TRACK_0075
     * @tc.desc   Verify static Annotation coverage for decorator.global.Track
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_TRACK_0075',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          75, 'decorator#global#Track#Annotation');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_OBJECTLINK_0076
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_OBJECTLINK_0076
     * @tc.desc   Verify static Annotation coverage for decorator.global.ObjectLink
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_OBJECTLINK_0076',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          76, 'decorator#global#ObjectLink#Annotation');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_STORAGEPROPREF_0077
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_STORAGEPROPREF_0077
     * @tc.desc   Verify static Annotation coverage for decorator.global.StoragePropRef
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_STORAGEPROPREF_0077',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          77, 'decorator#global#StoragePropRef#Annotation');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_STORAGEPROPREF_PROPERTY_0078
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_STORAGEPROPREF_PROPERTY_0078
     * @tc.desc   Verify static Property coverage for decorator.StoragePropRef.property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_STORAGEPROPREF_PROPERTY_0078',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          78, 'decorator#StoragePropRef#property#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_STORAGELINK_PROPERTY_0079
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_STORAGELINK_PROPERTY_0079
     * @tc.desc   Verify static Property coverage for decorator.StorageLink.property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_STORAGELINK_PROPERTY_0079',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          79, 'decorator#StorageLink#property#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_LOCALSTORAGEPROPREF_PROPERTY_0080
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_LOCALSTORAGEPROPREF_PROPERTY_0080
     * @tc.desc   Verify static Property coverage for decorator.LocalStoragePropRef.property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_LOCALSTORAGEPROPREF_PROPERTY_0080',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          80, 'decorator#LocalStoragePropRef#property#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_LOCALSTORAGELINK_PROPERTY_0081
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_LOCALSTORAGELINK_PROPERTY_0081
     * @tc.desc   Verify static Property coverage for decorator.LocalStorageLink.property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_LOCALSTORAGELINK_PROPERTY_0081',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          81, 'decorator#LocalStorageLink#property#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_PROVIDE_ALIAS_0082
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_PROVIDE_ALIAS_0082
     * @tc.desc   Verify static Property coverage for decorator.Provide.alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_PROVIDE_ALIAS_0082',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          82, 'decorator#Provide#alias#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_PROVIDE_ALLOWOVERRIDE_0083
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_PROVIDE_ALLOWOVERRIDE_0083
     * @tc.desc   Verify static Property coverage for decorator.Provide.allowOverride
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_PROVIDE_ALLOWOVERRIDE_0083',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          83, 'decorator#Provide#allowOverride#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_CONSUME_ALIAS_0084
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_CONSUME_ALIAS_0084
     * @tc.desc   Verify static Property coverage for decorator.Consume.alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_CONSUME_ALIAS_0084',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          84, 'decorator#Consume#alias#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_WATCH_0085
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_WATCH_0085
     * @tc.desc   Verify static Annotation coverage for decorator.global.Watch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_WATCH_0085',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          85, 'decorator#global#Watch#Annotation');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_WATCH_CALLBACK_0086
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_WATCH_CALLBACK_0086
     * @tc.desc   Verify static Property coverage for decorator.Watch.callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_WATCH_CALLBACK_0086',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          86, 'decorator#Watch#callback#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_REQUIRE_0087
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_REQUIRE_0087
     * @tc.desc   Verify static Annotation coverage for decorator.global.Require
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_REQUIRE_0087',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          87, 'decorator#global#Require#Annotation');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_LOCAL_0088
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_LOCAL_0088
     * @tc.desc   Verify static Annotation coverage for decorator.global.Local
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_LOCAL_0088',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          88, 'decorator#global#Local#Annotation');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_ONCE_0089
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_ONCE_0089
     * @tc.desc   Verify static Annotation coverage for decorator.global.Once
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_ONCE_0089',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          89, 'decorator#global#Once#Annotation');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_EVENT_0090
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_EVENT_0090
     * @tc.desc   Verify static Annotation coverage for decorator.global.Event
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_EVENT_0090',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          90, 'decorator#global#Event#Annotation');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_PROVIDER_0091
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_PROVIDER_0091
     * @tc.desc   Verify static Annotation coverage for decorator.global.Provider
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_PROVIDER_0091',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          91, 'decorator#global#Provider#Annotation');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_PROVIDER_ALIAS_0092
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_PROVIDER_ALIAS_0092
     * @tc.desc   Verify static Property coverage for decorator.Provider.alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_PROVIDER_ALIAS_0092',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          92, 'decorator#Provider#alias#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_CONSUMER_0093
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_CONSUMER_0093
     * @tc.desc   Verify static Annotation coverage for decorator.global.Consumer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_CONSUMER_0093',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          93, 'decorator#global#Consumer#Annotation');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_CONSUMER_ALIAS_0094
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_CONSUMER_ALIAS_0094
     * @tc.desc   Verify static Property coverage for decorator.Consumer.alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_CONSUMER_ALIAS_0094',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          94, 'decorator#Consumer#alias#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPUTED_0095
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPUTED_0095
     * @tc.desc   Verify static Annotation coverage for decorator.global.Computed
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPUTED_0095',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          95, 'decorator#global#Computed#Annotation');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_MONITOR_0096
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_MONITOR_0096
     * @tc.desc   Verify static Annotation coverage for decorator.global.Monitor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_MONITOR_0096',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          96, 'decorator#global#Monitor#Annotation');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_MONITOR_PATH_0097
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_MONITOR_PATH_0097
     * @tc.desc   Verify static Property coverage for decorator.Monitor.path
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_MONITOR_PATH_0097',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          97, 'decorator#Monitor#path#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_ENV_0098
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_ENV_0098
     * @tc.desc   Verify static Annotation coverage for decorator.global.Env
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_ENV_0098',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          98, 'decorator#global#Env#Annotation');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_ENV_VALUE_0099
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_ENV_VALUE_0099
     * @tc.desc   Verify static Property coverage for decorator.Env.value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_ENV_VALUE_0099',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          99, 'decorator#Env#value#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_SYNCMONITOR_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_SYNCMONITOR_0100
     * @tc.desc   Verify static Annotation coverage for decorator.global.SyncMonitor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_SYNCMONITOR_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          100, 'decorator#global#SyncMonitor#Annotation');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_SYNCMONITOR_PATH_0101
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_SYNCMONITOR_PATH_0101
     * @tc.desc   Verify static Property coverage for decorator.SyncMonitor.path
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_SYNCMONITOR_PATH_0101',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          101, 'decorator#SyncMonitor#path#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_IMONITOR_0102
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_IMONITOR_0102
     * @tc.desc   Verify static Interface coverage for decorator.global.IMonitor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_IMONITOR_0102',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          102, 'decorator#global#IMonitor#Interface');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_IMONITOR_DIRTY_0103
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_IMONITOR_DIRTY_0103
     * @tc.desc   Verify static Property coverage for decorator.IMonitor.dirty
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_IMONITOR_DIRTY_0103',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          103, 'decorator#IMonitor#dirty#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_IMONITOR_VALUE_0104
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_IMONITOR_VALUE_0104
     * @tc.desc   Verify static Method coverage for decorator.IMonitor.value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_IMONITOR_VALUE_0104',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          104, 'decorator#IMonitor#value#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTINIT_0105
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTINIT_0105
     * @tc.desc   Verify static Annotation coverage for decorator.global.ComponentInit
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTINIT_0105',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          105, 'decorator#global#ComponentInit#Annotation');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTAPPEAR_0106
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTAPPEAR_0106
     * @tc.desc   Verify static Annotation coverage for decorator.global.ComponentAppear
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTAPPEAR_0106',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          106, 'decorator#global#ComponentAppear#Annotation');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTBUILT_0107
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTBUILT_0107
     * @tc.desc   Verify static Annotation coverage for decorator.global.ComponentBuilt
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTBUILT_0107',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          107, 'decorator#global#ComponentBuilt#Annotation');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTREUSE_0108
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTREUSE_0108
     * @tc.desc   Verify static Annotation coverage for decorator.global.ComponentReuse
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTREUSE_0108',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          108, 'decorator#global#ComponentReuse#Annotation');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTRECYCLE_0109
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTRECYCLE_0109
     * @tc.desc   Verify static Annotation coverage for decorator.global.ComponentRecycle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTRECYCLE_0109',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          109, 'decorator#global#ComponentRecycle#Annotation');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTDISAPPEAR_0110
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTDISAPPEAR_0110
     * @tc.desc   Verify static Annotation coverage for decorator.global.ComponentDisappear
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTDISAPPEAR_0110',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          110, 'decorator#global#ComponentDisappear#Annotation');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTACTIVE_0111
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTACTIVE_0111
     * @tc.desc   Verify static Annotation coverage for decorator.global.ComponentActive
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTACTIVE_0111',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          111, 'decorator#global#ComponentActive#Annotation');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTINACTIVE_0112
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTINACTIVE_0112
     * @tc.desc   Verify static Annotation coverage for decorator.global.ComponentInactive
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTINACTIVE_0112',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          112, 'decorator#global#ComponentInactive#Annotation');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_IDECORATEDVARIABLE_VARNAME_0113
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_IDECORATEDVARIABLE_VARNAME_0113
     * @tc.desc   Verify static Property coverage for decorator.IDecoratedVariable.varName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_IDECORATEDVARIABLE_VARNAME_0113',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          113, 'decorator#IDecoratedVariable#varName#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_LINKSOURCETYPE_0114
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_LINKSOURCETYPE_0114
     * @tc.desc   Verify static TypeAlias coverage for decorator.global.LinkSourceType
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_LINKSOURCETYPE_0114',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          114, 'decorator#global#LinkSourceType#TypeAlias');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_OBSERVE_0115
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_OBSERVE_0115
     * @tc.desc   Verify static Property coverage for decorator.global.OBSERVE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_OBSERVE_0115',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          115, 'decorator#global#OBSERVE#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_RENDERIDTYPE_0116
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_RENDERIDTYPE_0116
     * @tc.desc   Verify static TypeAlias coverage for decorator.global.RenderIdType
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_RENDERIDTYPE_0116',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          116, 'decorator#global#RenderIdType#TypeAlias');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_IOBSERVEDOBJECT_SETV1RENDERID_0117
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_IOBSERVEDOBJECT_SETV1RENDERID_0117
     * @tc.desc   Verify static Method coverage for decorator.IObservedObject.setV1RenderId
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_IOBSERVEDOBJECT_SETV1RENDERID_0117',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          117, 'decorator#IObservedObject#setV1RenderId#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_CONSUMEOPTIONS_0118
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_CONSUMEOPTIONS_0118
     * @tc.desc   Verify static Interface coverage for decorator.global.ConsumeOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_CONSUMEOPTIONS_0118',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          118, 'decorator#global#ConsumeOptions#Interface');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_CONSUMEOPTIONS_DEFAULTVALUE_0119
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_CONSUMEOPTIONS_DEFAULTVALUE_0119
     * @tc.desc   Verify static Property coverage for decorator.ConsumeOptions.defaultValue
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_CONSUMEOPTIONS_DEFAULTVALUE_0119',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          119, 'decorator#ConsumeOptions#defaultValue#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_STATE_MGMT_FACTORY_0120
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_STATE_MGMT_FACTORY_0120
     * @tc.desc   Verify static Property coverage for decorator.global.STATE_MGMT_FACTORY
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_STATE_MGMT_FACTORY_0120',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          120, 'decorator#global#STATE_MGMT_FACTORY#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPUTEDCALLBACK_0121
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPUTEDCALLBACK_0121
     * @tc.desc   Verify static TypeAlias coverage for decorator.global.ComputedCallback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPUTEDCALLBACK_0121',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          121, 'decorator#global#ComputedCallback#TypeAlias');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_MONITORCALLBACK_0122
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_MONITORCALLBACK_0122
     * @tc.desc   Verify static TypeAlias coverage for decorator.global.MonitorCallback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_MONITORCALLBACK_0122',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          122, 'decorator#global#MonitorCallback#TypeAlias');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_WATCHFUNCTYPE_0123
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_WATCHFUNCTYPE_0123
     * @tc.desc   Verify static TypeAlias coverage for decorator.global.WatchFuncType
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_WATCHFUNCTYPE_0123',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          123, 'decorator#global#WatchFuncType#TypeAlias');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_WATCHIDTYPE_0124
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_WATCHIDTYPE_0124
     * @tc.desc   Verify static TypeAlias coverage for decorator.global.WatchIdType
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_WATCHIDTYPE_0124',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          124, 'decorator#global#WatchIdType#TypeAlias');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_MAKEMONITOROPTIONS_0125
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_MAKEMONITOROPTIONS_0125
     * @tc.desc   Verify static Interface coverage for decorator.global.MakeMonitorOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_MAKEMONITOROPTIONS_0125',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          125, 'decorator#global#MakeMonitorOptions#Interface');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_MAKEMONITOROPTIONS_OWNER_0126
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_MAKEMONITOROPTIONS_OWNER_0126
     * @tc.desc   Verify static Property coverage for decorator.MakeMonitorOptions.owner
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_MAKEMONITOROPTIONS_OWNER_0126',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          126, 'decorator#MakeMonitorOptions#owner#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_MAKEMONITOROPTIONS_FUNCTIONNAME_0127
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_MAKEMONITOROPTIONS_FUNCTIONNAME_0127
     * @tc.desc   Verify static Property coverage for decorator.MakeMonitorOptions.functionName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_MAKEMONITOROPTIONS_FUNCTIONNAME_0127',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          127, 'decorator#MakeMonitorOptions#functionName#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_ENVOPTIONS_0128
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_ENVOPTIONS_0128
     * @tc.desc   Verify static Interface coverage for decorator.global.EnvOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_ENVOPTIONS_0128',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          128, 'decorator#global#EnvOptions#Interface');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_ENVOPTIONS_INITVALUE_0129
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_ENVOPTIONS_INITVALUE_0129
     * @tc.desc   Verify static Property coverage for decorator.EnvOptions.initValue
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_ENVOPTIONS_INITVALUE_0129',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          129, 'decorator#EnvOptions#initValue#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_CUSTOMENVOPTIONS_0130
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_CUSTOMENVOPTIONS_0130
     * @tc.desc   Verify static Interface coverage for decorator.global.CustomEnvOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_CUSTOMENVOPTIONS_0130',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          130, 'decorator#global#CustomEnvOptions#Interface');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_WRITABLEENVKEY_0131
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_WRITABLEENVKEY_0131
     * @tc.desc   Verify static Class coverage for decorator.global.WritableEnvKey
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_WRITABLEENVKEY_0131',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          131, 'decorator#global#WritableEnvKey#Class');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_WRITABLEENVKEY_DIRECTION_0132
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_WRITABLEENVKEY_DIRECTION_0132
     * @tc.desc   Verify static Property coverage for decorator.WritableEnvKey.DIRECTION
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_WRITABLEENVKEY_DIRECTION_0132',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          132, 'decorator#WritableEnvKey#DIRECTION#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_WRITABLEENVKEY_FONT_SCALE_0133
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_WRITABLEENVKEY_FONT_SCALE_0133
     * @tc.desc   Verify static Property coverage for decorator.WritableEnvKey.FONT_SCALE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_WRITABLEENVKEY_FONT_SCALE_0133',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          133, 'decorator#WritableEnvKey#FONT_SCALE#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_READONLYENVKEY_0134
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_READONLYENVKEY_0134
     * @tc.desc   Verify static Class coverage for decorator.global.ReadonlyEnvKey
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_READONLYENVKEY_0134',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          134, 'decorator#global#ReadonlyEnvKey#Class');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_CUSTOMENV_VALUE_0135
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_CUSTOMENV_VALUE_0135
     * @tc.desc   Verify static Property coverage for decorator.CustomEnv.value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_CUSTOMENV_VALUE_0135',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          135, 'decorator#CustomEnv#value#Property');
        expect(passed).assertTrue();
      }
    );
  });
}
