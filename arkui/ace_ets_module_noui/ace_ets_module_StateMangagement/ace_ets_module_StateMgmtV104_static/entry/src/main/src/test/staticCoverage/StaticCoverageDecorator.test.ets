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
import {
  ConsumeOptions, CustomEnvOptions, EnvOptions, IDecoratedVariable, IMonitor,
  IObservedObject, LinkSourceType, MakeMonitorOptions, MonitorCallback, OBSERVE,
  ReadonlyEnvKey, RenderIdType, STATE_MGMT_FACTORY, WatchFuncType, WatchIdType,
  WritableEnvKey
} from '@kit.ArkUI';
import { staticCoverageFixtureReady } from './StaticCoverageFixture';
import {
  CoverageDecoratedVariable, CoverageOwner
} from './StaticCoverageSupport';

export default function StaticCoverageDecoratorTest(): void {
  describe('StaticCoverageDecoratorTest', (): void => {
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_OBSERVED_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_OBSERVED_0100
     * @tc.desc   Verify static Annotation coverage for decorator.global.Observed
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_OBSERVED_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_TRACK_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_TRACK_0100
     * @tc.desc   Verify static Annotation coverage for decorator.global.Track
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_TRACK_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_OBJECTLINK_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_OBJECTLINK_0100
     * @tc.desc   Verify static Annotation coverage for decorator.global.ObjectLink
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_OBJECTLINK_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_STORAGEPROPREF_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_STORAGEPROPREF_0100
     * @tc.desc   Verify static Annotation coverage for decorator.global.StoragePropRef
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_STORAGEPROPREF_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_STORAGEPROPREF_PROPERTY_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_STORAGEPROPREF_PROPERTY_0100
     * @tc.desc   Verify static Property coverage for decorator.StoragePropRef.property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_STORAGEPROPREF_PROPERTY_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_STORAGELINK_PROPERTY_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_STORAGELINK_PROPERTY_0100
     * @tc.desc   Verify static Property coverage for decorator.StorageLink.property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_STORAGELINK_PROPERTY_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_LOCALSTORAGEPROPREF_PROPERTY_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_LOCALSTORAGEPROPREF_PROPERTY_0100
     * @tc.desc   Verify static Property coverage for decorator.LocalStoragePropRef.property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_LOCALSTORAGEPROPREF_PROPERTY_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_LOCALSTORAGELINK_PROPERTY_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_LOCALSTORAGELINK_PROPERTY_0100
     * @tc.desc   Verify static Property coverage for decorator.LocalStorageLink.property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_LOCALSTORAGELINK_PROPERTY_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_PROVIDE_ALIAS_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_PROVIDE_ALIAS_0100
     * @tc.desc   Verify static Property coverage for decorator.Provide.alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_PROVIDE_ALIAS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_PROVIDE_ALLOWOVERRIDE_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_PROVIDE_ALLOWOVERRIDE_0100
     * @tc.desc   Verify static Property coverage for decorator.Provide.allowOverride
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_PROVIDE_ALLOWOVERRIDE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_CONSUME_ALIAS_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_CONSUME_ALIAS_0100
     * @tc.desc   Verify static Property coverage for decorator.Consume.alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_CONSUME_ALIAS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_WATCH_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_WATCH_0100
     * @tc.desc   Verify static Annotation coverage for decorator.global.Watch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_WATCH_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_WATCH_CALLBACK_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_WATCH_CALLBACK_0100
     * @tc.desc   Verify static Property coverage for decorator.Watch.callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_WATCH_CALLBACK_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_REQUIRE_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_REQUIRE_0100
     * @tc.desc   Verify static Annotation coverage for decorator.global.Require
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_REQUIRE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_LOCAL_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_LOCAL_0100
     * @tc.desc   Verify static Annotation coverage for decorator.global.Local
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_LOCAL_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_ONCE_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_ONCE_0100
     * @tc.desc   Verify static Annotation coverage for decorator.global.Once
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_ONCE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_EVENT_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_EVENT_0100
     * @tc.desc   Verify static Annotation coverage for decorator.global.Event
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_EVENT_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_PROVIDER_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_PROVIDER_0100
     * @tc.desc   Verify static Annotation coverage for decorator.global.Provider
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_PROVIDER_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_PROVIDER_ALIAS_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_PROVIDER_ALIAS_0100
     * @tc.desc   Verify static Property coverage for decorator.Provider.alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_PROVIDER_ALIAS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_CONSUMER_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_CONSUMER_0100
     * @tc.desc   Verify static Annotation coverage for decorator.global.Consumer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_CONSUMER_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_CONSUMER_ALIAS_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_CONSUMER_ALIAS_0100
     * @tc.desc   Verify static Property coverage for decorator.Consumer.alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_CONSUMER_ALIAS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPUTED_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPUTED_0100
     * @tc.desc   Verify static Annotation coverage for decorator.global.Computed
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPUTED_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_MONITOR_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_MONITOR_0100
     * @tc.desc   Verify static Annotation coverage for decorator.global.Monitor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_MONITOR_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_MONITOR_PATH_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_MONITOR_PATH_0100
     * @tc.desc   Verify static Property coverage for decorator.Monitor.path
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_MONITOR_PATH_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_ENV_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_ENV_0100
     * @tc.desc   Verify static Annotation coverage for decorator.global.Env
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_ENV_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_ENV_VALUE_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_ENV_VALUE_0100
     * @tc.desc   Verify static Property coverage for decorator.Env.value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_ENV_VALUE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
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
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_SYNCMONITOR_PATH_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_SYNCMONITOR_PATH_0100
     * @tc.desc   Verify static Property coverage for decorator.SyncMonitor.path
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_SYNCMONITOR_PATH_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_IMONITOR_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_IMONITOR_0100
     * @tc.desc   Verify static Interface coverage for decorator.global.IMonitor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_IMONITOR_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let monitor: IMonitor | undefined = undefined;
        expect(monitor === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_IMONITOR_DIRTY_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_IMONITOR_DIRTY_0100
     * @tc.desc   Verify static Property coverage for decorator.IMonitor.dirty
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_IMONITOR_DIRTY_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const readDirty = (monitor: IMonitor): int => monitor.dirty.length;
        expect(readDirty !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_IMONITOR_VALUE_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_IMONITOR_VALUE_0100
     * @tc.desc   Verify static Method coverage for decorator.IMonitor.value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_IMONITOR_VALUE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const readValue = (monitor: IMonitor): boolean => monitor.value<int>('value') === undefined;
        expect(readValue !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTINIT_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTINIT_0100
     * @tc.desc   Verify static Annotation coverage for decorator.global.ComponentInit
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTINIT_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTAPPEAR_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTAPPEAR_0100
     * @tc.desc   Verify static Annotation coverage for decorator.global.ComponentAppear
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTAPPEAR_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTBUILT_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTBUILT_0100
     * @tc.desc   Verify static Annotation coverage for decorator.global.ComponentBuilt
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTBUILT_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTREUSE_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTREUSE_0100
     * @tc.desc   Verify static Annotation coverage for decorator.global.ComponentReuse
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTREUSE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTRECYCLE_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTRECYCLE_0100
     * @tc.desc   Verify static Annotation coverage for decorator.global.ComponentRecycle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTRECYCLE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTDISAPPEAR_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTDISAPPEAR_0100
     * @tc.desc   Verify static Annotation coverage for decorator.global.ComponentDisappear
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTDISAPPEAR_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTACTIVE_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTACTIVE_0100
     * @tc.desc   Verify static Annotation coverage for decorator.global.ComponentActive
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTACTIVE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTINACTIVE_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTINACTIVE_0100
     * @tc.desc   Verify static Annotation coverage for decorator.global.ComponentInactive
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPONENTINACTIVE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_IDECORATEDVARIABLE_VARNAME_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_IDECORATEDVARIABLE_VARNAME_0100
     * @tc.desc   Verify static Property coverage for decorator.IDecoratedVariable.varName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_IDECORATEDVARIABLE_VARNAME_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const variable: IDecoratedVariable = new CoverageDecoratedVariable();
        expect(variable.varName === 'staticCoverage').assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_LINKSOURCETYPE_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_LINKSOURCETYPE_0100
     * @tc.desc   Verify static TypeAlias coverage for decorator.global.LinkSourceType
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_LINKSOURCETYPE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let source: LinkSourceType<int> | undefined = undefined;
        expect(source === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_OBSERVE_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_OBSERVE_0100
     * @tc.desc   Verify static Property coverage for decorator.global.OBSERVE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_OBSERVE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(OBSERVE.renderingComponent >= -1).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_RENDERIDTYPE_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_RENDERIDTYPE_0100
     * @tc.desc   Verify static TypeAlias coverage for decorator.global.RenderIdType
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_RENDERIDTYPE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const renderId: RenderIdType = 26;
        expect(renderId === 26).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_IOBSERVEDOBJECT_SETV1RENDERID_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_IOBSERVEDOBJECT_SETV1RENDERID_0100
     * @tc.desc   Verify static Method coverage for decorator.IObservedObject.setV1RenderId
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_IOBSERVEDOBJECT_SETV1RENDERID_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let observed: IObservedObject | undefined = undefined;
        expect(observed === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_CONSUMEOPTIONS_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_CONSUMEOPTIONS_0100
     * @tc.desc   Verify static Interface coverage for decorator.global.ConsumeOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_CONSUMEOPTIONS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const options: ConsumeOptions<int> = { defaultValue: 1 };
        expect(options.defaultValue === 1).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_CONSUMEOPTIONS_DEFAULTVALUE_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_CONSUMEOPTIONS_DEFAULTVALUE_0100
     * @tc.desc   Verify static Property coverage for decorator.ConsumeOptions.defaultValue
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_CONSUMEOPTIONS_DEFAULTVALUE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const options: ConsumeOptions<int> = { defaultValue: 1 };
        expect(options.defaultValue === 1).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_STATE_MGMT_FACTORY_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_STATE_MGMT_FACTORY_0100
     * @tc.desc   Verify static Property coverage for decorator.global.STATE_MGMT_FACTORY
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_STATE_MGMT_FACTORY_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(STATE_MGMT_FACTORY !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPUTEDCALLBACK_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPUTEDCALLBACK_0100
     * @tc.desc   Verify static TypeAlias coverage for decorator.global.ComputedCallback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_COMPUTEDCALLBACK_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_MONITORCALLBACK_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_MONITORCALLBACK_0100
     * @tc.desc   Verify static TypeAlias coverage for decorator.global.MonitorCallback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_MONITORCALLBACK_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const callback: MonitorCallback = (_monitor: IMonitor): void => {};
        expect(callback !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_WATCHFUNCTYPE_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_WATCHFUNCTYPE_0100
     * @tc.desc   Verify static TypeAlias coverage for decorator.global.WatchFuncType
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_WATCHFUNCTYPE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let name: string = '';
        const callback: WatchFuncType = (propertyName: string): void => { name = propertyName; };
        callback('value');
        expect(name === 'value').assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_WATCHIDTYPE_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_WATCHIDTYPE_0100
     * @tc.desc   Verify static TypeAlias coverage for decorator.global.WatchIdType
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_WATCHIDTYPE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const watchId: WatchIdType = 1;
        expect(watchId === 1).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_MAKEMONITOROPTIONS_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_MAKEMONITOROPTIONS_0100
     * @tc.desc   Verify static Interface coverage for decorator.global.MakeMonitorOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_MAKEMONITOROPTIONS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const options: MakeMonitorOptions = {
          owner: new CoverageOwner(), functionName: 'staticCoverageMonitor'
        };
        expect(options.functionName !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_MAKEMONITOROPTIONS_OWNER_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_MAKEMONITOROPTIONS_OWNER_0100
     * @tc.desc   Verify static Property coverage for decorator.MakeMonitorOptions.owner
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_MAKEMONITOROPTIONS_OWNER_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const options: MakeMonitorOptions = { owner: new CoverageOwner() };
        expect(options.owner !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_MAKEMONITOROPTIONS_FUNCTIONNAME_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_MAKEMONITOROPTIONS_FUNCTIONNAME_0100
     * @tc.desc   Verify static Property coverage for decorator.MakeMonitorOptions.functionName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_MAKEMONITOROPTIONS_FUNCTIONNAME_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const options: MakeMonitorOptions = {
          owner: new CoverageOwner(), functionName: 'staticCoverageMonitor'
        };
        expect(options.functionName === 'staticCoverageMonitor').assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_ENVOPTIONS_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_ENVOPTIONS_0100
     * @tc.desc   Verify static Interface coverage for decorator.global.EnvOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_ENVOPTIONS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const options: EnvOptions<int> = { initValue: 2 };
        expect(options.initValue === 2).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_ENVOPTIONS_INITVALUE_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_ENVOPTIONS_INITVALUE_0100
     * @tc.desc   Verify static Property coverage for decorator.EnvOptions.initValue
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_ENVOPTIONS_INITVALUE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const options: EnvOptions<int> = { initValue: 2 };
        expect(options.initValue === 2).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_CUSTOMENVOPTIONS_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_CUSTOMENVOPTIONS_0100
     * @tc.desc   Verify static Interface coverage for decorator.global.CustomEnvOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_CUSTOMENVOPTIONS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const options: CustomEnvOptions<int> = {
          watchFunc: (_propertyName: string): void => {}
        };
        expect(options.watchFunc !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_WRITABLEENVKEY_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_WRITABLEENVKEY_0100
     * @tc.desc   Verify static Class coverage for decorator.global.WritableEnvKey
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_WRITABLEENVKEY_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(WritableEnvKey.FONT_SCALE !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_WRITABLEENVKEY_DIRECTION_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_WRITABLEENVKEY_DIRECTION_0100
     * @tc.desc   Verify static Property coverage for decorator.WritableEnvKey.DIRECTION
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_WRITABLEENVKEY_DIRECTION_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(WritableEnvKey.DIRECTION !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_WRITABLEENVKEY_FONT_SCALE_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_WRITABLEENVKEY_FONT_SCALE_0100
     * @tc.desc   Verify static Property coverage for decorator.WritableEnvKey.FONT_SCALE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_WRITABLEENVKEY_FONT_SCALE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(WritableEnvKey.FONT_SCALE !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_GLOBAL_READONLYENVKEY_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_GLOBAL_READONLYENVKEY_0100
     * @tc.desc   Verify static Class coverage for decorator.global.ReadonlyEnvKey
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_GLOBAL_READONLYENVKEY_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(ReadonlyEnvKey.WINDOW_SIZE !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_DECORATOR_CUSTOMENV_VALUE_0100
     * @tc.name   SUB_ARKUI_STCOV_DECORATOR_CUSTOMENV_VALUE_0100
     * @tc.desc   Verify static Property coverage for decorator.CustomEnv.value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_DECORATOR_CUSTOMENV_VALUE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
  });
}
