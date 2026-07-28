'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { ConfigService } from './module/config/configService';
import { SuiteService } from './module/service/SuiteService';
import { SpecService } from './module/service/SpecService';
import { ExpectService, AssertMatcher } from './module/service/ExpectService';
import { ReportService } from './module/service/ReportService';
import { OhReport } from './module/report/OhReport';
import { SpecEvent, TaskEvent, SuiteEvent } from './module/service/event';
import { ApiIF, ServiceIF } from './interface';
import { HypiumValue, HookFuncType, ItfnType } from './module/types/common';
import { WorkerLocal, concurrency } from 'std/concurrency';
/**
 * core service for execute testcase.
 */
type EventType = SuiteEvent | SpecEvent | TaskEvent;
class Core {
  // Eager WorkerLocal: per-thread storage via get/set; avoid lazy static init races.
  public static instance: WorkerLocal<Core> = new WorkerLocal<Core>(() => new Core());
  public static getInstance(): Core | null {
    return Core.instance.get();
  }

  public static setThreadInstance(core: Core): void {
    Core.instance.set(core);
  }

  public services: Map<string, Map<string, ServiceIF>>;
  public events: Map<string, Map<string, EventType>>;
  public describe: (desc: string, func: () => void) => void;
  public xdescribe: (desc: string, func: () => void, reason: string) => void;
  public beforeItSpecified: (itDescs: string | string[], func: HookFuncType) => void;
  public afterItSpecified: (itDescs: string | string[], func: HookFuncType) => void;
  public beforeAll: (func: HookFuncType) => void;
  public beforeEach: (func: HookFuncType) => void;
  public beforeEachIt: (func: HookFuncType) => void;
  public afterAll: (func: HookFuncType) => void;
  public afterEach: (func: HookFuncType) => void;
  public afterEachIt: (func: HookFuncType) => void;
  public it: (desc: string, filter: int, func: ItfnType, timeout?: number, tag?: string) => void;
  public xit: (desc: string, filter: int, func: ItfnType, reason: string) => void;
  public expect: ((actualValue?: HypiumValue) => AssertMatcher) | null;
  public specEvent: SpecEvent;
  public suiteEvent: SuiteEvent;
  public taskEvent: TaskEvent;
  public sService: SuiteService | null;
  public msgHandle: concurrency.MessageHandler | null = null;
  constructor() {
    this.services = new Map<string, Map<string, ServiceIF>>();
    this.events = new Map<string, Map<string, EventType>>();
    this.describe = (desc: string, func: () => void): void => {};
    this.xdescribe = (desc: string, func: () => void, reason: string) => {};
    this.beforeItSpecified = (itDescs: string | string[], func: HookFuncType) => { };
    this.afterItSpecified = (itDescs: string | string[], func: HookFuncType) => { };
    this.beforeAll = (func: HookFuncType) => { };
    this.beforeEach = (func: HookFuncType) => { };
    this.beforeEachIt = (func: HookFuncType) => { };
    this.afterAll = (func: HookFuncType) => { };
    this.afterEach = (func: HookFuncType) => { };
    this.afterEachIt = (func: HookFuncType) => { };
    this.it = (desc: string, filter: int, func: ItfnType, timeout?: number, tag?: string) => { };
    this.xit = (desc: string, filter: int, func: ItfnType, reason: string) => { };
    this.expect = null;
    this.specEvent = new SpecEvent({ id: '' });
    this.suiteEvent = new SuiteEvent({ id: '' });
    this.taskEvent = new TaskEvent({ id: '' });
    this.sService = null;
  }

  addService(name: string, service: ServiceIF): void {
    let serviceMap = this.services.get(name);
    if (!serviceMap) {
      serviceMap = new Map<string, ServiceIF>();
      this.services.set(name, serviceMap);
    }
    serviceMap.set(service.id, service);
  }

  getDefaultService(name: string): ServiceIF | null {
    const serviceMap = this.services.get(name);
    if (serviceMap) {
      return serviceMap.get('default') ?? null;
    } else {
      return null;
    }
  }

  getServices(name: string): Map<string, ServiceIF> | undefined {
    return this.services.get(name);
  }

  registerEvent(serviceName: string, event: EventType): void {
    let eventMap = this.events.get(serviceName);
    if (!eventMap) {
      eventMap = new Map<string, EventType>();
      this.events.set(serviceName, eventMap);
    }
    eventMap.set(event.id, event);
  }

  unRegisterEvent(serviceName: string, eventID: string): void {
    const eventObj = this.events.get(serviceName);
    if (eventObj) {
      eventObj.delete(eventID);
    }
  }

  subscribeEvent(serviceName: string, serviceObj: ReportService | OhReport): void {
    const eventMap = this.events.get(serviceName);
    if (eventMap) {
      eventMap.forEach((value: EventType) => {
        value.subscribeEvent(serviceObj);
      });
    }
  }

