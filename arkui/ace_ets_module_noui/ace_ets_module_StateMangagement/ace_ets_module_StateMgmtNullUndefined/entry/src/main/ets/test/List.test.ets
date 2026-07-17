/**
 * Copyright (c) 2026 Kaihong Digital Industry Development Co., Ltd.
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

import appStorageNullUndefinedTest from './appStorage/AppStorageNullUndefined.test';
import localStorageNullUndefinedTest from './localStorage/LocalStorageNullUndefined.test';
import environmentNullUndefinedTest from './environment/EnvironmentNullUndefined.test';
import persistentStorageNullUndefinedTest from './persistentStorage/PersistentStorageNullUndefined.test';
import appStorageV2NullUndefinedTest from './appStorageV2/AppStorageV2NullUndefined.test';
import persistenceV2NullUndefinedTest from './persistenceV2/PersistenceV2NullUndefined.test';
import uiUtilsNullUndefinedTest from './uiUtils/UIUtilsNullUndefined.test';
import uiUtilsOptionsNullUndefinedTest from './uiUtils/UIUtilsOptionsNullUndefined.test';
import globalResNullUndefinedTest from './global/GlobalResNullUndefined.test';
import abstractPropertyNullUndefinedTest from './abstractProperty/AbstractPropertyNullUndefined.test';
import connectOptionsNullUndefinedTest from './connectOptions/ConnectOptionsNullUndefined.test';
import entryOptionsNullUndefinedTest from './entry/EntryOptionsNullUndefined.test';
import providerConsumerNullUndefinedTest from './decorators/ProviderConsumerNullUndefined.test';
import storageDecoratorsNullUndefinedTest from './decorators/StorageDecoratorsNullUndefined.test';
import provideConsumeNullUndefinedTest from './decorators/ProvideConsumeNullUndefined.test';
import previewExtendNullUndefinedTest from './decorators/PreviewExtendNullUndefined.test';
import envDecoratorNullUndefinedTest from './env/EnvDecoratorNullUndefined.test';
import monitorValueNullUndefinedTest from './monitor/MonitorValueNullUndefined.test';
import reuseOptionsNullUndefinedTest from './reuse/ReuseOptionsNullUndefined.test';
import lifecycleReuseNullUndefinedTest from './lifecycle/LifecycleReuseNullUndefined.test';
import noArgSmokeNullUndefinedTest from './noArg/NoArgSmokeNullUndefined.test';

export default function testsuite() {
  appStorageNullUndefinedTest();
  localStorageNullUndefinedTest();
  environmentNullUndefinedTest();
  persistentStorageNullUndefinedTest();
  appStorageV2NullUndefinedTest();
  persistenceV2NullUndefinedTest();
  uiUtilsNullUndefinedTest();
  uiUtilsOptionsNullUndefinedTest();
  globalResNullUndefinedTest();
  abstractPropertyNullUndefinedTest();
  connectOptionsNullUndefinedTest();
  entryOptionsNullUndefinedTest();
  providerConsumerNullUndefinedTest();
  storageDecoratorsNullUndefinedTest();
  provideConsumeNullUndefinedTest();
  previewExtendNullUndefinedTest();
  envDecoratorNullUndefinedTest();
  monitorValueNullUndefinedTest();
  reuseOptionsNullUndefinedTest();
  lifecycleReuseNullUndefinedTest();
  noArgSmokeNullUndefinedTest();
}
