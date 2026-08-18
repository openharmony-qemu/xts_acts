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

import {
  BaseConnectOptions, BaseCustomDialog, ConnectOptions, CustomBuilder,
  CustomComponent, CustomComponentContext, CustomComponentLifecycle,
  CustomComponentLifecycleObserver, CustomComponentLifecycleState,
  CustomComponentV2, EntryPoint, ExtendableComponent, IDecoratedVariable,
  IMonitor, IObservedObject, IReusePool, IReusableInfo, IVariableOwner,
  LayoutCallbacks, LifeCycle, LinkSourceType, PageLifeCycle,
  PersistPropsOptions, ReadableState, StateContext, StorageDefaultSubCreators,
  WrappedBuilder
} from '@kit.ArkUI';

export function referenceCoverageTypes(): boolean {
  const lifecycle: LifeCycle | undefined = undefined;
  const extendable: ExtendableComponent | undefined = undefined;
  const entryPoint: EntryPoint | undefined = undefined;
  const callbacks: LayoutCallbacks | undefined = undefined;
  const source: LinkSourceType<int> | undefined = undefined;
  const observed: IObservedObject | undefined = undefined;
  return lifecycle === undefined && extendable === undefined &&
    entryPoint === undefined && callbacks === undefined &&
    source === undefined && observed === undefined;
}

export class CoverageRecord {
  public value: int = 7;
}

export class CoverageOwner implements IVariableOwner {
}

export class CoverageReadableState implements ReadableState<int> {
  readonly value: int = 26;
}

export class CoverageStateContext implements StateContext {
  scope<T>(_id: int, _paramCount: int): never {
    throw new Error('state scope requires framework context');
  }
}

export class CoveragePageLifeCycle implements PageLifeCycle {
  onPageShow(): void {
  }
}

export class CoverageLifecycleObserver implements CustomComponentLifecycleObserver {
  aboutToAppear(): void {
  }

  onDidBuild(): void {
  }

  aboutToDisappear(): void {
  }

  aboutToReuse(): void {
  }

  aboutToRecycle(): void {
  }
}

export class CoverageLifecycle implements CustomComponentLifecycle {
  private observerCount: int = 0;

  getCurrentState(): CustomComponentLifecycleState {
    return CustomComponentLifecycleState.INIT;
  }

  addObserver(_observer: CustomComponentLifecycleObserver): void {
    this.observerCount++;
  }

  removeObserver(_observer: CustomComponentLifecycleObserver): void {
    this.observerCount--;
  }

  count(): int {
    return this.observerCount;
  }
}

export class CoverageDecoratedVariable implements IDecoratedVariable {
  readonly varName: string = 'staticCoverage';
}

export function inspectMonitor(monitor: IMonitor): boolean {
  return monitor.dirty.length >= 0 && monitor.value<int>('value') === undefined;
}

export class CoverageReusePool implements IReusePool {
  getReusableInfo(_componentConstructor: Class,
    _reuseId?: string): IReusableInfo[] | IReusableInfo | undefined {
    return undefined;
  }

  preRender(_builder: WrappedBuilder<CustomBuilder>, _times: int): Promise<void> {
    return Promise.resolve();
  }
}

export class CoverageComponentContext implements CustomComponentContext {
  private readonly pool: IReusePool = new CoverageReusePool();

  getReusePool(): IReusePool | undefined {
    return this.pool;
  }

  registerActiveAndInactiveCallback(_active?: () => void,
    _inactive?: () => void): void {
  }
}

export function makeRecord(): CoverageRecord {
  return new CoverageRecord();
}

export function toCoverageJson(_value: CoverageRecord): jsonx.JsonElement {
  throw new Error('coverage serializer is compile-only');
}

export function fromCoverageJson(_value: jsonx.JsonElement): CoverageRecord {
  return new CoverageRecord();
}

export function contains(values: string[], expected: string): boolean {
  return values.indexOf(expected) >= 0;
}

export abstract class BaseCustomDialogStub extends
  BaseCustomDialog<BaseCustomDialogStub, Object> {
}

export abstract class CustomComponentStub extends
  CustomComponent<CustomComponentStub, Object> {
}

export abstract class CustomComponentV2Stub extends
  CustomComponentV2<CustomComponentV2Stub, Object> {
}

export function makeSubCreators(): StorageDefaultSubCreators {
  const creators: StorageDefaultSubCreators = new Map<Class, () => object>();
  creators.set(Class.from<CoverageRecord>(), (): object => new CoverageRecord());
  return creators;
}

export function makeConnectOptions(): ConnectOptions<CoverageRecord> {
  return {
    type: Class.from<CoverageRecord>(),
    key: 'static_coverage_global_record',
    defaultCreator: makeRecord,
    toJson: toCoverageJson,
    fromJson: fromCoverageJson,
    enableAutoSave: false,
    defaultSubCreators: makeSubCreators()
  };
}

export function makeBaseConnectOptions(): BaseConnectOptions<CoverageRecord> {
  return {
    toJson: toCoverageJson,
    fromJson: fromCoverageJson,
    enableAutoSave: false
  };
}

export function makePersistOptions(): PersistPropsOptions<int> {
  return {
    key: 'static_coverage_persistent',
    defaultValue: 9,
    toJson: (_value: int): jsonx.JsonElement => {
      throw new Error('coverage serializer is compile-only');
    },
    fromJson: (_value: jsonx.JsonElement): int => 9
  };
}
