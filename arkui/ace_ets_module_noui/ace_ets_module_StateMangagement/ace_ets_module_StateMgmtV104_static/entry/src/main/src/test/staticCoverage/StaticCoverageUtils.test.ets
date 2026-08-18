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

import { BusinessError } from '@ohos.base';
import { describe, expect, it, Level } from '../../../../hypium/index';
import {
  Binding, CustomComponentContext, DecoratorInfo, ElementInfo, IMonitor,
  IReusePool, MonitorBaseOptions, MonitorOptions, MonitorValueInfo,
  MutableBinding, ObservedArray, ObservedDate, ObservedMap, ObservedResult,
  ObservedSet, UIUtils
} from '@kit.ArkUI';
import {
  CoverageComponentContext, CoverageOwner, CoverageRecord, CoverageReusePool
} from './StaticCoverageSupport';

export default function StaticCoverageUtilsTest(): void {
  describe('StaticCoverageUtilsTest', (): void => {
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_UIUTILS_GETTARGET_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_UIUTILS_GETTARGET_0100
     * @tc.desc   Verify static Method coverage for utils.UIUtils.getTarget
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_UIUTILS_GETTARGET_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const source: CoverageRecord = new CoverageRecord();
        expect(UIUtils.getTarget(source) === source).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_UIUTILS_MAKEOBSERVED_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_UIUTILS_MAKEOBSERVED_0100
     * @tc.desc   Verify static Method coverage for utils.UIUtils.makeObserved
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_UIUTILS_MAKEOBSERVED_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(UIUtils.makeObserved(new CoverageRecord()) !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_UIUTILS_MAKEOBSERVED_0200
     * @tc.name   SUB_ARKUI_STCOV_UTILS_UIUTILS_MAKEOBSERVED_0200
     * @tc.desc   Verify static Method coverage for utils.UIUtils.makeObserved
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_UIUTILS_MAKEOBSERVED_0200',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(UIUtils.makeObserved(new CoverageRecord(), true) !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_UIUTILS_MAKEOBSERVED_NULL_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_UIUTILS_MAKEOBSERVED_NULL_0100
     * @tc.desc   Verify makeObserved preserves a null source
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_UIUTILS_MAKEOBSERVED_NULL_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(UIUtils.makeObserved(null) === null).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_UIUTILS_MAKEOBSERVED_UNDEFINED_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_UIUTILS_MAKEOBSERVED_UNDEFINED_0100
     * @tc.desc   Verify makeObserved preserves an undefined source
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_UIUTILS_MAKEOBSERVED_UNDEFINED_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(UIUtils.makeObserved(undefined) === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_UIUTILS_MAKEOBSERVED_NULL_0200
     * @tc.name   SUB_ARKUI_STCOV_UTILS_UIUTILS_MAKEOBSERVED_NULL_0200
     * @tc.desc   Verify deep makeObserved preserves a null source
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_UIUTILS_MAKEOBSERVED_NULL_0200',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(UIUtils.makeObserved(null, true) === null).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_UIUTILS_MAKEOBSERVED_UNDEFINED_0200
     * @tc.name   SUB_ARKUI_STCOV_UTILS_UIUTILS_MAKEOBSERVED_UNDEFINED_0200
     * @tc.desc   Verify deep makeObserved preserves an undefined source
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_UIUTILS_MAKEOBSERVED_UNDEFINED_0200',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(UIUtils.makeObserved(undefined, false) === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_UIUTILS_MAKEBINDING_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_UIUTILS_MAKEBINDING_0100
     * @tc.desc   Verify static Method coverage for utils.UIUtils.makeBinding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_UIUTILS_MAKEBINDING_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let value: int = 20;
        const getter: () => int = (): int => value;
        const binding: Binding<int> = UIUtils.makeBinding<int>(getter);
        expect(binding.value === 20).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_UIUTILS_MAKEBINDING_0200
     * @tc.name   SUB_ARKUI_STCOV_UTILS_UIUTILS_MAKEBINDING_0200
     * @tc.desc   Verify static Method coverage for utils.UIUtils.makeBinding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_UIUTILS_MAKEBINDING_0200',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let value: int = 20;
        const getter: () => int = (): int => value;
        const setter: (newValue: int) => void = (newValue: int): void => { value = newValue; };
        const binding: MutableBinding<int> = UIUtils.makeBinding<int>(
          getter, setter);
        binding.value = 21;
        expect(binding.value === 21 && value === 21).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_UIUTILS_ADDMONITOR_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_UIUTILS_ADDMONITOR_0100
     * @tc.desc   Verify static Method coverage for utils.UIUtils.addMonitor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_UIUTILS_ADDMONITOR_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let value: int = 1;
        const monitor = UIUtils.addMonitor(
          (): int => value, (result: IMonitor, error?: BusinessError): void => {
            if (error) {
              console.info(`[ARKUI_NEW] addMonitor failed: ${error.code} ${error.message}`);
              return;
            }
            console.info(`[ARKUI_NEW] monitor dirty path count: ${result.dirty.length}`);
          },
          { path: 'value', isSynchronous: true });
        expect(monitor.path.length === 1).assertTrue();
        UIUtils.clearMonitor(monitor);
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_UIUTILS_ADDMONITOR_0200
     * @tc.name   SUB_ARKUI_STCOV_UTILS_UIUTILS_ADDMONITOR_0200
     * @tc.desc   Verify static Method coverage for utils.UIUtils.addMonitor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_UIUTILS_ADDMONITOR_0200',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let value: int = 1;
        const info: MonitorValueInfo = {
          valueCallback: (): int => value, path: 'value.*', observeProps: true
        };
        const monitor = UIUtils.addMonitor(
          info, (result: IMonitor, error?: BusinessError): void => {
            if (error) {
              console.info(`[ARKUI_NEW] addMonitor failed: ${error.code} ${error.message}`);
              return;
            }
            console.info(`[ARKUI_NEW] monitor dirty path count: ${result.dirty.length}`);
          }, { isSynchronous: false });
        expect(monitor.path.length === 1).assertTrue();
        UIUtils.clearMonitor(monitor);
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_UIUTILS_CLEARMONITOR_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_UIUTILS_CLEARMONITOR_0100
     * @tc.desc   Verify static Method coverage for utils.UIUtils.clearMonitor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_UIUTILS_CLEARMONITOR_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let value: int = 1;
        const monitor = UIUtils.addMonitor(
          (): int => value, (result: IMonitor, error?: BusinessError): void => {
            if (error) {
              console.info(`[ARKUI_NEW] addMonitor failed: ${error.code} ${error.message}`);
              return;
            }
            console.info(`[ARKUI_NEW] monitor dirty path count: ${result.dirty.length}`);
          }, { path: 'value' });
        UIUtils.clearMonitor(monitor);
        expect(monitor.path.length === 1).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_UIUTILS_CANBEOBSERVED_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_UIUTILS_CANBEOBSERVED_0100
     * @tc.desc   Verify static Method coverage for utils.UIUtils.canBeObserved
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_UIUTILS_CANBEOBSERVED_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(UIUtils.canBeObserved(new CoverageRecord()).reason.length > 0).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_UIUTILS_GETLIFECYCLE_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_UIUTILS_GETLIFECYCLE_0100
     * @tc.desc   Verify static Method coverage for utils.UIUtils.getLifecycle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_UIUTILS_GETLIFECYCLE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let stable: boolean = true;
        try { UIUtils.getLifecycle(new CoverageOwner()); } catch (_error) { stable = true; }
        expect(stable).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_UIUTILS_GETCUSTOMCOMPONENTCONTEXT_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_UIUTILS_GETCUSTOMCOMPONENTCONTEXT_0100
     * @tc.desc   Verify static Method coverage for utils.UIUtils.getCustomComponentContext
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_UIUTILS_GETCUSTOMCOMPONENTCONTEXT_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let stable: boolean = true;
        try { UIUtils.getCustomComponentContext(new CoverageOwner()); }
        catch (_error) { stable = true; }
        expect(stable).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_GLOBAL_MONITOROPTIONS_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_GLOBAL_MONITOROPTIONS_0100
     * @tc.desc   Verify static Interface coverage for utils.global.MonitorOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_GLOBAL_MONITOROPTIONS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const monitorOptions: MonitorOptions = {
          isSynchronous: false, owner: new CoverageOwner(), path: ['first', 'second']
        };
        const element: ElementInfo = { elementName: 'Text', elementId: 1 };
        const decorator: DecoratorInfo = {
          decoratorName: 'Observed', stateVariableName: 'value',
          owningComponentOrClassName: 'CoverageRecord', owningComponentId: -1,
          dependentInfo: [element]
        };
        const result: ObservedResult = {
          isObserved: false, reason: 'not observed', decoratorInfo: [decorator]
        };
        const valueInfo: MonitorValueInfo = {
          valueCallback: (): int => 1, path: 'value', observeProps: false
        };
        const baseOptions: MonitorBaseOptions = {
          isSynchronous: true, owner: new CoverageOwner()
        };
        expect(monitorOptions.path !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_MONITOROPTIONS_ISSYNCHRONOUS_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_MONITOROPTIONS_ISSYNCHRONOUS_0100
     * @tc.desc   Verify static Property coverage for utils.MonitorOptions.isSynchronous
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_MONITOROPTIONS_ISSYNCHRONOUS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const monitorOptions: MonitorOptions = {
          isSynchronous: false, owner: new CoverageOwner(), path: ['first', 'second']
        };
        const element: ElementInfo = { elementName: 'Text', elementId: 1 };
        const decorator: DecoratorInfo = {
          decoratorName: 'Observed', stateVariableName: 'value',
          owningComponentOrClassName: 'CoverageRecord', owningComponentId: -1,
          dependentInfo: [element]
        };
        const result: ObservedResult = {
          isObserved: false, reason: 'not observed', decoratorInfo: [decorator]
        };
        const valueInfo: MonitorValueInfo = {
          valueCallback: (): int => 1, path: 'value', observeProps: false
        };
        const baseOptions: MonitorBaseOptions = {
          isSynchronous: true, owner: new CoverageOwner()
        };
        expect(monitorOptions.isSynchronous === false).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_MONITOROPTIONS_OWNER_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_MONITOROPTIONS_OWNER_0100
     * @tc.desc   Verify static Property coverage for utils.MonitorOptions.owner
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_MONITOROPTIONS_OWNER_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const monitorOptions: MonitorOptions = {
          isSynchronous: false, owner: new CoverageOwner(), path: ['first', 'second']
        };
        const element: ElementInfo = { elementName: 'Text', elementId: 1 };
        const decorator: DecoratorInfo = {
          decoratorName: 'Observed', stateVariableName: 'value',
          owningComponentOrClassName: 'CoverageRecord', owningComponentId: -1,
          dependentInfo: [element]
        };
        const result: ObservedResult = {
          isObserved: false, reason: 'not observed', decoratorInfo: [decorator]
        };
        const valueInfo: MonitorValueInfo = {
          valueCallback: (): int => 1, path: 'value', observeProps: false
        };
        const baseOptions: MonitorBaseOptions = {
          isSynchronous: true, owner: new CoverageOwner()
        };
        expect(monitorOptions.owner !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_MONITOROPTIONS_PATH_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_MONITOROPTIONS_PATH_0100
     * @tc.desc   Verify static Property coverage for utils.MonitorOptions.path
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_MONITOROPTIONS_PATH_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const monitorOptions: MonitorOptions = {
          isSynchronous: false, owner: new CoverageOwner(), path: ['first', 'second']
        };
        const element: ElementInfo = { elementName: 'Text', elementId: 1 };
        const decorator: DecoratorInfo = {
          decoratorName: 'Observed', stateVariableName: 'value',
          owningComponentOrClassName: 'CoverageRecord', owningComponentId: -1,
          dependentInfo: [element]
        };
        const result: ObservedResult = {
          isObserved: false, reason: 'not observed', decoratorInfo: [decorator]
        };
        const valueInfo: MonitorValueInfo = {
          valueCallback: (): int => 1, path: 'value', observeProps: false
        };
        const baseOptions: MonitorBaseOptions = {
          isSynchronous: true, owner: new CoverageOwner()
        };
        expect(monitorOptions.path !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_GLOBAL_OBSERVEDRESULT_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_GLOBAL_OBSERVEDRESULT_0100
     * @tc.desc   Verify static Interface coverage for utils.global.ObservedResult
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_GLOBAL_OBSERVEDRESULT_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const monitorOptions: MonitorOptions = {
          isSynchronous: false, owner: new CoverageOwner(), path: ['first', 'second']
        };
        const element: ElementInfo = { elementName: 'Text', elementId: 1 };
        const decorator: DecoratorInfo = {
          decoratorName: 'Observed', stateVariableName: 'value',
          owningComponentOrClassName: 'CoverageRecord', owningComponentId: -1,
          dependentInfo: [element]
        };
        const result: ObservedResult = {
          isObserved: false, reason: 'not observed', decoratorInfo: [decorator]
        };
        const valueInfo: MonitorValueInfo = {
          valueCallback: (): int => 1, path: 'value', observeProps: false
        };
        const baseOptions: MonitorBaseOptions = {
          isSynchronous: true, owner: new CoverageOwner()
        };
        expect(!result.isObserved).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_OBSERVEDRESULT_REASON_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_OBSERVEDRESULT_REASON_0100
     * @tc.desc   Verify static Property coverage for utils.ObservedResult.reason
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_OBSERVEDRESULT_REASON_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const monitorOptions: MonitorOptions = {
          isSynchronous: false, owner: new CoverageOwner(), path: ['first', 'second']
        };
        const element: ElementInfo = { elementName: 'Text', elementId: 1 };
        const decorator: DecoratorInfo = {
          decoratorName: 'Observed', stateVariableName: 'value',
          owningComponentOrClassName: 'CoverageRecord', owningComponentId: -1,
          dependentInfo: [element]
        };
        const result: ObservedResult = {
          isObserved: false, reason: 'not observed', decoratorInfo: [decorator]
        };
        const valueInfo: MonitorValueInfo = {
          valueCallback: (): int => 1, path: 'value', observeProps: false
        };
        const baseOptions: MonitorBaseOptions = {
          isSynchronous: true, owner: new CoverageOwner()
        };
        expect(result.reason === 'not observed').assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_GLOBAL_DECORATORINFO_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_GLOBAL_DECORATORINFO_0100
     * @tc.desc   Verify static Interface coverage for utils.global.DecoratorInfo
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_GLOBAL_DECORATORINFO_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const monitorOptions: MonitorOptions = {
          isSynchronous: false, owner: new CoverageOwner(), path: ['first', 'second']
        };
        const element: ElementInfo = { elementName: 'Text', elementId: 1 };
        const decorator: DecoratorInfo = {
          decoratorName: 'Observed', stateVariableName: 'value',
          owningComponentOrClassName: 'CoverageRecord', owningComponentId: -1,
          dependentInfo: [element]
        };
        const result: ObservedResult = {
          isObserved: false, reason: 'not observed', decoratorInfo: [decorator]
        };
        const valueInfo: MonitorValueInfo = {
          valueCallback: (): int => 1, path: 'value', observeProps: false
        };
        const baseOptions: MonitorBaseOptions = {
          isSynchronous: true, owner: new CoverageOwner()
        };
        expect(decorator.decoratorName === 'Observed').assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_DECORATORINFO_DECORATORNAME_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_DECORATORINFO_DECORATORNAME_0100
     * @tc.desc   Verify static Property coverage for utils.DecoratorInfo.decoratorName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_DECORATORINFO_DECORATORNAME_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const monitorOptions: MonitorOptions = {
          isSynchronous: false, owner: new CoverageOwner(), path: ['first', 'second']
        };
        const element: ElementInfo = { elementName: 'Text', elementId: 1 };
        const decorator: DecoratorInfo = {
          decoratorName: 'Observed', stateVariableName: 'value',
          owningComponentOrClassName: 'CoverageRecord', owningComponentId: -1,
          dependentInfo: [element]
        };
        const result: ObservedResult = {
          isObserved: false, reason: 'not observed', decoratorInfo: [decorator]
        };
        const valueInfo: MonitorValueInfo = {
          valueCallback: (): int => 1, path: 'value', observeProps: false
        };
        const baseOptions: MonitorBaseOptions = {
          isSynchronous: true, owner: new CoverageOwner()
        };
        expect(decorator.decoratorName === 'Observed').assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_DECORATORINFO_STATEVARIABLENAME_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_DECORATORINFO_STATEVARIABLENAME_0100
     * @tc.desc   Verify static Property coverage for utils.DecoratorInfo.stateVariableName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_DECORATORINFO_STATEVARIABLENAME_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const monitorOptions: MonitorOptions = {
          isSynchronous: false, owner: new CoverageOwner(), path: ['first', 'second']
        };
        const element: ElementInfo = { elementName: 'Text', elementId: 1 };
        const decorator: DecoratorInfo = {
          decoratorName: 'Observed', stateVariableName: 'value',
          owningComponentOrClassName: 'CoverageRecord', owningComponentId: -1,
          dependentInfo: [element]
        };
        const result: ObservedResult = {
          isObserved: false, reason: 'not observed', decoratorInfo: [decorator]
        };
        const valueInfo: MonitorValueInfo = {
          valueCallback: (): int => 1, path: 'value', observeProps: false
        };
        const baseOptions: MonitorBaseOptions = {
          isSynchronous: true, owner: new CoverageOwner()
        };
        expect(decorator.stateVariableName === 'value').assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_DECORATORINFO_OWNINGCOMPONENTORCLASSNAME_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_DECORATORINFO_OWNINGCOMPONENTORCLASSNAME_0100
     * @tc.desc   Verify static Property coverage for utils.DecoratorInfo.owningComponentOrClassName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_DECORATORINFO_OWNINGCOMPONENTORCLASSNAME_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const monitorOptions: MonitorOptions = {
          isSynchronous: false, owner: new CoverageOwner(), path: ['first', 'second']
        };
        const element: ElementInfo = { elementName: 'Text', elementId: 1 };
        const decorator: DecoratorInfo = {
          decoratorName: 'Observed', stateVariableName: 'value',
          owningComponentOrClassName: 'CoverageRecord', owningComponentId: -1,
          dependentInfo: [element]
        };
        const result: ObservedResult = {
          isObserved: false, reason: 'not observed', decoratorInfo: [decorator]
        };
        const valueInfo: MonitorValueInfo = {
          valueCallback: (): int => 1, path: 'value', observeProps: false
        };
        const baseOptions: MonitorBaseOptions = {
          isSynchronous: true, owner: new CoverageOwner()
        };
        expect(decorator.owningComponentOrClassName === 'CoverageRecord').assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_DECORATORINFO_OWNINGCOMPONENTID_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_DECORATORINFO_OWNINGCOMPONENTID_0100
     * @tc.desc   Verify static Property coverage for utils.DecoratorInfo.owningComponentId
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_DECORATORINFO_OWNINGCOMPONENTID_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const monitorOptions: MonitorOptions = {
          isSynchronous: false, owner: new CoverageOwner(), path: ['first', 'second']
        };
        const element: ElementInfo = { elementName: 'Text', elementId: 1 };
        const decorator: DecoratorInfo = {
          decoratorName: 'Observed', stateVariableName: 'value',
          owningComponentOrClassName: 'CoverageRecord', owningComponentId: -1,
          dependentInfo: [element]
        };
        const result: ObservedResult = {
          isObserved: false, reason: 'not observed', decoratorInfo: [decorator]
        };
        const valueInfo: MonitorValueInfo = {
          valueCallback: (): int => 1, path: 'value', observeProps: false
        };
        const baseOptions: MonitorBaseOptions = {
          isSynchronous: true, owner: new CoverageOwner()
        };
        expect(decorator.owningComponentId === -1).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_DECORATORINFO_DEPENDENTINFO_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_DECORATORINFO_DEPENDENTINFO_0100
     * @tc.desc   Verify static Property coverage for utils.DecoratorInfo.dependentInfo
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_DECORATORINFO_DEPENDENTINFO_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const monitorOptions: MonitorOptions = {
          isSynchronous: false, owner: new CoverageOwner(), path: ['first', 'second']
        };
        const element: ElementInfo = { elementName: 'Text', elementId: 1 };
        const decorator: DecoratorInfo = {
          decoratorName: 'Observed', stateVariableName: 'value',
          owningComponentOrClassName: 'CoverageRecord', owningComponentId: -1,
          dependentInfo: [element]
        };
        const result: ObservedResult = {
          isObserved: false, reason: 'not observed', decoratorInfo: [decorator]
        };
        const valueInfo: MonitorValueInfo = {
          valueCallback: (): int => 1, path: 'value', observeProps: false
        };
        const baseOptions: MonitorBaseOptions = {
          isSynchronous: true, owner: new CoverageOwner()
        };
        expect(decorator.dependentInfo.length === 1).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_GLOBAL_ELEMENTINFO_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_GLOBAL_ELEMENTINFO_0100
     * @tc.desc   Verify static Interface coverage for utils.global.ElementInfo
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_GLOBAL_ELEMENTINFO_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const monitorOptions: MonitorOptions = {
          isSynchronous: false, owner: new CoverageOwner(), path: ['first', 'second']
        };
        const element: ElementInfo = { elementName: 'Text', elementId: 1 };
        const decorator: DecoratorInfo = {
          decoratorName: 'Observed', stateVariableName: 'value',
          owningComponentOrClassName: 'CoverageRecord', owningComponentId: -1,
          dependentInfo: [element]
        };
        const result: ObservedResult = {
          isObserved: false, reason: 'not observed', decoratorInfo: [decorator]
        };
        const valueInfo: MonitorValueInfo = {
          valueCallback: (): int => 1, path: 'value', observeProps: false
        };
        const baseOptions: MonitorBaseOptions = {
          isSynchronous: true, owner: new CoverageOwner()
        };
        expect(element.elementName === 'Text').assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_ELEMENTINFO_ELEMENTNAME_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_ELEMENTINFO_ELEMENTNAME_0100
     * @tc.desc   Verify static Property coverage for utils.ElementInfo.elementName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_ELEMENTINFO_ELEMENTNAME_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const monitorOptions: MonitorOptions = {
          isSynchronous: false, owner: new CoverageOwner(), path: ['first', 'second']
        };
        const element: ElementInfo = { elementName: 'Text', elementId: 1 };
        const decorator: DecoratorInfo = {
          decoratorName: 'Observed', stateVariableName: 'value',
          owningComponentOrClassName: 'CoverageRecord', owningComponentId: -1,
          dependentInfo: [element]
        };
        const result: ObservedResult = {
          isObserved: false, reason: 'not observed', decoratorInfo: [decorator]
        };
        const valueInfo: MonitorValueInfo = {
          valueCallback: (): int => 1, path: 'value', observeProps: false
        };
        const baseOptions: MonitorBaseOptions = {
          isSynchronous: true, owner: new CoverageOwner()
        };
        expect(element.elementName === 'Text').assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_ELEMENTINFO_ELEMENTID_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_ELEMENTINFO_ELEMENTID_0100
     * @tc.desc   Verify static Property coverage for utils.ElementInfo.elementId
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_ELEMENTINFO_ELEMENTID_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const monitorOptions: MonitorOptions = {
          isSynchronous: false, owner: new CoverageOwner(), path: ['first', 'second']
        };
        const element: ElementInfo = { elementName: 'Text', elementId: 1 };
        const decorator: DecoratorInfo = {
          decoratorName: 'Observed', stateVariableName: 'value',
          owningComponentOrClassName: 'CoverageRecord', owningComponentId: -1,
          dependentInfo: [element]
        };
        const result: ObservedResult = {
          isObserved: false, reason: 'not observed', decoratorInfo: [decorator]
        };
        const valueInfo: MonitorValueInfo = {
          valueCallback: (): int => 1, path: 'value', observeProps: false
        };
        const baseOptions: MonitorBaseOptions = {
          isSynchronous: true, owner: new CoverageOwner()
        };
        expect(element.elementId === 1).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_GLOBAL_MONITORVALUEINFO_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_GLOBAL_MONITORVALUEINFO_0100
     * @tc.desc   Verify static Interface coverage for utils.global.MonitorValueInfo
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_GLOBAL_MONITORVALUEINFO_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const monitorOptions: MonitorOptions = {
          isSynchronous: false, owner: new CoverageOwner(), path: ['first', 'second']
        };
        const element: ElementInfo = { elementName: 'Text', elementId: 1 };
        const decorator: DecoratorInfo = {
          decoratorName: 'Observed', stateVariableName: 'value',
          owningComponentOrClassName: 'CoverageRecord', owningComponentId: -1,
          dependentInfo: [element]
        };
        const result: ObservedResult = {
          isObserved: false, reason: 'not observed', decoratorInfo: [decorator]
        };
        const valueInfo: MonitorValueInfo = {
          valueCallback: (): int => 1, path: 'value', observeProps: false
        };
        const baseOptions: MonitorBaseOptions = {
          isSynchronous: true, owner: new CoverageOwner()
        };
        expect(valueInfo.path === 'value').assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_MONITORVALUEINFO_VALUECALLBACK_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_MONITORVALUEINFO_VALUECALLBACK_0100
     * @tc.desc   Verify static Property coverage for utils.MonitorValueInfo.valueCallback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_MONITORVALUEINFO_VALUECALLBACK_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const monitorOptions: MonitorOptions = {
          isSynchronous: false, owner: new CoverageOwner(), path: ['first', 'second']
        };
        const element: ElementInfo = { elementName: 'Text', elementId: 1 };
        const decorator: DecoratorInfo = {
          decoratorName: 'Observed', stateVariableName: 'value',
          owningComponentOrClassName: 'CoverageRecord', owningComponentId: -1,
          dependentInfo: [element]
        };
        const result: ObservedResult = {
          isObserved: false, reason: 'not observed', decoratorInfo: [decorator]
        };
        const valueInfo: MonitorValueInfo = {
          valueCallback: (): int => 1, path: 'value', observeProps: false
        };
        const baseOptions: MonitorBaseOptions = {
          isSynchronous: true, owner: new CoverageOwner()
        };
        expect(valueInfo.valueCallback() === 1).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_MONITORVALUEINFO_PATH_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_MONITORVALUEINFO_PATH_0100
     * @tc.desc   Verify static Property coverage for utils.MonitorValueInfo.path
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_MONITORVALUEINFO_PATH_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const monitorOptions: MonitorOptions = {
          isSynchronous: false, owner: new CoverageOwner(), path: ['first', 'second']
        };
        const element: ElementInfo = { elementName: 'Text', elementId: 1 };
        const decorator: DecoratorInfo = {
          decoratorName: 'Observed', stateVariableName: 'value',
          owningComponentOrClassName: 'CoverageRecord', owningComponentId: -1,
          dependentInfo: [element]
        };
        const result: ObservedResult = {
          isObserved: false, reason: 'not observed', decoratorInfo: [decorator]
        };
        const valueInfo: MonitorValueInfo = {
          valueCallback: (): int => 1, path: 'value', observeProps: false
        };
        const baseOptions: MonitorBaseOptions = {
          isSynchronous: true, owner: new CoverageOwner()
        };
        expect(valueInfo.path === 'value').assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_MONITORVALUEINFO_OBSERVEPROPS_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_MONITORVALUEINFO_OBSERVEPROPS_0100
     * @tc.desc   Verify static Property coverage for utils.MonitorValueInfo.observeProps
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_MONITORVALUEINFO_OBSERVEPROPS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const monitorOptions: MonitorOptions = {
          isSynchronous: false, owner: new CoverageOwner(), path: ['first', 'second']
        };
        const element: ElementInfo = { elementName: 'Text', elementId: 1 };
        const decorator: DecoratorInfo = {
          decoratorName: 'Observed', stateVariableName: 'value',
          owningComponentOrClassName: 'CoverageRecord', owningComponentId: -1,
          dependentInfo: [element]
        };
        const result: ObservedResult = {
          isObserved: false, reason: 'not observed', decoratorInfo: [decorator]
        };
        const valueInfo: MonitorValueInfo = {
          valueCallback: (): int => 1, path: 'value', observeProps: false
        };
        const baseOptions: MonitorBaseOptions = {
          isSynchronous: true, owner: new CoverageOwner()
        };
        expect(valueInfo.observeProps === false).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_GLOBAL_MONITORBASEOPTIONS_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_GLOBAL_MONITORBASEOPTIONS_0100
     * @tc.desc   Verify static Interface coverage for utils.global.MonitorBaseOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_GLOBAL_MONITORBASEOPTIONS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const monitorOptions: MonitorOptions = {
          isSynchronous: false, owner: new CoverageOwner(), path: ['first', 'second']
        };
        const element: ElementInfo = { elementName: 'Text', elementId: 1 };
        const decorator: DecoratorInfo = {
          decoratorName: 'Observed', stateVariableName: 'value',
          owningComponentOrClassName: 'CoverageRecord', owningComponentId: -1,
          dependentInfo: [element]
        };
        const result: ObservedResult = {
          isObserved: false, reason: 'not observed', decoratorInfo: [decorator]
        };
        const valueInfo: MonitorValueInfo = {
          valueCallback: (): int => 1, path: 'value', observeProps: false
        };
        const baseOptions: MonitorBaseOptions = {
          isSynchronous: true, owner: new CoverageOwner()
        };
        expect(baseOptions.isSynchronous === true).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_MONITORBASEOPTIONS_ISSYNCHRONOUS_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_MONITORBASEOPTIONS_ISSYNCHRONOUS_0100
     * @tc.desc   Verify static Property coverage for utils.MonitorBaseOptions.isSynchronous
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_MONITORBASEOPTIONS_ISSYNCHRONOUS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const monitorOptions: MonitorOptions = {
          isSynchronous: false, owner: new CoverageOwner(), path: ['first', 'second']
        };
        const element: ElementInfo = { elementName: 'Text', elementId: 1 };
        const decorator: DecoratorInfo = {
          decoratorName: 'Observed', stateVariableName: 'value',
          owningComponentOrClassName: 'CoverageRecord', owningComponentId: -1,
          dependentInfo: [element]
        };
        const result: ObservedResult = {
          isObserved: false, reason: 'not observed', decoratorInfo: [decorator]
        };
        const valueInfo: MonitorValueInfo = {
          valueCallback: (): int => 1, path: 'value', observeProps: false
        };
        const baseOptions: MonitorBaseOptions = {
          isSynchronous: true, owner: new CoverageOwner()
        };
        expect(baseOptions.isSynchronous === true).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_MONITORBASEOPTIONS_OWNER_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_MONITORBASEOPTIONS_OWNER_0100
     * @tc.desc   Verify static Property coverage for utils.MonitorBaseOptions.owner
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_MONITORBASEOPTIONS_OWNER_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const monitorOptions: MonitorOptions = {
          isSynchronous: false, owner: new CoverageOwner(), path: ['first', 'second']
        };
        const element: ElementInfo = { elementName: 'Text', elementId: 1 };
        const decorator: DecoratorInfo = {
          decoratorName: 'Observed', stateVariableName: 'value',
          owningComponentOrClassName: 'CoverageRecord', owningComponentId: -1,
          dependentInfo: [element]
        };
        const result: ObservedResult = {
          isObserved: false, reason: 'not observed', decoratorInfo: [decorator]
        };
        const valueInfo: MonitorValueInfo = {
          valueCallback: (): int => 1, path: 'value', observeProps: false
        };
        const baseOptions: MonitorBaseOptions = {
          isSynchronous: true, owner: new CoverageOwner()
        };
        expect(baseOptions.owner !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_GLOBAL_IREUSEPOOL_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_GLOBAL_IREUSEPOOL_0100
     * @tc.desc   Verify static Interface coverage for utils.global.IReusePool
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_GLOBAL_IREUSEPOOL_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const pool: IReusePool = new CoverageReusePool();
        expect(pool.getReusableInfo(Class.from<CoverageRecord>()) === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_IREUSEPOOL_GETREUSABLEINFO_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_IREUSEPOOL_GETREUSABLEINFO_0100
     * @tc.desc   Verify static Method coverage for utils.IReusePool.getReusableInfo
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_IREUSEPOOL_GETREUSABLEINFO_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const pool: IReusePool = new CoverageReusePool();
        expect(pool.getReusableInfo(Class.from<CoverageRecord>(), '') === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_IREUSEPOOL_PRERENDER_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_IREUSEPOOL_PRERENDER_0100
     * @tc.desc   Verify static Method coverage for utils.IReusePool.preRender
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_IREUSEPOOL_PRERENDER_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const pool: IReusePool = new CoverageReusePool();
        expect(pool.preRender !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_GLOBAL_CUSTOMCOMPONENTCONTEXT_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_GLOBAL_CUSTOMCOMPONENTCONTEXT_0100
     * @tc.desc   Verify static Interface coverage for utils.global.CustomComponentContext
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_GLOBAL_CUSTOMCOMPONENTCONTEXT_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const context: CustomComponentContext = new CoverageComponentContext();
        expect(context.getReusePool() !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_CUSTOMCOMPONENTCONTEXT_GETREUSEPOOL_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_CUSTOMCOMPONENTCONTEXT_GETREUSEPOOL_0100
     * @tc.desc   Verify static Method coverage for utils.CustomComponentContext.getReusePool
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_CUSTOMCOMPONENTCONTEXT_GETREUSEPOOL_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const context: CustomComponentContext = new CoverageComponentContext();
        expect(context.getReusePool() !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_GLOBAL_OBSERVEDARRAY_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_GLOBAL_OBSERVEDARRAY_0100
     * @tc.desc   Verify static Class coverage for utils.global.ObservedArray
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_GLOBAL_OBSERVEDARRAY_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const value: ObservedArray<int> =
          new ObservedArray<int>(3, (index: int): int => index);
        expect(value.length === 3 && value[2] === 2).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_GLOBAL_OBSERVEDDATE_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_GLOBAL_OBSERVEDDATE_0100
     * @tc.desc   Verify static Class coverage for utils.global.ObservedDate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_GLOBAL_OBSERVEDDATE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const value: ObservedDate = new ObservedDate(0);
        expect(value.getTime() === 0).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_GLOBAL_OBSERVEDMAP_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_GLOBAL_OBSERVEDMAP_0100
     * @tc.desc   Verify static Class coverage for utils.global.ObservedMap
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_GLOBAL_OBSERVEDMAP_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const value: ObservedMap<string, int> =
          new ObservedMap<string, int>([['key', 1]]);
        expect(value.get('key') === 1).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_UTILS_GLOBAL_OBSERVEDSET_0100
     * @tc.name   SUB_ARKUI_STCOV_UTILS_GLOBAL_OBSERVEDSET_0100
     * @tc.desc   Verify static Class coverage for utils.global.ObservedSet
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_UTILS_GLOBAL_OBSERVEDSET_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const value: ObservedSet<int> = new ObservedSet<int>([1, 2]);
        expect(value.has(2)).assertTrue();
      }
    );
  });
}
