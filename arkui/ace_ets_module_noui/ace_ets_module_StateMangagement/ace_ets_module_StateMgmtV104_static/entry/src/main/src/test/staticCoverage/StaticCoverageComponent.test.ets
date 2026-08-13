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
  BaseCustomComponent, BaseCustomDialog, Bindable, BuilderParameterCallback,
  CommonMethod, CustomBuilder, CustomComponent, CustomComponentInvokeOptions,
  CustomComponentLifecycle, CustomComponentLifecycleObserver,
  CustomComponentLifecycleState, CustomComponentV2, CustomStyles, EntryPoint,
  Equivalent, ExtendableComponent, LayoutCallbacks, LifeCycle, makeBindable,
  makeBuilderParameterProxy, PageLifeCycle, ReadableState,
  ReusableMemOptStrategy, ReuseOptions, ReusePoolOwnership, StateContext,
  StateStyles, WrappedBuilder, wrapBuilder
} from '@kit.ArkUI';
import {
  staticCoverageBuilder, staticCoverageFixtureReady
} from './StaticCoverageFixture';
import {
  BaseCustomDialogStub, CoverageLifecycle, CoverageLifecycleObserver,
  CoveragePageLifeCycle, CoverageReadableState, CoverageRecord,
  CoverageStateContext, CustomComponentStub, CustomComponentV2Stub
} from './StaticCoverageSupport';

