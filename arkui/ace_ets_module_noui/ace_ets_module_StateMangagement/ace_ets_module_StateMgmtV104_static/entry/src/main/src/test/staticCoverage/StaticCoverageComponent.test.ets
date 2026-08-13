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

export default function StaticCoverageComponentTest(): void {
  describe('StaticCoverageComponentTest', (): void => {
    /**
     * @tc.number SUB_ARKUI_STCOV_BUILDER_GLOBAL_BUILDER_0002
     * @tc.name   SUB_ARKUI_STCOV_BUILDER_GLOBAL_BUILDER_0002
     * @tc.desc   Verify static Annotation coverage for builder.global.Builder
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_BUILDER_GLOBAL_BUILDER_0002',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          2, 'builder#global#Builder#Annotation');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_BUILDER_GLOBAL_BUILDERPARAM_0003
     * @tc.name   SUB_ARKUI_STCOV_BUILDER_GLOBAL_BUILDERPARAM_0003
     * @tc.desc   Verify static Annotation coverage for builder.global.BuilderParam
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_BUILDER_GLOBAL_BUILDERPARAM_0003',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          3, 'builder#global#BuilderParam#Annotation');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_BUILDER_GLOBAL_WRAPBUILDER_0004
     * @tc.name   SUB_ARKUI_STCOV_BUILDER_GLOBAL_WRAPBUILDER_0004
     * @tc.desc   Verify static Method coverage for builder.global.wrapBuilder
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_BUILDER_GLOBAL_WRAPBUILDER_0004',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          4, 'builder#global#wrapBuilder#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_BUILDER_GLOBAL_WRAPPEDBUILDER_0005
     * @tc.name   SUB_ARKUI_STCOV_BUILDER_GLOBAL_WRAPPEDBUILDER_0005
     * @tc.desc   Verify static Class coverage for builder.global.WrappedBuilder
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_BUILDER_GLOBAL_WRAPPEDBUILDER_0005',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          5, 'builder#global#WrappedBuilder#Class');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_BUILDER_GLOBAL_BUILDERPARAMETERCALLBACK_0006
     * @tc.name   SUB_ARKUI_STCOV_BUILDER_GLOBAL_BUILDERPARAMETERCALLBACK_0006
     * @tc.desc   Verify static TypeAlias coverage for builder.global.BuilderParameterCallback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_BUILDER_GLOBAL_BUILDERPARAMETERCALLBACK_0006',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          6, 'builder#global#BuilderParameterCallback#TypeAlias');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_BUILDER_GLOBAL_MAKEBUILDERPARAMETERPROXY_0007
     * @tc.name   SUB_ARKUI_STCOV_BUILDER_GLOBAL_MAKEBUILDERPARAMETERPROXY_0007
     * @tc.desc   Verify static Method coverage for builder.global.makeBuilderParameterProxy
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_BUILDER_GLOBAL_MAKEBUILDERPARAMETERPROXY_0007',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          7, 'builder#global#makeBuilderParameterProxy#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_BUILDER_GLOBAL_COMPONENTBUILDER_0008
     * @tc.name   SUB_ARKUI_STCOV_BUILDER_GLOBAL_COMPONENTBUILDER_0008
     * @tc.desc   Verify static Annotation coverage for builder.global.ComponentBuilder
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_BUILDER_GLOBAL_COMPONENTBUILDER_0008',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          8, 'builder#global#ComponentBuilder#Annotation');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_COMMON_GLOBAL_REUSEOPTIONS_0009
     * @tc.name   SUB_ARKUI_STCOV_COMMON_GLOBAL_REUSEOPTIONS_0009
     * @tc.desc   Verify static Interface coverage for common.global.ReuseOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_COMMON_GLOBAL_REUSEOPTIONS_0009',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          9, 'common#global#ReuseOptions#Interface');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_COMMON_REUSEOPTIONS_REUSEID_0010
     * @tc.name   SUB_ARKUI_STCOV_COMMON_REUSEOPTIONS_REUSEID_0010
     * @tc.desc   Verify static Method coverage for common.ReuseOptions.reuseId
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_COMMON_REUSEOPTIONS_REUSEID_0010',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          10, 'common#ReuseOptions#reuseId#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_COMMON_GLOBAL_CUSTOMSTYLES_0011
     * @tc.name   SUB_ARKUI_STCOV_COMMON_GLOBAL_CUSTOMSTYLES_0011
     * @tc.desc   Verify static TypeAlias coverage for common.global.CustomStyles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_COMMON_GLOBAL_CUSTOMSTYLES_0011',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          11, 'common#global#CustomStyles#TypeAlias');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_COMMON_GLOBAL_STATESTYLES_0012
     * @tc.name   SUB_ARKUI_STCOV_COMMON_GLOBAL_STATESTYLES_0012
     * @tc.desc   Verify static Interface coverage for common.global.StateStyles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_COMMON_GLOBAL_STATESTYLES_0012',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          12, 'common#global#StateStyles#Interface');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_COMMON_GLOBAL_MAKEBINDABLE_0013
     * @tc.name   SUB_ARKUI_STCOV_COMMON_GLOBAL_MAKEBINDABLE_0013
     * @tc.desc   Verify static Method coverage for common.global.makeBindable
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_COMMON_GLOBAL_MAKEBINDABLE_0013',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          13, 'common#global#makeBindable#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_REUSEPOOLOWNERSHIP_0014
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_REUSEPOOLOWNERSHIP_0014
     * @tc.desc   Verify static Enum coverage for customComponent.global.ReusePoolOwnership
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_REUSEPOOLOWNERSHIP_0014',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          14, 'customComponent#global#ReusePoolOwnership#Enum');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_REUSEPOOLOWNERSHIP_SHARED_0015
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_REUSEPOOLOWNERSHIP_SHARED_0015
     * @tc.desc   Verify static EnumValue coverage for customComponent.ReusePoolOwnership.SHARED
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_REUSEPOOLOWNERSHIP_SHARED_0015',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          15, 'customComponent#ReusePoolOwnership#SHARED#EnumValue');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_REUSEPOOLOWNERSHIP_PER_INSTANCE_0016
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_REUSEPOOLOWNERSHIP_PER_INSTANCE_0016
     * @tc.desc   Verify static EnumValue coverage for customComponent.ReusePoolOwnership.PER_INSTANCE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_REUSEPOOLOWNERSHIP_PER_INSTANCE_0016',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          16, 'customComponent#ReusePoolOwnership#PER_INSTANCE#EnumValue');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_REUSEPOOLOWNERSHIP_OFF_0017
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_REUSEPOOLOWNERSHIP_OFF_0017
     * @tc.desc   Verify static EnumValue coverage for customComponent.ReusePoolOwnership.OFF
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_REUSEPOOLOWNERSHIP_OFF_0017',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          17, 'customComponent#ReusePoolOwnership#OFF#EnumValue');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_COMPONENT_0018
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_COMPONENT_0018
     * @tc.desc   Verify static Annotation coverage for customComponent.global.Component
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_COMPONENT_0018',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          18, 'customComponent#global#Component#Annotation');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_COMPONENT_REUSEPOOL_0019
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_COMPONENT_REUSEPOOL_0019
     * @tc.desc   Verify static Property coverage for customComponent.Component.reusePool
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_COMPONENT_REUSEPOOL_0019',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          19, 'customComponent#Component#reusePool#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_COMPONENT_POOLACCEPTS_0020
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_COMPONENT_POOLACCEPTS_0020
     * @tc.desc   Verify static Property coverage for customComponent.Component.poolAccepts
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_COMPONENT_POOLACCEPTS_0020',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          20, 'customComponent#Component#poolAccepts#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_COMPONENTV2_0021
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_COMPONENTV2_0021
     * @tc.desc   Verify static Annotation coverage for customComponent.global.ComponentV2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_COMPONENTV2_0021',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          21, 'customComponent#global#ComponentV2#Annotation');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_COMPONENTV2_REUSEPOOL_0022
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_COMPONENTV2_REUSEPOOL_0022
     * @tc.desc   Verify static Property coverage for customComponent.ComponentV2.reusePool
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_COMPONENTV2_REUSEPOOL_0022',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          22, 'customComponent#ComponentV2#reusePool#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_COMPONENTV2_POOLACCEPTS_0023
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_COMPONENTV2_POOLACCEPTS_0023
     * @tc.desc   Verify static Property coverage for customComponent.ComponentV2.poolAccepts
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_COMPONENTV2_POOLACCEPTS_0023',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          23, 'customComponent#ComponentV2#poolAccepts#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_REUSABLE_0024
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_REUSABLE_0024
     * @tc.desc   Verify static Annotation coverage for customComponent.global.Reusable
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_REUSABLE_0024',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          24, 'customComponent#global#Reusable#Annotation');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_REUSABLE_MEMORYOPTIMIZATIONSTRATEGY_0025
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_REUSABLE_MEMORYOPTIMIZATIONSTRATEGY_0025
     * @tc.desc   Verify static Property coverage for customComponent.Reusable.memoryOptimizationStrategy
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_REUSABLE_MEMORYOPTIMIZATIONSTRATEGY_0025',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          25, 'customComponent#Reusable#memoryOptimizationStrategy#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_REUSABLEV2_0026
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_REUSABLEV2_0026
     * @tc.desc   Verify static Annotation coverage for customComponent.global.ReusableV2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_REUSABLEV2_0026',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          26, 'customComponent#global#ReusableV2#Annotation');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_REUSABLEV2_MEMORYOPTIMIZATIONSTRATEGY_0027
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_REUSABLEV2_MEMORYOPTIMIZATIONSTRATEGY_0027
     * @tc.desc   Verify static Property coverage for customComponent.ReusableV2.memoryOptimizationStrategy
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_REUSABLEV2_MEMORYOPTIMIZATIONSTRATEGY_0027',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          27, 'customComponent#ReusableV2#memoryOptimizationStrategy#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_ENTRYPOINT_0028
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_ENTRYPOINT_0028
     * @tc.desc   Verify static Class coverage for customComponent.global.EntryPoint
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_ENTRYPOINT_0028',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          28, 'customComponent#global#EntryPoint#Class');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_ENTRYPOINT_ENTRY_0029
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_ENTRYPOINT_ENTRY_0029
     * @tc.desc   Verify static Method coverage for customComponent.EntryPoint.entry
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_ENTRYPOINT_ENTRY_0029',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          29, 'customComponent#EntryPoint#entry#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMDIALOG_0030
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMDIALOG_0030
     * @tc.desc   Verify static Annotation coverage for customComponent.global.CustomDialog
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMDIALOG_0030',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          30, 'customComponent#global#CustomDialog#Annotation');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_BASECUSTOMDIALOG_0031
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_BASECUSTOMDIALOG_0031
     * @tc.desc   Verify static Class coverage for customComponent.global.BaseCustomDialog
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_BASECUSTOMDIALOG_0031',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          31, 'customComponent#global#BaseCustomDialog#Class');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_BASECUSTOMCOMPONENT_0032
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_BASECUSTOMCOMPONENT_0032
     * @tc.desc   Verify static Class coverage for customComponent.global.BaseCustomComponent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_BASECUSTOMCOMPONENT_0032',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          32, 'customComponent#global#BaseCustomComponent#Class');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_BASECUSTOMCOMPONENT_ABOUTTORECYCLE_0033
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_BASECUSTOMCOMPONENT_ABOUTTORECYCLE_0033
     * @tc.desc   Verify static Method coverage for customComponent.BaseCustomComponent.aboutToRecycle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_BASECUSTOMCOMPONENT_ABOUTTORECYCLE_0033',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          33, 'customComponent#BaseCustomComponent#aboutToRecycle#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMCOMPONENT_0034
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMCOMPONENT_0034
     * @tc.desc   Verify static Class coverage for customComponent.global.CustomComponent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMCOMPONENT_0034',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          34, 'customComponent#global#CustomComponent#Class');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENT_ABOUTTOREUSE_0035
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENT_ABOUTTOREUSE_0035
     * @tc.desc   Verify static Method coverage for customComponent.CustomComponent.aboutToReuse
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENT_ABOUTTOREUSE_0035',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          35, 'customComponent#CustomComponent#aboutToReuse#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMCOMPONENTV2_0036
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMCOMPONENTV2_0036
     * @tc.desc   Verify static Class coverage for customComponent.global.CustomComponentV2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMCOMPONENTV2_0036',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          36, 'customComponent#global#CustomComponentV2#Class');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTV2_ABOUTTOREUSE_0037
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTV2_ABOUTTOREUSE_0037
     * @tc.desc   Verify static Method coverage for customComponent.CustomComponentV2.aboutToReuse
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTV2_ABOUTTOREUSE_0037',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          37, 'customComponent#CustomComponentV2#aboutToReuse#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTV2_RESETSTATEVARSONREUSE_0038
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTV2_RESETSTATEVARSONREUSE_0038
     * @tc.desc   Verify static Method coverage for customComponent.CustomComponentV2.resetStateVarsOnReuse
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTV2_RESETSTATEVARSONREUSE_0038',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          38, 'customComponent#CustomComponentV2#resetStateVarsOnReuse#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_PAGELIFECYCLE_0039
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_PAGELIFECYCLE_0039
     * @tc.desc   Verify static Interface coverage for customComponent.global.PageLifeCycle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_PAGELIFECYCLE_0039',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          39, 'customComponent#global#PageLifeCycle#Interface');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_PAGELIFECYCLE_ONPAGESHOW_0040
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_PAGELIFECYCLE_ONPAGESHOW_0040
     * @tc.desc   Verify static Method coverage for customComponent.PageLifeCycle.onPageShow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_PAGELIFECYCLE_ONPAGESHOW_0040',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          40, 'customComponent#PageLifeCycle#onPageShow#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_LAYOUTCALLBACKS_0041
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_LAYOUTCALLBACKS_0041
     * @tc.desc   Verify static Interface coverage for customComponent.global.LayoutCallbacks
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_LAYOUTCALLBACKS_0041',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          41, 'customComponent#global#LayoutCallbacks#Interface');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_LAYOUTCALLBACKS_ONPLACECHILDREN_0042
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_LAYOUTCALLBACKS_ONPLACECHILDREN_0042
     * @tc.desc   Verify static Method coverage for customComponent.LayoutCallbacks.onPlaceChildren
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_LAYOUTCALLBACKS_ONPLACECHILDREN_0042',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          42, 'customComponent#LayoutCallbacks#onPlaceChildren#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMCOMPONENTINVOKEOPTIONS_0043
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMCOMPONENTINVOKEOPTIONS_0043
     * @tc.desc   Verify static Interface coverage for customComponent.global.CustomComponentInvokeOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMCOMPONENTINVOKEOPTIONS_0043',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          43, 'customComponent#global#CustomComponentInvokeOptions#Interface');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTINVOKEOPTIONS_SCLASS_0044
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTINVOKEOPTIONS_SCLASS_0044
     * @tc.desc   Verify static Property coverage for customComponent.CustomComponentInvokeOptions.sClass
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTINVOKEOPTIONS_SCLASS_0044',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          44, 'customComponent#CustomComponentInvokeOptions#sClass#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMCOMPONENTLIFECYCLE_0045
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMCOMPONENTLIFECYCLE_0045
     * @tc.desc   Verify static Interface coverage for customComponent.global.CustomComponentLifecycle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMCOMPONENTLIFECYCLE_0045',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          45, 'customComponent#global#CustomComponentLifecycle#Interface');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLE_GETCURRENTSTATE_0046
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLE_GETCURRENTSTATE_0046
     * @tc.desc   Verify static Method coverage for customComponent.CustomComponentLifecycle.getCurrentState
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLE_GETCURRENTSTATE_0046',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          46, 'customComponent#CustomComponentLifecycle#getCurrentState#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLE_ADDOBSERVER_0047
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLE_ADDOBSERVER_0047
     * @tc.desc   Verify static Method coverage for customComponent.CustomComponentLifecycle.addObserver
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLE_ADDOBSERVER_0047',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          47, 'customComponent#CustomComponentLifecycle#addObserver#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLE_REMOVEOBSERVER_0048
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLE_REMOVEOBSERVER_0048
     * @tc.desc   Verify static Method coverage for customComponent.CustomComponentLifecycle.removeObserver
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLE_REMOVEOBSERVER_0048',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          48, 'customComponent#CustomComponentLifecycle#removeObserver#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMCOMPONENTLIFECYCLEOBSERVER_0049
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMCOMPONENTLIFECYCLEOBSERVER_0049
     * @tc.desc   Verify static Interface coverage for customComponent.global.CustomComponentLifecycleObserver
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_GLOBAL_CUSTOMCOMPONENTLIFECYCLEOBSERVER_0049',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          49, 'customComponent#global#CustomComponentLifecycleObserver#Interface');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLEOBSERVER_ABOUTTOAPPEAR_0050
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLEOBSERVER_ABOUTTOAPPEAR_0050
     * @tc.desc   Verify static Method coverage for customComponent.CustomComponentLifecycleObserver.aboutToAppear
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLEOBSERVER_ABOUTTOAPPEAR_0050',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          50, 'customComponent#CustomComponentLifecycleObserver#aboutToAppear#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLEOBSERVER_ONDIDBUILD_0051
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLEOBSERVER_ONDIDBUILD_0051
     * @tc.desc   Verify static Method coverage for customComponent.CustomComponentLifecycleObserver.onDidBuild
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLEOBSERVER_ONDIDBUILD_0051',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          51, 'customComponent#CustomComponentLifecycleObserver#onDidBuild#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLEOBSERVER_ABOUTTODISAPPEAR_0052
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLEOBSERVER_ABOUTTODISAPPEAR_0052
     * @tc.desc   Verify static Method coverage for customComponent.CustomComponentLifecycleObserver.aboutToDisappear
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLEOBSERVER_ABOUTTODISAPPEAR_0052',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          52, 'customComponent#CustomComponentLifecycleObserver#aboutToDisappear#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLEOBSERVER_ABOUTTOREUSE_0053
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLEOBSERVER_ABOUTTOREUSE_0053
     * @tc.desc   Verify static Method coverage for customComponent.CustomComponentLifecycleObserver.aboutToReuse
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLEOBSERVER_ABOUTTOREUSE_0053',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          53, 'customComponent#CustomComponentLifecycleObserver#aboutToReuse#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLEOBSERVER_ABOUTTORECYCLE_0054
     * @tc.name   SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLEOBSERVER_ABOUTTORECYCLE_0054
     * @tc.desc   Verify static Method coverage for customComponent.CustomComponentLifecycleObserver.aboutToRecycle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_CUSTOMCOMPONENT_CUSTOMCOMPONENTLIFECYCLEOBSERVER_ABOUTTORECYCLE_0054',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          54, 'customComponent#CustomComponentLifecycleObserver#aboutToRecycle#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_GLOBAL_LIFECYCLE_0055
     * @tc.name   SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_GLOBAL_LIFECYCLE_0055
     * @tc.desc   Verify static Interface coverage for extendableComponent.global.LifeCycle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_GLOBAL_LIFECYCLE_0055',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          55, 'extendableComponent#global#LifeCycle#Interface');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_LIFECYCLE_ABOUTTOAPPEAR_0056
     * @tc.name   SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_LIFECYCLE_ABOUTTOAPPEAR_0056
     * @tc.desc   Verify static Method coverage for extendableComponent.LifeCycle.aboutToAppear
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_LIFECYCLE_ABOUTTOAPPEAR_0056',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          56, 'extendableComponent#LifeCycle#aboutToAppear#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_LIFECYCLE_ABOUTTODISAPPEAR_0057
     * @tc.name   SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_LIFECYCLE_ABOUTTODISAPPEAR_0057
     * @tc.desc   Verify static Method coverage for extendableComponent.LifeCycle.aboutToDisappear
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_LIFECYCLE_ABOUTTODISAPPEAR_0057',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          57, 'extendableComponent#LifeCycle#aboutToDisappear#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_LIFECYCLE_ONDIDBUILD_0058
     * @tc.name   SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_LIFECYCLE_ONDIDBUILD_0058
     * @tc.desc   Verify static Method coverage for extendableComponent.LifeCycle.onDidBuild
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_LIFECYCLE_ONDIDBUILD_0058',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          58, 'extendableComponent#LifeCycle#onDidBuild#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_LIFECYCLE_BUILD_0059
     * @tc.name   SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_LIFECYCLE_BUILD_0059
     * @tc.desc   Verify static Method coverage for extendableComponent.LifeCycle.build
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_LIFECYCLE_BUILD_0059',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          59, 'extendableComponent#LifeCycle#build#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_GLOBAL_EXTENDABLECOMPONENT_0060
     * @tc.name   SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_GLOBAL_EXTENDABLECOMPONENT_0060
     * @tc.desc   Verify static Class coverage for extendableComponent.global.ExtendableComponent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_GLOBAL_EXTENDABLECOMPONENT_0060',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          60, 'extendableComponent#global#ExtendableComponent#Class');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_ONWILLAPPLYTHEME_0061
     * @tc.name   SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_ONWILLAPPLYTHEME_0061
     * @tc.desc   Verify static Method coverage for extendableComponent.ExtendableComponent.onWillApplyTheme
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_ONWILLAPPLYTHEME_0061',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          61, 'extendableComponent#ExtendableComponent#onWillApplyTheme#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_GETUICONTEXT_0062
     * @tc.name   SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_GETUICONTEXT_0062
     * @tc.desc   Verify static Method coverage for extendableComponent.ExtendableComponent.getUIContext
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_GETUICONTEXT_0062',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          62, 'extendableComponent#ExtendableComponent#getUIContext#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_GETUNIQUEID_0063
     * @tc.name   SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_GETUNIQUEID_0063
     * @tc.desc   Verify static Method coverage for extendableComponent.ExtendableComponent.getUniqueId
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_GETUNIQUEID_0063',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          63, 'extendableComponent#ExtendableComponent#getUniqueId#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_QUERYNAVDESTINATIONINFO_0064
     * @tc.name   SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_QUERYNAVDESTINATIONINFO_0064
     * @tc.desc   Verify static Method coverage for extendableComponent.ExtendableComponent.queryNavDestinationInfo
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_QUERYNAVDESTINATIONINFO_0064',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          64, 'extendableComponent#ExtendableComponent#queryNavDestinationInfo#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_QUERYNAVDESTINATIONINFO_0065
     * @tc.name   SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_QUERYNAVDESTINATIONINFO_0065
     * @tc.desc   Verify static Method coverage for extendableComponent.ExtendableComponent.queryNavDestinationInfo
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_QUERYNAVDESTINATIONINFO_0065',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          65, 'extendableComponent#ExtendableComponent#queryNavDestinationInfo#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_QUERYNAVIGATIONINFO_0066
     * @tc.name   SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_QUERYNAVIGATIONINFO_0066
     * @tc.desc   Verify static Method coverage for extendableComponent.ExtendableComponent.queryNavigationInfo
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_QUERYNAVIGATIONINFO_0066',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          66, 'extendableComponent#ExtendableComponent#queryNavigationInfo#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_QUERYROUTERPAGEINFO_0067
     * @tc.name   SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_QUERYROUTERPAGEINFO_0067
     * @tc.desc   Verify static Method coverage for extendableComponent.ExtendableComponent.queryRouterPageInfo
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_QUERYROUTERPAGEINFO_0067',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          67, 'extendableComponent#ExtendableComponent#queryRouterPageInfo#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_GETDIALOGCONTROLLER_0068
     * @tc.name   SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_GETDIALOGCONTROLLER_0068
     * @tc.desc   Verify static Method coverage for extendableComponent.ExtendableComponent.getDialogController
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_EXTENDABLECOMPONENT_EXTENDABLECOMPONENT_GETDIALOGCONTROLLER_0068',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          68, 'extendableComponent#ExtendableComponent#getDialogController#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STATE_GLOBAL_READABLESTATE_0069
     * @tc.name   SUB_ARKUI_STCOV_STATE_GLOBAL_READABLESTATE_0069
     * @tc.desc   Verify static Interface coverage for state.global.ReadableState
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STATE_GLOBAL_READABLESTATE_0069',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          69, 'state#global#ReadableState#Interface');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STATE_READABLESTATE_VALUE_0070
     * @tc.name   SUB_ARKUI_STCOV_STATE_READABLESTATE_VALUE_0070
     * @tc.desc   Verify static Property coverage for state.ReadableState.value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STATE_READABLESTATE_VALUE_0070',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          70, 'state#ReadableState#value#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STATE_GLOBAL_EQUIVALENT_0071
     * @tc.name   SUB_ARKUI_STCOV_STATE_GLOBAL_EQUIVALENT_0071
     * @tc.desc   Verify static TypeAlias coverage for state.global.Equivalent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STATE_GLOBAL_EQUIVALENT_0071',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          71, 'state#global#Equivalent#TypeAlias');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STATE_GLOBAL_STATECONTEXT_0072
     * @tc.name   SUB_ARKUI_STCOV_STATE_GLOBAL_STATECONTEXT_0072
     * @tc.desc   Verify static Interface coverage for state.global.StateContext
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STATE_GLOBAL_STATECONTEXT_0072',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          72, 'state#global#StateContext#Interface');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STATE_STATECONTEXT_SCOPE_0073
     * @tc.name   SUB_ARKUI_STCOV_STATE_STATECONTEXT_SCOPE_0073
     * @tc.desc   Verify static Method coverage for state.StateContext.scope
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STATE_STATECONTEXT_SCOPE_0073',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          73, 'state#StateContext#scope#Method');
        expect(passed).assertTrue();
      }
    );
  });
}
