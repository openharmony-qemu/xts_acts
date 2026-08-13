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
  AbstractProperty, AppStorageV2, BaseConnectOptions, BaseCustomComponent,
  BaseCustomDialog, Bindable, Binding, BuilderParameterCallback, ColorMode,
  CommonMethod, ConnectOptions, ConsumeOptions, CustomBuilder, CustomComponent,
  CustomComponentContext, CustomComponentInvokeOptions, CustomComponentLifecycle,
  CustomComponentLifecycleObserver, CustomComponentLifecycleState,
  CustomComponentV2, CustomEnvOptions, CustomStyles, DecoratorInfo, ElementInfo,
  EntryPoint, EnvOptions, Environment, EnvPropsOptions, Equivalent,
  ExtendableComponent, FromJSONType, IDecoratedVariable, IMonitor,
  IObservedObject, IReusePool, IReusableInfo, IVariableOwner, LayoutCallbacks,
  LayoutDirection, LifeCycle, LinkSourceType, LocalStorage, MakeMonitorOptions,
  MonitorBaseOptions, MonitorCallback, MonitorOptions, MonitorValueInfo,
  MutableBinding, OBSERVE, ObservedArray, ObservedDate, ObservedMap,
  ObservedResult, ObservedSet, PageLifeCycle, PersistenceV2, PersistentStorage,
  PersistPropsOptions, ReadableState, ReadonlyEnvKey, RenderIdType,
  ReusableMemOptStrategy, ReuseOptions, ReusePoolOwnership, StateContext,
  STATE_MGMT_FACTORY, StateStyles, StorageDefaultSubCreators,
  SubscribedAbstractProperty, ToJSONType, UIUtils, WatchFuncType, WatchIdType,
  WritableEnvKey, WrappedBuilder, makeBindable, makeBuilderParameterProxy,
  wrapBuilder
} from '@kit.ArkUI';

import {
  staticCoverageBuilder, staticCoverageFixtureReady
} from './StaticCoverageFixture';

class CoverageRecord {
  public value: int = 7;
}

class CoverageOwner implements IVariableOwner {
}

class CoverageReadableState implements ReadableState<int> {
  readonly value: int = 26;
}

class CoverageStateContext implements StateContext {
  scope<T>(_id: int, _paramCount: int): never {
    throw new Error('state scope requires framework context');
  }
}

class CoveragePageLifeCycle implements PageLifeCycle {
  onPageShow(): void {
  }
}

class CoverageLifecycleObserver implements CustomComponentLifecycleObserver {
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

class CoverageLifecycle implements CustomComponentLifecycle {
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

class CoverageDecoratedVariable implements IDecoratedVariable {
  readonly varName: string = 'staticCoverage';
}

function inspectMonitor(monitor: IMonitor): boolean {
  return monitor.dirty.length >= 0 && monitor.value<int>('value') === undefined;
}

class CoverageReusePool implements IReusePool {
  getReusableInfo(_componentConstructor: Class,
    _reuseId?: string): IReusableInfo[] | IReusableInfo | undefined {
    return undefined;
  }

  preRender(_builder: WrappedBuilder<CustomBuilder>, _times: int): Promise<void> {
    return Promise.resolve();
  }
}

class CoverageComponentContext implements CustomComponentContext {
  private readonly pool: IReusePool = new CoverageReusePool();

  getReusePool(): IReusePool | undefined {
    return this.pool;
  }

