'use static';
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium-static/src/main/indexStatic";
import dataPreferences from '@ohos.data.preferences';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const NAME = 'test_preferences';
const KEY_TEST_INT_ELEMENT = 'key_test_int';
const KEY_TEST_LONG_ELEMENT = 'key_test_long';
const KEY_TEST_FLOAT_ELEMENT = 'key_test_float';
const KEY_TEST_BOOLEAN_ELEMENT = 'key_test_boolean';
const KEY_TEST_STRING_ELEMENT = 'key_test_string';
const KEY_TEST_NUMBER_ARRAY_ELEMENT = 'key_test_number_array';
const KEY_TEST_STRING_ARRAY_ELEMENT = 'key_test_string_array';
const KEY_TEST_BOOL_ARRAY_ELEMENT = 'key_test_bool_array';
const KEY_TEST_BIGINT = 'key_test_bigint';
const NAME_MAX = 'a'.repeat(255);
const NAME_MAX1 = 'a'.repeat(256);
const TAG = "[PREFERENCES_JSUNIT_TEST]";
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
let mPreferences: dataPreferences.Preferences;

export default function PreferencesSharedMapSizeStaticTest(): void {
  describe('PreferencesSharedMapSizeStaticTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info('beforeAll');
    })
    beforeEach(async (): Promise<void> => {
      console.info('beforeEach');
    })
    afterEach(async (): Promise<void> => {
      console.info('afterEach');
    })
    afterAll(async (): Promise<void> => {
      await dataPreferences.deletePreferences(context, NAME);
      console.info('afterAll');
    })

    /**
     * @tc.name   testPreferencesSharedMapSizeStaticTest0100
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiSharedMapSizeStaticTest_0100
     * @tc.desc   getPreferences interface test with sharedMapSize 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesSharedMapSizeStaticTest0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let options: dataPreferences.Options = {
          name: NAME,
          dataGroupId: "",
          storageType: dataPreferences.StorageType.GSKV,
          sharedMapSize: 0
        }
        let isGSkvSupported: boolean = dataPreferences.isStorageTypeSupported(dataPreferences.StorageType.GSKV);
        if (isGSkvSupported) {
          let mPreferences = await dataPreferences.getPreferences(context, options);
          await mPreferences.put(KEY_TEST_STRING_ELEMENT, 555555);
          let ret = await mPreferences.get(KEY_TEST_STRING_ELEMENT, 'default');
          expect(ret).assertEqual(555555);
          done();
        } else {
          console.info(TAG + `isGSkvSupported: ${isGSkvSupported}`);
          expect(isGSkvSupported).assertEqual(false);
          done();
        }
      } catch (err) {
        console.error(TAG + "err.code = " + err.code + "err.message = " + err.message);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testPreferencesSharedMapSizeStaticTest0200
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiSharedMapSizeStaticTest_0200
     * @tc.desc   getPreferences interface test with sharedMapSize -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesSharedMapSizeStaticTest0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let options1: dataPreferences.Options = {
          name: NAME,
          dataGroupId: "",
          storageType: dataPreferences.StorageType.GSKV,
          sharedMapSize: -1
        }
        let isGSkvSupported: boolean = dataPreferences.isStorageTypeSupported(dataPreferences.StorageType.GSKV);
        if (isGSkvSupported) {
          await dataPreferences.getPreferences(context, options1);
          expect().assertFail();
          done();
        } else {
          console.info(TAG + `isGSkvSupported: ${isGSkvSupported}`);
          expect(isGSkvSupported).assertEqual(false);
          done();
        }
      } catch (err) {
        console.error(TAG + "err.code = " + err.code + "err.message = " + err.message);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testPreferencesSharedMapSizeStaticTest0300
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiSharedMapSizeStaticTest_0300
     * @tc.desc   getPreferences interface test with sharedMapSize 256
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesSharedMapSizeStaticTest0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let options2: dataPreferences.Options = {
          name: NAME,
          dataGroupId: "",
          storageType: dataPreferences.StorageType.GSKV,
          sharedMapSize: 256
        }
        let isGSkvSupported: boolean = dataPreferences.isStorageTypeSupported(dataPreferences.StorageType.GSKV);
        if (isGSkvSupported) {
          let mPreferences = await dataPreferences.getPreferences(context, options2);
          await mPreferences.put(KEY_TEST_STRING_ELEMENT, 555555);
          let ret = await mPreferences.get(KEY_TEST_STRING_ELEMENT, 'default');
          expect(ret).assertEqual(555555);
          done();
        } else {
          console.info(TAG + `isGSkvSupported: ${isGSkvSupported}`);
          expect(isGSkvSupported).assertEqual(false);
          done();
        }
      } catch (err) {
        console.error(TAG + "err.code = " + err.code + "err.message = " + err.message);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testPreferencesSharedMapSizeStaticTest0400
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiSharedMapSizeStaticTest_0400
     * @tc.desc   getPreferences interface test with sharedMapSize 65536
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesSharedMapSizeStaticTest0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let options3: dataPreferences.Options = {
          name: NAME,
          dataGroupId: "",
          storageType: dataPreferences.StorageType.GSKV,
          sharedMapSize: 65536
        }
        let isGSkvSupported: boolean = dataPreferences.isStorageTypeSupported(dataPreferences.StorageType.GSKV);
        if (isGSkvSupported) {
          let mPreferences = await dataPreferences.getPreferences(context, options3);
          await mPreferences.put(KEY_TEST_STRING_ELEMENT, 555555);
          let ret = await mPreferences.get(KEY_TEST_STRING_ELEMENT, 'default');
          expect(ret).assertEqual(555555);
          done();
        } else {
          console.info(TAG + `isGSkvSupported: ${isGSkvSupported}`);
          expect(isGSkvSupported).assertEqual(false);
          done();
        }
      } catch (err) {
        console.error(TAG + "err.code = " + err.code + "err.message = " + err.message);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testPreferencesSharedMapSizeStaticTest0500
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiSharedMapSizeStaticTest_0500
     * @tc.desc   getPreferences interface test with sharedMapSize 1112784
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesSharedMapSizeStaticTest0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let options4: dataPreferences.Options = {
          name: NAME,
          dataGroupId: "",
          storageType: dataPreferences.StorageType.GSKV,
          sharedMapSize: 1112784
        }
        let isGSkvSupported: boolean = dataPreferences.isStorageTypeSupported(dataPreferences.StorageType.GSKV);
        if (isGSkvSupported) {
          let mPreferences = await dataPreferences.getPreferences(context, options4);
          await mPreferences.put(KEY_TEST_STRING_ELEMENT, 555555);
          let ret = await mPreferences.get(KEY_TEST_STRING_ELEMENT, 'default');
          expect(ret).assertEqual(555555);
          console.info("====>testPreferencesStorageType001 success: part1")
          done();
        } else {
          console.info(TAG + `isGSkvSupported: ${isGSkvSupported}`);
          expect(isGSkvSupported).assertEqual(false);
          done();
        }
      } catch (err) {
        console.error(TAG + "err.code = " + err.code + "err.message = " + err.message);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testPreferencesSharedMapSizeStaticTest0600
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiSharedMapSizeStaticTest_0600
     * @tc.desc   getPreferences interface test with sharedMapSize 1112785
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesSharedMapSizeStaticTest0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let options5: dataPreferences.Options = {
          name: NAME,
          dataGroupId: "",
          storageType: dataPreferences.StorageType.GSKV,
          sharedMapSize: 1112785
        }
        let isGSkvSupported: boolean = dataPreferences.isStorageTypeSupported(dataPreferences.StorageType.GSKV);
        if (isGSkvSupported) {
          await dataPreferences.getPreferences(context, options5);
          expect().assertFail();
          done();
        } else {
          console.info(TAG + `isGSkvSupported: ${isGSkvSupported}`);
          expect(isGSkvSupported).assertEqual(false);
          done();
        }
      } catch (err) {
        console.error(TAG + "err.code = " + err.code + "err.message = " + err.message);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testPreferencesSharedMapSizeStaticTest0700
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiSharedMapSizeStaticTest_0700
     * @tc.desc   getPreferences interface test with sharedMapSize 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesSharedMapSizeStaticTest0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let options6: dataPreferences.Options = {
          name: NAME,
          dataGroupId: "",
          storageType: dataPreferences.StorageType.GSKV,
          sharedMapSize: 1
        }
        let isGSkvSupported: boolean = dataPreferences.isStorageTypeSupported(dataPreferences.StorageType.GSKV);
        if (isGSkvSupported) {
          await dataPreferences.getPreferences(context, options6);
          expect().assertFail();
          done();
        } else {
          console.info(TAG + `isGSkvSupported: ${isGSkvSupported}`);
          expect(isGSkvSupported).assertEqual(false);
          done();
        }
      } catch (err) {
        console.error(TAG + "err.code = " + err.code + "err.message = " + err.message);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testPreferencesSharedMapSizeStaticTest0800
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiSharedMapSizeStaticTest_0800
     * @tc.desc   getPreferences interface test with sharedMapSize 255
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesSharedMapSizeStaticTest0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let options7: dataPreferences.Options = {
          name: NAME,
          dataGroupId: "",
          storageType: dataPreferences.StorageType.GSKV,
          sharedMapSize: 255
        }
        let isGSkvSupported: boolean = dataPreferences.isStorageTypeSupported(dataPreferences.StorageType.GSKV);
        if (isGSkvSupported) {
          await dataPreferences.getPreferences(context, options7);
          expect().assertFail();
          done();
        } else {
          console.info(TAG + `isGSkvSupported: ${isGSkvSupported}`);
          expect(isGSkvSupported).assertEqual(false);
          done();
        }
      } catch (err) {
        console.error(TAG + "err.code = " + err.code + "err.message = " + err.message);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testPreferencesSharedMapSizeStaticTest0900
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiSharedMapSizeStaticTest_0900
     * @tc.desc   getPreferences interface test with sharedMapSize 999999999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesSharedMapSizeStaticTest0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let options8: dataPreferences.Options = {
          name: NAME,
          dataGroupId: "",
          storageType: dataPreferences.StorageType.GSKV,
          sharedMapSize: 999999999
        }
        let isGSkvSupported: boolean = dataPreferences.isStorageTypeSupported(dataPreferences.StorageType.GSKV);
        if (isGSkvSupported) {
          await dataPreferences.getPreferences(context, options8);
          expect().assertFail();
          done();
        } else {
          console.info(TAG + `isGSkvSupported: ${isGSkvSupported}`);
          expect(isGSkvSupported).assertEqual(false);
          done();
        }
      } catch (err) {
        console.error(TAG + "err.code = " + err.code + "err.message = " + err.message);
        expect(err.code).assertEqual(401);
        done();
      }
    });
  })
}