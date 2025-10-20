/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../hypium/index'
import radio from '@ohos.telephony.radio';
import { BusinessError } from '@ohos.base';
import sim from '@ohos.telephony.sim';
import abilityAccessCtrl, { PermissionRequestResult, Permissions } from '@ohos.abilityAccessCtrl';
import hilog from '@ohos.hilog';

const SLOT_0: int = 0;
const SLOT_1: int = 1;
const SLOT_2: int = -1;
const SLOT_3: int = 1000000;

let tag: string = 'TelephonyRadioPublicStatic';
let domain: Int = 0x0000;

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

export default function telephonyRadioPublicTest() {

  describe('telephonyRadioPublicTest', () => {

    /*
     * @tc.number: SUB_Telephony_Radio_GetPrimarySlotId_0300
     * @tc.name  : testTelephonyRadioGetPrimarySlotId0300
     * @tc.desc  : Obtain the index number of the slot where the main card is located. Use callback for asynchronous callback.
     * @tc.size  : SmallTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioGetPrimarySlotId0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyRadioGetPrimarySlotId0300';
      console.info(`${caseName} test start`);
      radio.getPrimarySlotId((err: BusinessError<void> | null, data:int | undefined): void => {
        if (err?.code !== 0) {
          console.info(`${caseName} failed, callback: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        } else {
          console.info(`${caseName} success, callback: data->${JSON.stringify(data)}`);
          ExpectTrue(true);
          console.info(`${caseName} test end`);
          done();
        }
      });
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetPrimarySlotId_0600
     * @tc.name  : testTelephonyRadioGetPrimarySlotId0600
     * @tc.desc  : Obtain the index number of the slot where the main card is located. Use Promise asynchronous callback.
     * @tc.size  : SmallTest
     * @tc.type  : Function
     * @tc.level : Level 3
     */
    it('testTelephonyRadioGetPrimarySlotId0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyRadioGetPrimarySlotId0600';
      console.info(`${caseName} test start`);
      radio.getPrimarySlotId().then((data: int | undefined) => {
        console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
        ExpectTrue(true);
        done()
      }).catch((err: BusinessError): void => {
        console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      });
    });

    /*
     * @tc.number: SUB_Telephony_Radio_IsNRSupported_0100
     * @tc.name  : testTelephonyRadioIsNRSupported0100
     * @tc.desc  : Determine if the current device supports 5G (NR).
     * @tc.size  : SmallTest
     * @tc.type  : Function
     * @tc.level : Level 3
     */
    it('testTelephonyRadioIsNRSupported0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyRadioIsNRSupported0100';
      console.info(`${caseName} test start`);
      try {
        let result: boolean = radio.isNRSupported();
        console.info(`${caseName} success: " + result`);
        ExpectTrue(true);
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} failed: " + err`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_IsRadioOn_0500
     * @tc.name  : testTelephonyRadioIsRadioOn_static_0500
     * @tc.desc  : Check if the main card's Radio is turned on. Use callback for asynchronous callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it("testTelephonyRadioIsRadioOn_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyRadioIsRadioOn_static_0500';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          radio.isRadioOn(SLOT_2, (err: BusinessError<void> | null, data: boolean | undefined) => {
            if (err?.code !== 0) {
              hilog.error(domain, tag, `${caseName} failed, callback: err->${JSON.stringify(err)}`);
              expect(true).assertEqual(err?.code === 8300001);
              hilog.error(domain, tag, `${caseName} test end`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} success, callback: data->${JSON.stringify(data)}`);
              expect().assertFail();
              hilog.info(domain, tag, `${caseName} test end`);
              done();
            }
          });
        } catch (error) {
          let err = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed, catch: err->${JSON.stringify(err)}`);
          expect().assertFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /*
     * @tc.number: SUB_Telephony_Radio_IsRadioOn_0600
     * @tc.name  : testTelephonyRadioIsRadioOn_static_0600
     * @tc.desc  : Check if the main card's Radio is turned on. Use callback for asynchronous callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it("testTelephonyRadioIsRadioOn_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyRadioIsRadioOn_static_0600';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          radio.isRadioOn(SLOT_3, (err: BusinessError<void> | null, data: boolean | undefined) => {
            if (err?.code !== 0) {
              hilog.error(domain, tag, `${caseName} failed, callback: err->${JSON.stringify(err)}`);
              expect(true).assertEqual(err?.code === 8300001);
              hilog.error(domain, tag, `${caseName} test end`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} success, callback: data->${JSON.stringify(data)}`);
              expect().assertFail();
              hilog.info(domain, tag, `${caseName} test end`);
              done();
            }
          });
        } catch (error) {
          let err = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed, catch: err->${JSON.stringify(err)}`);
          expect().assertFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /*
     * @tc.number: SUB_Telephony_Radio_IsRadioOn_1100
     * @tc.name  : testTelephonyRadioIsRadioOn_static_1100
     * @tc.desc  : Check if the Radio is turned on. Use Promise asynchronous callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 3
     */
    it("testTelephonyRadioIsRadioOn_static_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyRadioIsRadioOn_static_1100';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          radio.isRadioOn(SLOT_2).then((data: boolean) => {
            hilog.info(domain, tag, `${caseName} success, promise: data->${JSON.stringify(data)}`);
            expect().assertFail();
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, `${caseName} failed, promise: err->${JSON.stringify(err)}`);
            expect(true).assertEqual(err?.code === 8300001);
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          });
        } catch (error) {
          let err = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed, catch: err->${JSON.stringify(err)}`);
          expect().assertFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /*
     * @tc.number: SUB_Telephony_Radio_IsRadioOn_1200
     * @tc.name  : testTelephonyRadioIsRadioOn_static_1200
     * @tc.desc  : Check if the Radio is turned on. Use Promise asynchronous callback.
     * @tc.size  : SmallTest
     * @tc.type  : Function
     * @tc.level : Level 3
     */
    it("testTelephonyRadioIsRadioOn_static_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyRadioIsRadioOn_static_1200';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          radio.isRadioOn(SLOT_3).then((data: boolean) => {
            hilog.info(domain, tag, `${caseName} success, promise: data->${JSON.stringify(data)}`);
            expect().assertFail();
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, `${caseName} failed, promise: err->${JSON.stringify(err)}`);
            expect(true).assertEqual(err?.code === 8300001);
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          });
        } catch (error) {
          let err = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed, catch: err->${JSON.stringify(err)}`);
          expect().assertFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /*
     * @tc.number: SUB_Telephony_Radio_GetISOCountryCodeForNetwork_Async_0500
     * @tc.name  : testTelephonyRadioGetISOCountryCodeForNetworkAsync_static_0500
     * @tc.desc  : slotId parameter input is -1
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it("testTelephonyRadioGetISOCountryCodeForNetworkAsync_static_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyRadioGetISOCountryCodeForNetworkAsync_static_0500';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          radio.getISOCountryCodeForNetwork(SLOT_2, (err: BusinessError<void> | null, data: string | undefined) => {
            if (err?.code !== 0) {
              hilog.error(domain, tag, `${caseName} success, err->${JSON.stringify(err)}`);
              expect(true).assertEqual(err?.code === 8300001);
              hilog.error(domain, tag, `${caseName} test end`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} failed, data->${JSON.stringify(data)}`);
              expect().assertFail();
              hilog.info(domain, tag, `${caseName} test end`);
              done();
            }
          });
        } catch (error) {
          let err = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed, catch: err->${JSON.stringify(err)}`);
          expect().assertFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /*
     * @tc.number: SUB_Telephony_Radio_GetISOCountryCodeForNetwork_Async_0600
     * @tc.name  : testTelephonyRadioGetISOCountryCodeForNetworkAsync_static_0600
     * @tc.desc  : slotId parameter input is 1000000
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it("testTelephonyRadioGetISOCountryCodeForNetworkAsync_static_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyRadioGetISOCountryCodeForNetworkAsync_static_0600';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          radio.getISOCountryCodeForNetwork(SLOT_3, (err: BusinessError<void> | null, data: string | undefined) => {
            if (err?.code !== 0) {
              hilog.error(domain, tag, `${caseName} success, err->${JSON.stringify(err)}`);
              expect(true).assertEqual(err?.code === 8300001);
              hilog.error(domain, tag, `${caseName} test end`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} failed, data->${JSON.stringify(data)}`);
              expect().assertFail();
              hilog.info(domain, tag, `${caseName} test end`);
              done();
            }
          });
        } catch (error) {
          let err = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed, catch: err->${JSON.stringify(err)}`);
          expect().assertFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /*
     * @tc.number: SUB_Telephony_Radio_GetISOCountryCodeForNetwork_Promise_0500
     * @tc.name  : testTelephonyRadioGetISOCountryCodeForNetworkPromise_static_0500
     * @tc.desc  : slotId parameter input is 0
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it("testTelephonyRadioGetISOCountryCodeForNetworkPromise_static_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyRadioGetISOCountryCodeForNetworkPromise_static_0500';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          radio.getISOCountryCodeForNetwork(SLOT_2).then((data: string) => {
            hilog.info(domain, tag, `${caseName} failed, data->${JSON.stringify(data)}`);
            expect().assertFail();
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.error(domain, tag, `${caseName} success, err->${JSON.stringify(err)}`);
            expect(true).assertEqual(err?.code === 8300001);
            hilog.error(domain, tag, `${caseName} test end`);
            done();
          });
        } catch (error) {
          let err = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed, catch: err->${JSON.stringify(err)}`);
          expect().assertFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /*
     * @tc.number: SUB_Telephony_Radio_GetISOCountryCodeForNetwork_Promise_0600
     * @tc.name  : testTelephonyRadioGetISOCountryCodeForNetworkPromise_static_0600
     * @tc.desc  : slotId parameter input is 1000000
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it("testTelephonyRadioGetISOCountryCodeForNetworkPromise_static_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyRadioGetISOCountryCodeForNetworkPromise_static_0600';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          radio.getISOCountryCodeForNetwork(SLOT_3).then((data: string) => {
            hilog.info(domain, tag, `${caseName} failed, data->${JSON.stringify(data)}`);
            expect().assertFail();
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.error(domain, tag, `${caseName} success, err->${JSON.stringify(err)}`);
            expect(true).assertEqual(err?.code === 8300001);
            hilog.error(domain, tag, `${caseName} test end`);
            done();
          });
        } catch (error) {
          let err = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed, catch: err->${JSON.stringify(err)}`);
          expect().assertFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /*
     * @tc.number: SUB_Telephony_Radio_GetRadioTech_0300
     * @tc.name  : testTelephonyRadioGetRadioTech_static_0300
     * @tc.desc  : Obtain the wireless access technologies for the CS and PS domains currently accessed. Using callback for asynchronous callback
     * @tc.size  : SmallTest
     * @tc.type  : Function
     * @tc.level : Level 3
     */
    it("testTelephonyRadioGetRadioTech_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyRadioGetRadioTech_static_0300';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          radio.getRadioTech(SLOT_2, (err: BusinessError<void> | null, data: radio.NetworkRadioTech | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, `${caseName} failed, callback: err->${JSON.stringify(err)}`)
              expect(true).assertEqual(err?.code === 8300001);
              hilog.info(domain, tag, `${caseName} test end`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} success, callback: data->${JSON.stringify(data)}`);
              expect().assertFail();
              hilog.info(domain, tag, `${caseName} test end`);
              done();
            }
          });
        } catch (error) {
          let err = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed, catch: err->${JSON.stringify(err)}`);
          expect().assertFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /*
     * @tc.number: SUB_Telephony_Radio_GetRadioTech_0400
     * @tc.name  : testTelephonyRadioGetRadioTech_static_0400
     * @tc.desc  : Obtain the wireless access technologies for the CS and PS domains currently accessed. Using callback for asynchronous callback
     * @tc.size  : SmallTest
     * @tc.type  : Function
     * @tc.level : Level 3
     */
    it("testTelephonyRadioGetRadioTech_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyRadioGetRadioTech_static_0400';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          radio.getRadioTech(SLOT_3, (err: BusinessError<void> | null, data: radio.NetworkRadioTech | undefined) => {
            if (err?.code !== 0) {
              hilog.error(domain, tag, `${caseName} failed, callback: err->${JSON.stringify(err)}`);
              expect(true).assertEqual(err?.code === 8300001);
              hilog.error(domain, tag, `${caseName} test end`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} success, callback: data->${JSON.stringify(data)}`);
              expect().assertFail();
              hilog.info(domain, tag, `${caseName} test end`);
              done();
            }
          });
        } catch (error) {
          let err = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed, catch: err->${JSON.stringify(err)}`);
          expect().assertFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /*
     * @tc.number: SUB_Telephony_Radio_GetRadioTech_0900
     * @tc.name  : testTelephonyRadioGetRadioTech_static_0900
     * @tc.desc  : Obtain the wireless access technologies for the CS and PS domains currently accessed. Use Promise asynchronous callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it("testTelephonyRadioGetRadioTech_static_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyRadioGetRadioTech_static_0900';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let data = await radio.getRadioTech(SLOT_2);
          hilog.info(domain, tag, `${caseName} success, Promise: data->${JSON.stringify(data)}`);
          expect().assertFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        } catch (error) {
          let err = error as BusinessError;
          hilog.error(domain, tag, `${caseName} failed, Promise: err->${err}`);
          expect(true).assertEqual(err?.code === 8300001);
          hilog.error(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /*
     * @tc.number: SUB_Telephony_Radio_GetRadioTech_1000
     * @tc.name  : testTelephonyRadioGetRadioTech_static_1000
     * @tc.desc  : Obtain the wireless access technologies for the CS and PS domains currently accessed. Use Promise asynchronous callback.
     * @tc.size  : SmallTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it("testTelephonyRadioGetRadioTech_static_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyRadioGetRadioTech_static_1000';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let data = await radio.getRadioTech(SLOT_3);
          hilog.info(domain, tag, `${caseName} success, Promise: data->${JSON.stringify(data)}`);
          expect().assertFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        } catch (error) {
          let err = error as BusinessError;
          hilog.error(domain, tag, `${caseName} failed, Promise: err->${err}`);
          expect(true).assertEqual(err?.code === 8300001);
          hilog.error(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /*
     * @tc.number: SUB_Telephony_Radio_GetNetworkSelectionMode_Async_0500
     * @tc.name  : testTelephonyRadioGetNetworkSelectionModeAsync_static_0500
     * @tc.desc  : slotId parameter input is -1
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioGetNetworkSelectionModeAsync_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyRadioGetNetworkSelectionModeAsync_static_0500';
      console.info(`${caseName} test start`);
      try {
        radio.getNetworkSelectionMode(SLOT_2,
          (err: BusinessError<void> | null, data: radio.NetworkSelectionMode | undefined) => {
            if (err?.code !== 0) {
              console.info(`${caseName} success, err->${JSON.stringify(err)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end`);
              done();
            } else {
              console.info(`${caseName} failed, data is: `+ data);
              ExpectFail();
              console.info(`${caseName} test end`);
              done();
            }
          });
      } catch (error) {
        let err = error as BusinessError;
        hilog.error(domain, tag, `${caseName} failed, Callback: err->${err}`);
        expect().assertFail();
        hilog.error(domain, tag, `${caseName} test end`);
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetNetworkSelectionMode_Async_0600
     * @tc.name  : testTelephonyRadioGetNetworkSelectionModeAsync_static_0600
     * @tc.desc  : slotId parameter input is 1000000
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioGetNetworkSelectionModeAsync_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyRadioGetNetworkSelectionModeAsync_static_0600';
      hilog.info(domain, tag,`${caseName} test start`);
      try {
        radio.getNetworkSelectionMode(SLOT_3,
          (err: BusinessError<void> | null, data: radio.NetworkSelectionMode | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, `${caseName} success, err->${JSON.stringify(err)}`);
              ExpectTrue(true);
              hilog.info(domain, tag, `${caseName} test end`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} failed, data-> ` + data);
              ExpectFail();
              hilog.info(domain, tag, `${caseName} test end`);
              done();
            }
          });
      } catch (error) {
        let err = error as BusinessError;
        hilog.info(domain, tag, `${caseName} failed, Callback: err->${err}`);
        expect().assertFail();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetNetworkSelectionMode_Promise_0500
     * @tc.name  : testTelephonyRadioGetNetworkSelectionModePromise_static_0500
     * @tc.desc  : slotId parameter input is -1
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioGetNetworkSelectionModePromise_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> =>  {
      let caseName: string = 'testTelephonyRadioGetNetworkSelectionModePromise_static_0500';
      hilog.info(domain, tag,`${caseName} test start`);
      try {
        radio.getNetworkSelectionMode(SLOT_2).then((data: radio.NetworkSelectionMode) => {
          hilog.info(domain, tag, `${caseName} failed, data-> ` + data);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, `${caseName} success, err->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 8300001);
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        });
      } catch (error) {
        let err = error as BusinessError;
        hilog.info(domain, tag, `${caseName} failed, Promise: err->${err}`);
        expect().assertFail();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_GetNetworkSelectionMode_Promise_0600
     * @tc.name  : testTelephonyRadioGetNetworkSelectionModePromise_static_0600
     * @tc.desc  : slotId parameter input is 1000000
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioGetNetworkSelectionModePromise_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> =>  {
      let caseName: string = 'testTelephonyRadioGetNetworkSelectionModePromise_static_0600';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        radio.getNetworkSelectionMode(SLOT_3).then((data: radio.NetworkSelectionMode) => {
          hilog.info(domain, tag, `${caseName} failed, data->` + data);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, `${caseName} success, err->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 8300001);
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        });
      } catch (error) {
        let err = error as BusinessError;
        hilog.info(domain, tag, `${caseName} failed, Promise: err->${err}`);
        expect().assertFail();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_IsNRSupported_0200
     * @tc.name  : testTelephonyRadioIsNRSupported_static_0200
     * @tc.desc  : Determine if the current device supports 5G (NR).
     * @tc.size  : SmallTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioIsNRSupported_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyRadioIsNRSupported_static_0200';
      hilog.info(domain, tag,`${caseName} test start`);
      try {
        let result: boolean = radio.isNRSupported(SLOT_0);
        hilog.info(domain, tag,`${caseName} success: ` + result);
        ExpectTrue(true);
        hilog.info(domain, tag,`${caseName} test end`);
        done();
      } catch (error) {
        let err = error as BusinessError;
        hilog.info(domain, tag,`${caseName} failed: " + err`);
        ExpectFail();
        hilog.info(domain, tag,`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number: SUB_Telephony_Radio_IsNRSupported_0300
     * @tc.name  : testTelephonyRadioIsNRSupported_static_0300
     * @tc.desc  : Determine if the current device supports 5G (NR).
     * @tc.size  : SmallTest
     * @tc.type  : Function
     * @tc.level : Level 1
     */
    it('testTelephonyRadioIsNRSupported_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyRadioIsNRSupported_static_0300';
      hilog.info(domain, tag,`${caseName} test start`);
      try {
        let result: boolean = radio.isNRSupported(SLOT_1);
        hilog.info(domain, tag,`${caseName} success: ` + result);
        ExpectTrue(true);
        hilog.info(domain, tag,`${caseName} test end`);
        done();
      } catch (error) {
        let err = error as BusinessError;
        hilog.info(domain, tag,`${caseName} failed: " + err`);
        ExpectFail();
        hilog.info(domain, tag,`${caseName} test end`);
        done();
      }
    });
  });
}