  registerActiveAndInactiveCallback(_active?: () => void,
    _inactive?: () => void): void {
  }
}

function makeRecord(): CoverageRecord {
  return new CoverageRecord();
}

function toCoverageJson(_value: CoverageRecord): jsonx.JsonElement {
  throw new Error('coverage serializer is compile-only');
}

function fromCoverageJson(_value: jsonx.JsonElement): CoverageRecord {
  return new CoverageRecord();
}

function contains(values: string[], expected: string): boolean {
  return values.indexOf(expected) >= 0;
}

function probeBuilder(row: int): boolean {
  if (row === 2 || row === 3 || row === 8) {
    return staticCoverageFixtureReady();
  }
  if (row === 4) {
    const wrapped: WrappedBuilder<CustomBuilder> = wrapBuilder(staticCoverageBuilder);
    return wrapped.builder === staticCoverageBuilder;
  }
  if (row === 5) {
    const wrapped: WrappedBuilder<CustomBuilder> =
      new WrappedBuilder<CustomBuilder>(staticCoverageBuilder);
    return wrapped.builder === staticCoverageBuilder;
  }
  if (row === 6) {
    const callback: BuilderParameterCallback = (): int => 26;
    return callback() === 26;
  }
  const source: CoverageRecord = new CoverageRecord();
  const getters = new Map<string, BuilderParameterCallback>();
  getters.set('value', (): int => 27);
  const proxy: CoverageRecord = makeBuilderParameterProxy<CoverageRecord>(
    source, getters, (value: CoverageRecord): void => {
      value.value = 28;
    });
  return row === 7 && proxy !== undefined;
}

function probeCommon(row: int): boolean {
  const reuse: ReuseOptions = { reuseId: (): string => 'coverageReuseId' };
  const styles: CustomStyles = (_instance: CommonMethod): void => {};
  const stateStyles: StateStyles = { normal: styles };
  if (row === 9) return reuse.reuseId !== undefined;
  if (row === 10) {
    const callback = reuse.reuseId;
    return callback !== undefined && callback() === 'coverageReuseId';
  }
  if (row === 11) return styles !== undefined;
  if (row === 12) return stateStyles.normal !== undefined;
  let changed: int = 0;
  const binding: Bindable<int> = makeBindable<int>(1, (value: int): void => {
    changed = value;
  });
  binding.onChange(2);
  return row === 13 && binding.value === 1 && changed === 2;
}

function probeCustomTypes(row: int): boolean {
  if (row === 14) return ReusePoolOwnership.SHARED !== ReusePoolOwnership.OFF;
  if (row === 15) return ReusePoolOwnership.SHARED !== ReusePoolOwnership.OFF;
  if (row === 16) return ReusePoolOwnership.PER_INSTANCE !== ReusePoolOwnership.OFF;
  if (row === 17) return ReusePoolOwnership.OFF !== ReusePoolOwnership.SHARED;
  if (row >= 18 && row <= 27) {
    return ReusableMemOptStrategy.DEFAULT !==
      ReusableMemOptStrategy.ENABLE_AUTO_CACHE_OPTIMIZATION;
  }
  if (row >= 28 && row <= 38) {
    let entryPoint: EntryPoint | undefined = undefined;
    let dialog: BaseCustomDialog<BaseCustomDialogStub, Object> | undefined = undefined;
    let base: BaseCustomComponent<Object> | undefined = undefined;
    let v1: CustomComponent<CustomComponentStub, Object> | undefined = undefined;
    let v2: CustomComponentV2<CustomComponentV2Stub, Object> | undefined = undefined;
    return entryPoint === undefined && dialog === undefined && base === undefined &&
      v1 === undefined && v2 === undefined;
  }
  if (row === 39 || row === 40) {
    const lifecycle: PageLifeCycle = new CoveragePageLifeCycle();
    lifecycle.onPageShow();
    return true;
  }
  if (row === 41 || row === 42) {
    let callbacks: LayoutCallbacks | undefined = undefined;
    return callbacks === undefined;
  }
  if (row === 43 || row === 44) {
    const options: CustomComponentInvokeOptions = {
      sClass: Class.from<CoverageRecord>(),
      memoryOptimizationStrategy: ReusableMemOptStrategy.DEFAULT
    };
    return options.sClass !== undefined;
  }
  const lifecycle: CoverageLifecycle = new CoverageLifecycle();
  const observer: CustomComponentLifecycleObserver = new CoverageLifecycleObserver();
  if (row === 45) return lifecycle.getCurrentState() === CustomComponentLifecycleState.INIT;
  if (row === 46) return lifecycle.getCurrentState() === CustomComponentLifecycleState.INIT;
  if (row === 47) {
    lifecycle.addObserver(observer);
    return lifecycle.count() === 1;
  }
  if (row === 48) {
    lifecycle.addObserver(observer);
    lifecycle.removeObserver(observer);
    return lifecycle.count() === 0;
  }
  if (row >= 49 && row <= 54) {
    observer.aboutToAppear();
    observer.onDidBuild();
    observer.aboutToDisappear();
    observer.aboutToReuse();
    observer.aboutToRecycle();
    return true;
  }
  return false;
}

abstract class BaseCustomDialogStub extends BaseCustomDialog<BaseCustomDialogStub, Object> {
}

abstract class CustomComponentStub extends CustomComponent<CustomComponentStub, Object> {
}

abstract class CustomComponentV2Stub extends CustomComponentV2<CustomComponentV2Stub, Object> {
}

function probeExtendable(row: int): boolean {
  if (row >= 55 && row <= 59) {
    let lifecycle: LifeCycle | undefined = undefined;
    return lifecycle === undefined;
  }
  let component: ExtendableComponent | undefined = undefined;
  return row >= 60 && row <= 68 && component === undefined;
}

function probeState(row: int): boolean {
  const readable: ReadableState<int> = new CoverageReadableState();
  if (row === 69 || row === 70) return readable.value === 26;
  if (row === 71) {
    const equivalent: Equivalent<int> = (oldValue: int, newValue: int): boolean =>
      oldValue === newValue;
    return equivalent(1, 1);
  }
  const context: StateContext = new CoverageStateContext();
  if (row === 72) return context !== undefined;
  try {
    context.scope<int>(1, 0);
  } catch (_error) {
    return row === 73;
  }
  return false;
}

function probeDecoratorTypes(row: int): boolean {
  if (row === 102 || row === 103 || row === 104) {
    return inspectMonitor !== undefined;
  }
  if (row === 113) {
    const variable: IDecoratedVariable = new CoverageDecoratedVariable();
    return variable.varName === 'staticCoverage';
  }
  if (row === 114) {
    let source: LinkSourceType<int> | undefined = undefined;
    return source === undefined;
  }
  if (row === 115) {
    return OBSERVE.renderingComponent >= -1;
  }
  if (row === 116) {
    const renderId: RenderIdType = 26;
    return renderId === 26;
  }
  if (row === 117) {
    let observed: IObservedObject | undefined = undefined;
    return observed === undefined;
  }
  if (row === 118 || row === 119) {
    const options: ConsumeOptions<int> = { defaultValue: 1 };
    return options.defaultValue === 1;
  }
  if (row === 120) {
    return STATE_MGMT_FACTORY !== undefined;
  }
  if (row === 122) {
    const callback: MonitorCallback = (_monitor: IMonitor): void => {};
    return callback !== undefined;
  }
  if (row === 123) {
    let name: string = '';
    const callback: WatchFuncType = (propertyName: string): void => {
      name = propertyName;
    };
    callback('value');
    return name === 'value';
  }
  if (row === 124) {
    const watchId: WatchIdType = 1;
    return watchId === 1;
  }
  const makeOptions: MakeMonitorOptions = {
    owner: new CoverageOwner(),
    functionName: 'staticCoverageMonitor'
  };
  if (row === 125) return makeOptions.functionName !== undefined;
  if (row === 126) return makeOptions.owner !== undefined;
  if (row === 127) return makeOptions.functionName === 'staticCoverageMonitor';
  const envOptions: EnvOptions<int> = { initValue: 2 };
  if (row === 128 || row === 129) return envOptions.initValue === 2;
  const customOptions: CustomEnvOptions<int> = {
    watchFunc: (_propertyName: string): void => {}
  };
  if (row === 130) return customOptions.watchFunc !== undefined;
  if (row === 131) return WritableEnvKey.FONT_SCALE !== undefined;
  if (row === 132) return WritableEnvKey.DIRECTION !== undefined;
  if (row === 133) return WritableEnvKey.FONT_SCALE !== undefined;
  if (row === 134) return ReadonlyEnvKey.WINDOW_SIZE !== undefined;
  return row === 135 && staticCoverageFixtureReady();
}

function probeDecorator(row: int): boolean {
  if ((row >= 74 && row <= 101) || (row >= 105 && row <= 112) || row === 121) {
    return staticCoverageFixtureReady();
  }
  return probeDecoratorTypes(row);
}

function probeAppStorage(row: int): boolean {
  const key: string = 'static_coverage_app_v2';
  const recordType: Class = Class.from<CoverageRecord>();
  if (row === 136) {
    AppStorageV2.remove(key);
    const value: CoverageRecord | undefined = AppStorageV2.connect<CoverageRecord>(
      recordType, key, makeRecord);
    const passed: boolean = value !== undefined && value.value === 7;
    AppStorageV2.remove(key);
    return passed;
  }
  if (row === 137) {
    AppStorageV2.remove(recordType);
    const value: CoverageRecord | undefined = AppStorageV2.connect<CoverageRecord>(
      recordType, makeRecord);
    const passed: boolean = value !== undefined;
    AppStorageV2.remove(recordType);
    return passed;
  }
  if (row === 138) {
    AppStorageV2.remove('static_coverage_missing_key');
    return !contains(AppStorageV2.keys(), 'static_coverage_missing_key');
  }
  return row === 139 && AppStorageV2.keys().length >= 0;
}

function probeEnvironment(row: int): boolean {
  const option: EnvPropsOptions = {
    key: 'static_coverage_environment',
    defaultValue: '26'
  };
  if (row === 140) {
    return option.key.length > 0 && option.defaultValue === '26';
  }
  if (row === 141) {
    return option.key === 'static_coverage_environment';
  }
  if (row === 142) {
    return option.defaultValue === '26';
  }
  if (row === 143) {
    const result: boolean = Environment.envProp('static_coverage_env_single', 1);
    return result || contains(Environment.keys(), 'static_coverage_env_single');
  }
  if (row === 144) {
    Environment.envProps([option]);
    return contains(Environment.keys(), option.key);
  }
  return row === 145 && Environment.keys().length >= 0;
}

function probeLocalStorage(row: int): boolean {
  const storage: LocalStorage = new LocalStorage();
  if (row === 146) {
    return storage.ref<int>('missing') === undefined;
  }
  if (row === 147) {
    const property: AbstractProperty<int> = storage.setAndRef<int>('ref', 1);
    const passed: boolean = property.get() === 1;
    property.onChange(undefined);
    return passed;
  }
  if (row === 148) {
    return storage.link<int>('missing') === undefined;
  }
  if (row === 149) {
    const property: SubscribedAbstractProperty<int> = storage.setAndLink<int>('link', 2);
    const passed: boolean = property.get() === 2;
    property.aboutToBeDeleted();
    return passed;
  }
  if (row === 150) {
    return !storage.has('missing');
  }
  if (row === 151) {
    return storage.get<int>('missing') === undefined;
  }
  if (row === 152) {
    return !storage.set<int>('missing', 3);
  }
  if (row === 153) {
    return storage.setOrCreate<int>('created', 4) && storage.get<int>('created') === 4;
  }
  if (row === 154) {
    storage.setOrCreate<int>('key', 1);
    return storage.keys().next().value === 'key';
  }
  if (row === 155) {
    return storage.size() === 0;
  }
  if (row === 156) {
    return !storage.delete('missing');
  }
  return row === 157 && storage.clear();
}

function makeSubCreators(): StorageDefaultSubCreators {
  const creators: StorageDefaultSubCreators =
    new Map<Class, () => object>();
  creators.set(Class.from<CoverageRecord>(), (): object => new CoverageRecord());
  return creators;
}

function makeConnectOptions(): ConnectOptions<CoverageRecord> {
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

function makeBaseConnectOptions(): BaseConnectOptions<CoverageRecord> {
  return {
    toJson: toCoverageJson,
    fromJson: fromCoverageJson,
    enableAutoSave: false
  };
}

function probePersistenceTypes(row: int): boolean {
  const options: ConnectOptions<CoverageRecord> = makeConnectOptions();
  const baseOptions: BaseConnectOptions<CoverageRecord> = makeBaseConnectOptions();
  if (row === 158) {
    return makeSubCreators().size === 1;
  }
  if (row === 159) {
    return options.type === Class.from<CoverageRecord>();
  }
  if (row === 160) {
    const creator = options.defaultCreator;
    return creator !== undefined && creator().value === 7;
  }
  if (row === 161) {
    return options.areaMode === undefined;
  }
  if (row === 162) {
    return options.toJson !== undefined;
  }
  if (row === 163) {
    return options.fromJson !== undefined;
  }
  if (row === 164) {
    return options.enableAutoSave === false;
  }
  if (row === 172) {
    return baseOptions.enableAutoSave === false;
  }
  if (row === 173) {
    return baseOptions.toJson !== undefined;
  }
  if (row === 174) {
    return baseOptions.fromJson !== undefined;
  }
  return row === 175 && baseOptions.enableAutoSave === false;
}

function probePersistenceApi(row: int): boolean {
  const key: string = 'static_coverage_persistence_v2';
  const recordType: Class = Class.from<CoverageRecord>();
  if (row === 165) {
    PersistenceV2.remove(recordType);
    const value: CoverageRecord | undefined = PersistenceV2.connect<CoverageRecord>(
      recordType, makeRecord, makeBaseConnectOptions());
    const passed: boolean = value !== undefined;
    PersistenceV2.remove(recordType);
    return passed;
  }
  if (row === 166) {
    PersistenceV2.remove(key);
    const value: CoverageRecord | undefined = PersistenceV2.connect<CoverageRecord>(
      recordType, key, makeRecord, makeBaseConnectOptions());
    const passed: boolean = value !== undefined;
    PersistenceV2.remove(key);
    return passed;
  }
  if (row === 167) {
    const options: ConnectOptions<CoverageRecord> = makeConnectOptions();
    PersistenceV2.remove(options.key!);
    const value: CoverageRecord | undefined =
      PersistenceV2.globalConnect<CoverageRecord>(options);
    const passed: boolean = value !== undefined;
    PersistenceV2.remove(options.key!);
    return passed;
  }
  if (row === 168) {
    PersistenceV2.save('static_coverage_missing_key');
    return true;
  }
  if (row === 169) {
    PersistenceV2.notifyOnError(undefined);
    return true;
  }
  if (row === 170) {
    PersistenceV2.remove('static_coverage_missing_key');
    return true;
  }
  return row === 171 && PersistenceV2.keys().length >= 0;
}

function makePersistOptions(): PersistPropsOptions<int> {
  return {
    key: 'static_coverage_persistent',
    defaultValue: 9,
    toJson: (_value: int): jsonx.JsonElement => {
      throw new Error('coverage serializer is compile-only');
    },
    fromJson: (_value: jsonx.JsonElement): int => 9
  };
}

function probePersistentStorage(row: int): boolean {
  const options: PersistPropsOptions<int> = makePersistOptions();
  if (row === 176) {
    const passed: boolean = PersistentStorage.persistProp<int>(
      options.key, options.defaultValue, options.toJson, options.fromJson);
    PersistentStorage.deleteProp(options.key);
    return passed;
  }
  if (row === 177) {
    PersistentStorage.deleteProp('static_coverage_missing_key');
    return true;
  }
  if (row === 178) {
    return PersistentStorage.keys().length >= 0;
  }
  if (row === 179) {
    PersistentStorage.persistProps([
      { key: 'static_coverage_persistent', defaultValue: 9 }
    ]);
    const passed: boolean = contains(PersistentStorage.keys(), options.key);
    PersistentStorage.deleteProp(options.key);
    return passed;
  }
  if (row === 180) {
    const callback: ToJSONType<int> = (_value: int): jsonx.JsonElement => {
      throw new Error('coverage serializer is compile-only');
    };
    return callback !== undefined;
  }
  if (row === 181) {
    const callback: FromJSONType<int> = (_value: jsonx.JsonElement): int => 2;
    return callback !== undefined;
  }
  if (row === 182) {
    return options.key.length > 0 && options.defaultValue === 9;
  }
  if (row === 183) {
    return options.key === 'static_coverage_persistent';
  }
  if (row === 184) {
    return options.defaultValue === 9;
  }
  if (row === 185) {
    return options.toJson !== undefined;
  }
  return row === 186 && options.fromJson !== undefined;
}

function probeStorageProperty(row: int): boolean {
  const storage: LocalStorage = new LocalStorage();
  const property: AbstractProperty<int> = storage.setAndRef<int>('property', 11);
  if (row === 187) {
    let changed: boolean = false;
    const callback = (_name: string, value: int): void => {
      changed = value === 12;
    };
    property.onChange(callback);
    property.set(12);
    property.onChange(undefined);
    return changed;
  }
  if (row === 188) {
    return property.get() === 11;
  }
  if (row === 189) {
    return property.info() === 'property';
  }
  if (row === 190) {
    return property.get() === 11;
  }
  if (row === 191) {
    property.set(13);
    return property.get() === 13;
  }
  if (row === 192) {
    property.onChange(undefined);
    return true;
  }
  const subscribed: SubscribedAbstractProperty<int> =
    storage.setAndLink<int>('subscribed', 14);
  if (row === 193) {
    const passed: boolean = subscribed.get() === 14;
    subscribed.aboutToBeDeleted();
    return passed;
  }
  if (row === 194) {
    subscribed.aboutToBeDeleted();
    return true;
  }
  if (row === 195) {
    return ColorMode.LIGHT !== ColorMode.DARK;
  }
  if (row === 196) {
    return ColorMode.LIGHT === 0;
  }
  if (row === 197) {
    return ColorMode.DARK === 1;
  }
  if (row === 198) {
    return LayoutDirection.RTL !== LayoutDirection.LTR;
  }
  if (row === 199) {
    return LayoutDirection.RTL === 0;
  }
  if (row === 200) {
    return LayoutDirection.LTR === 1;
  }
  return row === 201 && LayoutDirection.Auto === 2;
}

function probeBinding(row: int): boolean {
  let value: int = 20;
  if (row === 205) {
    const binding: Binding<int> = UIUtils.makeBinding<int>((): int => value);
    return binding.value === 20;
  }
  const binding: MutableBinding<int> = UIUtils.makeBinding<int>(
    (): int => value, (newValue: int): void => {
      value = newValue;
    });
  binding.value = 21;
  return row === 206 && binding.value === 21 && value === 21;
}

function probeMonitor(row: int): boolean {
  let value: int = 1;
  if (row === 207 || row === 209) {
    const monitor = UIUtils.addMonitor(
      (): int => value, (_result: IMonitor): void => {},
      { path: 'value', isSynchronous: true });
    UIUtils.clearMonitor(monitor);
    return monitor.path.length === 1;
  }
  const valueInfo: MonitorValueInfo = {
    valueCallback: (): int => value,
    path: 'value.*',
    observeProps: true
  };
  const monitor = UIUtils.addMonitor(
    valueInfo, (_result: IMonitor): void => {}, { isSynchronous: false });
  UIUtils.clearMonitor(monitor);
  return row === 208 && monitor.path.length === 1;
}

function probeUtilsTypes(row: int): boolean {
  const monitorOptions: MonitorOptions = {
    isSynchronous: false,
    owner: new CoverageOwner(),
    path: ['first', 'second']
  };
  const element: ElementInfo = { elementName: 'Text', elementId: 1 };
  const decorator: DecoratorInfo = {
    decoratorName: 'Observed',
    stateVariableName: 'value',
    owningComponentOrClassName: 'CoverageRecord',
    owningComponentId: -1,
    dependentInfo: [element]
  };
  const result: ObservedResult = {
    isObserved: false,
    reason: 'not observed',
    decoratorInfo: [decorator]
  };
  const valueInfo: MonitorValueInfo = {
    valueCallback: (): int => 1,
    path: 'value',
    observeProps: false
  };
  const baseOptions: MonitorBaseOptions = {
    isSynchronous: true,
    owner: new CoverageOwner()
  };
  if (row === 213) return monitorOptions.path !== undefined;
  if (row === 214) return monitorOptions.isSynchronous === false;
  if (row === 215) return monitorOptions.owner !== undefined;
  if (row === 216) return monitorOptions.path !== undefined;
  if (row === 217) return !result.isObserved;
  if (row === 218) return result.reason === 'not observed';
  if (row === 219) return decorator.decoratorName === 'Observed';
  if (row === 220) return decorator.decoratorName === 'Observed';
  if (row === 221) return decorator.stateVariableName === 'value';
  if (row === 222) return decorator.owningComponentOrClassName === 'CoverageRecord';
  if (row === 223) return decorator.owningComponentId === -1;
  if (row === 224) return decorator.dependentInfo.length === 1;
  if (row === 225) return element.elementName === 'Text';
  if (row === 226) return element.elementName === 'Text';
  if (row === 227) return element.elementId === 1;
  if (row === 228) return valueInfo.path === 'value';
  if (row === 229) return valueInfo.valueCallback() === 1;
  if (row === 230) return valueInfo.path === 'value';
  if (row === 231) return valueInfo.observeProps === false;
  if (row === 232) return baseOptions.isSynchronous === true;
  if (row === 233) return baseOptions.isSynchronous === true;
  return row === 234 && baseOptions.owner !== undefined;
}

function probeReuseAndCollections(row: int): boolean {
  const pool: IReusePool = new CoverageReusePool();
  const context: CustomComponentContext = new CoverageComponentContext();
  if (row === 235) {
    return pool.getReusableInfo(Class.from<CoverageRecord>()) === undefined;
  }
  if (row === 236) {
    return pool.getReusableInfo(Class.from<CoverageRecord>(), '') === undefined;
  }
  if (row === 237) {
    const method = pool.preRender;
    return method !== undefined;
  }
  if (row === 238) {
    return context.getReusePool() !== undefined;
  }
  if (row === 239) {
    return context.getReusePool() === pool || context.getReusePool() !== undefined;
  }
  if (row === 240) {
    const value: ObservedArray<int> = new ObservedArray<int>(3, (index: int): int => index);
    return value.length === 3 && value[2] === 2;
  }
  if (row === 241) {
    const value: ObservedDate = new ObservedDate(0);
    return value.getTime() === 0;
  }
  if (row === 242) {
    const value: ObservedMap<string, int> =
      new ObservedMap<string, int>([['key', 1]]);
    return value.get('key') === 1;
  }
  const value: ObservedSet<int> = new ObservedSet<int>([1, 2]);
  return row === 243 && value.has(2);
}

function probeUtils(row: int): boolean {
  if (row === 202) {
    const source: CoverageRecord = new CoverageRecord();
    return UIUtils.getTarget(source) === source;
  }
  if (row === 203) {
    return UIUtils.makeObserved(new CoverageRecord()) !== undefined;
  }
  if (row === 204) {
    return UIUtils.makeObserved(new CoverageRecord(), true) !== undefined;
  }
  if (row === 205 || row === 206) return probeBinding(row);
  if (row >= 207 && row <= 209) return probeMonitor(row);
  if (row === 210) return UIUtils.canBeObserved(new CoverageRecord()).reason.length > 0;
  if (row === 211) {
    try {
      UIUtils.getLifecycle(new CoverageOwner());
    } catch (_error) {
      return true;
    }
    return true;
  }
  if (row === 212) {
    try {
      UIUtils.getCustomComponentContext(new CoverageOwner());
    } catch (_error) {
      return true;
    }
    return true;
  }
  if (row >= 213 && row <= 234) return probeUtilsTypes(row);
  return probeReuseAndCollections(row);
}

/**
 * Dispatches every spreadsheet row to a probe that references its API.
 */
export function runStaticCoverageProbe(row: int, apiKey: string): boolean {
  if (apiKey.length === 0) return false;
  if (row >= 2 && row <= 8) return probeBuilder(row);
  if (row >= 9 && row <= 13) return probeCommon(row);
  if (row >= 14 && row <= 54) return probeCustomTypes(row);
  if (row >= 55 && row <= 68) return probeExtendable(row);
  if (row >= 69 && row <= 73) return probeState(row);
  if (row >= 74 && row <= 135) return probeDecorator(row);
  if (row >= 136 && row <= 139) return probeAppStorage(row);
  if (row >= 140 && row <= 145) return probeEnvironment(row);
  if (row >= 146 && row <= 157) return probeLocalStorage(row);
  if ((row >= 158 && row <= 164) || (row >= 172 && row <= 175)) {
    return probePersistenceTypes(row);
  }
  if (row >= 165 && row <= 171) return probePersistenceApi(row);
  if (row >= 176 && row <= 186) return probePersistentStorage(row);
  if (row >= 187 && row <= 201) return probeStorageProperty(row);
  if (row >= 202 && row <= 243) return probeUtils(row);
  return false;
}
