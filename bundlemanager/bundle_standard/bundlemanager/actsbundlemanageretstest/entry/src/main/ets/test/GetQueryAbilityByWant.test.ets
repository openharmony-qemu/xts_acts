/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import bundle from '@ohos.bundle'
import account from '@ohos.account.osAccount'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

const BUNDLE_NAME1 = 'com.example.third1';
const BUNDLE_NAME2 = 'com.example.third7';
const SYSTEM_NAME = 'com.example.system2';
const ABILITIY_NAME8 = 'com.example.system2.MainAbility';
let userId: number = 0;
const INVALID_CODE: number = 1;
const TAG = '[BMS_QUERY_ABILITY]';

export default function ActsBmsQueryAbilityByWant() {
  describe('ActsBmsQueryAbilityByWant', function () {

    beforeAll(async function (done) {
      console.info(`${TAG} beforeAll start`);
      try {
        let accountId = await account.getAccountManager().getOsAccountLocalIdFromProcess();
        console.info(`${TAG} getOsAccountLocalIdFromProcess userId = ${accountId}`);
        userId = accountId;
      } catch (err) {
        console.error(`${TAG} getOsAccountLocalIdFromProcess err = ${JSON.stringify(err)}`);
      }
      console.info(`${TAG} beforeAll end, userId = ${userId}`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_0500
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_0500
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_0500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0500 start, want={"action":""}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0500 unexpected success, res=${JSON.stringify(res)}`);
        expect(res).assertFail();
      } catch (err) {
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0500 err=${JSON.stringify(err)}`);
        expect(err).assertEqual(INVALID_CODE);
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0500 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_0520
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_0520
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_0520', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0520 start, want={}`);
      try {
        let res = await bundle.queryAbilityByWant({}, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0520 unexpected success, res=${JSON.stringify(res)}`);
        expect(res).assertFail();
      } catch (err) {
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0520 err=${JSON.stringify(err)}`);
        expect(err).assertEqual(INVALID_CODE);
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0520 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_0540
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_0540
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_0540', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0540 start, want={action:"action_a"}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { action: "action_a" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0540 success, res.length=${res.length}, res=${JSON.stringify(res)}`);
        expect(res[0].name).assertEqual('com.example.third7.actionSingleString');
        expect(res[0].description).assertEqual('actionSingleString');
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0540 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0540 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_0560
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_0560
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_0560', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0560 start, want={action:"action_b2"}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "action_b2" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0560 success, res.length=${res.length}, res=${JSON.stringify(res)}`);
        expect(res[0].name).assertEqual('com.example.third7.actionDoubleString');
        expect(res[0].description).assertEqual('actionDoubleString');
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0560 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0560 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_0580
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_0580
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_0580', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0580 start, want={action:"action_c1"}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "action_c1" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0580 success, res.length=${res.length}, res=${JSON.stringify(res)}`);
        expect(res[0].name).assertEqual('com.example.third7.actionDoubleSkill');
        expect(res[0].description).assertEqual('actionDoubleSkill');
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0580 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0580 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_0600
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_0600
     * @tc.desc   queryAbilityByWant for third appl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_0600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0600 start, want={action:"action_d2"}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "action_d2" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0600 success, res.length=${res.length}, res=${JSON.stringify(res)}`);
        expect(res[0].name).assertEqual('com.example.third7.actionDoubleSkill');
        expect(res[0].description).assertEqual('actionDoubleSkill');
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0600 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0600 end`);
      done();
    });


    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_0620
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_0620
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_0620', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0620 start, want={action:"action_not_exist"}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "action_not_exist" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0620 unexpected success, res=${JSON.stringify(res)}`);
        expect(res).assertFail();
      } catch (err) {
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0620 err=${JSON.stringify(err)}`);
        expect(err).assertEqual(INVALID_CODE);
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0620 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_0640
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_0640
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_0640', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0640 start, want={action:"entity_reserved", entities:[]}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "entity_reserved", "entities": [] }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0640 success, res.length=${res.length}`);
        const list = ['entityDoubleSkill', 'entityDoubleString', 'entitySingleString', 'entityEmpty'];
        if (res && res.length) {
          for (let i = 0; i < res.length; i++) {
            console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0640 res[${i}].description=${res[i].description}`);
            expect(list.includes(res[i].description)).assertEqual(true);
          }
        }
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0640 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0640 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_0660
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_0660
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_0660', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0660 start, want={action:"entity_reserved", entities:[""]}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "entity_reserved", "entities": [""] }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0660 unexpected success, res=${JSON.stringify(res)}`);
        expect(res).assertFail();
      } catch (err) {
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0660 err=${JSON.stringify(err)}`);
        expect(err).assertEqual(INVALID_CODE);
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0660 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_0680
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_0680
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_0680', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0680 start, want={action:"entity_reserved", entities:["entity_a"]}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "entity_reserved", "entities": ["entity_a"] }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0680 success, res.length=${res.length}, res=${JSON.stringify(res)}`);
        expect(res[0].name).assertEqual('com.example.third7.entitySingleString');
        expect(res[0].description).assertEqual('entitySingleString');
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0680 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0680 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_0700
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_0700
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_0700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0700 start, want={action:"entity_reserved", entities:["entity_b2"]}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "entity_reserved", "entities": ["entity_b2"] }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0700 success, res.length=${res.length}, res=${JSON.stringify(res)}`);
        expect(res[0].name).assertEqual('com.example.third7.entityDoubleString');
        expect(res[0].description).assertEqual('entityDoubleString');
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0700 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_0700 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_5020
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_5020
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_5020', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5020 start, want={action:"entity_reserved", entities:["entity_d1"]}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "entity_reserved", "entities": ["entity_d1"] }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5020 success, res.length=${res.length}, res=${JSON.stringify(res)}`);
        expect(res[0].name).assertEqual('com.example.third7.entityDoubleSkill');
        expect(res[0].description).assertEqual('entityDoubleSkill');
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5020 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5020 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_5520
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_5520
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_5520', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5520 start, want={action:"entity_reserved", entities:["entity_c1","entity_c2"]}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "entity_reserved", "entities": ["entity_c1", "entity_c2"] }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5520 success, res.length=${res.length}, res=${JSON.stringify(res)}`);
        expect(res[0].name).assertEqual('com.example.third7.entityDoubleSkill');
        expect(res[0].description).assertEqual('entityDoubleSkill');
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5520 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5520 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_5540
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_5540
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_5540', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5540 start, want={action:"entity_reserved", entities:["entity_b1","entity_not_exist"]}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "entity_reserved", "entities": ["entity_b1", "entity_not_exist"] }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5540 unexpected success, res=${JSON.stringify(res)}`);
        expect(res).assertFail();
      } catch (err) {
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5540 err=${JSON.stringify(err)}`);
        expect(err).assertEqual(INVALID_CODE);
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5540 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_5080
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_5080
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_5080', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5080 start, want={action:"entity_reserved", entities:["entity_b1","entity_b2","entity_not_exist"]}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "entity_reserved", "entities": ["entity_b1", "entity_b2", "entity_not_exist"] }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5080 unexpected success, res=${JSON.stringify(res)}`);
        expect(res).assertFail();
      } catch (err) {
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5080 err=${JSON.stringify(err)}`);
        expect(err).assertEqual(INVALID_CODE);
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5080 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_5040
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_5040
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_5040', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5040 start, want={action:"entity_reserved", entities:["entity_not_exist"]}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "entity_reserved", "entities": ["entity_not_exist"] }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5040 unexpected success, res=${JSON.stringify(res)}`);
        expect(res).assertFail();
      } catch (err) {
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5040 err=${JSON.stringify(err)}`);
        expect(err).assertEqual(INVALID_CODE);
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5040 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_4940
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_4940
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_4940', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_4940 start, want={action:"entity_reserved"}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "entity_reserved" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_4940 success, res.length=${res.length}`);
        const list = ['entityDoubleSkill', 'entityDoubleString', 'entitySingleString', 'entityEmpty'];
        if (res && res.length) {
          for (let i = 0; i < res.length; i++) {
            console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_4940 res[${i}].description=${res[i].description}`);
            expect(list.includes(res[i].description)).assertEqual(true);
          }
        }
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_4940 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_4940 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_5660
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_5660
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_5660', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5660 start, want={action:"uri_reserved", uri:""}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "uri_reserved", "uri": "" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5660 success, res.length=${res.length}`);
        expect(res.length).assertEqual(2);
        for (let count = 0; count < 2; count++) {
          console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5660 res[${count}].name=${res[count].name}, description=${res[count].description}`);
          if (res[count].name == BUNDLE_NAME2 + '.uriEmpty') {
            expect(res[count].description).assertEqual('uriEmpty');
          } else {
            expect(res[count].name).assertEqual(BUNDLE_NAME2 + '.uriSchemeEmpty');
            expect(res[count].description).assertEqual('uriSchemeEmpty');
          }
        }
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5660 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5660 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_5560
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_5560
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_5560', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5560 start, want={action:"uri_reserved", uri:"content"}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "uri_reserved", "uri": "content" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5560 success, res.length=${res.length}`);
        const list = ['uriHostEmpty', 'uriScheme'];
        if (res && res.length) {
          for (let i = 0; i < res.length; i++) {
            console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5560 res[${i}].description=${res[i].description}`);
            expect(list.includes(res[i].description)).assertEqual(true);
          }
        }
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5560 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5560 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_5100
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_5100
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_5100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5100 start, want={action:"uri_reserved", uri:"content://www.test.com"}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "uri_reserved", "uri": "content://www.test.com" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5100 success, res.length=${res.length}`);
        expect(res.length).assertEqual(3);
        for (let count = 0; count < 3; count++) {
          console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5100 res[${count}].name=${res[count].name}, description=${res[count].description}`);
          if (res[count].name == BUNDLE_NAME2 + '.uriHostEmpty') {
            expect(res[count].description).assertEqual('uriHostEmpty');
          } else if (res[count].name == BUNDLE_NAME2 + '.uriScheme') {
            expect(res[count].description).assertEqual('uriScheme');
          } else {
            expect(res[count].description).assertEqual('uriSchemeHost');
          }
        }
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5100 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5100 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_5120
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_5120
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_5120', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5120 start, want={action:"uri_reserved", uri:"content://www.test.com:8080"}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "uri_reserved", "uri": "content://www.test.com:8080" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5120 success, res.length=${res.length}`);
        expect(res.length).assertEqual(4);
        for (let count = 0; count < 4; count++) {
          console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5120 res[${count}].name=${res[count].name}, description=${res[count].description}`);
          if (res[count].name == BUNDLE_NAME2 + '.uriHostEmpty') {
            expect(res[count].description).assertEqual('uriHostEmpty');
          } else if (res[count].name == BUNDLE_NAME2 + '.uriScheme') {
            expect(res[count].description).assertEqual('uriScheme');
          } else if (res[count].name == BUNDLE_NAME2 + '.uriSchemeHostPort') {
            expect(res[count].description).assertEqual('uriSchemeHostPort');
          } else {
            expect(res[count].description).assertEqual('uriSchemeHost');
          }
        }
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5120 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5120 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_5580
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_5580
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_5580', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5580 start, want={action:"uri_reserved", uri:"content://www.test.com:8080/query/student/name"}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "uri_reserved", "uri": "content://www.test.com:8080/query/student/name" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5580 success, res.length=${res.length}`);
        expect(res.length).assertEqual(7);
        for (let count = 0; count < 7; count++) {
          console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5580 res[${count}].name=${res[count].name}, description=${res[count].description}`);
          if (res[count].name == BUNDLE_NAME2 + '.uriHostEmpty') {
            expect(res[count].description).assertEqual('uriHostEmpty');
          } else if (res[count].name == BUNDLE_NAME2 + '.uriScheme') {
            expect(res[count].description).assertEqual('uriScheme');
          } else if (res[count].name == BUNDLE_NAME2 + '.uriSchemeHostPort') {
            expect(res[count].description).assertEqual('uriSchemeHostPort');
          } else if (res[count].name == BUNDLE_NAME2 + '.uriSchemeHostPortPathStartWith') {
            expect(res[count].description).assertEqual('uriSchemeHostPortPathStartWith');
          } else if (res[count].name == BUNDLE_NAME2 + '.uriSchemeHostPortPathRegx') {
            expect(res[count].description).assertEqual('uriSchemeHostPortPathRegx');
          } else if (res[count].name == BUNDLE_NAME2 + '.uriSchemeHostPortPath') {
            expect(res[count].description).assertEqual('uriSchemeHostPortPath');
          } else {
            expect(res[count].description).assertEqual('uriSchemeHost');
          }
        }
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5580 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5580 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_5140
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_5140
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_5140', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5140 start, want={action:"uri_reserved", uri:"content://www.test.com/query/student/name"}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "uri_reserved", "uri": "content://www.test.com/query/student/name" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5140 success, res.length=${res.length}`);
        expect(res.length).assertEqual(6);
        for (let count = 0; count < 6; count++) {
          console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5140 res[${count}].name=${res[count].name}, description=${res[count].description}`);
          if (res[count].name == BUNDLE_NAME2 + '.uriHostEmpty') {
            expect(res[count].description).assertEqual('uriHostEmpty');
          } else if (res[count].name == BUNDLE_NAME2 + '.uriScheme') {
            expect(res[count].description).assertEqual('uriScheme');
          } else if (res[count].name == BUNDLE_NAME2 + '.uriPortEmptyWithPath') {
            expect(res[count].description).assertEqual('uriPortEmptyWithPath');
          } else if (res[count].name == BUNDLE_NAME2 + '.uriPortEmptyWithPathStartWith') {
            expect(res[count].description).assertEqual('uriPortEmptyWithPathStartWith');
          } else if (res[count].name == BUNDLE_NAME2 + '.uriPortEmptyWithPathRegx') {
            expect(res[count].description).assertEqual('uriPortEmptyWithPathRegx');
          } else {
            expect(res[count].description).assertEqual('uriSchemeHost');
          }
        }
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5140 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5140 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_5180
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_5180
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_5180', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5180 start, want={action:"uri_reserved", uri:"content://www.test.com:8080/query/teacher/name"}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "uri_reserved", "uri": "content://www.test.com:8080/query/teacher/name" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5180 success, res.length=${res.length}`);
        expect(res.length).assertEqual(5);
        for (let count = 0; count < 5; count++) {
          console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5180 res[${count}].name=${res[count].name}, description=${res[count].description}`);
          if (res[count].name == BUNDLE_NAME2 + '.uriHostEmpty') {
            expect(res[count].description).assertEqual('uriHostEmpty');
          } else if (res[count].name == BUNDLE_NAME2 + '.uriScheme') {
            expect(res[count].description).assertEqual('uriScheme');
          } else if (res[count].name == BUNDLE_NAME2 + '.uriSchemeHostPort') {
            expect(res[count].description).assertEqual('uriSchemeHostPort');
          } else if (res[count].name == BUNDLE_NAME2 + '.uriSchemeHostPortPathRegx') {
            expect(res[count].description).assertEqual('uriSchemeHostPortPathRegx');
          } else {
            expect(res[count].description).assertEqual('uriSchemeHost');
          }
        }
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5180 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5180 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_5160
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_5160
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_5160', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5160 start, want={action:"uri_reserved", uri:"content://www.test.com:8080/query/student/jack"}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "uri_reserved", "uri": "content://www.test.com:8080/query/student/jack" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5160 success, res.length=${res.length}`);
        expect(res.length).assertEqual(5);
        for (let count = 0; count < 5; count++) {
          console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5160 res[${count}].name=${res[count].name}, description=${res[count].description}`);
          if (res[count].name == BUNDLE_NAME2 + '.uriHostEmpty') {
            expect(res[count].description).assertEqual('uriHostEmpty');
          } else if (res[count].name == BUNDLE_NAME2 + '.uriScheme') {
            expect(res[count].description).assertEqual('uriScheme');
          } else if (res[count].name == BUNDLE_NAME2 + '.uriSchemeHostPort') {
            expect(res[count].description).assertEqual('uriSchemeHostPort');
          } else if (res[count].name == BUNDLE_NAME2 + '.uriSchemeHostPortPathStartWith') {
            expect(res[count].description).assertEqual('uriSchemeHostPortPathStartWith');
          } else {
            expect(res[count].description).assertEqual('uriSchemeHost');
          }
        }
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5160 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5160 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_5680
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_5680
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_5680', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5680 start, want={action:"uri_reserved", uri:"file://www.test.com:8080/query/student/name"}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "uri_reserved", "uri": "file://www.test.com:8080/query/student/name" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5680 success, res.length=${res.length}, res=${JSON.stringify(res)}`);
        expect(res[0].description).assertEqual('uriMultiPath');
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5680 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5680 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_5700
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_5700
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_5700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5700 start, want={action:"uri_reserved", uri:"file://www.test.com:8080/query/teacher/hello"}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "uri_reserved", "uri": "file://www.test.com:8080/query/teacher/hello" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5700 success, res.length=${res.length}, res=${JSON.stringify(res)}`);
        expect(res[0].description).assertEqual('uriMultiPath');
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5700 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5700 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_5720
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_5720
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_5720', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5720 start, want={action:"uri_reserved", uri:"content://abc"}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "uri_reserved", "uri": "content://abc" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5720 success, res.length=${res.length}`);
        expect(res.length).assertEqual(2);
        for (let count = 0; count < 2; count++) {
          console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5720 res[${count}].name=${res[count].name}, description=${res[count].description}`);
          if (res[count].name == BUNDLE_NAME2 + '.uriHostEmpty') {
            expect(res[count].description).assertEqual('uriHostEmpty');
          } else {
            expect(res[count].description).assertEqual('uriScheme');
          }
        }
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5720 fail, err=${JSON.stringify(err)}`);
        expect(err).assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5720 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_5200
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_5200
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_5200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5200 start, want={type:"*/*"}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "type": "*/*" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5200 success, res.length=${res.length}`);
        const list = ['TypeDoubleWildCard', 'TypeSingleWildCard', 'TypeString', 'TypeStringExt'];
        let cnt = 0;
        if (res && res.length) {
          for (let i = 0; i < res.length; i++) {
            console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5200 res[${i}].description=${res[i].description}`);
            if (list.includes(res[i].description)) {
              cnt++;
            }
          }
        }
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5200 matched count=${cnt}, expected=${list.length}`);
        expect(cnt).assertEqual(list.length);
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5200 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5200 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_5220
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_5220
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_5220', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5220 start, want={type:"prefixType/*"}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "type": "prefixType/*" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5220 success, res.length=${res.length}`);
        const list = ['TypeDoubleWildCard', 'TypeSingleWildCard', 'TypeString'];
        if (res && res.length) {
          for (let i = 0; i < res.length; i++) {
            console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5220 res[${i}].description=${res[i].description}`);
            expect(list.includes(res[i].description)).assertEqual(true);
          }
        }
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5220 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5220 end`);
      done();
    });

    /**
     * @tc.name   sub_Bms_Framework_Query_AbilityInfo_5240
     * @tc.number sub_Bms_Framework_Query_AbilityInfo_5240
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('sub_Bms_Framework_Query_AbilityInfo_5240', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
      console.info(`${TAG} sub_Bms_Framework_Query_AbilityInfo_5240 start, want={type:"prefixType/suffixType"}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "type": "prefixType/suffixType" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} sub_Bms_Framework_Query_AbilityInfo_5240 success, res.length=${res.length}`);
        const list = ['TypeDoubleWildCard', 'TypeSingleWildCard', 'TypeString'];
        if (res && res.length) {
          for (let i = 0; i < res.length; i++) {
            console.info(`${TAG} sub_Bms_Framework_Query_AbilityInfo_5240 res[${i}].description=${res[i].description}`);
            expect(list.includes(res[i].description)).assertEqual(true);
          }
        }
      } catch (err) {
        console.error(`${TAG} sub_Bms_Framework_Query_AbilityInfo_5240 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} sub_Bms_Framework_Query_AbilityInfo_5240 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_5740
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_5740
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_5740', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5740 start, want={type:"prefixTypeExt/suffixTypeExt"}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "type": "prefixTypeExt/suffixTypeExt" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5740 success, res.length=${res.length}`);
        const list = ['TypeStringExt', 'TypeDoubleWildCard'];
        if (res && res.length) {
          for (let i = 0; i < res.length; i++) {
            console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5740 res[${i}].description=${res[i].description}`);
            expect(list.includes(res[i].description)).assertEqual(true);
          }
        }
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5740 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5740 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_5760
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_5760
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_5760', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5760 start, want={action:"type_reserved"}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "type_reserved" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5760 success, res.length=${res.length}`);
        const list = ['TypeEmpty', 'TypeEmptyExt'];
        if (res && res.length) {
          for (let i = 0; i < res.length; i++) {
            console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5760 res[${i}].description=${res[i].description}`);
            expect(list.includes(res[i].description)).assertEqual(true);
          }
        }
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5760 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5760 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_5600
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_5600
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_5600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5600 start, want={action:"type_reserved", type:""}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "type_reserved", "type": "" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5600 success, res.length=${res.length}`);
        const list = ['TypeEmpty', 'TypeEmptyExt'];
        if (res && res.length) {
          for (let i = 0; i < res.length; i++) {
            console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5600 res[${i}].description=${res[i].description}`);
            expect(list.includes(res[i].description)).assertEqual(true);
          }
        }
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5600 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5600 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_5780
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_5780
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_5780', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5780 start, want={type:"none/none"}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "type": "none/none" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5780 success, res.length=${res.length}, res=${JSON.stringify(res)}`);
        expect(res[0].description).assertEqual('TypeDoubleWildCard');
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5780 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5780 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_5900
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_5900
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_5900', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5900 start, want={action:"all_action_a", entities:["all_entity_a"]}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "all_action_a", "entities": ["all_entity_a"] }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5900 success, res.length=${res.length}, res=${JSON.stringify(res)}`);
        expect(res[0].description).assertEqual('allAE');
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5900 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5900 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_5920
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_5920
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_5920', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5920 start, want={action:"all_action_b", entities:["all_entity_b1","all_entity_b2"]}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "all_action_b", "entities": ["all_entity_b1", "all_entity_b2"] }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5920 success, res.length=${res.length}, res=${JSON.stringify(res)}`);
        expect(res[0].description).assertEqual('allAEs');
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5920 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5920 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_5800
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_5800
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_5800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5800 start, want={uri:"http://www.test.com:8080/query/student/name", type:"text/plain"}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "uri": "http://www.test.com:8080/query/student/name", "type": "text/plain" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5800 success, res.length=${res.length}, res=${JSON.stringify(res)}`);
        expect(res[0].description).assertEqual('allUT');
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5800 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5800 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_5820
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_5820
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_5820', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5820 start, want={uri:"http://www.test.com:8080/query/student/name", type:"text/*"}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "uri": "http://www.test.com:8080/query/student/name", "type": "text/*" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5820 success, res.length=${res.length}, res=${JSON.stringify(res)}`);
        expect(res[0].description).assertEqual('allUT');
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5820 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5820 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_5840
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_5840
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_5840', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5840 start, want={uri:"http://www.test.com:8080/query/teacher", type:"text/plain"}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "uri": "http://www.test.com:8080/query/teacher", "type": "text/plain" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5840 success, res.length=${res.length}, res=${JSON.stringify(res)}`);
        expect(res[0].description).assertEqual('allUT');
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5840 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5840 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_5860
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_5860
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_5860', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5860 start, want={uri:"http://www.test.com:8080/query/teacher/hello", type:"text/plain"}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "uri": "http://www.test.com:8080/query/teacher/hello", "type": "text/plain" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5860 success, res.length=${res.length}, res=${JSON.stringify(res)}`);
        expect(res[0].description).assertEqual('allUT');
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5860 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5860 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_5880
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_5880
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_5880', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5880 start, want={uri:"http://www.test.com:8080/update/hello/world/name", type:"text/plain"}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "uri": "http://www.test.com:8080/update/hello/world/name", "type": "text/plain" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5880 success, res.length=${res.length}, res=${JSON.stringify(res)}`);
        expect(res[0].description).assertEqual('allUT');
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5880 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5880 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_5620
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_5620
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_5620', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5620 start, want={action:"all_action_c", entities:["all_entity_c1"], uri:"https://...", type:"text/plain"}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "all_action_c", "entities": ["all_entity_c1"], "uri": "https://www.test.com:8080/query/student/name", "type": "text/plain" },
          bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5620 success, res.length=${res.length}, res=${JSON.stringify(res)}`);
        expect(res[0].description).assertEqual('allAEUT');
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5620 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5620 end`);
      done();
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_5640
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_5640
     * @tc.desc   queryAbilityByWant for third app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_5640', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5640 start, want={action:"all_action_c", entities:["all_entity_c1","all_entity_c2"], uri:"https://...", type:"text/*"}`);
      try {
        let res = await bundle.queryAbilityByWant(
          { "action": "all_action_c", "entities": ["all_entity_c1", "all_entity_c2"], "uri": "https://www.test.com:8080/query/student/name", "type": "text/*" },
          bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5640 success, res.length=${res.length}, res=${JSON.stringify(res)}`);
        expect(res[0].description).assertEqual('allAEUT');
      } catch (err) {
        console.error(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5640 fail, err=${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.info(`${TAG} Sub_Bms_Framework_Query_AbilityInfo_5640 end`);
      done();
    });

    /**
     * @tc.name   testQueryAbilityByWantNullWantCallback
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_6000
     * @tc.desc   Test queryAbilityByWant with null want. (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testQueryAbilityByWantNullWantCallback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
      console.info(`${TAG} testQueryAbilityByWantNullWantCallback start, want=null`);
      bundle.queryAbilityByWant(null, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId, (err, data) => {
        if (err) {
          console.info(`${TAG} testQueryAbilityByWantNullWantCallback err=${JSON.stringify(err)}`);
          expect(err).assertEqual(1);
          done();
          return;
        }
        console.error(`${TAG} testQueryAbilityByWantNullWantCallback unexpected success, data=${JSON.stringify(data)}`);
        expect().assertFail();
        done();
      });
    });

    /**
     * @tc.name   testQueryAbilityByWantUndefinedWantCallback
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_6010
     * @tc.desc   Test queryAbilityByWant with undefined want. (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testQueryAbilityByWantUndefinedWantCallback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
      console.info(`${TAG} testQueryAbilityByWantUndefinedWantCallback start, want=undefined`);
      bundle.queryAbilityByWant(undefined, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId, (err, data) => {
        if (err) {
          console.info(`${TAG} testQueryAbilityByWantUndefinedWantCallback err=${JSON.stringify(err)}`);
          expect(err).assertEqual(1);
          done();
          return;
        }
        console.error(`${TAG} testQueryAbilityByWantUndefinedWantCallback unexpected success, data=${JSON.stringify(data)}`);
        expect().assertFail();
        done();
      });
    });

    /**
     * @tc.name   testQueryAbilityByWantNullFlagsCallback
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_6020
     * @tc.desc   Test queryAbilityByWant with null bundleFlags. (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testQueryAbilityByWantNullFlagsCallback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
      console.info(`${TAG} testQueryAbilityByWantNullFlagsCallback start, flags=null`);
      bundle.queryAbilityByWant({ action: "action_a" }, null, userId, (err, data) => {
        if (err) {
          console.info(`${TAG} testQueryAbilityByWantNullFlagsCallback err=${JSON.stringify(err)}`);
          expect(err).assertEqual(1);
          done();
          return;
        }
        console.error(`${TAG} testQueryAbilityByWantNullFlagsCallback unexpected success, data=${JSON.stringify(data)}`);
        expect().assertFail();
        done();
      });
    });

    /**
     * @tc.name   testQueryAbilityByWantUndefinedFlagsCallback
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_6030
     * @tc.desc   Test queryAbilityByWant with undefined bundleFlags. (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testQueryAbilityByWantUndefinedFlagsCallback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
      console.info(`${TAG} testQueryAbilityByWantUndefinedFlagsCallback start, flags=undefined`);
      bundle.queryAbilityByWant({ action: "action_a" }, undefined, userId, (err, data) => {
        if (err) {
          console.info(`${TAG} testQueryAbilityByWantUndefinedFlagsCallback err=${JSON.stringify(err)}`);
          expect(err).assertEqual(1);
          done();
          return;
        }
        console.error(`${TAG} testQueryAbilityByWantUndefinedFlagsCallback unexpected success, data=${JSON.stringify(data)}`);
        expect().assertFail();
        done();
      });
    });

    /**
     * @tc.name   testQueryAbilityByWantWithNullUserIdCallback
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_6040
     * @tc.desc   Test queryAbilityByWant with null userId. (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testQueryAbilityByWantWithNullUserIdCallback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
      console.info(`${TAG} testQueryAbilityByWantWithNullUserIdCallback start, userId=null`);
      bundle.queryAbilityByWant({ action: "action_a" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, null, (err, data) => {
        if (err) {
          console.info(`${TAG} testQueryAbilityByWantWithNullUserIdCallback err=${JSON.stringify(err)}`);
          expect(err).assertEqual(1);
          done();
          return;
        }
        console.error(`${TAG} testQueryAbilityByWantWithNullUserIdCallback unexpected success, data=${JSON.stringify(data)}`);
        expect().assertFail();
        done();
      });
    });

    /**
     * @tc.name   testQueryAbilityByWantWithUndefinedUserIdCallback
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_6050
     * @tc.desc   Test queryAbilityByWant with undefined userId. (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testQueryAbilityByWantWithUndefinedUserIdCallback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
      console.info(`${TAG} testQueryAbilityByWantWithUndefinedUserIdCallback start, userId=undefined`);
      bundle.queryAbilityByWant({ action: "action_a" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, undefined, (err, data) => {
        if (err) {
          console.info(`${TAG} testQueryAbilityByWantWithUndefinedUserIdCallback err=${JSON.stringify(err)}`);
          expect(err).assertEqual(1);
          done();
          return;
        }
        console.error(`${TAG} testQueryAbilityByWantWithUndefinedUserIdCallback unexpected success, data=${JSON.stringify(data)}`);
        expect().assertFail();
        done();
      });
    });

    /**
     * @tc.name   testQueryAbilityByWantNullWantWithoutUserIdCallback
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_6060
     * @tc.desc   Test queryAbilityByWant with null want without userId. (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testQueryAbilityByWantNullWantWithoutUserIdCallback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
      console.info(`${TAG} testQueryAbilityByWantNullWantWithoutUserIdCallback start, want=null, no userId`);
      bundle.queryAbilityByWant(null, bundle.BundleFlag.GET_BUNDLE_DEFAULT, (err, data) => {
        if (err) {
          console.info(`${TAG} testQueryAbilityByWantNullWantWithoutUserIdCallback err=${JSON.stringify(err)}`);
          expect(err).assertEqual(1);
          done();
          return;
        }
        console.error(`${TAG} testQueryAbilityByWantNullWantWithoutUserIdCallback unexpected success, data=${JSON.stringify(data)}`);
        expect().assertFail();
        done();
      });
    });

    /**
     * @tc.name   testQueryAbilityByWantUndefinedWantWithoutUserIdCallback
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_6070
     * @tc.desc   Test queryAbilityByWant with undefined want without userId. (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testQueryAbilityByWantUndefinedWantWithoutUserIdCallback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
      console.info(`${TAG} testQueryAbilityByWantUndefinedWantWithoutUserIdCallback start, want=undefined, no userId`);
      bundle.queryAbilityByWant(undefined, bundle.BundleFlag.GET_BUNDLE_DEFAULT, (err, data) => {
        if (err) {
          console.info(`${TAG} testQueryAbilityByWantUndefinedWantWithoutUserIdCallback err=${JSON.stringify(err)}`);
          expect(err).assertEqual(1);
          done();
          return;
        }
        console.error(`${TAG} testQueryAbilityByWantUndefinedWantWithoutUserIdCallback unexpected success, data=${JSON.stringify(data)}`);
        expect().assertFail();
        done();
      });
    });

    /**
     * @tc.name   testQueryAbilityByWantNullFlagsWithoutUserIdCallback
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_6080
     * @tc.desc   Test queryAbilityByWant with null bundleFlags without userId. (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testQueryAbilityByWantNullFlagsWithoutUserIdCallback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
      console.info(`${TAG} testQueryAbilityByWantNullFlagsWithoutUserIdCallback start, flags=null, no userId`);
      bundle.queryAbilityByWant({ action: "action_a" }, null, (err, data) => {
        if (err) {
          console.info(`${TAG} testQueryAbilityByWantNullFlagsWithoutUserIdCallback err=${JSON.stringify(err)}`);
          expect(err).assertEqual(1);
          done();
          return;
        }
        console.error(`${TAG} testQueryAbilityByWantNullFlagsWithoutUserIdCallback unexpected success, data=${JSON.stringify(data)}`);
        expect().assertFail();
        done();
      });
    });

    /**
     * @tc.name   testQueryAbilityByWantUndefinedFlagsWithoutUserIdCallback
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_6090
     * @tc.desc   Test queryAbilityByWant with undefined bundleFlags without userId. (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testQueryAbilityByWantUndefinedFlagsWithoutUserIdCallback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
      console.info(`${TAG} testQueryAbilityByWantUndefinedFlagsWithoutUserIdCallback start, flags=undefined, no userId`);
      bundle.queryAbilityByWant({ action: "action_a" }, undefined, (err, data) => {
        if (err) {
          console.info(`${TAG} testQueryAbilityByWantUndefinedFlagsWithoutUserIdCallback err=${JSON.stringify(err)}`);
          expect(err).assertEqual(1);
          done();
          return;
        }
        console.error(`${TAG} testQueryAbilityByWantUndefinedFlagsWithoutUserIdCallback unexpected success, data=${JSON.stringify(data)}`);
        expect().assertFail();
        done();
      });
    });

    /**
     * @tc.name   testQueryAbilityByWantNullWantWithUserIdPromise
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_6100
     * @tc.desc   Test queryAbilityByWant with null want and userId. (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testQueryAbilityByWantNullWantWithUserIdPromise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
      console.info(`${TAG} testQueryAbilityByWantNullWantWithUserIdPromise start, want=null`);
      try {
        let data = await bundle.queryAbilityByWant(null, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.error(`${TAG} testQueryAbilityByWantNullWantWithUserIdPromise unexpected success, data=${JSON.stringify(data)}`);
        expect().assertFail();
      } catch (err) {
        console.info(`${TAG} testQueryAbilityByWantNullWantWithUserIdPromise err=${JSON.stringify(err)}`);
        expect(err).assertEqual(1);
      }
      console.info(`${TAG} testQueryAbilityByWantNullWantWithUserIdPromise end`);
      done();
    });

    /**
     * @tc.name   testQueryAbilityByWantUndefinedWantWithUserIdPromise
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_6110
     * @tc.desc   Test queryAbilityByWant with undefined want and userId. (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testQueryAbilityByWantUndefinedWantWithUserIdPromise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
      console.info(`${TAG} testQueryAbilityByWantUndefinedWantWithUserIdPromise start, want=undefined`);
      try {
        let data = await bundle.queryAbilityByWant(undefined, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        console.error(`${TAG} testQueryAbilityByWantUndefinedWantWithUserIdPromise unexpected success, data=${JSON.stringify(data)}`);
        expect().assertFail();
      } catch (err) {
        console.info(`${TAG} testQueryAbilityByWantUndefinedWantWithUserIdPromise err=${JSON.stringify(err)}`);
        expect(err).assertEqual(1);
      }
      console.info(`${TAG} testQueryAbilityByWantUndefinedWantWithUserIdPromise end`);
      done();
    });

    /**
     * @tc.name   testQueryAbilityByWantNullFlagsWithUserIdPromise
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_6120
     * @tc.desc   Test queryAbilityByWant with null bundleFlags and userId. (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testQueryAbilityByWantNullFlagsWithUserIdPromise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
      console.info(`${TAG} testQueryAbilityByWantNullFlagsWithUserIdPromise start, flags=null`);
      try {
        let data = await bundle.queryAbilityByWant({ action: "action_a" }, null, userId);
        console.error(`${TAG} testQueryAbilityByWantNullFlagsWithUserIdPromise unexpected success, data=${JSON.stringify(data)}`);
        expect().assertFail();
      } catch (err) {
        console.info(`${TAG} testQueryAbilityByWantNullFlagsWithUserIdPromise err=${JSON.stringify(err)}`);
        expect(err).assertEqual(1);
      }
      console.info(`${TAG} testQueryAbilityByWantNullFlagsWithUserIdPromise end`);
      done();
    });

    /**
     * @tc.name   testQueryAbilityByWantUndefinedFlagsWithUserIdPromise
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_6130
     * @tc.desc   Test queryAbilityByWant with undefined bundleFlags and userId. (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testQueryAbilityByWantUndefinedFlagsWithUserIdPromise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
      console.info(`${TAG} testQueryAbilityByWantUndefinedFlagsWithUserIdPromise start, flags=undefined`);
      try {
        let data = await bundle.queryAbilityByWant({ action: "action_a" }, undefined, userId);
        console.error(`${TAG} testQueryAbilityByWantUndefinedFlagsWithUserIdPromise unexpected success, data=${JSON.stringify(data)}`);
        expect().assertFail();
      } catch (err) {
        console.info(`${TAG} testQueryAbilityByWantUndefinedFlagsWithUserIdPromise err=${JSON.stringify(err)}`);
        expect(err).assertEqual(1);
      }
      console.info(`${TAG} testQueryAbilityByWantUndefinedFlagsWithUserIdPromise end`);
      done();
    });

    /**
     * @tc.name   testQueryAbilityByWantWithNullUserIdPromise
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_6140
     * @tc.desc   Test queryAbilityByWant with null userId. (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testQueryAbilityByWantWithNullUserIdPromise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
      console.info(`${TAG} testQueryAbilityByWantWithNullUserIdPromise start, userId=null`);
      try {
        let data = await bundle.queryAbilityByWant({ action: "action_a" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, null);
        console.error(`${TAG} testQueryAbilityByWantWithNullUserIdPromise unexpected success, data=${JSON.stringify(data)}`);
        expect().assertFail();
      } catch (err) {
        console.info(`${TAG} testQueryAbilityByWantWithNullUserIdPromise err=${JSON.stringify(err)}`);
        expect(err).assertEqual(1);
      }
      console.info(`${TAG} testQueryAbilityByWantWithNullUserIdPromise end`);
      done();
    });

    /**
     * @tc.name   testQueryAbilityByWantWithUndefinedUserIdPromise
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_6150
     * @tc.desc   Test queryAbilityByWant with undefined userId. (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testQueryAbilityByWantWithUndefinedUserIdPromise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
      console.info(`${TAG} testQueryAbilityByWantWithUndefinedUserIdPromise start, userId=undefined`);
      try {
        let data = await bundle.queryAbilityByWant({ action: "action_a" }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, undefined);
        console.error(`${TAG} testQueryAbilityByWantWithUndefinedUserIdPromise unexpected success, data=${JSON.stringify(data)}`);
        expect().assertFail();
      } catch (err) {
        console.info(`${TAG} testQueryAbilityByWantWithUndefinedUserIdPromise err=${JSON.stringify(err)}`);
        expect(err).assertEqual(1);
      }
      console.info(`${TAG} testQueryAbilityByWantWithUndefinedUserIdPromise end`);
      done();
    });
  })
}
