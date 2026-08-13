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

export default function StaticCoverageStorageTest(): void {
  describe('StaticCoverageStorageTest', (): void => {
    /**
     * @tc.number SUB_ARKUI_STCOV_APPSTORAGEV2_APPSTORAGEV2_CONNECT_0136
     * @tc.name   SUB_ARKUI_STCOV_APPSTORAGEV2_APPSTORAGEV2_CONNECT_0136
     * @tc.desc   Verify static Method coverage for appStorageV2.AppStorageV2.connect
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_APPSTORAGEV2_APPSTORAGEV2_CONNECT_0136',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          136, 'appStorageV2#AppStorageV2#connect#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_APPSTORAGEV2_APPSTORAGEV2_CONNECT_0137
     * @tc.name   SUB_ARKUI_STCOV_APPSTORAGEV2_APPSTORAGEV2_CONNECT_0137
     * @tc.desc   Verify static Method coverage for appStorageV2.AppStorageV2.connect
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_APPSTORAGEV2_APPSTORAGEV2_CONNECT_0137',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          137, 'appStorageV2#AppStorageV2#connect#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_APPSTORAGEV2_APPSTORAGEV2_REMOVE_0138
     * @tc.name   SUB_ARKUI_STCOV_APPSTORAGEV2_APPSTORAGEV2_REMOVE_0138
     * @tc.desc   Verify static Method coverage for appStorageV2.AppStorageV2.remove
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_APPSTORAGEV2_APPSTORAGEV2_REMOVE_0138',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          138, 'appStorageV2#AppStorageV2#remove#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_APPSTORAGEV2_APPSTORAGEV2_KEYS_0139
     * @tc.name   SUB_ARKUI_STCOV_APPSTORAGEV2_APPSTORAGEV2_KEYS_0139
     * @tc.desc   Verify static Method coverage for appStorageV2.AppStorageV2.keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_APPSTORAGEV2_APPSTORAGEV2_KEYS_0139',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          139, 'appStorageV2#AppStorageV2#keys#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_ENVIRONMENT_GLOBAL_ENVPROPSOPTIONS_0140
     * @tc.name   SUB_ARKUI_STCOV_ENVIRONMENT_GLOBAL_ENVPROPSOPTIONS_0140
     * @tc.desc   Verify static Interface coverage for environment.global.EnvPropsOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_ENVIRONMENT_GLOBAL_ENVPROPSOPTIONS_0140',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          140, 'environment#global#EnvPropsOptions#Interface');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_ENVIRONMENT_ENVPROPSOPTIONS_KEY_0141
     * @tc.name   SUB_ARKUI_STCOV_ENVIRONMENT_ENVPROPSOPTIONS_KEY_0141
     * @tc.desc   Verify static Property coverage for environment.EnvPropsOptions.key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_ENVIRONMENT_ENVPROPSOPTIONS_KEY_0141',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          141, 'environment#EnvPropsOptions#key#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_ENVIRONMENT_ENVPROPSOPTIONS_DEFAULTVALUE_0142
     * @tc.name   SUB_ARKUI_STCOV_ENVIRONMENT_ENVPROPSOPTIONS_DEFAULTVALUE_0142
     * @tc.desc   Verify static Property coverage for environment.EnvPropsOptions.defaultValue
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_ENVIRONMENT_ENVPROPSOPTIONS_DEFAULTVALUE_0142',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          142, 'environment#EnvPropsOptions#defaultValue#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_ENVIRONMENT_ENVIRONMENT_ENVPROP_0143
     * @tc.name   SUB_ARKUI_STCOV_ENVIRONMENT_ENVIRONMENT_ENVPROP_0143
     * @tc.desc   Verify static Method coverage for environment.Environment.envProp
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_ENVIRONMENT_ENVIRONMENT_ENVPROP_0143',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          143, 'environment#Environment#envProp#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_ENVIRONMENT_ENVIRONMENT_ENVPROPS_0144
     * @tc.name   SUB_ARKUI_STCOV_ENVIRONMENT_ENVIRONMENT_ENVPROPS_0144
     * @tc.desc   Verify static Method coverage for environment.Environment.envProps
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_ENVIRONMENT_ENVIRONMENT_ENVPROPS_0144',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          144, 'environment#Environment#envProps#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_ENVIRONMENT_ENVIRONMENT_KEYS_0145
     * @tc.name   SUB_ARKUI_STCOV_ENVIRONMENT_ENVIRONMENT_KEYS_0145
     * @tc.desc   Verify static Method coverage for environment.Environment.keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_ENVIRONMENT_ENVIRONMENT_KEYS_0145',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          145, 'environment#Environment#keys#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_REF_0146
     * @tc.name   SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_REF_0146
     * @tc.desc   Verify static Method coverage for localStorage.LocalStorage.ref
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_REF_0146',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          146, 'localStorage#LocalStorage#ref#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_SETANDREF_0147
     * @tc.name   SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_SETANDREF_0147
     * @tc.desc   Verify static Method coverage for localStorage.LocalStorage.setAndRef
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_SETANDREF_0147',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          147, 'localStorage#LocalStorage#setAndRef#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_LINK_0148
     * @tc.name   SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_LINK_0148
     * @tc.desc   Verify static Method coverage for localStorage.LocalStorage.link
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_LINK_0148',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          148, 'localStorage#LocalStorage#link#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_SETANDLINK_0149
     * @tc.name   SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_SETANDLINK_0149
     * @tc.desc   Verify static Method coverage for localStorage.LocalStorage.setAndLink
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_SETANDLINK_0149',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          149, 'localStorage#LocalStorage#setAndLink#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_HAS_0150
     * @tc.name   SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_HAS_0150
     * @tc.desc   Verify static Method coverage for localStorage.LocalStorage.has
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_HAS_0150',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          150, 'localStorage#LocalStorage#has#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_GET_0151
     * @tc.name   SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_GET_0151
     * @tc.desc   Verify static Method coverage for localStorage.LocalStorage.get
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_GET_0151',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          151, 'localStorage#LocalStorage#get#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_SET_0152
     * @tc.name   SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_SET_0152
     * @tc.desc   Verify static Method coverage for localStorage.LocalStorage.set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_SET_0152',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          152, 'localStorage#LocalStorage#set#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_SETORCREATE_0153
     * @tc.name   SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_SETORCREATE_0153
     * @tc.desc   Verify static Method coverage for localStorage.LocalStorage.setOrCreate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_SETORCREATE_0153',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          153, 'localStorage#LocalStorage#setOrCreate#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_KEYS_0154
     * @tc.name   SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_KEYS_0154
     * @tc.desc   Verify static Method coverage for localStorage.LocalStorage.keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_KEYS_0154',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          154, 'localStorage#LocalStorage#keys#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_SIZE_0155
     * @tc.name   SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_SIZE_0155
     * @tc.desc   Verify static Method coverage for localStorage.LocalStorage.size
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_SIZE_0155',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          155, 'localStorage#LocalStorage#size#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_DELETE_0156
     * @tc.name   SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_DELETE_0156
     * @tc.desc   Verify static Method coverage for localStorage.LocalStorage.delete
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_DELETE_0156',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          156, 'localStorage#LocalStorage#delete#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_CLEAR_0157
     * @tc.name   SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_CLEAR_0157
     * @tc.desc   Verify static Method coverage for localStorage.LocalStorage.clear
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_LOCALSTORAGE_LOCALSTORAGE_CLEAR_0157',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          157, 'localStorage#LocalStorage#clear#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_GLOBAL_STORAGEDEFAULTSUBCREATORS_0158
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_GLOBAL_STORAGEDEFAULTSUBCREATORS_0158
     * @tc.desc   Verify static TypeAlias coverage for persistenceV2.global.StorageDefaultSubCreators
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_GLOBAL_STORAGEDEFAULTSUBCREATORS_0158',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          158, 'persistenceV2#global#StorageDefaultSubCreators#TypeAlias');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_GLOBAL_CONNECTOPTIONS_0159
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_GLOBAL_CONNECTOPTIONS_0159
     * @tc.desc   Verify static Interface coverage for persistenceV2.global.ConnectOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_GLOBAL_CONNECTOPTIONS_0159',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          159, 'persistenceV2#global#ConnectOptions#Interface');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_CONNECTOPTIONS_DEFAULTCREATOR_0160
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_CONNECTOPTIONS_DEFAULTCREATOR_0160
     * @tc.desc   Verify static Method coverage for persistenceV2.ConnectOptions.defaultCreator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_CONNECTOPTIONS_DEFAULTCREATOR_0160',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          160, 'persistenceV2#ConnectOptions#defaultCreator#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_CONNECTOPTIONS_AREAMODE_0161
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_CONNECTOPTIONS_AREAMODE_0161
     * @tc.desc   Verify static Property coverage for persistenceV2.ConnectOptions.areaMode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_CONNECTOPTIONS_AREAMODE_0161',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          161, 'persistenceV2#ConnectOptions#areaMode#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_CONNECTOPTIONS_TOJSON_0162
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_CONNECTOPTIONS_TOJSON_0162
     * @tc.desc   Verify static Property coverage for persistenceV2.ConnectOptions.toJson
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_CONNECTOPTIONS_TOJSON_0162',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          162, 'persistenceV2#ConnectOptions#toJson#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_CONNECTOPTIONS_FROMJSON_0163
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_CONNECTOPTIONS_FROMJSON_0163
     * @tc.desc   Verify static Property coverage for persistenceV2.ConnectOptions.fromJson
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_CONNECTOPTIONS_FROMJSON_0163',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          163, 'persistenceV2#ConnectOptions#fromJson#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_CONNECTOPTIONS_ENABLEAUTOSAVE_0164
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_CONNECTOPTIONS_ENABLEAUTOSAVE_0164
     * @tc.desc   Verify static Property coverage for persistenceV2.ConnectOptions.enableAutoSave
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_CONNECTOPTIONS_ENABLEAUTOSAVE_0164',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          164, 'persistenceV2#ConnectOptions#enableAutoSave#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_CONNECT_0165
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_CONNECT_0165
     * @tc.desc   Verify static Method coverage for persistenceV2.PersistenceV2.connect
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_CONNECT_0165',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          165, 'persistenceV2#PersistenceV2#connect#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_CONNECT_0166
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_CONNECT_0166
     * @tc.desc   Verify static Method coverage for persistenceV2.PersistenceV2.connect
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_CONNECT_0166',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          166, 'persistenceV2#PersistenceV2#connect#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_GLOBALCONNECT_0167
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_GLOBALCONNECT_0167
     * @tc.desc   Verify static Method coverage for persistenceV2.PersistenceV2.globalConnect
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_GLOBALCONNECT_0167',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          167, 'persistenceV2#PersistenceV2#globalConnect#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_SAVE_0168
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_SAVE_0168
     * @tc.desc   Verify static Method coverage for persistenceV2.PersistenceV2.save
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_SAVE_0168',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          168, 'persistenceV2#PersistenceV2#save#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_NOTIFYONERROR_0169
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_NOTIFYONERROR_0169
     * @tc.desc   Verify static Method coverage for persistenceV2.PersistenceV2.notifyOnError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_NOTIFYONERROR_0169',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          169, 'persistenceV2#PersistenceV2#notifyOnError#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_REMOVE_0170
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_REMOVE_0170
     * @tc.desc   Verify static Method coverage for persistenceV2.PersistenceV2.remove
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_REMOVE_0170',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          170, 'persistenceV2#PersistenceV2#remove#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_KEYS_0171
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_KEYS_0171
     * @tc.desc   Verify static Method coverage for persistenceV2.PersistenceV2.keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_PERSISTENCEV2_KEYS_0171',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          171, 'persistenceV2#PersistenceV2#keys#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_GLOBAL_BASECONNECTOPTIONS_0172
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_GLOBAL_BASECONNECTOPTIONS_0172
     * @tc.desc   Verify static Interface coverage for persistenceV2.global.BaseConnectOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_GLOBAL_BASECONNECTOPTIONS_0172',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          172, 'persistenceV2#global#BaseConnectOptions#Interface');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_BASECONNECTOPTIONS_TOJSON_0173
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_BASECONNECTOPTIONS_TOJSON_0173
     * @tc.desc   Verify static Property coverage for persistenceV2.BaseConnectOptions.toJson
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_BASECONNECTOPTIONS_TOJSON_0173',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          173, 'persistenceV2#BaseConnectOptions#toJson#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_BASECONNECTOPTIONS_FROMJSON_0174
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_BASECONNECTOPTIONS_FROMJSON_0174
     * @tc.desc   Verify static Property coverage for persistenceV2.BaseConnectOptions.fromJson
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_BASECONNECTOPTIONS_FROMJSON_0174',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          174, 'persistenceV2#BaseConnectOptions#fromJson#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENCEV2_BASECONNECTOPTIONS_ENABLEAUTOSAVE_0175
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENCEV2_BASECONNECTOPTIONS_ENABLEAUTOSAVE_0175
     * @tc.desc   Verify static Property coverage for persistenceV2.BaseConnectOptions.enableAutoSave
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENCEV2_BASECONNECTOPTIONS_ENABLEAUTOSAVE_0175',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          175, 'persistenceV2#BaseConnectOptions#enableAutoSave#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTENTSTORAGE_PERSISTPROP_0176
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTENTSTORAGE_PERSISTPROP_0176
     * @tc.desc   Verify static Method coverage for persistentStorage.PersistentStorage.persistProp
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTENTSTORAGE_PERSISTPROP_0176',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          176, 'persistentStorage#PersistentStorage#persistProp#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTENTSTORAGE_DELETEPROP_0177
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTENTSTORAGE_DELETEPROP_0177
     * @tc.desc   Verify static Method coverage for persistentStorage.PersistentStorage.deleteProp
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTENTSTORAGE_DELETEPROP_0177',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          177, 'persistentStorage#PersistentStorage#deleteProp#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTENTSTORAGE_KEYS_0178
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTENTSTORAGE_KEYS_0178
     * @tc.desc   Verify static Method coverage for persistentStorage.PersistentStorage.keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTENTSTORAGE_KEYS_0178',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          178, 'persistentStorage#PersistentStorage#keys#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTENTSTORAGE_PERSISTPROPS_0179
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTENTSTORAGE_PERSISTPROPS_0179
     * @tc.desc   Verify static Method coverage for persistentStorage.PersistentStorage.persistProps
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTENTSTORAGE_PERSISTPROPS_0179',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          179, 'persistentStorage#PersistentStorage#persistProps#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENTSTORAGE_GLOBAL_TOJSONTYPE_0180
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENTSTORAGE_GLOBAL_TOJSONTYPE_0180
     * @tc.desc   Verify static TypeAlias coverage for persistentStorage.global.ToJSONType
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENTSTORAGE_GLOBAL_TOJSONTYPE_0180',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          180, 'persistentStorage#global#ToJSONType#TypeAlias');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENTSTORAGE_GLOBAL_FROMJSONTYPE_0181
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENTSTORAGE_GLOBAL_FROMJSONTYPE_0181
     * @tc.desc   Verify static TypeAlias coverage for persistentStorage.global.FromJSONType
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENTSTORAGE_GLOBAL_FROMJSONTYPE_0181',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          181, 'persistentStorage#global#FromJSONType#TypeAlias');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENTSTORAGE_GLOBAL_PERSISTPROPSOPTIONS_0182
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENTSTORAGE_GLOBAL_PERSISTPROPSOPTIONS_0182
     * @tc.desc   Verify static Interface coverage for persistentStorage.global.PersistPropsOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENTSTORAGE_GLOBAL_PERSISTPROPSOPTIONS_0182',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          182, 'persistentStorage#global#PersistPropsOptions#Interface');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTPROPSOPTIONS_KEY_0183
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTPROPSOPTIONS_KEY_0183
     * @tc.desc   Verify static Property coverage for persistentStorage.PersistPropsOptions.key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTPROPSOPTIONS_KEY_0183',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          183, 'persistentStorage#PersistPropsOptions#key#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTPROPSOPTIONS_DEFAULTVALUE_0184
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTPROPSOPTIONS_DEFAULTVALUE_0184
     * @tc.desc   Verify static Property coverage for persistentStorage.PersistPropsOptions.defaultValue
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTPROPSOPTIONS_DEFAULTVALUE_0184',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          184, 'persistentStorage#PersistPropsOptions#defaultValue#Property');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTPROPSOPTIONS_TOJSON_0185
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTPROPSOPTIONS_TOJSON_0185
     * @tc.desc   Verify static Method coverage for persistentStorage.PersistPropsOptions.toJson
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTPROPSOPTIONS_TOJSON_0185',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          185, 'persistentStorage#PersistPropsOptions#toJson#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTPROPSOPTIONS_FROMJSON_0186
     * @tc.name   SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTPROPSOPTIONS_FROMJSON_0186
     * @tc.desc   Verify static Method coverage for persistentStorage.PersistPropsOptions.fromJson
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_PERSISTENTSTORAGE_PERSISTPROPSOPTIONS_FROMJSON_0186',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          186, 'persistentStorage#PersistPropsOptions#fromJson#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STORAGEPROPERTY_GLOBAL_ONCHANGETYPE_0187
     * @tc.name   SUB_ARKUI_STCOV_STORAGEPROPERTY_GLOBAL_ONCHANGETYPE_0187
     * @tc.desc   Verify static TypeAlias coverage for storageProperty.global.OnChangeType
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STORAGEPROPERTY_GLOBAL_ONCHANGETYPE_0187',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          187, 'storageProperty#global#OnChangeType#TypeAlias');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STORAGEPROPERTY_GLOBAL_ABSTRACTPROPERTY_0188
     * @tc.name   SUB_ARKUI_STCOV_STORAGEPROPERTY_GLOBAL_ABSTRACTPROPERTY_0188
     * @tc.desc   Verify static Interface coverage for storageProperty.global.AbstractProperty
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STORAGEPROPERTY_GLOBAL_ABSTRACTPROPERTY_0188',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          188, 'storageProperty#global#AbstractProperty#Interface');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STORAGEPROPERTY_ABSTRACTPROPERTY_INFO_0189
     * @tc.name   SUB_ARKUI_STCOV_STORAGEPROPERTY_ABSTRACTPROPERTY_INFO_0189
     * @tc.desc   Verify static Method coverage for storageProperty.AbstractProperty.info
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STORAGEPROPERTY_ABSTRACTPROPERTY_INFO_0189',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          189, 'storageProperty#AbstractProperty#info#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STORAGEPROPERTY_ABSTRACTPROPERTY_GET_0190
     * @tc.name   SUB_ARKUI_STCOV_STORAGEPROPERTY_ABSTRACTPROPERTY_GET_0190
     * @tc.desc   Verify static Method coverage for storageProperty.AbstractProperty.get
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STORAGEPROPERTY_ABSTRACTPROPERTY_GET_0190',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          190, 'storageProperty#AbstractProperty#get#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STORAGEPROPERTY_ABSTRACTPROPERTY_SET_0191
     * @tc.name   SUB_ARKUI_STCOV_STORAGEPROPERTY_ABSTRACTPROPERTY_SET_0191
     * @tc.desc   Verify static Method coverage for storageProperty.AbstractProperty.set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STORAGEPROPERTY_ABSTRACTPROPERTY_SET_0191',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          191, 'storageProperty#AbstractProperty#set#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STORAGEPROPERTY_ABSTRACTPROPERTY_ONCHANGE_0192
     * @tc.name   SUB_ARKUI_STCOV_STORAGEPROPERTY_ABSTRACTPROPERTY_ONCHANGE_0192
     * @tc.desc   Verify static Method coverage for storageProperty.AbstractProperty.onChange
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STORAGEPROPERTY_ABSTRACTPROPERTY_ONCHANGE_0192',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          192, 'storageProperty#AbstractProperty#onChange#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STORAGEPROPERTY_GLOBAL_SUBSCRIBEDABSTRACTPROPERTY_0193
     * @tc.name   SUB_ARKUI_STCOV_STORAGEPROPERTY_GLOBAL_SUBSCRIBEDABSTRACTPROPERTY_0193
     * @tc.desc   Verify static Interface coverage for storageProperty.global.SubscribedAbstractProperty
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STORAGEPROPERTY_GLOBAL_SUBSCRIBEDABSTRACTPROPERTY_0193',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          193, 'storageProperty#global#SubscribedAbstractProperty#Interface');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STORAGEPROPERTY_SUBSCRIBEDABSTRACTPROPERTY_ABOUTTOBEDELETED_0194
     * @tc.name   SUB_ARKUI_STCOV_STORAGEPROPERTY_SUBSCRIBEDABSTRACTPROPERTY_ABOUTTOBEDELETED_0194
     * @tc.desc   Verify static Method coverage for storageProperty.SubscribedAbstractProperty.aboutToBeDeleted
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STORAGEPROPERTY_SUBSCRIBEDABSTRACTPROPERTY_ABOUTTOBEDELETED_0194',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          194, 'storageProperty#SubscribedAbstractProperty#aboutToBeDeleted#Method');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STORAGEPROPERTY_GLOBAL_COLORMODE_0195
     * @tc.name   SUB_ARKUI_STCOV_STORAGEPROPERTY_GLOBAL_COLORMODE_0195
     * @tc.desc   Verify static Enum coverage for storageProperty.global.ColorMode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STORAGEPROPERTY_GLOBAL_COLORMODE_0195',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          195, 'storageProperty#global#ColorMode#Enum');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STORAGEPROPERTY_COLORMODE_LIGHT_0196
     * @tc.name   SUB_ARKUI_STCOV_STORAGEPROPERTY_COLORMODE_LIGHT_0196
     * @tc.desc   Verify static EnumValue coverage for storageProperty.ColorMode.LIGHT
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STORAGEPROPERTY_COLORMODE_LIGHT_0196',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          196, 'storageProperty#ColorMode#LIGHT#EnumValue');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STORAGEPROPERTY_COLORMODE_DARK_0197
     * @tc.name   SUB_ARKUI_STCOV_STORAGEPROPERTY_COLORMODE_DARK_0197
     * @tc.desc   Verify static EnumValue coverage for storageProperty.ColorMode.DARK
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STORAGEPROPERTY_COLORMODE_DARK_0197',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          197, 'storageProperty#ColorMode#DARK#EnumValue');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STORAGEPROPERTY_GLOBAL_LAYOUTDIRECTION_0198
     * @tc.name   SUB_ARKUI_STCOV_STORAGEPROPERTY_GLOBAL_LAYOUTDIRECTION_0198
     * @tc.desc   Verify static Enum coverage for storageProperty.global.LayoutDirection
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STORAGEPROPERTY_GLOBAL_LAYOUTDIRECTION_0198',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          198, 'storageProperty#global#LayoutDirection#Enum');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STORAGEPROPERTY_LAYOUTDIRECTION_RTL_0199
     * @tc.name   SUB_ARKUI_STCOV_STORAGEPROPERTY_LAYOUTDIRECTION_RTL_0199
     * @tc.desc   Verify static EnumValue coverage for storageProperty.LayoutDirection.RTL
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STORAGEPROPERTY_LAYOUTDIRECTION_RTL_0199',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          199, 'storageProperty#LayoutDirection#RTL#EnumValue');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STORAGEPROPERTY_LAYOUTDIRECTION_LTR_0200
     * @tc.name   SUB_ARKUI_STCOV_STORAGEPROPERTY_LAYOUTDIRECTION_LTR_0200
     * @tc.desc   Verify static EnumValue coverage for storageProperty.LayoutDirection.LTR
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STORAGEPROPERTY_LAYOUTDIRECTION_LTR_0200',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          200, 'storageProperty#LayoutDirection#LTR#EnumValue');
        expect(passed).assertTrue();
      }
    );
    /**
     * @tc.number SUB_ARKUI_STCOV_STORAGEPROPERTY_LAYOUTDIRECTION_AUTO_0201
     * @tc.name   SUB_ARKUI_STCOV_STORAGEPROPERTY_LAYOUTDIRECTION_AUTO_0201
     * @tc.desc   Verify static EnumValue coverage for storageProperty.LayoutDirection.Auto
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_ARKUI_STCOV_STORAGEPROPERTY_LAYOUTDIRECTION_AUTO_0201',
      Level.LEVEL1,
      (): void => {
        console.info('[ARKUI_NEW] static coverage execute');
        const passed: boolean = runStaticCoverageProbe(
          201, 'storageProperty#LayoutDirection#Auto#EnumValue');
        expect(passed).assertTrue();
      }
    );
  });
}
