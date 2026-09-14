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
  AbstractProperty, AppStorageV2, BaseConnectOptions, ColorMode, ConnectOptions,
  Environment, EnvPropsOptions, FromJSONType, LayoutDirection, LocalStorage,
  PersistenceV2, PersistentStorage, PersistPropsOptions,
  StorageDefaultSubCreators, SubscribedAbstractProperty, ToJSONType
} from '@kit.ArkUI';
import {
  contains, CoverageRecord, makeBaseConnectOptions, makeConnectOptions,
  makePersistOptions, makeRecord, makeSubCreators
} from '../../../ets/staticCoverage/StaticCoverageSupport';

export default function StaticCoverageStorageTest(): void {
  describe('StaticCoverageStorageTest', (): void => {
    /**
     * @tc.number SUB_ARKUI_STCOV_APPSTORAGEV2_APPSTORAGEV2_CONNECT_0100
     * @tc.name   SUB_ARKUI_STCOV_APPSTORAGEV2_APPSTORAGEV2_CONNECT_0100
     * @tc.desc   Verify static Method coverage for appStorageV2.AppStorageV2.connect
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_APPSTORAGEV2_APPSTORAGEV2_CONNECT_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const key: string = 'static_coverage_app_v2';
        const recordType: Class = Class.from<CoverageRecord>();
        AppStorageV2.remove(key);
        const value: CoverageRecord | undefined = AppStorageV2.connect<CoverageRecord>(
          recordType, key, makeRecord);
        expect(value?.value === 7).assertTrue();
        AppStorageV2.remove(key);
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_APPSTORAGEV2_APPSTORAGEV2_CONNECT_0200
     * @tc.name   SUB_ARKUI_STCOV_APPSTORAGEV2_APPSTORAGEV2_CONNECT_0200
     * @tc.desc   Verify static Method coverage for appStorageV2.AppStorageV2.connect
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_APPSTORAGEV2_APPSTORAGEV2_CONNECT_0200',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const recordType: Class = Class.from<CoverageRecord>();
        AppStorageV2.remove(recordType);
        const value: CoverageRecord | undefined = AppStorageV2.connect<CoverageRecord>(
          recordType, makeRecord);
        expect(value !== undefined).assertTrue();
        AppStorageV2.remove(recordType);
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_APPSTORAGEV2_APPSTORAGEV2_CONNECT_UNDEFINED_0100
     * @tc.name   SUB_ARKUI_STCOV_APPSTORAGEV2_APPSTORAGEV2_CONNECT_UNDEFINED_0100
     * @tc.desc   Verify first connect rejects an undefined default creator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_APPSTORAGEV2_APPSTORAGEV2_CONNECT_UNDEFINED_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const key: string = 'static_coverage_app_v2_undefined';
        const recordType: Class = Class.from<CoverageRecord>();
        AppStorageV2.remove(key);
        let rejected: boolean = false;
        try {
          AppStorageV2.connect<CoverageRecord>(recordType, key, undefined);
        } catch (_error) {
          rejected = true;
        }
        expect(rejected).assertTrue();
        AppStorageV2.remove(key);
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_APPSTORAGEV2_APPSTORAGEV2_REMOVE_0100
     * @tc.name   SUB_ARKUI_STCOV_APPSTORAGEV2_APPSTORAGEV2_REMOVE_0100
     * @tc.desc   Verify static Method coverage for appStorageV2.AppStorageV2.remove
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_APPSTORAGEV2_APPSTORAGEV2_REMOVE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const key: string = 'static_coverage_missing_key';
        AppStorageV2.remove(key);
        expect(!contains(AppStorageV2.keys(), key)).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_APPSTORAGEV2_APPSTORAGEV2_KEYS_0100
     * @tc.name   SUB_ARKUI_STCOV_APPSTORAGEV2_APPSTORAGEV2_KEYS_0100
     * @tc.desc   Verify static Method coverage for appStorageV2.AppStorageV2.keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_APPSTORAGEV2_APPSTORAGEV2_KEYS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(AppStorageV2.keys().length >= 0).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_ENVIRONMENT_GLOBAL_ENVPROPSOPTIONS_0100
     * @tc.name   SUB_ARKUI_STCOV_ENVIRONMENT_GLOBAL_ENVPROPSOPTIONS_0100
     * @tc.desc   Verify static Interface coverage for environment.global.EnvPropsOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_ENVIRONMENT_GLOBAL_ENVPROPSOPTIONS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const options: EnvPropsOptions = {
          key: 'static_coverage_environment', defaultValue: '26'
        };
        expect(options.key.length > 0 && options.defaultValue === '26').assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_ENVIRONMENT_ENVPROPSOPTIONS_KEY_0100
     * @tc.name   SUB_ARKUI_STCOV_ENVIRONMENT_ENVPROPSOPTIONS_KEY_0100
     * @tc.desc   Verify static Property coverage for environment.EnvPropsOptions.key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_ENVIRONMENT_ENVPROPSOPTIONS_KEY_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const options: EnvPropsOptions = {
          key: 'static_coverage_environment', defaultValue: '26'
        };
        expect(options.key === 'static_coverage_environment').assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_ENVIRONMENT_ENVPROPSOPTIONS_DEFAULTVALUE_0100
     * @tc.name   SUB_ARKUI_STCOV_ENVIRONMENT_ENVPROPSOPTIONS_DEFAULTVALUE_0100
     * @tc.desc   Verify static Property coverage for environment.EnvPropsOptions.defaultValue
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_ENVIRONMENT_ENVPROPSOPTIONS_DEFAULTVALUE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const options: EnvPropsOptions = {
          key: 'static_coverage_environment', defaultValue: '26'
        };
        expect(options.defaultValue === '26').assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_ENVIRONMENT_ENVIRONMENT_ENVPROP_0100
     * @tc.name   SUB_ARKUI_STCOV_ENVIRONMENT_ENVIRONMENT_ENVPROP_0100
     * @tc.desc   Verify static Method coverage for environment.Environment.envProp
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_ENVIRONMENT_ENVIRONMENT_ENVPROP_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const result: boolean = Environment.envProp('static_coverage_env_single', 1);
        expect(result || contains(Environment.keys(), 'static_coverage_env_single')).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_ENVIRONMENT_ENVIRONMENT_ENVPROPS_0100
     * @tc.name   SUB_ARKUI_STCOV_ENVIRONMENT_ENVIRONMENT_ENVPROPS_0100
     * @tc.desc   Verify static Method coverage for environment.Environment.envProps
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_ENVIRONMENT_ENVIRONMENT_ENVPROPS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const options: EnvPropsOptions = {
          key: 'static_coverage_environment', defaultValue: '26'
        };
        Environment.envProps([options]);
        expect(contains(Environment.keys(), options.key)).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_ENVIRONMENT_ENVIRONMENT_KEYS_0100
     * @tc.name   SUB_ARKUI_STCOV_ENVIRONMENT_ENVIRONMENT_KEYS_0100
     * @tc.desc   Verify static Method coverage for environment.Environment.keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_ENVIRONMENT_ENVIRONMENT_KEYS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(Environment.keys().length >= 0).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_REF_0100
     * @tc.name   SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_REF_0100
     * @tc.desc   Verify static Method coverage for localStorage.LocalStorage.ref
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_REF_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const storage: LocalStorage = new LocalStorage();
        expect(storage.ref<int>('missing') === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_SETANDREF_0100
     * @tc.name   SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_SETANDREF_0100
     * @tc.desc   Verify static Method coverage for localStorage.LocalStorage.setAndRef
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_SETANDREF_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const storage: LocalStorage = new LocalStorage();
        const property: AbstractProperty<int> = storage.setAndRef<int>('ref', 1);
        expect(property.get() === 1).assertTrue();
        property.onChange(undefined);
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_LINK_0100
     * @tc.name   SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_LINK_0100
     * @tc.desc   Verify static Method coverage for localStorage.LocalStorage.link
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_LINK_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const storage: LocalStorage = new LocalStorage();
        expect(storage.link<int>('missing') === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_SETANDLINK_0100
     * @tc.name   SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_SETANDLINK_0100
     * @tc.desc   Verify static Method coverage for localStorage.LocalStorage.setAndLink
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_SETANDLINK_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const storage: LocalStorage = new LocalStorage();
        const property: SubscribedAbstractProperty<int> = storage.setAndLink<int>('link', 2);
        expect(property.get() === 2).assertTrue();
        property.aboutToBeDeleted();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_HAS_0100
     * @tc.name   SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_HAS_0100
     * @tc.desc   Verify static Method coverage for localStorage.LocalStorage.has
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_HAS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const storage: LocalStorage = new LocalStorage();
        expect(!storage.has('missing')).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_GET_0100
     * @tc.name   SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_GET_0100
     * @tc.desc   Verify static Method coverage for localStorage.LocalStorage.get
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_GET_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const storage: LocalStorage = new LocalStorage();
        expect(storage.get<int>('missing') === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_SET_0100
     * @tc.name   SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_SET_0100
     * @tc.desc   Verify static Method coverage for localStorage.LocalStorage.set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_SET_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const storage: LocalStorage = new LocalStorage();
        expect(!storage.set<int>('missing', 3)).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_SETORCREATE_0100
     * @tc.name   SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_SETORCREATE_0100
     * @tc.desc   Verify static Method coverage for localStorage.LocalStorage.setOrCreate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_SETORCREATE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const storage: LocalStorage = new LocalStorage();
        const created: boolean = storage.setOrCreate<int>('created', 4);
        expect(created && storage.get<int>('created') === 4).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_KEYS_0100
     * @tc.name   SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_KEYS_0100
     * @tc.desc   Verify static Method coverage for localStorage.LocalStorage.keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_KEYS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const storage: LocalStorage = new LocalStorage();
        storage.setOrCreate<int>('key', 1);
        expect(storage.keys().next().value === 'key').assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_SIZE_0100
     * @tc.name   SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_SIZE_0100
     * @tc.desc   Verify static Method coverage for localStorage.LocalStorage.size
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_SIZE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const storage: LocalStorage = new LocalStorage();
        expect(storage.size() === 0).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_DELETE_0100
     * @tc.name   SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_DELETE_0100
     * @tc.desc   Verify static Method coverage for localStorage.LocalStorage.delete
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_DELETE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const storage: LocalStorage = new LocalStorage();
        expect(!storage.delete('missing')).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_CLEAR_0100
     * @tc.name   SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_CLEAR_0100
     * @tc.desc   Verify static Method coverage for localStorage.LocalStorage.clear
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_CLEAR_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const storage: LocalStorage = new LocalStorage();
        expect(storage.clear()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_GLOBAL_STORAGEDEFAULTSUBCREATORS_0100
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_GLOBAL_STORAGEDEFAULTSUBCREATORS_0100
     * @tc.desc   Verify static TypeAlias coverage for persistenceV2.global.StorageDefaultSubCreators
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_GLOBAL_STORAGEDEFAULTSUBCREATORS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const creators: StorageDefaultSubCreators = makeSubCreators();
        expect(creators.size === 1).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_GLOBAL_CONNECTOPTIONS_0100
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_GLOBAL_CONNECTOPTIONS_0100
     * @tc.desc   Verify static Interface coverage for persistenceV2.global.ConnectOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_GLOBAL_CONNECTOPTIONS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const options: ConnectOptions<CoverageRecord> = makeConnectOptions();
        expect(options.type === Class.from<CoverageRecord>()).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_CONNECTOPTIONS_DEFAULTCREATOR_0100
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_CONNECTOPTIONS_DEFAULTCREATOR_0100
     * @tc.desc   Verify static Method coverage for persistenceV2.ConnectOptions.defaultCreator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_CONNECTOPTIONS_DEFAULTCREATOR_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const options: ConnectOptions<CoverageRecord> = makeConnectOptions();
        const created: CoverageRecord | undefined = options.defaultCreator?.();
        expect(created?.value === 7).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_CONNECTOPTIONS_AREAMODE_0100
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_CONNECTOPTIONS_AREAMODE_0100
     * @tc.desc   Verify static Property coverage for persistenceV2.ConnectOptions.areaMode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_CONNECTOPTIONS_AREAMODE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const options: ConnectOptions<CoverageRecord> = makeConnectOptions();
        expect(options.areaMode === undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_CONNECTOPTIONS_TOJSON_0100
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_CONNECTOPTIONS_TOJSON_0100
     * @tc.desc   Verify static Property coverage for persistenceV2.ConnectOptions.toJson
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_CONNECTOPTIONS_TOJSON_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const options: ConnectOptions<CoverageRecord> = makeConnectOptions();
        expect(options.toJson !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_CONNECTOPTIONS_FROMJSON_0100
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_CONNECTOPTIONS_FROMJSON_0100
     * @tc.desc   Verify static Property coverage for persistenceV2.ConnectOptions.fromJson
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_CONNECTOPTIONS_FROMJSON_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const options: ConnectOptions<CoverageRecord> = makeConnectOptions();
        expect(options.fromJson !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_CONNECTOPTIONS_ENABLEAUTOSAVE_0100
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_CONNECTOPTIONS_ENABLEAUTOSAVE_0100
     * @tc.desc   Verify static Property coverage for persistenceV2.ConnectOptions.enableAutoSave
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_CONNECTOPTIONS_ENABLEAUTOSAVE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const options: ConnectOptions<CoverageRecord> = makeConnectOptions();
        expect(options.enableAutoSave === false).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_CONNECT_0100
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_CONNECT_0100
     * @tc.desc   Verify static Method coverage for persistenceV2.PersistenceV2.connect
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_CONNECT_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const recordType: Class = Class.from<CoverageRecord>();
        PersistenceV2.remove(recordType);
        const value: CoverageRecord | undefined = PersistenceV2.connect<CoverageRecord>(
          recordType, makeRecord, makeBaseConnectOptions());
        expect(value !== undefined).assertTrue();
        PersistenceV2.remove(recordType);
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_CONNECT_0200
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_CONNECT_0200
     * @tc.desc   Verify static Method coverage for persistenceV2.PersistenceV2.connect
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_CONNECT_0200',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const key: string = 'static_coverage_persistence_v2';
        const recordType: Class = Class.from<CoverageRecord>();
        PersistenceV2.remove(key);
        const value: CoverageRecord | undefined = PersistenceV2.connect<CoverageRecord>(
          recordType, key, makeRecord, makeBaseConnectOptions());
        expect(value !== undefined).assertTrue();
        PersistenceV2.remove(key);
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_CONNECT_UNDEFINED_0100
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_CONNECT_UNDEFINED_0100
     * @tc.desc   Verify first connect rejects undefined creator and options
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_CONNECT_UNDEFINED_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const key: string = 'static_coverage_persistence_v2_undefined';
        const recordType: Class = Class.from<CoverageRecord>();
        PersistenceV2.remove(key);
        let rejected: boolean = false;
        try {
          PersistenceV2.connect<CoverageRecord>(recordType, key, undefined, undefined);
        } catch (_error) {
          rejected = true;
        }
        expect(rejected).assertTrue();
        PersistenceV2.remove(key);
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_GLOBALCONNECT_0100
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_GLOBALCONNECT_0100
     * @tc.desc   Verify static Method coverage for persistenceV2.PersistenceV2.globalConnect
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_GLOBALCONNECT_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const options: ConnectOptions<CoverageRecord> = makeConnectOptions();
        PersistenceV2.remove(options.key!);
        const value: CoverageRecord | undefined =
          PersistenceV2.globalConnect<CoverageRecord>(options);
        expect(value !== undefined).assertTrue();
        PersistenceV2.remove(options.key!);
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_SAVE_0100
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_SAVE_0100
     * @tc.desc   Verify static Method coverage for persistenceV2.PersistenceV2.save
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_SAVE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        let saved: boolean = false;
        try {
          PersistenceV2.save('static_coverage_missing_key');
          saved = true;
        } catch (_error) {
          saved = false;
        }
        expect(saved).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_NOTIFYONERROR_0100
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_NOTIFYONERROR_0100
     * @tc.desc   Verify static Method coverage for persistenceV2.PersistenceV2.notifyOnError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_NOTIFYONERROR_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        PersistenceV2.notifyOnError(undefined);
        expect(!contains(
          PersistenceV2.keys(), 'static_coverage_missing_key')).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_REMOVE_0100
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_REMOVE_0100
     * @tc.desc   Verify static Method coverage for persistenceV2.PersistenceV2.remove
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_REMOVE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        PersistenceV2.remove('static_coverage_missing_key');
        expect(contains(
          PersistenceV2.keys(), 'static_coverage_missing_key')).assertFalse();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_KEYS_0100
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_KEYS_0100
     * @tc.desc   Verify static Method coverage for persistenceV2.PersistenceV2.keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_KEYS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(PersistenceV2.keys().length >= 0).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_GLOBAL_BASECONNECTOPTIONS_0100
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_GLOBAL_BASECONNECTOPTIONS_0100
     * @tc.desc   Verify static Interface coverage for persistenceV2.global.BaseConnectOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_GLOBAL_BASECONNECTOPTIONS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const options: BaseConnectOptions<CoverageRecord> = makeBaseConnectOptions();
        expect(options.enableAutoSave === false).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_BASECONNECTOPTIONS_TOJSON_0100
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_BASECONNECTOPTIONS_TOJSON_0100
     * @tc.desc   Verify static Property coverage for persistenceV2.BaseConnectOptions.toJson
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_BASECONNECTOPTIONS_TOJSON_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const options: BaseConnectOptions<CoverageRecord> = makeBaseConnectOptions();
        expect(options.toJson !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_BASECONNECTOPTIONS_FROMJSON_0100
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_BASECONNECTOPTIONS_FROMJSON_0100
     * @tc.desc   Verify static Property coverage for persistenceV2.BaseConnectOptions.fromJson
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_BASECONNECTOPTIONS_FROMJSON_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const options: BaseConnectOptions<CoverageRecord> = makeBaseConnectOptions();
        expect(options.fromJson !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_BASECONNECTOPTIONS_ENABLEAUTOSAVE_0100
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_BASECONNECTOPTIONS_ENABLEAUTOSAVE_0100
     * @tc.desc   Verify static Property coverage for persistenceV2.BaseConnectOptions.enableAutoSave
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_BASECONNECTOPTIONS_ENABLEAUTOSAVE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const options: BaseConnectOptions<CoverageRecord> = makeBaseConnectOptions();
        expect(options.enableAutoSave === false).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTENTSTORAGE_PERSISTPROP_0100
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTENTSTORAGE_PERSISTPROP_0100
     * @tc.desc   Verify static Method coverage for persistentStorage.PersistentStorage.persistProp
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTENTSTORAGE_PERSISTPROP_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const options: PersistPropsOptions<int> = makePersistOptions();
        const persisted: boolean = PersistentStorage.persistProp<int>(
          options.key, options.defaultValue, options.toJson, options.fromJson);
        expect(persisted).assertTrue();
        PersistentStorage.deleteProp(options.key);
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTENTSTORAGE_DELETEPROP_0100
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTENTSTORAGE_DELETEPROP_0100
     * @tc.desc   Verify static Method coverage for persistentStorage.PersistentStorage.deleteProp
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTENTSTORAGE_DELETEPROP_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        PersistentStorage.deleteProp('static_coverage_missing_key');
        expect(contains(
          PersistentStorage.keys(), 'static_coverage_missing_key')).assertFalse();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTENTSTORAGE_KEYS_0100
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTENTSTORAGE_KEYS_0100
     * @tc.desc   Verify static Method coverage for persistentStorage.PersistentStorage.keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTENTSTORAGE_KEYS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(PersistentStorage.keys().length >= 0).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTENTSTORAGE_PERSISTPROPS_0100
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTENTSTORAGE_PERSISTPROPS_0100
     * @tc.desc   Verify static Method coverage for persistentStorage.PersistentStorage.persistProps
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTENTSTORAGE_PERSISTPROPS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const key: string = 'static_coverage_persistent';
        PersistentStorage.persistProps([{ key: key, defaultValue: 9 }]);
        expect(contains(PersistentStorage.keys(), key)).assertTrue();
        PersistentStorage.deleteProp(key);
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENTSTORAGE_GLOBAL_TOJSONTYPE_0100
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENTSTORAGE_GLOBAL_TOJSONTYPE_0100
     * @tc.desc   Verify static TypeAlias coverage for persistentStorage.global.ToJSONType
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENTSTORAGE_GLOBAL_TOJSONTYPE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const callback: ToJSONType<int> = (_value: int): jsonx.JsonElement => {
          throw new Error('coverage serializer is compile-only');
        };
        expect(callback !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENTSTORAGE_GLOBAL_FROMJSONTYPE_0100
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENTSTORAGE_GLOBAL_FROMJSONTYPE_0100
     * @tc.desc   Verify static TypeAlias coverage for persistentStorage.global.FromJSONType
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENTSTORAGE_GLOBAL_FROMJSONTYPE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const callback: FromJSONType<int> = (_value: jsonx.JsonElement): int => 2;
        expect(callback !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENTSTORAGE_GLOBAL_PERSISTPROPSOPTIONS_0100
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENTSTORAGE_GLOBAL_PERSISTPROPSOPTIONS_0100
     * @tc.desc   Verify static Interface coverage for persistentStorage.global.PersistPropsOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENTSTORAGE_GLOBAL_PERSISTPROPSOPTIONS_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const options: PersistPropsOptions<int> = makePersistOptions();
        expect(options.key.length > 0 && options.defaultValue === 9).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTPROPSOPTIONS_KEY_0100
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTPROPSOPTIONS_KEY_0100
     * @tc.desc   Verify static Property coverage for persistentStorage.PersistPropsOptions.key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTPROPSOPTIONS_KEY_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const options: PersistPropsOptions<int> = makePersistOptions();
        expect(options.key === 'static_coverage_persistent').assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTPROPSOPTIONS_DEFAULTVALUE_0100
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTPROPSOPTIONS_DEFAULTVALUE_0100
     * @tc.desc   Verify static Property coverage for persistentStorage.PersistPropsOptions.defaultValue
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTPROPSOPTIONS_DEFAULTVALUE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const options: PersistPropsOptions<int> = makePersistOptions();
        expect(options.defaultValue === 9).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTPROPSOPTIONS_TOJSON_0100
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTPROPSOPTIONS_TOJSON_0100
     * @tc.desc   Verify static Method coverage for persistentStorage.PersistPropsOptions.toJson
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTPROPSOPTIONS_TOJSON_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const options: PersistPropsOptions<int> = makePersistOptions();
        expect(options.toJson !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTPROPSOPTIONS_FROMJSON_0100
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTPROPSOPTIONS_FROMJSON_0100
     * @tc.desc   Verify static Method coverage for persistentStorage.PersistPropsOptions.fromJson
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTPROPSOPTIONS_FROMJSON_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const options: PersistPropsOptions<int> = makePersistOptions();
        expect(options.fromJson !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STORAGEPROPERTY_GLOBAL_ONCHANGETYPE_0100
     * @tc.name   SUB_ARKUI_STCOV_STORAGEPROPERTY_GLOBAL_ONCHANGETYPE_0100
     * @tc.desc   Verify static TypeAlias coverage for storageProperty.global.OnChangeType
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STORAGEPROPERTY_GLOBAL_ONCHANGETYPE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const storage: LocalStorage = new LocalStorage();
        const property: AbstractProperty<int> = storage.setAndRef<int>('property', 11);
        let changed: boolean = false;
        property.onChange((name: string, value: int): void => {
          changed = name === 'property' && value === 12;
        });
        property.set(12);
        property.onChange(undefined);
        expect(changed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STORAGEPROPERTY_GLOBAL_ABSTRACTPROPERTY_0100
     * @tc.name   SUB_ARKUI_STCOV_STORAGEPROPERTY_GLOBAL_ABSTRACTPROPERTY_0100
     * @tc.desc   Verify static Interface coverage for storageProperty.global.AbstractProperty
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STORAGEPROPERTY_GLOBAL_ABSTRACTPROPERTY_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const storage: LocalStorage = new LocalStorage();
        const property: AbstractProperty<int> = storage.setAndRef<int>('property', 11);
        expect(property.get() === 11).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STORAGEPROPERTY_ABSTRACTPROPERTY_INFO_0100
     * @tc.name   SUB_ARKUI_STCOV_STORAGEPROPERTY_ABSTRACTPROPERTY_INFO_0100
     * @tc.desc   Verify static Method coverage for storageProperty.AbstractProperty.info
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STORAGEPROPERTY_ABSTRACTPROPERTY_INFO_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const storage: LocalStorage = new LocalStorage();
        const property: AbstractProperty<int> = storage.setAndRef<int>('property', 11);
        expect(property.info() === 'property').assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STORAGEPROPERTY_ABSTRACTPROPERTY_GET_0100
     * @tc.name   SUB_ARKUI_STCOV_STORAGEPROPERTY_ABSTRACTPROPERTY_GET_0100
     * @tc.desc   Verify static Method coverage for storageProperty.AbstractProperty.get
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STORAGEPROPERTY_ABSTRACTPROPERTY_GET_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const storage: LocalStorage = new LocalStorage();
        const property: AbstractProperty<int> = storage.setAndRef<int>('property', 11);
        expect(property.get() === 11).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STORAGEPROPERTY_ABSTRACTPROPERTY_SET_0100
     * @tc.name   SUB_ARKUI_STCOV_STORAGEPROPERTY_ABSTRACTPROPERTY_SET_0100
     * @tc.desc   Verify static Method coverage for storageProperty.AbstractProperty.set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STORAGEPROPERTY_ABSTRACTPROPERTY_SET_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const storage: LocalStorage = new LocalStorage();
        const property: AbstractProperty<int> = storage.setAndRef<int>('property', 11);
        property.set(13);
        expect(property.get() === 13).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STORAGEPROPERTY_ABSTRACTPROPERTY_ONCHANGE_0100
     * @tc.name   SUB_ARKUI_STCOV_STORAGEPROPERTY_ABSTRACTPROPERTY_ONCHANGE_0100
     * @tc.desc   Verify static Method coverage for storageProperty.AbstractProperty.onChange
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STORAGEPROPERTY_ABSTRACTPROPERTY_ONCHANGE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const storage: LocalStorage = new LocalStorage();
        const property: AbstractProperty<int> = storage.setAndRef<int>('property', 11);
        property.onChange(undefined);
        expect(property.get() === 11).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STORAGEPROPERTY_GLOBAL_SUBSCRIBEDABSTRACTPROPERTY_0100
     * @tc.name   SUB_ARKUI_STCOV_STORAGEPROPERTY_GLOBAL_SUBSCRIBEDABSTRACTPROPERTY_0100
     * @tc.desc   Verify static Interface coverage for storageProperty.global.SubscribedAbstractProperty
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STORAGEPROPERTY_GLOBAL_SUBSCRIBEDABSTRACTPROPERTY_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const storage: LocalStorage = new LocalStorage();
        const property: SubscribedAbstractProperty<int> =
          storage.setAndLink<int>('subscribed', 14);
        expect(property.get() === 14).assertTrue();
        property.aboutToBeDeleted();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STORAGEPROPERTY_SUBSCRIBEDABSTRACTPROPERTY_ABOUTTOBEDELETED_0100
     * @tc.name   SUB_ARKUI_STCOV_STORAGEPROPERTY_SUBSCRIBEDABSTRACTPROPERTY_ABOUTTOBEDELETED_0100
     * @tc.desc   Verify static Method coverage for storageProperty.SubscribedAbstractProperty.aboutToBeDeleted
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STORAGEPROPERTY_SUBSCRIBEDABSTRACTPROPERTY_ABOUTTOBEDELETED_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const storage: LocalStorage = new LocalStorage();
        const property: SubscribedAbstractProperty<int> =
          storage.setAndLink<int>('subscribed', 14);
        property.aboutToBeDeleted();
        expect(storage.get<int>('subscribed') === 14).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STORAGEPROPERTY_GLOBAL_COLORMODE_0100
     * @tc.name   SUB_ARKUI_STCOV_STORAGEPROPERTY_GLOBAL_COLORMODE_0100
     * @tc.desc   Verify static Enum coverage for storageProperty.global.ColorMode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STORAGEPROPERTY_GLOBAL_COLORMODE_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(ColorMode.LIGHT !== ColorMode.DARK).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STORAGEPROPERTY_COLORMODE_LIGHT_0100
     * @tc.name   SUB_ARKUI_STCOV_STORAGEPROPERTY_COLORMODE_LIGHT_0100
     * @tc.desc   Verify static EnumValue coverage for storageProperty.ColorMode.LIGHT
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STORAGEPROPERTY_COLORMODE_LIGHT_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(ColorMode.LIGHT === 0).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STORAGEPROPERTY_COLORMODE_DARK_0100
     * @tc.name   SUB_ARKUI_STCOV_STORAGEPROPERTY_COLORMODE_DARK_0100
     * @tc.desc   Verify static EnumValue coverage for storageProperty.ColorMode.DARK
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STORAGEPROPERTY_COLORMODE_DARK_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(ColorMode.DARK === 1).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STORAGEPROPERTY_GLOBAL_LAYOUTDIRECTION_0100
     * @tc.name   SUB_ARKUI_STCOV_STORAGEPROPERTY_GLOBAL_LAYOUTDIRECTION_0100
     * @tc.desc   Verify static Enum coverage for storageProperty.global.LayoutDirection
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STORAGEPROPERTY_GLOBAL_LAYOUTDIRECTION_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(LayoutDirection.RTL !== LayoutDirection.LTR).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STORAGEPROPERTY_LAYOUTDIRECTION_RTL_0100
     * @tc.name   SUB_ARKUI_STCOV_STORAGEPROPERTY_LAYOUTDIRECTION_RTL_0100
     * @tc.desc   Verify static EnumValue coverage for storageProperty.LayoutDirection.RTL
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STORAGEPROPERTY_LAYOUTDIRECTION_RTL_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(LayoutDirection.RTL === 0).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STORAGEPROPERTY_LAYOUTDIRECTION_LTR_0100
     * @tc.name   SUB_ARKUI_STCOV_STORAGEPROPERTY_LAYOUTDIRECTION_LTR_0100
     * @tc.desc   Verify static EnumValue coverage for storageProperty.LayoutDirection.LTR
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STORAGEPROPERTY_LAYOUTDIRECTION_LTR_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(LayoutDirection.LTR === 1).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STORAGEPROPERTY_LAYOUTDIRECTION_AUTO_0100
     * @tc.name   SUB_ARKUI_STCOV_STORAGEPROPERTY_LAYOUTDIRECTION_AUTO_0100
     * @tc.desc   Verify static EnumValue coverage for storageProperty.LayoutDirection.Auto
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STORAGEPROPERTY_LAYOUTDIRECTION_AUTO_0100',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        expect(LayoutDirection.Auto === 2).assertTrue();
      }
    );
  });
}
