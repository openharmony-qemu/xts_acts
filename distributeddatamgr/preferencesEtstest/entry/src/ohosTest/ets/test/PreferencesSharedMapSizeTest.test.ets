import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType,
  DEFAULT } from "@ohos/hypium";
import dataPreferences from '@ohos.data.preferences';
import common from "@ohos.app.ability.common";
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
let mPreferences:dataPreferences.Preferences;

export default function PreferencesSharedMapSizeTest() {
  describe('PreferencesSharedMapSizeTest', () => {
    beforeAll(async () => {
      console.info('beforeAll');
    })
    beforeEach(async () => {
      console.info('beforeEach');
    })
    afterEach(async () => {
      console.info('afterEach');
    })
    afterAll(async () => {
      await dataPreferences.deletePreferences(context, NAME);
      console.info('afterAll');
    })

    /**
     * @tc.name   testPreferencesSharedMapSizeTest0100
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiSharedMapSizeTest_0100
     * @tc.desc   getPreferences interface test with sharedMapSize 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesSharedMapSizeTest0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let options:dataPreferences.Options = {
          name:NAME,
          dataGroupId:"",
          storageType:dataPreferences.StorageType.GSKV,
          sharedMapSize:0
        }
        let isGSkvSupported : boolean = dataPreferences.isStorageTypeSupported(dataPreferences.StorageType.GSKV);
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
     * @tc.name   testPreferencesSharedMapSizeTest0200
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiSharedMapSizeTest_0200
     * @tc.desc   getPreferences interface test with sharedMapSize -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesSharedMapSizeTest0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let options1:dataPreferences.Options = {
          name:NAME,
          dataGroupId:"",
          storageType:dataPreferences.StorageType.GSKV,
          sharedMapSize:-1
        }
        let isGSkvSupported : boolean = dataPreferences.isStorageTypeSupported(dataPreferences.StorageType.GSKV);
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
        expect(err.code).assertEqual("401");
        done();
      }
    });

    /**
     * @tc.name   testPreferencesSharedMapSizeTest0300
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiSharedMapSizeTest_0300
     * @tc.desc   getPreferences interface test with sharedMapSize 256
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesSharedMapSizeTest0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let options2:dataPreferences.Options = {
          name:NAME,
          dataGroupId:"",
          storageType:dataPreferences.StorageType.GSKV,
          sharedMapSize:256
        }
        let isGSkvSupported : boolean = dataPreferences.isStorageTypeSupported(dataPreferences.StorageType.GSKV);
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
     * @tc.name   testPreferencesSharedMapSizeTest0400
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiSharedMapSizeTest_0400
     * @tc.desc   getPreferences interface test with sharedMapSize 65536
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesSharedMapSizeTest0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let options3:dataPreferences.Options = {
          name:NAME,
          dataGroupId:"",
          storageType:dataPreferences.StorageType.GSKV,
          sharedMapSize:65536
        }
        let isGSkvSupported : boolean = dataPreferences.isStorageTypeSupported(dataPreferences.StorageType.GSKV);
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
     * @tc.name   testPreferencesSharedMapSizeTest0500
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiSharedMapSizeTest_0500
     * @tc.desc   getPreferences interface test with sharedMapSize 1112784
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesSharedMapSizeTest0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let options4:dataPreferences.Options = {
          name:NAME,
          dataGroupId:"",
          storageType:dataPreferences.StorageType.GSKV,
          sharedMapSize:1112784
        }
        let isGSkvSupported : boolean = dataPreferences.isStorageTypeSupported(dataPreferences.StorageType.GSKV);
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
     * @tc.name   testPreferencesSharedMapSizeTest0600
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiSharedMapSizeTest_0600
     * @tc.desc   getPreferences interface test with sharedMapSize 1112785
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesSharedMapSizeTest0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let options5:dataPreferences.Options = {
          name:NAME,
          dataGroupId:"",
          storageType:dataPreferences.StorageType.GSKV,
          sharedMapSize:1112785
        }
        let isGSkvSupported : boolean = dataPreferences.isStorageTypeSupported(dataPreferences.StorageType.GSKV);
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
        expect(err.code).assertEqual("401");
        done();
      }
    });

    /**
     * @tc.name   testPreferencesSharedMapSizeTest0700
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiSharedMapSizeTest_0700
     * @tc.desc   getPreferences interface test with sharedMapSize 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesSharedMapSizeTest0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let options6:dataPreferences.Options = {
          name:NAME,
          dataGroupId:"",
          storageType:dataPreferences.StorageType.GSKV,
          sharedMapSize:1
        }
        let isGSkvSupported : boolean = dataPreferences.isStorageTypeSupported(dataPreferences.StorageType.GSKV);
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
        expect(err.code).assertEqual("401");
        done();
      }
    });

    /**
     * @tc.name   testPreferencesSharedMapSizeTest0800
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiSharedMapSizeTest_0800
     * @tc.desc   getPreferences interface test with sharedMapSize 255
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesSharedMapSizeTest0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let options7:dataPreferences.Options = {
          name:NAME,
          dataGroupId:"",
          storageType:dataPreferences.StorageType.GSKV,
          sharedMapSize:255
        }
        let isGSkvSupported : boolean = dataPreferences.isStorageTypeSupported(dataPreferences.StorageType.GSKV);
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
        expect(err.code).assertEqual("401");
        done();
      }
    });

    /**
     * @tc.name   testPreferencesSharedMapSizeTest0900
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiSharedMapSizeTest_0900
     * @tc.desc   getPreferences interface test with sharedMapSize 999999999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesSharedMapSizeTest0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let options8:dataPreferences.Options = {
          name:NAME,
          dataGroupId:"",
          storageType:dataPreferences.StorageType.GSKV,
          sharedMapSize:999999999
        }
        let isGSkvSupported : boolean = dataPreferences.isStorageTypeSupported(dataPreferences.StorageType.GSKV);
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
        expect(err.code).assertEqual("401");
        done();
      }
    });
  })
}