  async fireEvents(serviceName: string, eventName: string): Promise<void> {
    const eventMap = this.events.get(serviceName);
    if (!eventMap || eventMap.size === 0) {
      return;
    }
    // Events are keyed by id (typically 'default'). Dispatch every registered event
    // so duplicate ids / additional registrations are not silently skipped.
    // Prefer 'default' first, then remaining entries in map iteration order.
    const events: EventType[] = [];
    const defaultEvent = eventMap.get('default');
    if (defaultEvent !== undefined) {
      events.push(defaultEvent);
    }
    for (const e of eventMap.values()) {
      if (defaultEvent !== undefined && e === defaultEvent) {
        continue;
      }
      events.push(e);
    }
    for (const event of events) {
      switch (eventName) {
        case 'specStart':
          if (event instanceof SpecEvent) {
            this.specEvent = event;
            await this.specEvent.specStart();
          }
          break;
        case 'specDone':
          if (event instanceof SpecEvent) {
            this.specEvent = event;
            await this.specEvent.specDone();
          }
          break;
        case 'suiteStart':
          if (event instanceof SuiteEvent) {
            this.suiteEvent = event;
            await this.suiteEvent.suiteStart();
          }
          break;
        case 'suiteDone':
          if (event instanceof SuiteEvent) {
            this.suiteEvent = event;
            await this.suiteEvent.suiteDone();
          }
          break;
        case 'taskStart':
          if (event instanceof TaskEvent) {
            this.taskEvent = event;
            await this.taskEvent.taskStart();
          }
          break;
        case 'taskDone':
          if (event instanceof TaskEvent) {
            this.taskEvent = event;
            await this.taskEvent.taskDone();
          }
          break;
        case 'incorrectFormat':
          if (event instanceof TaskEvent) {
            event.incorrectFormat();
          }
          break;
        case 'incorrectTestSuiteFormat':
          if (event instanceof TaskEvent) {
            event.incorrectTestSuiteFormat();
          }
          break;
      }
    }
  }

  addToGlobal(apis: ApiIF): void {
    const describe = apis.describe;
    if (describe) {
      this.describe = describe;
    }
    const xdescribe = apis.xdescribe;
    if (xdescribe) {
      this.xdescribe = xdescribe;
    }
    const beforeItSpecified = apis.beforeItSpecified;
    if (beforeItSpecified) {
      this.beforeItSpecified = beforeItSpecified;
    }
    const afterItSpecified = apis.afterItSpecified;
    if (afterItSpecified) {
      this.afterItSpecified = afterItSpecified;
    }
    const beforeAll = apis.beforeAll;
    if (beforeAll) {
      this.beforeAll = beforeAll;
    }
    const beforeEach = apis.beforeEach;
    if (beforeEach) {
      this.beforeEach = beforeEach;
    }
    const beforeEachIt = apis.beforeEachIt;
    if (beforeEachIt) {
      this.beforeEachIt = beforeEachIt;
    }
    const afterAll = apis.afterAll;
    if (afterAll) {
      this.afterAll = afterAll;
    }
    const afterEach = apis.afterEach;
    if (afterEach) {
      this.afterEach = afterEach;
    }
    const afterEachIt = apis.afterEachIt;
    if (afterEachIt) {
      this.afterEachIt = afterEachIt;
    }
    const it = apis.it;
    if (it) {
      this.it = it;
    }
    const xit = apis.xit;
    if (xit) {
      this.xit = xit;
    }
    const expect = apis.expect;
    if (expect) {
      this.expect = expect as (actualValue?: HypiumValue) => AssertMatcher;
    }
  }

  init(): void {
    const suiteService = new SuiteService({ id: 'default' });
    suiteService.msgHandle = this.msgHandle;
    this.addService('suite', suiteService);
    this.addService('spec', new SpecService({ id: 'default' }));
    this.addService('expect', new ExpectService({ id: 'default' }));
    this.addService('report', new ReportService({ id: 'default' }));
    this.addService('config', new ConfigService({ id: 'default' }));
    this.registerEvent('task', new TaskEvent({ id: 'default' }));
    this.registerEvent('suite', new SuiteEvent({ id: 'default' }));
    this.registerEvent('spec', new SpecEvent({ id: 'default' }));
    const report = this.getDefaultService('report');
    if (report instanceof ReportService || report instanceof OhReport) {
      this.subscribeEvent('spec', report);
      this.subscribeEvent('suite', report);
      this.subscribeEvent('task', report);
    }

    for (const serviceMap of this.services.values()) {
      for (const service of serviceMap.values()) {
        service.init(this);
        this.addToGlobal(service.apis());
      }
    }
  }

  async execute(abilityDelegator: abilityDelegatorRegistry.AbilityDelegator | null): Promise<void> {
    const suiteService = this.getDefaultService('suite');
    const configService = this.getDefaultService('config');
    if (suiteService instanceof SuiteService && configService instanceof ConfigService) {
      this.sService = suiteService;
      const cService = configService;
      if (cService.dryRun === 'true') {
        if (abilityDelegator === null) {
          throw new Error('dryRun requires AbilityDelegator on main thread');
        }
        await suiteService.dryRun(abilityDelegator);
      } else {
        try {
          await suiteService.execute();
        } catch (e) {
          const errMsg = e instanceof Error ? e.message : String(e);
          console.error(`Core execute exception, error: ${errMsg}`);
          // Worker mode (msgHandle set / null delegator): never call finishTest here.
          if (abilityDelegator !== null && this.msgHandle === null) {
            abilityDelegator.finishTest(`Core execute exception: ${errMsg}`, -1, () => {});
          }
          throw (e instanceof Error ? e : new Error(errMsg));
        }
      }
    } else {
      throw new Error('SuiteService or ConfigService not initialized');
    }
  }
}
export { Core };
