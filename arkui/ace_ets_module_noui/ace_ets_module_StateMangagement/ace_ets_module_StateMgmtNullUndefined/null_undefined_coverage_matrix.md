# Excel 134 接口覆盖矩阵
Hypium it 数: 215

| 状态 | 类型 | 类 | 短名 |
|---|---|---|---|
| type/class/page | Interface | global | `TypeConstructorWithArgs` |
| type/class/page | Class | global | `ConnectOptions` |
| no-arg-smoke | Method | ConnectOptions | `StorageDefaultCreator` |
| type/class/page | Class | global | `export declare class AppStorageV2` |
| null+undefined | Method | AppStorageV2 | `connect` |
| null+undefined | Method | AppStorageV2 | `remove` |
| type/class/page | TypeAlias | global | `CollectionType` |
| type/class/page | Class | global | `ConnectOptionsCollections` |
| no-arg-smoke | Method | ConnectOptionsCollections | `StorageDefaultCreator` |
| no-arg-smoke | Method | ConnectOptionsCollections | `StorageDefaultCreator` |
| type/class/page | Class | global | `export declare class PersistenceV2 extends AppStor` |
| null+undefined | Method | PersistenceV2 | `globalConnect` |
| null+undefined | Method | PersistenceV2 | `globalConnect` |
| null+undefined | Method | PersistenceV2 | `save` |
| null+undefined | Method | PersistenceV2 | `notifyOnError` |
| type/class/page | Interface | global | `TypeConstructor` |
| page/deco | Decorator | global | `TypeConstructor` |
| type/class/page | Class | global | `export declare class UIUtils` |
| null+undefined | Method | UIUtils | `getTarget` |
| null+undefined | Method | UIUtils | `makeObserved` |
| null+undefined | Method | UIUtils | `makeV1Observed` |
| null+undefined | Method | UIUtils | `enableV2Compatibility` |
| null+undefined | Method | UIUtils | `addMonitor` |
| null+undefined | Method | UIUtils | `clearMonitor` |
| null+undefined | Method | UIUtils | `makeBinding` |
| null+undefined | Method | UIUtils | `makeBinding` |
| null+undefined | Method | UIUtils | `applySync` |
| no-arg-smoke | Method | UIUtils | `flushUpdates` |
| no-arg-smoke | Method | UIUtils | `flushUIUpdates` |
| null+undefined | Method | UIUtils | `canBeObserved` |
| null+undefined | Method | UIUtils | `getLifecycle` |
| null+undefined | Method | UIUtils | `getCustomComponentContext` |
| type/class/page | Interface | global | `export declare interface CustomComponentLifecycle` |
| null+undefined | Method | CustomComponentLifecycle | `addObserver` |
| null+undefined | Method | CustomComponentLifecycle | `removeObserver` |
| type/class/page | Interface | global | `export declare interface CustomComponentLifecycleO` |
| MISSING | Method | CustomComponentLifecycleObserver | `Record` |
| type/class/page | Interface | global | `export declare interface IReusePool` |
| null+undefined | Method | IReusePool | `getReusableInfo` |
| null+undefined | Method | IReusePool | `preRender` |
| type/class/page | TypeAlias | global | `declare type ReusableComponentConstructor = Functi` |
| type/class/page | TypeAlias | global | `declare type ReusePoolOwnership = 'shared' | 'perI` |
| page/deco | Decorator | global | `declare const Component: ClassDecorator & ((option` |
| page/deco | Decorator | global | `declare const ComponentV2: ClassDecorator & ((opti` |
| type/class/page | Interface | global | `declare interface EntryOptions` |
| type/class/page | Property | EntryOptions | `storage?: LocalStorage;` |
| page/deco | Decorator | global | `declare const Entry: ClassDecorator & ((options?: ` |
| page/deco | Decorator | global | `declare const Preview: ClassDecorator & ((value: P` |
| page/deco | Decorator | global | `declare const Provide: PropertyDecorator & ((value` |
| page/deco | Decorator | global | `declare const Provider: (aliasName?: string) => Pr` |
| type/class/page | Class | global | `SystemEnvKey` |
| no-arg-smoke | Method | SystemEnvKey | `constructor` |
| type/class/page | Class | global | `WritableSystemEnvKey` |
| type/class/page | Class | global | `ReadonlySystemEnvKey` |
| type/class/page | Class | global | `CustomEnvKey` |
| no-arg-smoke | Method | CustomEnvKey | `constructor` |
| type/class/page | Class | global | `declare class ReadonlyEnvKey` |
| page/deco | Decorator | global | `declare type EnvDecorator = (value: SystemProperti` |
| null+undefined | Method | global | `Env` |
| type/class/page | Enum | global | `declare enum SystemProperties` |
| page/deco | Decorator | global | `declare const Consume: PropertyDecorator & ((value` |
| page/deco | Decorator | global | `declare const Consumer: (aliasName?: string) => Pr` |
| page/deco | Decorator | global | `declare const StorageProp: (value: string) => Prop` |
| page/deco | Decorator | global | `declare const StorageLink: (value: string) => Prop` |
| page/deco | Decorator | global | `declare const Watch: (value: string) => PropertyDe` |
| page/deco | Decorator | global | `declare const Extend: MethodDecorator & ((value: a` |
| page/deco | Decorator | global | `declare type MonitorDecorator = (value: string | M` |
| type/class/page | Interface | global | `declare interface IMonitor` |
| null+undefined | Method | IMonitor | `value` |
| page/deco | Decorator | global | `declare const LocalStorageLink: (value: string) =>` |
| page/deco | Decorator | global | `declare const LocalStorageProp: (value: string) =>` |
| page/deco | Decorator | global | `declare const ReusableV2: ClassDecorator & ((optio` |
| type/class/page | Interface | global | `declare interface ReuseOptions` |
| no-arg-smoke | Method | ReuseOptions | `reuseId?: ReuseIdCallback;` |
| null+undefined | Method | global | `$r` |
| null+undefined | Method | global | `$rawfile` |
| type/class/page | Class | global | `declare class AppStorage` |
| null+undefined | Method | AppStorage | `ref` |
| null+undefined | Method | AppStorage | `setAndRef` |
| null+undefined | Method | AppStorage | `Link` |
| null+undefined | Method | AppStorage | `link` |
| null+undefined | Method | AppStorage | `SetAndLink` |
| null+undefined | Method | AppStorage | `setAndLink` |
| null+undefined | Method | AppStorage | `Prop` |
| null+undefined | Method | AppStorage | `prop` |
| null+undefined | Method | AppStorage | `SetAndProp` |
| null+undefined | Method | AppStorage | `setAndProp` |
| null+undefined | Method | AppStorage | `Has` |
| null+undefined | Method | AppStorage | `has` |
| null+undefined | Method | AppStorage | `Get` |
| null+undefined | Method | AppStorage | `get` |
| null+undefined | Method | AppStorage | `Set` |
| null+undefined | Method | AppStorage | `set` |
| null+undefined | Method | AppStorage | `SetOrCreate` |
| null+undefined | Method | AppStorage | `setOrCreate` |
| null+undefined | Method | AppStorage | `Delete` |
| null+undefined | Method | AppStorage | `delete` |
| no-arg-smoke | Method | AppStorage | `Clear` |
| no-arg-smoke | Method | AppStorage | `clear` |
| null+undefined | Method | AppStorage | `IsMutable` |
| type/class/page | Interface | global | `AbstractProperty` |
| null+undefined | Method | AbstractProperty | `set` |
| type/class/page | Class | global | `SubscribedAbstractProperty` |
| null+undefined | Method | SubscribedAbstractProperty | `set` |
| type/class/page | Class | global | `declare class Environment` |
| null+undefined | Method | Environment | `EnvProp` |
| null+undefined | Method | Environment | `envProp` |
| null+undefined | Method | Environment | `EnvProps` |
| null+undefined | Method | Environment | `envProps` |
| no-arg-smoke | Method | Environment | `Keys` |
| no-arg-smoke | Method | Environment | `keys` |
| type/class/page | Class | global | `declare class PersistentStorage` |
| null+undefined | Method | PersistentStorage | `PersistProp` |
| null+undefined | Method | PersistentStorage | `persistProp` |
| null+undefined | Method | PersistentStorage | `DeleteProp` |
| null+undefined | Method | PersistentStorage | `deleteProp` |
| null+undefined | Method | PersistentStorage | `PersistProps` |
| null+undefined | Method | PersistentStorage | `persistProps` |
| no-arg-smoke | Method | PersistentStorage | `Keys` |
| no-arg-smoke | Method | PersistentStorage | `keys` |
| type/class/page | Class | global | `declare class LocalStorage` |
| null+undefined | Method | LocalStorage | `constructor` |
| null+undefined | Method | LocalStorage | `ref` |
| null+undefined | Method | LocalStorage | `setAndRef` |
| null+undefined | Method | LocalStorage | `has` |
| null+undefined | Method | LocalStorage | `get` |
| null+undefined | Method | LocalStorage | `set` |
| null+undefined | Method | LocalStorage | `setOrCreate` |
| null+undefined | Method | LocalStorage | `link` |
| null+undefined | Method | LocalStorage | `setAndLink` |
| null+undefined | Method | LocalStorage | `prop` |
| null+undefined | Method | LocalStorage | `setAndProp` |
| null+undefined | Method | LocalStorage | `delete` |
| no-arg-smoke | Method | LocalStorage | `clear` |
