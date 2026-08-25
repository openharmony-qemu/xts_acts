/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import dataPreferences from "@ohos.data.preferences";
import { BusinessError } from "@ohos.base";
import AbilityDelegatorRegistry from "@ohos.app.ability.abilityDelegatorRegistry";

const NAME = "test_preferences";
const KEY_TEST_STRING = "key_test_string";
const INVALID_STORAGE_TYPE = 999;
const INVALID_STORAGE_TYPE_NEG = -1;

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

let mPreferences: dataPreferences.Preferences;

export default function preferencesCoverageAddTest() {
  describe("PreferencesCoverageAddTest", () => {
    beforeAll(async () => {
      console.info("beforeAll");
    });

    afterAll(async () => {
      console.info("afterAll");
    });

    beforeEach(async () => {
      console.info("beforeEach");
      mPreferences = await dataPreferences.getPreferences(context, NAME);
    });

    afterEach(async () => {
      console.info("afterEach");
      await dataPreferences.removePreferencesFromCache(context, NAME);
      await dataPreferences.deletePreferences(context, NAME);
    });
    // ==================== getPreferences callback ====================
    /**
     * @tc.name   testGetPreferencesCallbackStorageTypeInvalid0100
     * @tc.number SUB_DistributedData_Preference_SDK_PreferencesTest_0100
     * @tc.desc   Test getPreferences callback with options.storageType set to invalid enum value 999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetPreferencesCallbackStorageTypeInvalid0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        let invalidOptions: dataPreferences.Options = { name: NAME, storageType: INVALID_STORAGE_TYPE };
        dataPreferences.getPreferences(context, invalidOptions, (err: BusinessError, pref: dataPreferences.Preferences) => {
          if (err) {
            console.info("testGetPreferencesCallbackStorageTypeInvalid0100 err code: " + err.code + ", message: " + err.message);
            expect("401").assertEqual(err.code.toString());
            done();
          } else {
            console.info("testGetPreferencesCallbackStorageTypeInvalid0100 unexpected success");
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.info("testGetPreferencesCallbackStorageTypeInvalid0100 catch err code: " + err.code + ", message: " + err.message);
        expect("401").assertEqual(err.code.toString());
        done();
      }
    });
    /**
     * @tc.name   testGetPreferencesCallbackStorageTypeInvalid0200
     * @tc.number SUB_DistributedData_Preference_SDK_PreferencesTest_0101
     * @tc.desc   Test getPreferences callback with options.storageType set to invalid enum value -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetPreferencesCallbackStorageTypeInvalid0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        let invalidOptions: dataPreferences.Options = { name: NAME, storageType: INVALID_STORAGE_TYPE_NEG };
        dataPreferences.getPreferences(context, invalidOptions, (err: BusinessError, pref: dataPreferences.Preferences) => {
          if (err) {
            console.info("testGetPreferencesCallbackStorageTypeInvalid0200 err code: " + err.code + ", message: " + err.message);
            expect("401").assertEqual(err.code.toString());
            done();
          } else {
            console.info("testGetPreferencesCallbackStorageTypeInvalid0200 unexpected success");
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.info("testGetPreferencesCallbackStorageTypeInvalid0200 catch err code: " + err.code + ", message: " + err.message);
        expect("401").assertEqual(err.code.toString());
        done();
      }
    });
    // ==================== getPreferencesSync ====================
    /**
     * @tc.name   testGetPreferencesSyncStorageTypeInvalid0100
     * @tc.number SUB_DistributedData_Preference_SDK_PreferencesTest_0200
     * @tc.desc   Test getPreferencesSync with options.storageType set to invalid enum value 999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetPreferencesSyncStorageTypeInvalid0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        let invalidOptions: dataPreferences.Options = { name: NAME, storageType: INVALID_STORAGE_TYPE };
        let pref = dataPreferences.getPreferencesSync(context, invalidOptions);
        console.info("testGetPreferencesSyncStorageTypeInvalid0100 unexpected success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testGetPreferencesSyncStorageTypeInvalid0100 catch err code: " + err.code + ", message: " + err.message);
        expect("401").assertEqual(err.code.toString());
        done();
      }
    });
    /**
     * @tc.name   testGetPreferencesSyncStorageTypeInvalid0200
     * @tc.number SUB_DistributedData_Preference_SDK_PreferencesTest_0201
     * @tc.desc   Test getPreferencesSync with options.storageType set to invalid enum value -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetPreferencesSyncStorageTypeInvalid0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        let invalidOptions: dataPreferences.Options = { name: NAME, storageType: INVALID_STORAGE_TYPE_NEG };
        let pref = dataPreferences.getPreferencesSync(context, invalidOptions);
        console.info("testGetPreferencesSyncStorageTypeInvalid0200 unexpected success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testGetPreferencesSyncStorageTypeInvalid0200 catch err code: " + err.code + ", message: " + err.message);
        expect("401").assertEqual(err.code.toString());
        done();
      }
    });
    // ==================== isStorageTypeSupported ====================
    /**
     * @tc.name   testIsStorageTypeSupportedUndefined0100
     * @tc.number SUB_DistributedData_Preference_SDK_PreferencesTest_0300
     * @tc.desc   Test isStorageTypeSupported with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testIsStorageTypeSupportedUndefined0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        let result = dataPreferences.isStorageTypeSupported(undefined);
        console.info("testIsStorageTypeSupportedUndefined0100 unexpected success, result: " + result);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testIsStorageTypeSupportedUndefined0100 catch err code: " + err.code + ", message: " + err.message);
        expect("401").assertEqual(err.code.toString());
        done();
      }
    });
    // ==================== deletePreferences callback ====================
    /**
     * @tc.name   testDeletePreferencesCallbackStorageTypeInvalid0100
     * @tc.number SUB_DistributedData_Preference_SDK_PreferencesTest_0400
     * @tc.desc   Test deletePreferences callback with options.storageType set to invalid enum value 999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testDeletePreferencesCallbackStorageTypeInvalid0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        let invalidOptions: dataPreferences.Options = { name: NAME, storageType: INVALID_STORAGE_TYPE };
        dataPreferences.deletePreferences(context, invalidOptions, (err: BusinessError) => {
          if (err) {
            console.info("testDeletePreferencesCallbackStorageTypeInvalid0100 err code: " + err.code + ", message: " + err.message);
            expect("401").assertEqual(err.code.toString());
            done();
          } else {
            console.info("testDeletePreferencesCallbackStorageTypeInvalid0100 unexpected success");
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.info("testDeletePreferencesCallbackStorageTypeInvalid0100 catch err code: " + err.code + ", message: " + err.message);
        expect("401").assertEqual(err.code.toString());
        done();
      }
    });
    /**
     * @tc.name   testDeletePreferencesCallbackStorageTypeInvalid0200
     * @tc.number SUB_DistributedData_Preference_SDK_PreferencesTest_0401
     * @tc.desc   Test deletePreferences callback with options.storageType set to invalid enum value -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testDeletePreferencesCallbackStorageTypeInvalid0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        let invalidOptions: dataPreferences.Options = { name: NAME, storageType: INVALID_STORAGE_TYPE_NEG };
        dataPreferences.deletePreferences(context, invalidOptions, (err: BusinessError) => {
          if (err) {
            console.info("testDeletePreferencesCallbackStorageTypeInvalid0200 err code: " + err.code + ", message: " + err.message);
            expect("401").assertEqual(err.code.toString());
            done();
          } else {
            console.info("testDeletePreferencesCallbackStorageTypeInvalid0200 unexpected success");
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.info("testDeletePreferencesCallbackStorageTypeInvalid0200 catch err code: " + err.code + ", message: " + err.message);
        expect("401").assertEqual(err.code.toString());
        done();
      }
    });
    // ==================== deletePreferences promise ====================
    /**
     * @tc.name   testDeletePreferencesPromiseStorageTypeInvalid0100
     * @tc.number SUB_DistributedData_Preference_SDK_PreferencesTest_0500
     * @tc.desc   Test deletePreferences promise with options.storageType set to invalid enum value 999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testDeletePreferencesPromiseStorageTypeInvalid0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let invalidOptions: dataPreferences.Options = { name: NAME, storageType: INVALID_STORAGE_TYPE };
        await dataPreferences.deletePreferences(context, invalidOptions);
        console.info("testDeletePreferencesPromiseStorageTypeInvalid0100 unexpected success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testDeletePreferencesPromiseStorageTypeInvalid0100 catch err code: " + err.code + ", message: " + err.message);
        expect("401").assertEqual(err.code.toString());
        done();
      }
    });
    /**
     * @tc.name   testDeletePreferencesPromiseStorageTypeInvalid0200
     * @tc.number SUB_DistributedData_Preference_SDK_PreferencesTest_0501
     * @tc.desc   Test deletePreferences promise with options.storageType set to invalid enum value -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testDeletePreferencesPromiseStorageTypeInvalid0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let invalidOptions: dataPreferences.Options = { name: NAME, storageType: INVALID_STORAGE_TYPE_NEG };
        await dataPreferences.deletePreferences(context, invalidOptions);
        console.info("testDeletePreferencesPromiseStorageTypeInvalid0200 unexpected success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testDeletePreferencesPromiseStorageTypeInvalid0200 catch err code: " + err.code + ", message: " + err.message);
        expect("401").assertEqual(err.code.toString());
        done();
      }
    });
    // ==================== removePreferencesFromCache callback ====================
    /**
     * @tc.name   testRemovePreferencesFromCacheCallbackStorageTypeInvalid0100
     * @tc.number SUB_DistributedData_Preference_SDK_PreferencesTest_0600
     * @tc.desc   Test removePreferencesFromCache callback with options.storageType set to invalid enum value 999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRemovePreferencesFromCacheCallbackStorageTypeInvalid0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        let invalidOptions: dataPreferences.Options = { name: NAME, storageType: INVALID_STORAGE_TYPE };
        dataPreferences.removePreferencesFromCache(context, invalidOptions, (err: BusinessError) => {
          if (err) {
            console.info("testRemovePreferencesFromCacheCallbackStorageTypeInvalid0100 err code: " + err.code + ", message: " + err.message);
            expect("401").assertEqual(err.code.toString());
            done();
          } else {
            console.info("testRemovePreferencesFromCacheCallbackStorageTypeInvalid0100 unexpected success");
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.info("testRemovePreferencesFromCacheCallbackStorageTypeInvalid0100 catch err code: " + err.code + ", message: " + err.message);
        expect("401").assertEqual(err.code.toString());
        done();
      }
    });
    /**
     * @tc.name   testRemovePreferencesFromCacheCallbackStorageTypeInvalid0200
     * @tc.number SUB_DistributedData_Preference_SDK_PreferencesTest_0601
     * @tc.desc   Test removePreferencesFromCache callback with options.storageType set to invalid enum value -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRemovePreferencesFromCacheCallbackStorageTypeInvalid0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        let invalidOptions: dataPreferences.Options = { name: NAME, storageType: INVALID_STORAGE_TYPE_NEG };
        dataPreferences.removePreferencesFromCache(context, invalidOptions, (err: BusinessError) => {
          if (err) {
            console.info("testRemovePreferencesFromCacheCallbackStorageTypeInvalid0200 err code: " + err.code + ", message: " + err.message);
            expect("401").assertEqual(err.code.toString());
            done();
          } else {
            console.info("testRemovePreferencesFromCacheCallbackStorageTypeInvalid0200 unexpected success");
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.info("testRemovePreferencesFromCacheCallbackStorageTypeInvalid0200 catch err code: " + err.code + ", message: " + err.message);
        expect("401").assertEqual(err.code.toString());
        done();
      }
    });
    // ==================== removePreferencesFromCache promise ====================
    /**
     * @tc.name   testRemovePreferencesFromCachePromiseStorageTypeInvalid0100
     * @tc.number SUB_DistributedData_Preference_SDK_PreferencesTest_0700
     * @tc.desc   Test removePreferencesFromCache promise with options.storageType set to invalid enum value 999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRemovePreferencesFromCachePromiseStorageTypeInvalid0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let invalidOptions: dataPreferences.Options = { name: NAME, storageType: INVALID_STORAGE_TYPE };
        await dataPreferences.removePreferencesFromCache(context, invalidOptions);
        console.info("testRemovePreferencesFromCachePromiseStorageTypeInvalid0100 unexpected success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testRemovePreferencesFromCachePromiseStorageTypeInvalid0100 catch err code: " + err.code + ", message: " + err.message);
        expect("401").assertEqual(err.code.toString());
        done();
      }
    });
    /**
     * @tc.name   testRemovePreferencesFromCachePromiseStorageTypeInvalid0200
     * @tc.number SUB_DistributedData_Preference_SDK_PreferencesTest_0701
     * @tc.desc   Test removePreferencesFromCache promise with options.storageType set to invalid enum value -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRemovePreferencesFromCachePromiseStorageTypeInvalid0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let invalidOptions: dataPreferences.Options = { name: NAME, storageType: INVALID_STORAGE_TYPE_NEG };
        await dataPreferences.removePreferencesFromCache(context, invalidOptions);
        console.info("testRemovePreferencesFromCachePromiseStorageTypeInvalid0200 unexpected success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testRemovePreferencesFromCachePromiseStorageTypeInvalid0200 catch err code: " + err.code + ", message: " + err.message);
        expect("401").assertEqual(err.code.toString());
        done();
      }
    });
    // ==================== off dataChange keys ====================
    /**
     * @tc.name   testOffDataChangeEmptyKeys0100
     * @tc.number SUB_DistributedData_Preference_SDK_PreferencesTest_0800
     * @tc.desc   Test off('dataChange') with empty array for keys parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testOffDataChangeEmptyKeys0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await mPreferences.put(KEY_TEST_STRING, "testValue");
        await mPreferences.flush();
        let dataChangeCalled = false;
        let observer = (data: Record<string, dataPreferences.ValueType>) => {
          dataChangeCalled = true;
          console.info("testOffDataChangeEmptyKeys0100 observer called");
        };
        mPreferences.on("dataChange", ["key_nonexist"], observer);
        mPreferences.off("dataChange", [], observer);
        await mPreferences.put(KEY_TEST_STRING, "newValue");
        await mPreferences.flush();
        console.info("testOffDataChangeEmptyKeys0100 dataChangeCalled: " + dataChangeCalled);
        done();
      } catch (err) {
        console.info("testOffDataChangeEmptyKeys0100 catch err code: " + err.code + ", message: " + err.message);
        expect("401").assertEqual(err.code.toString());
        done();
      }
    });
    /**
     * @tc.name   testOffDataChangeNonEmptyKeys0100
     * @tc.number SUB_DistributedData_Preference_SDK_PreferencesTest_0900
     * @tc.desc   Test off('dataChange') with non-empty array for keys parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testOffDataChangeNonEmptyKeys0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let dataChangeCalled = false;
        let observer = (data: Record<string, dataPreferences.ValueType>) => {
          dataChangeCalled = true;
          console.info("testOffDataChangeNonEmptyKeys0100 observer called");
        };
        mPreferences.on("dataChange", [KEY_TEST_STRING], observer);
        mPreferences.off("dataChange", [KEY_TEST_STRING], observer);
        await mPreferences.put(KEY_TEST_STRING, "testValue");
        await mPreferences.flush();
        expect(dataChangeCalled).assertFalse();
        console.info("testOffDataChangeNonEmptyKeys0100 end");
        done();
      } catch (err) {
        console.info("testOffDataChangeNonEmptyKeys0100 catch err code: " + err.code + ", message: " + err.message);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   testOffDataChangeKeysUndefined0100
     * @tc.number SUB_DistributedData_Preference_SDK_PreferencesTest_1000
     * @tc.desc   Test off('dataChange') with undefined for keys parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testOffDataChangeKeysUndefined0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let dataChangeCalled = false;
        let observer = (data: Record<string, dataPreferences.ValueType>) => {
          dataChangeCalled = true;
          console.info("testOffDataChangeKeysUndefined0100 observer called");
        };
        mPreferences.on("dataChange", [KEY_TEST_STRING], observer);
        mPreferences.off("dataChange", undefined, observer);
        await mPreferences.put(KEY_TEST_STRING, "testValue");
        await mPreferences.flush();
        expect(dataChangeCalled).assertFalse();
        console.info("testOffDataChangeKeysUndefined0100 end");
        done();
      } catch (err) {
        console.info("testOffDataChangeKeysUndefined0100 catch err code: " + err.code + ", message: " + err.message);
        expect("401").assertEqual(err.code.toString());
        done();
      }
    });
  });
}