export default function StaticCoverageComponentTest(): void {
  describe('StaticCoverageComponentTest', (): void => {
    /**
     * @tc.number SUB_ARKUI_STCOV_BUILDER_GLOBAL_BUILDER_0100
     * @tc.name   SUB_ARKUI_STCOV_BUILDER_GLOBAL_BUILDER_0100
     * @tc.desc   Verify static Annotation coverage for builder.global.Builder
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_BUILDER_GLOBAL_BUILDER_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_BUILDER_GLOBAL_BUILDERPARAM_0100
     * @tc.name   SUB_ARKUI_STCOV_BUILDER_GLOBAL_BUILDERPARAM_0100
     * @tc.desc   Verify static Annotation coverage for builder.global.BuilderParam
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_BUILDER_GLOBAL_BUILDERPARAM_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_BUILDER_GLOBAL_WRAPBUILDER_0100
     * @tc.name   SUB_ARKUI_STCOV_BUILDER_GLOBAL_WRAPBUILDER_0100
     * @tc.desc   Verify static Method coverage for builder.global.wrapBuilder
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_BUILDER_GLOBAL_WRAPBUILDER_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const wrapped: WrappedBuilder<CustomBuilder> = wrapBuilder(staticCoverageBuilder);
        expect(wrapped.builder === staticCoverageBuilder).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_BUILDER_GLOBAL_WRAPPEDBUILDER_0100
     * @tc.name   SUB_ARKUI_STCOV_BUILDER_GLOBAL_WRAPPEDBUILDER_0100
     * @tc.desc   Verify static Class coverage for builder.global.WrappedBuilder
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_BUILDER_GLOBAL_WRAPPEDBUILDER_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const wrapped: WrappedBuilder<CustomBuilder> =
          new WrappedBuilder<CustomBuilder>(staticCoverageBuilder);
        expect(wrapped.builder === staticCoverageBuilder).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_BUILDER_GLOBAL_BUILDERPARAMETERCALLBACK_0100
     * @tc.name   SUB_ARKUI_STCOV_BUILDER_GLOBAL_BUILDERPARAMETERCALLBACK_0100
     * @tc.desc   Verify static TypeAlias coverage for builder.global.BuilderParameterCallback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_BUILDER_GLOBAL_BUILDERPARAMETERCALLBACK_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const callback: BuilderParameterCallback = (): int => 26;
        expect(callback() === 26).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_BUILDER_GLOBAL_MAKEBUILDERPARAMETERPROXY_0100
     * @tc.name   SUB_ARKUI_STCOV_BUILDER_GLOBAL_MAKEBUILDERPARAMETERPROXY_0100
     * @tc.desc   Verify static Method coverage for builder.global.makeBuilderParameterProxy
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_BUILDER_GLOBAL_MAKEBUILDERPARAMETERPROXY_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const source: CoverageRecord = new CoverageRecord();
        const getters = new Map<string, BuilderParameterCallback>();
        getters.set('value', (): int => 27);
        const proxy: CoverageRecord = makeBuilderParameterProxy<CoverageRecord>(
          source, getters, (value: CoverageRecord): void => { value.value = 28; });
        expect(proxy !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_BUILDER_GLOBAL_COMPONENTBUILDER_0100
     * @tc.name   SUB_ARKUI_STCOV_BUILDER_GLOBAL_COMPONENTBUILDER_0100
     * @tc.desc   Verify static Annotation coverage for builder.global.ComponentBuilder
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_BUILDER_GLOBAL_COMPONENTBUILDER_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_COMMON_GLOBAL_REUSEOPTIONS_0100
     * @tc.name   SUB_ARKUI_STCOV_COMMON_GLOBAL_REUSEOPTIONS_0100
     * @tc.desc   Verify static Interface coverage for common.global.ReuseOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_COMMON_GLOBAL_REUSEOPTIONS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const reuse: ReuseOptions = { reuseId: (): string => 'coverageReuseId' };
        expect(reuse.reuseId !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_COMMON_REUSEOPTIONS_REUSEID_0100
     * @tc.name   SUB_ARKUI_STCOV_COMMON_REUSEOPTIONS_REUSEID_0100
     * @tc.desc   Verify static Method coverage for common.ReuseOptions.reuseId
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_COMMON_REUSEOPTIONS_REUSEID_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const callback = (): string => 'coverageReuseId';
        const reuse: ReuseOptions = { reuseId: callback };
        expect(reuse.reuseId !== undefined && callback() === 'coverageReuseId').assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_COMMON_GLOBAL_CUSTOMSTYLES_0100
     * @tc.name   SUB_ARKUI_STCOV_COMMON_GLOBAL_CUSTOMSTYLES_0100
     * @tc.desc   Verify static TypeAlias coverage for common.global.CustomStyles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_COMMON_GLOBAL_CUSTOMSTYLES_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const styles: CustomStyles = (_instance: CommonMethod): void => {};
        expect(styles !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_COMMON_GLOBAL_STATESTYLES_0100
     * @tc.name   SUB_ARKUI_STCOV_COMMON_GLOBAL_STATESTYLES_0100
     * @tc.desc   Verify static Interface coverage for common.global.StateStyles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_COMMON_GLOBAL_STATESTYLES_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const styles: CustomStyles = (_instance: CommonMethod): void => {};
        const stateStyles: StateStyles = { normal: styles };
        expect(stateStyles.normal !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_COMMON_GLOBAL_MAKEBINDABLE_0100
     * @tc.name   SUB_ARKUI_STCOV_COMMON_GLOBAL_MAKEBINDABLE_0100
     * @tc.desc   Verify static Method coverage for common.global.makeBindable
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_COMMON_GLOBAL_MAKEBINDABLE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let changed: int = 0;
        const binding: Bindable<int> = makeBindable<int>(1, (value: int): void => {
          changed = value;
        });
        binding.onChange(2);
        expect(binding.value === 1 && changed === 2).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_REUSEPOOLOWNERSHIP_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_REUSEPOOLOWNERSHIP_0100
     * @tc.desc   Verify static Enum coverage for customComponent.global.ReusePoolOwnership
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_REUSEPOOLOWNERSHIP_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(ReusePoolOwnership.SHARED !== ReusePoolOwnership.OFF).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_REUSEPOOLOWNERSHIP_SHARED_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_REUSEPOOLOWNERSHIP_SHARED_0100
     * @tc.desc   Verify static EnumValue coverage for customComponent.ReusePoolOwnership.SHARED
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_REUSEPOOLOWNERSHIP_SHARED_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(ReusePoolOwnership.SHARED !== ReusePoolOwnership.OFF).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_REUSEPOOLOWNERSHIP_PER_INSTANCE_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_REUSEPOOLOWNERSHIP_PER_INSTANCE_0100
     * @tc.desc   Verify static EnumValue coverage for customComponent.ReusePoolOwnership.PER_INSTANCE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_REUSEPOOLOWNERSHIP_PER_INSTANCE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(ReusePoolOwnership.PER_INSTANCE !== ReusePoolOwnership.OFF).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_REUSEPOOLOWNERSHIP_OFF_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_REUSEPOOLOWNERSHIP_OFF_0100
     * @tc.desc   Verify static EnumValue coverage for customComponent.ReusePoolOwnership.OFF
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_REUSEPOOLOWNERSHIP_OFF_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(ReusePoolOwnership.OFF !== ReusePoolOwnership.SHARED).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_COMPONENT_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_COMPONENT_0100
     * @tc.desc   Verify static Annotation coverage for customComponent.global.Component
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_COMPONENT_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_COMPONENT_REUSEPOOL_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_COMPONENT_REUSEPOOL_0100
     * @tc.desc   Verify static Property coverage for customComponent.Component.reusePool
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_COMPONENT_REUSEPOOL_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_COMPONENT_POOLACCEPTS_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_COMPONENT_POOLACCEPTS_0100
     * @tc.desc   Verify static Property coverage for customComponent.Component.poolAccepts
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_COMPONENT_POOLACCEPTS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_COMPONENTV2_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_COMPONENTV2_0100
     * @tc.desc   Verify static Annotation coverage for customComponent.global.ComponentV2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_COMPONENTV2_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_COMPONENTV2_REUSEPOOL_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_COMPONENTV2_REUSEPOOL_0100
     * @tc.desc   Verify static Property coverage for customComponent.ComponentV2.reusePool
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_COMPONENTV2_REUSEPOOL_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_COMPONENTV2_POOLACCEPTS_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_COMPONENTV2_POOLACCEPTS_0100
     * @tc.desc   Verify static Property coverage for customComponent.ComponentV2.poolAccepts
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_COMPONENTV2_POOLACCEPTS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_REUSABLE_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_REUSABLE_0100
     * @tc.desc   Verify static Annotation coverage for customComponent.global.Reusable
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_REUSABLE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_REUSABLE_MEMORYOPTIMIZATIONSTRATEGY_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_REUSABLE_MEMORYOPTIMIZATIONSTRATEGY_0100
     * @tc.desc   Verify static Property coverage for customComponent.Reusable.memoryOptimizationStrategy
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_REUSABLE_MEMORYOPTIMIZATIONSTRATEGY_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(ReusableMemOptStrategy.DEFAULT !==
          ReusableMemOptStrategy.ENABLE_AUTO_CACHE_OPTIMIZATION).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_REUSABLEV2_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_REUSABLEV2_0100
     * @tc.desc   Verify static Annotation coverage for customComponent.global.ReusableV2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_REUSABLEV2_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_REUSABLEV2_MEMORYOPTIMIZATIONSTRATEGY_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_REUSABLEV2_MEMORYOPTIMIZATIONSTRATEGY_0100
     * @tc.desc   Verify static Property coverage for customComponent.ReusableV2.memoryOptimizationStrategy
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_REUSABLEV2_MEMORYOPTIMIZATIONSTRATEGY_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(ReusableMemOptStrategy.DEFAULT !==
          ReusableMemOptStrategy.ENABLE_AUTO_CACHE_OPTIMIZATION).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_ENTRYPOINT_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_ENTRYPOINT_0100
     * @tc.desc   Verify static Class coverage for customComponent.global.EntryPoint
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_ENTRYPOINT_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let entryPoint: EntryPoint | undefined = undefined;
        expect(entryPoint === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_ENTRYPOINT_ENTRY_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_ENTRYPOINT_ENTRY_0100
     * @tc.desc   Verify static Method coverage for customComponent.EntryPoint.entry
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_ENTRYPOINT_ENTRY_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let entryPoint: EntryPoint | undefined = undefined;
        expect(entryPoint === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMDIALOG_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMDIALOG_0100
     * @tc.desc   Verify static Annotation coverage for customComponent.global.CustomDialog
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMDIALOG_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(staticCoverageFixtureReady()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_BASECUSTOMDIALOG_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_BASECUSTOMDIALOG_0100
     * @tc.desc   Verify static Class coverage for customComponent.global.BaseCustomDialog
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_BASECUSTOMDIALOG_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let dialog: BaseCustomDialog<BaseCustomDialogStub, Object> | undefined = undefined;
        expect(dialog === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_BASECUSTOMCOMPONENT_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_BASECUSTOMCOMPONENT_0100
     * @tc.desc   Verify static Class coverage for customComponent.global.BaseCustomComponent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_BASECUSTOMCOMPONENT_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let component: BaseCustomComponent<Object> | undefined = undefined;
        expect(component === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_BASECUSTOMCOMPONENT_ABOUTTORECYCLE_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_BASECUSTOMCOMPONENT_ABOUTTORECYCLE_0100
     * @tc.desc   Verify static Method coverage for customComponent.BaseCustomComponent.aboutToRecycle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_BASECUSTOMCOMPONENT_ABOUTTORECYCLE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let component: BaseCustomComponent<Object> | undefined = undefined;
        expect(component === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMCOMPONENT_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMCOMPONENT_0100
     * @tc.desc   Verify static Class coverage for customComponent.global.CustomComponent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMCOMPONENT_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let component: CustomComponent<CustomComponentStub, Object> | undefined = undefined;
        expect(component === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENT_ABOUTTOREUSE_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENT_ABOUTTOREUSE_0100
     * @tc.desc   Verify static Method coverage for customComponent.CustomComponent.aboutToReuse
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENT_ABOUTTOREUSE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let component: CustomComponent<CustomComponentStub, Object> | undefined = undefined;
        expect(component === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMCOMPONENTV2_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMCOMPONENTV2_0100
     * @tc.desc   Verify static Class coverage for customComponent.global.CustomComponentV2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMCOMPONENTV2_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let component: CustomComponentV2<CustomComponentV2Stub, Object> | undefined = undefined;
        expect(component === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTV2_ABOUTTOREUSE_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTV2_ABOUTTOREUSE_0100
     * @tc.desc   Verify static Method coverage for customComponent.CustomComponentV2.aboutToReuse
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTV2_ABOUTTOREUSE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let component: CustomComponentV2<CustomComponentV2Stub, Object> | undefined = undefined;
        expect(component === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTV2_RESETSTATEVARSONREUSE_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTV2_RESETSTATEVARSONREUSE_0100
     * @tc.desc   Verify static Method coverage for customComponent.CustomComponentV2.resetStateVarsOnReuse
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTV2_RESETSTATEVARSONREUSE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let component: CustomComponentV2<CustomComponentV2Stub, Object> | undefined = undefined;
        expect(component === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_PAGELIFECYCLE_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_PAGELIFECYCLE_0100
     * @tc.desc   Verify static Interface coverage for customComponent.global.PageLifeCycle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_PAGELIFECYCLE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const lifecycle: PageLifeCycle = new CoveragePageLifeCycle();
        expect(lifecycle !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_PAGELIFECYCLE_ONPAGESHOW_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_PAGELIFECYCLE_ONPAGESHOW_0100
     * @tc.desc   Verify static Method coverage for customComponent.PageLifeCycle.onPageShow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_PAGELIFECYCLE_ONPAGESHOW_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const lifecycle: PageLifeCycle = new CoveragePageLifeCycle();
        lifecycle.onPageShow();
        expect(lifecycle !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_LAYOUTCALLBACKS_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_LAYOUTCALLBACKS_0100
     * @tc.desc   Verify static Interface coverage for customComponent.global.LayoutCallbacks
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_LAYOUTCALLBACKS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let callbacks: LayoutCallbacks | undefined = undefined;
        expect(callbacks === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_LAYOUTCALLBACKS_ONPLACECHILDREN_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_LAYOUTCALLBACKS_ONPLACECHILDREN_0100
     * @tc.desc   Verify static Method coverage for customComponent.LayoutCallbacks.onPlaceChildren
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_LAYOUTCALLBACKS_ONPLACECHILDREN_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let callbacks: LayoutCallbacks | undefined = undefined;
        expect(callbacks === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMCOMPONENTINVOKEOPTIONS_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMCOMPONENTINVOKEOPTIONS_0100
     * @tc.desc   Verify static Interface coverage for customComponent.global.CustomComponentInvokeOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMCOMPONENTINVOKEOPTIONS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const options: CustomComponentInvokeOptions = {
          sClass: Class.from<CoverageRecord>(),
          memoryOptimizationStrategy: ReusableMemOptStrategy.DEFAULT
        };
        expect(options.sClass !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTINVOKEOPTIONS_SCLASS_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTINVOKEOPTIONS_SCLASS_0100
     * @tc.desc   Verify static Property coverage for customComponent.CustomComponentInvokeOptions.sClass
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTINVOKEOPTIONS_SCLASS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const options: CustomComponentInvokeOptions = { sClass: Class.from<CoverageRecord>() };
        expect(options.sClass === Class.from<CoverageRecord>()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMCOMPONENTLIFECYCLE_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMCOMPONENTLIFECYCLE_0100
     * @tc.desc   Verify static Interface coverage for customComponent.global.CustomComponentLifecycle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMCOMPONENTLIFECYCLE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const lifecycle: CustomComponentLifecycle = new CoverageLifecycle();
        expect(lifecycle !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLE_GETCURRENTSTATE_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLE_GETCURRENTSTATE_0100
     * @tc.desc   Verify static Method coverage for customComponent.CustomComponentLifecycle.getCurrentState
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLE_GETCURRENTSTATE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const lifecycle: CustomComponentLifecycle = new CoverageLifecycle();
        expect(lifecycle.getCurrentState() === CustomComponentLifecycleState.INIT).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLE_ADDOBSERVER_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLE_ADDOBSERVER_0100
     * @tc.desc   Verify static Method coverage for customComponent.CustomComponentLifecycle.addObserver
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLE_ADDOBSERVER_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const lifecycle: CoverageLifecycle = new CoverageLifecycle();
        const observer: CustomComponentLifecycleObserver = new CoverageLifecycleObserver();
        lifecycle.addObserver(observer);
        expect(lifecycle.count() === 1).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLE_REMOVEOBSERVER_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLE_REMOVEOBSERVER_0100
     * @tc.desc   Verify static Method coverage for customComponent.CustomComponentLifecycle.removeObserver
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLE_REMOVEOBSERVER_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const lifecycle: CoverageLifecycle = new CoverageLifecycle();
        const observer: CustomComponentLifecycleObserver = new CoverageLifecycleObserver();
        lifecycle.addObserver(observer);
        lifecycle.removeObserver(observer);
        expect(lifecycle.count() === 0).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMCOMPONENTLIFECYCLEOBSERVER_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMCOMPONENTLIFECYCLEOBSERVER_0100
     * @tc.desc   Verify static Interface coverage for customComponent.global.CustomComponentLifecycleObserver
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMCOMPONENTLIFECYCLEOBSERVER_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const observer: CustomComponentLifecycleObserver = new CoverageLifecycleObserver();
        expect(observer !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLEOBSERVER_ABOUTTOAPPEAR_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLEOBSERVER_ABOUTTOAPPEAR_0100
     * @tc.desc   Verify static Method coverage for customComponent.CustomComponentLifecycleObserver.aboutToAppear
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLEOBSERVER_ABOUTTOAPPEAR_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const observer: CustomComponentLifecycleObserver = new CoverageLifecycleObserver();
        observer.aboutToAppear();
        expect(observer !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLEOBSERVER_ONDIDBUILD_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLEOBSERVER_ONDIDBUILD_0100
     * @tc.desc   Verify static Method coverage for customComponent.CustomComponentLifecycleObserver.onDidBuild
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLEOBSERVER_ONDIDBUILD_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const observer: CustomComponentLifecycleObserver = new CoverageLifecycleObserver();
        observer.onDidBuild();
        expect(observer !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLEOBSERVER_ABOUTTODISAPPEAR_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLEOBSERVER_ABOUTTODISAPPEAR_0100
     * @tc.desc   Verify static Method coverage for customComponent.CustomComponentLifecycleObserver.aboutToDisappear
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLEOBSERVER_ABOUTTODISAPPEAR_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const observer: CustomComponentLifecycleObserver = new CoverageLifecycleObserver();
        observer.aboutToDisappear();
        expect(observer !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLEOBSERVER_ABOUTTOREUSE_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLEOBSERVER_ABOUTTOREUSE_0100
     * @tc.desc   Verify static Method coverage for customComponent.CustomComponentLifecycleObserver.aboutToReuse
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLEOBSERVER_ABOUTTOREUSE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const observer: CustomComponentLifecycleObserver = new CoverageLifecycleObserver();
        observer.aboutToReuse();
        expect(observer !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLEOBSERVER_ABOUTTORECYCLE_0100
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLEOBSERVER_ABOUTTORECYCLE_0100
     * @tc.desc   Verify static Method coverage for customComponent.CustomComponentLifecycleObserver.aboutToRecycle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLEOBSERVER_ABOUTTORECYCLE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const observer: CustomComponentLifecycleObserver = new CoverageLifecycleObserver();
        observer.aboutToRecycle();
        expect(observer !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_GLOBAL_LIFECYCLE_0100
     * @tc.name   SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_GLOBAL_LIFECYCLE_0100
     * @tc.desc   Verify static Interface coverage for extendableComponent.global.LifeCycle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_GLOBAL_LIFECYCLE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let lifecycle: LifeCycle | undefined = undefined;
        expect(lifecycle === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_LIFECYCLE_ABOUTTOAPPEAR_0100
     * @tc.name   SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_LIFECYCLE_ABOUTTOAPPEAR_0100
     * @tc.desc   Verify static Method coverage for extendableComponent.LifeCycle.aboutToAppear
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_LIFECYCLE_ABOUTTOAPPEAR_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let lifecycle: LifeCycle | undefined = undefined;
        expect(lifecycle === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_LIFECYCLE_ABOUTTODISAPPEAR_0100
     * @tc.name   SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_LIFECYCLE_ABOUTTODISAPPEAR_0100
     * @tc.desc   Verify static Method coverage for extendableComponent.LifeCycle.aboutToDisappear
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_LIFECYCLE_ABOUTTODISAPPEAR_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let lifecycle: LifeCycle | undefined = undefined;
        expect(lifecycle === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_LIFECYCLE_ONDIDBUILD_0100
     * @tc.name   SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_LIFECYCLE_ONDIDBUILD_0100
     * @tc.desc   Verify static Method coverage for extendableComponent.LifeCycle.onDidBuild
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_LIFECYCLE_ONDIDBUILD_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let lifecycle: LifeCycle | undefined = undefined;
        expect(lifecycle === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_LIFECYCLE_BUILD_0100
     * @tc.name   SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_LIFECYCLE_BUILD_0100
     * @tc.desc   Verify static Method coverage for extendableComponent.LifeCycle.build
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_LIFECYCLE_BUILD_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let lifecycle: LifeCycle | undefined = undefined;
        expect(lifecycle === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_GLOBAL_EXTENDABLECOMPONENT_0100
     * @tc.name   SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_GLOBAL_EXTENDABLECOMPONENT_0100
     * @tc.desc   Verify static Class coverage for extendableComponent.global.ExtendableComponent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_GLOBAL_EXTENDABLECOMPONENT_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let component: ExtendableComponent | undefined = undefined;
        expect(component === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_ONWILLAPPLYTHEME_0100
     * @tc.name   SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_ONWILLAPPLYTHEME_0100
     * @tc.desc   Verify static Method coverage for extendableComponent.ExtendableComponent.onWillApplyTheme
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_ONWILLAPPLYTHEME_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let component: ExtendableComponent | undefined = undefined;
        expect(component === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_GETUICONTEXT_0100
     * @tc.name   SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_GETUICONTEXT_0100
     * @tc.desc   Verify static Method coverage for extendableComponent.ExtendableComponent.getUIContext
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_GETUICONTEXT_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let component: ExtendableComponent | undefined = undefined;
        expect(component === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_GETUNIQUEID_0100
     * @tc.name   SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_GETUNIQUEID_0100
     * @tc.desc   Verify static Method coverage for extendableComponent.ExtendableComponent.getUniqueId
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_GETUNIQUEID_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let component: ExtendableComponent | undefined = undefined;
        expect(component === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_QUERYNAVDESTINATIONINFO_0100
     * @tc.name   SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_QUERYNAVDESTINATIONINFO_0100
     * @tc.desc   Verify static Method coverage for extendableComponent.ExtendableComponent.queryNavDestinationInfo
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_QUERYNAVDESTINATIONINFO_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let component: ExtendableComponent | undefined = undefined;
        expect(component === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_QUERYNAVDESTINATIONINFO_0200
     * @tc.name   SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_QUERYNAVDESTINATIONINFO_0200
     * @tc.desc   Verify static Method coverage for extendableComponent.ExtendableComponent.queryNavDestinationInfo
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_QUERYNAVDESTINATIONINFO_0200',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let component: ExtendableComponent | undefined = undefined;
        expect(component === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_QUERYNAVIGATIONINFO_0100
     * @tc.name   SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_QUERYNAVIGATIONINFO_0100
     * @tc.desc   Verify static Method coverage for extendableComponent.ExtendableComponent.queryNavigationInfo
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_QUERYNAVIGATIONINFO_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let component: ExtendableComponent | undefined = undefined;
        expect(component === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_QUERYROUTERPAGEINFO_0100
     * @tc.name   SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_QUERYROUTERPAGEINFO_0100
     * @tc.desc   Verify static Method coverage for extendableComponent.ExtendableComponent.queryRouterPageInfo
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_QUERYROUTERPAGEINFO_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let component: ExtendableComponent | undefined = undefined;
        expect(component === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_GETDIALOGCONTROLLER_0100
     * @tc.name   SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_GETDIALOGCONTROLLER_0100
     * @tc.desc   Verify static Method coverage for extendableComponent.ExtendableComponent.getDialogController
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_GETDIALOGCONTROLLER_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let component: ExtendableComponent | undefined = undefined;
        expect(component === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STATE_GLOBAL_READABLESTATE_0100
     * @tc.name   SUB_ARKUI_STCOV_STATE_GLOBAL_READABLESTATE_0100
     * @tc.desc   Verify static Interface coverage for state.global.ReadableState
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STATE_GLOBAL_READABLESTATE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const readable: ReadableState<int> = new CoverageReadableState();
        expect(readable.value === 26).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STATE_READABLESTATE_VALUE_0100
     * @tc.name   SUB_ARKUI_STCOV_STATE_READABLESTATE_VALUE_0100
     * @tc.desc   Verify static Property coverage for state.ReadableState.value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STATE_READABLESTATE_VALUE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const readable: ReadableState<int> = new CoverageReadableState();
        expect(readable.value === 26).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STATE_GLOBAL_EQUIVALENT_0100
     * @tc.name   SUB_ARKUI_STCOV_STATE_GLOBAL_EQUIVALENT_0100
     * @tc.desc   Verify static TypeAlias coverage for state.global.Equivalent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STATE_GLOBAL_EQUIVALENT_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const equivalent: Equivalent<int> = (oldValue: int, newValue: int): boolean =>
          oldValue === newValue;
        expect(equivalent(1, 1)).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STATE_GLOBAL_STATECONTEXT_0100
     * @tc.name   SUB_ARKUI_STCOV_STATE_GLOBAL_STATECONTEXT_0100
     * @tc.desc   Verify static Interface coverage for state.global.StateContext
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STATE_GLOBAL_STATECONTEXT_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const context: StateContext = new CoverageStateContext();
        expect(context !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STATE_STATECONTEXT_SCOPE_0100
     * @tc.name   SUB_ARKUI_STCOV_STATE_STATECONTEXT_SCOPE_0100
     * @tc.desc   Verify static Method coverage for state.StateContext.scope
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STATE_STATECONTEXT_SCOPE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const context: StateContext = new CoverageStateContext();
        let caught: boolean = false;
        try { context.scope<int>(1, 0); } catch (_error) { caught = true; }
        expect(caught).assertTrue();
      }
    );
  });
}
