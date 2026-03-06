/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, afterEach, it, expect, beforeEach, Level, Size, TestType } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import contact from '@ohos.contact';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';

async function getPermissions() {
  console.info('getPermission start');
  type MyPermissions = "ohos.permission.WRITE_CONTACTS" | "ohos.permission.READ_CONTACTS";
  let list: MyPermissions[] = ['ohos.permission.WRITE_CONTACTS', 'ohos.permission.READ_CONTACTS'];
  try {
    let userId: number = await account.getAccountManager().getOsAccountLocalId();
    let applicationFlags: number = bundleManager.ApplicationFlag.GET_APPLICATION_INFO_DEFAULT;
    let applicationInfo: bundleManager.ApplicationInfo = await bundleManager.getApplicationInfoSync('com.example.contacttest',
    applicationFlags, userId);
    let tokenId: number = applicationInfo.accessTokenId;
    for (let index = 0; index < list.length; index++) {
      await abilityAccessCtrl.createAtManager().grantUserGrantedPermission(tokenId, list[index], 1);
    }
  } catch (err) {
    console.info(`getPermission error ${JSON.stringify(err)}`);
  }
  console.info('getPermission end');
}

export default function EmptyParamTest() {
    describe('EmptyParamTest', () => {

        beforeAll(async (done: Function) => {
            console.info("beforeAll case");
            await getPermissions();
            done();
        });

        afterEach(async (done: Function) => {
            console.info("afterEach case");
            done();
        });
    })

    /**
     * @tc.name   contactsApi_insert_empty_test_100
     * @tc.number contactsApi_insert_empty_test_100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_insert_empty_test_100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let contactDataError: contact.Contact = {};
        try {
            let context: Context = AppStorage.get('context') as Context;
            let rawContactId = await contact.addContact(context, contactDataError);
            console.info("contactsApi_insert_empty_test_100: rawContactId = " + rawContactId);
            expect(rawContactId === -1).assertTrue();
            done();
        } catch (error) {
            console.info("contactsApi_insert_empty_test_100: raw_contact insert error = " + error);
            expect.assertFail();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_insert_empty_test_200
     * @tc.number contactsApi_insert_empty_test_200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_insert_empty_test_200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let contactDataError: contact.Contact = {};
        try {
            let context: Context = AppStorage.get('context') as Context;
            contact.addContact(context, contactDataError, (error: BusinessError, rawContactId: number) => {
                console.info("contactsApi_insert_empty_test_200: rawContactId = " + rawContactId);
                expect(rawContactId === -1).assertTrue();
                done();
            });
        } catch (error) {
            console.info("contactsApi_insert_empty_test_200: raw_contact insert error = " + error);
            expect.assertFail();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_select_empty_test_300
     * @tc.number contactsApi_select_empty_test_300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_select_empty_test_300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let contactDataError: contact.Contact = {};
        try {
            const options: contact.ContactSelectionOptions = {};
            const contacts: contact.Contact[] = await contact.selectContacts(options);
            console.info("contactsApi_select_empty_test_300: contacts = " + contacts.length);
            expect(contacts.length > 0).assertTrue();
            done();
        } catch (error) {
            console.info("contactsApi_select_empty_test_300: selectContacts error = " + error);
            expect.assertFail();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_select_empty_test_400
     * @tc.number contactsApi_select_empty_test_400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_select_empty_test_400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let contactDataError: contact.Contact = {};
        try {
            const options: contact.ContactSelectionOptions = {};
            contact.selectContacts(options, (err: BusinessError, contacts: contact.Contact[]) => {
                console.info("contactsApi_select_empty_test_400: contacts = " + contacts.length);
                expect(contacts.length > 0).assertTrue();
                done();
            });
        } catch (error) {
            console.info("contactsApi_select_empty_test_400: selectContacts error = " + error);
            expect.assertFail();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_delete_empty_test_500
     * @tc.number contactsApi_delete_empty_test_500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_delete_empty_test_500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('context') as Context;
            const key: string = '';
            await contact.deleteContact(context, key);
            console.info("contactsApi_delete_empty_test_500: delete success");
            expect.assertFail();
            done();
        } catch (error) {
            console.info("contactsApi_delete_empty_test_500: raw_contact delete error = " + error);
            expect.(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_delete_empty_test_600
     * @tc.number contactsApi_delete_empty_test_600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_delete_empty_test_600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('context') as Context;
            const key: string = '';
            contact.deleteContact(context, key, (err: BusinessError) => {
                if (err) {
                    console.info("contactsApi_delete_empty_test_600: delete success");
                    expect.(error.code === 401).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_delete_empty_test_600: delete success");
                    expect.assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info("contactsApi_delete_empty_test_600: raw_contact delete error = " + error);
            expect.(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_delete_empty_test_700
     * @tc.number contactsApi_delete_empty_test_700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_delete_empty_test_700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('context') as Context;
            const key: string = '1';
            await contact.deleteContact(undefined, key);
            console.info("contactsApi_delete_empty_test_700: delete success");
            expect.assertFail();
            done();
        } catch (error) {
            console.info("contactsApi_delete_empty_test_700: raw_contact delete error = " + error);
            expect.(error.code === 401).assertTrue();
            done();
        }
    });

    
    /**
     * @tc.name   contactsApi_delete_empty_test_800
     * @tc.number contactsApi_delete_empty_test_800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_delete_empty_test_800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('context') as Context;
            const key: string = '1';
            contact.deleteContact(undefined, key, (err: BusinessError) => {
                if (err) {
                    console.info("contactsApi_delete_empty_test_800: delete success");
                    expect.(error.code === 401).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_delete_empty_test_600: delete success");
                    expect.assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info("contactsApi_delete_empty_test_800: raw_contact delete error = " + error);
            expect.(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_900
     * @tc.number contactsApi_query_empty_test_900
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('context') as Context;
            const key: string = '1';
            await contact.queryContact(null, key);
            console.info("contactsApi_query_empty_test_900: query success");
            expect.assertFail();
            done();
        } catch (error) {
            console.info(`contactsApi_query_empty_test_900: contact query error = ${error.code}, ${error.message}`);
            expect.(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_1000
     * @tc.number contactsApi_query_empty_test_1000
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('context') as Context;
            const key: string = '1';
            contact.queryContact(null, key, (err: BusinessError) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_1000: contact query error = ${error.code}, ${error.message}`);
                    expect.(error.code === 401).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_query_empty_test_1000: query success");
                    expect.assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info("contactsApi_query_empty_test_1000: contact query error = ${error.code}, ${error.message}`);
            expect.(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_1100
     * @tc.number contactsApi_query_empty_test_1100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('context') as Context;
            await contact.queryContacts(null);
            console.info("contactsApi_query_empty_test_1100: query success");
            expect.assertFail();
            done();
        } catch (error) {
            console.info(`contactsApi_query_empty_test_1100: contact query error = ${error.code}, ${error.message}`);
            expect.(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_1200
     * @tc.number contactsApi_query_empty_test_1200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('context') as Context;
            contact.queryContacts(null, (err: BusinessError) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_1200: contact query error = ${error.code}, ${error.message}`);
                    expect.(error.code === 401).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_query_empty_test_1200: query success");
                    expect.assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info("contactsApi_query_empty_test_1200: contact query error = ${error.code}, ${error.message}`);
            expect.(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_1300
     * @tc.number contactsApi_query_empty_test_1300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('context') as Context;
            let contactAttributes: contact.ContactAttributes = {
                attributes: []
            };
            await contact.queryContacts(null, contactAttributes, null);
            console.info("contactsApi_query_empty_test_1300: query success");
            expect.assertFail();
            done();
        } catch (error) {
            console.info(`contactsApi_query_empty_test_1300: contact query error = ${error.code}, ${error.message}`);
            expect.(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_1400
     * @tc.number contactsApi_query_empty_test_1400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('context') as Context;
            let contactAttributes: contact.ContactAttributes = {
                attributes: []
            };
            contact.queryContacts(null, null, contactAttributes, (err: BusinessError, contacts: contact.Contact[]) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_1400: contact query error = ${error.code}, ${error.message}`);
                    expect.(error.code === 401).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_query_empty_test_1400: query success");
                    expect.assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info("contactsApi_query_empty_test_1400: contact query error = ${error.code}, ${error.message}`);
            expect.(error.code === 401).assertTrue();
            done();
        }
    });


    /**
     * @tc.name   contactsApi_query_empty_test_1500
     * @tc.number contactsApi_query_empty_test_1500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('context') as Context;
            const email: string = '';
            await contact.queryContactByEmail(null, email);
            console.info("contactsApi_query_empty_test_1500: query success");
            expect.assertFail();
            done();
        } catch (error) {
            console.info(`contactsApi_query_empty_test_1500: contact query error = ${error.code}, ${error.message}`);
            expect.(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_1600
     * @tc.number contactsApi_query_empty_test_1600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('context') as Context;
            const email: string = '';
            contact.queryContactByEmail(null, email, (err: BusinessError, contacts: contact.Contact[]) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_1600: contact query error = ${error.code}, ${error.message}`);
                    expect.(error.code === 401).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_query_empty_test_1600: query success: " + contacts.length);
                    expect.assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info("contactsApi_query_empty_test_1600: contact query error = ${error.code}, ${error.message}`);
            expect.(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_1700
     * @tc.number contactsApi_query_empty_test_1700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('context') as Context;
            const phoneNumber: string = '';
            await contact.queryContactsByPhoneNumber(null, phoneNumber);
            console.info("contactsApi_query_empty_test_1700: query success");
            expect.assertFail();
            done();
        } catch (error) {
            console.info(`contactsApi_query_empty_test_1700: contact query error = ${error.code}, ${error.message}`);
            expect.(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_1800
     * @tc.number contactsApi_query_empty_test_1800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('context') as Context;
            const phoneNumber: string = '';
            contact.queryContactsByPhoneNumber(null, phoneNumber, (err: BusinessError, contacts: contact.Contact[]) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_1800: contact query error = ${error.code}, ${error.message}`);
                    expect.(error.code === 401).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_query_empty_test_1800: query success: " + contacts.length);
                    expect.assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info("contactsApi_query_empty_test_1800: contact query error = ${error.code}, ${error.message}`);
            expect.(error.code === 401).assertTrue();
            done();
        }
    });


    /**
     * @tc.name   contactsApi_query_empty_test_2000
     * @tc.number contactsApi_query_empty_test_2000
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            contact.queryGroups(null, (err: BusinessError, groups: contact.Group[]) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_2000: contact query error = ${error.code}, ${error.message}`);
                    expect.(error.code === 401).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_query_empty_test_2000: query success: " + groups.length);
                    expect.assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info("contactsApi_query_empty_test_2000: group query error = ${error.code}, ${error.message}`);
            expect.(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_2100
     * @tc.number contactsApi_query_empty_test_2100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            contact.queryGroups(null, null, (err: BusinessError, groups: contact.Group[]) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_2100: contact query error = ${error.code}, ${error.message}`);
                    expect.(error.code === 401).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_query_empty_test_2100: query success: " + groups.length);
                    expect.assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info("contactsApi_query_empty_test_2100: group query error = ${error.code}, ${error.message}`);
            expect.(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_2200
     * @tc.number contactsApi_query_empty_test_2200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            const holders = await contact.queryHolders(null);
            console.info("contactsApi_query_empty_test_2200: query success: " + groups.length);
            expect.assertFail();
            done();
        } catch (error) {
            console.info("contactsApi_query_empty_test_2200: holders query error = ${error.code}, ${error.message}`);
            expect.(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_2300
     * @tc.number contactsApi_query_empty_test_2300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            contact.queryHolders(null, (err: BusinessError, holders: contact.Holder[]) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_2300: contact query error = ${error.code}, ${error.message}`);
                    expect.(error.code === 401).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_query_empty_test_2300: query success: " + groups.length);
                    expect.assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info("contactsApi_query_empty_test_2300: holders query error = ${error.code}, ${error.message}`);
            expect.(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_2400
     * @tc.number contactsApi_query_empty_test_2400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            const keys = await contact.queryKey(null, null);
            console.info("contactsApi_query_empty_test_2400: query success");
            expect.assertFail();
            done();
        } catch (error) {
            console.info("contactsApi_query_empty_test_2400: query error = ${error.code}, ${error.message}`);
            expect.(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_2500
     * @tc.number contactsApi_query_empty_test_2500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            contact.queryKey(null, null, (err: BusinessError, key:string) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_2500: query error = ${error.code}, ${error.message}`);
                    expect.(error.code === 401).assertTrue();
                    done();
                } else {
                    console.error("contactsApi_query_empty_test_2500: query success: " + key);
                    expect.assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info("contactsApi_query_empty_test_2500: query error = ${error.code}, ${error.message}`);
            expect.(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_2600
     * @tc.number contactsApi_query_empty_test_2600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            contact.queryKey(null, null, null, (err: BusinessError, key:string) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_2600: query error = ${error.code}, ${error.message}`);
                    expect.(error.code === 401).assertTrue();
                    done();
                } else {
                    console.error("contactsApi_query_empty_test_2600: query success: " + key);
                    expect.assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info("contactsApi_query_empty_test_2600: query error = ${error.code}, ${error.message}`);
            expect.(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_2800
     * @tc.number contactsApi_query_empty_test_2800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            contact.queryMyCard(null, (err: BusinessError, card: contact.Contact) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_2800: contact query error = ${error.code}, ${error.message}`);
                    expect.(error.code === 401).assertTrue();
                    done();
                } else {
                    console.error("contactsApi_query_empty_test_2800: query success");
                    expect.assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info("contactsApi_query_empty_test_2800: query error = ${error.code}, ${error.message}`);
            expect.(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_2900
     * @tc.number contactsApi_query_empty_test_2900
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            contact.queryMyCard(null, null, (err: BusinessError, card: contact.Contact) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_2900: contact query error = ${error.code}, ${error.message}`);
                    expect.(error.code === 401).assertTrue();
                    done();
                } else {
                    console.error("contactsApi_query_empty_test_2900: query success");
                    expect.assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info("contactsApi_query_empty_test_2900: query error = ${error.code}, ${error.message}`);
            expect.(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_update_empty_test_3000
     * @tc.number contactsApi_update_empty_test_3000
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_update_empty_test_3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let contactDataError: contact.Contact = {};
            const card = await contact.updateContact(null, contactDataError);
            console.info("contactsApi_update_empty_test_3000: update success");
            expect.assertFail();
            done();
        } catch (error) {
            console.info("contactsApi_update_empty_test_3000: update error = ${error.code}, ${error.message}`);
            expect.(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_update_empty_test_3100
     * @tc.number contactsApi_update_empty_test_3100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_update_empty_test_3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let contactDataError: contact.Contact = {};
            contact.updateContact(null, contactDataError, (err: BusinessError, card: contact.Contact) => {
                if (err) {
                    console.error(`contactsApi_update_empty_test_3100: contact update error = ${error.code}, ${error.message}`);
                    expect.(error.code === 401).assertTrue();
                    done();
                } else {
                    console.error("contactsApi_update_empty_test_3100: query success");
                    expect.assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info("contactsApi_update_empty_test_3100: update error = ${error.code}, ${error.message}`);
            expect.(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_update_empty_test_3200
     * @tc.number contactsApi_update_empty_test_3200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_update_empty_test_3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let contactDataError: contact.Contact = {};
            contact.updateContact(null, contactDataError, null, (err: BusinessError, card: contact.Contact) => {
                if (err) {
                    console.error(`contactsApi_update_empty_test_3200: contact update error = ${error.code}, ${error.message}`);
                    expect.(error.code === 401).assertTrue();
                    done();
                } else {
                    console.error("contactsApi_update_empty_test_3200: query success");
                    expect.assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info("contactsApi_update_empty_test_3200: update error = ${error.code}, ${error.message}`);
            expect.(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_is_local_contact_empty_test_3300
     * @tc.number contactsApi_is_local_contact_empty_test_3300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_is_local_contact_empty_test_3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            const isLocalContact = await contact.isLocalContact(null, null);
            console.info("contactsApi_is_local_contact_empty_test_3300: isLocalContact success");
            expect.assertFail();
            done();
        } catch (error) {
            console.info("contactsApi_is_local_contact_empty_test_3300: isLocalContact error = ${error.code}, ${error.message}`);
            expect.(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_is_local_contact_empty_test_3400
     * @tc.number contactsApi_is_local_contact_empty_test_3400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_is_local_contact_empty_test_3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            contact.isLocalContact(null, null, (err: BusinessError, isLocalContact: boolean) => {
                if (err) {
                    console.error(`contactsApi_is_local_contact_empty_test_3400: isLocalContacte error = ${error.code}, ${error.message}`);
                    expect.(error.code === 401).assertTrue();
                    done();
                } else {
                    console.error("contactsApi_is_local_contact_empty_test_3400: query success");
                    expect.assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info("contactsApi_is_local_contact_empty_test_3400: isLocalContact error = ${error.code}, ${error.message}`);
            expect.(error.code === 401).assertTrue();
            done();
        }
    });

}