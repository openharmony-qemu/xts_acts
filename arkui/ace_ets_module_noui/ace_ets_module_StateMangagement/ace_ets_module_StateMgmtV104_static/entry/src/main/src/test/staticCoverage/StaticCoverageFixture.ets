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
  Builder, BuilderParam, Column, Component, ComponentActive, ComponentAppear,
  ComponentBuilder, ComponentBuilt, ComponentDisappear, ComponentInactive,
  ComponentInit, ComponentRecycle, ComponentReuse, ComponentV2, Computed,
  Consume, Consumer, CustomEnv, CustomEnvKey, Env, Event, Local, LocalStorageLink,
  LocalStoragePropRef, Monitor, ObjectLink, Observed, ObservedV2, Once, Param,
  IMonitor, Provide, Provider, Reusable, ReusableMemOptStrategy, ReusableV2,
  ReusePoolOwnership, State, StorageLink, StoragePropRef, SyncMonitor, Text,
  Trace, Track, Watch
} from '@kit.ArkUI';

const staticCoverageCustomEnv = CustomEnvKey.create<int>();

@Builder
export function staticCoverageBuilder(): void {
  Text('static coverage builder')
}

@Observed
export class StaticCoverageObservedModel {
  @Track public value: int = 1;
}

@ObservedV2
export class StaticCoverageObservedV2Model {
  @Trace public first: int = 1;
  @Trace public second: int = 2;

  @Computed
  get total(): int {
    return this.first + this.second;
  }

  @Monitor(['first'])
  onFirstChanged(_monitor: IMonitor): void {
  }

  @SyncMonitor(['second'])
  onSecondChanged(_monitor: IMonitor): void {
  }
}

@Reusable
@Component
struct StaticCoverageAcceptedV1 {
  build(): void {
    Text('accepted v1')
  }
}

@Reusable
@Component({
  reusePool: ReusePoolOwnership.PER_INSTANCE,
  poolAccepts: ['StaticCoverageAcceptedV1']
})
struct StaticCoverageV1Child {
  @State @Watch('onStateChanged') stateValue: int = 1;
  @ObjectLink linkedObject: StaticCoverageObservedModel;
  @StoragePropRef('static_coverage_storage_prop') storageProp: int = 1;
  @StorageLink('static_coverage_storage_link') storageLink: int = 1;
  @LocalStoragePropRef('static_coverage_local_prop') localProp: int = 1;
  @LocalStorageLink('static_coverage_local_link') localLink: int = 1;
  @Provide({ alias: 'staticCoverageV1', allowOverride: true }) provideValue: int = 1;
  @BuilderParam content: () => void = staticCoverageBuilder;

  onStateChanged(_propertyName: string): void {
  }

  @ComponentInit
  onComponentInit(): void {
  }

  @ComponentAppear
  onComponentAppear(): void {
  }

  @ComponentBuilt
  onComponentBuilt(): void {
  }

  @ComponentReuse
  onComponentReuse(): void {
  }

  @ComponentRecycle
  onComponentRecycle(): void {
  }

  @ComponentDisappear
  onComponentDisappear(): void {
  }

  @ComponentActive
  onComponentActive(): void {
  }

  @ComponentInactive
  onComponentInactive(): void {
  }

  build(): void {
    Column() {
      Text(`${this.stateValue}:${this.linkedObject.value}`)
      this.content()
    }
  }
}

@ReusableV2
@ComponentV2
struct StaticCoverageAcceptedV2 {
  build(): void {
    Text('accepted v2')
  }
}

@Component
struct StaticCoverageV1Consumer {
  @Consume('staticCoverageV1') consumeValue: int;

  build(): void {
    Text(`${this.consumeValue}`)
  }
}

@ReusableV2({
  memoryOptimizationStrategy: ReusableMemOptStrategy.ENABLE_AUTO_CACHE_OPTIMIZATION
})
@ComponentV2({
  reusePool: ReusePoolOwnership.SHARED,
  poolAccepts: ['StaticCoverageAcceptedV2']
})
struct StaticCoverageV2Child {
  @Local localValue: int = 1;
  @Param @Once onceValue: int = 2;
  @Event onValueChanged: (value: int) => void = (_value: int): void => {};
  @Provider('staticCoverageV2') providerValue: int = 3;
  @Consumer('staticCoverageParent') consumerValue: int = 4;
  @Env('WritableEnvKey.FONT_SCALE') fontScale: double;
  @CustomEnv('staticCoverageCustomEnv') customEnvValue: int = 5;

  @Computed
  get total(): int {
    return this.localValue + this.onceValue;
  }

  @Monitor(['localValue'])
  onLocalChanged(_monitor: IMonitor): void {
  }

  @SyncMonitor(['onceValue'])
  onOnceChanged(_monitor: IMonitor): void {
  }

  build(): void {
    Text(`${this.total}:${this.fontScale}:${this.customEnvValue}`)
  }
}

export function staticCoverageFixtureReady(): boolean {
  const model: StaticCoverageObservedModel = new StaticCoverageObservedModel();
  const modelV2: StaticCoverageObservedV2Model = new StaticCoverageObservedV2Model();
  return model.value === 1 && modelV2.total === 3;
}
