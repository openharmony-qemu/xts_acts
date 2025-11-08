/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import tag from '@ohos.nfc.tag';
import rpc from '@ohos.rpc';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level,TestType,Size} from '../../../hypium/index';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag1: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let remoteTagService: rpc.RemoteObject = new rpc.RemoteObject("rpcTestAbility");

let rawData: Array<int> = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];

let ndefRecordInfo: tag.NdefRecord = {
  "tnf": 1,
  "rtdType": [0x01, 0x02],
  "id": [0x01],
  "payload": [1],
}
let ndefTagInfo: tag.TagInfo = {
  "uid": [0x01, 0x02, 0x03, 0x04],
  "technology": [1, 6],
  "extrasData": [
    {
      "NdefMsg": "D4010354787473", "NdefForumType": 1, "NdefTagLength":255, "NdefTagMode": 1,
    }
  ],
  "tagRfDiscId": 1,
  "remoteTagService": remoteTagService,
};

let NdefFormatableTag: tag.TagInfo = {
  "uid": [0x01, 0x02, 0x03, 0x04],
  "technology": [1, 7],
  "extrasData": [
    {
      "Sak": 0x08, "Atqa": "B000",
    },
    {

    },
  ],
  "tagRfDiscId": 1,
  "remoteTagService": remoteTagService,
};

let ndefTag:tag.NdefTag;
let ndefFormatable:tag.NdefFormatableTag;

export default function nfcNDEFTagTest() {
  describe("nfcNDEFTagTest", (): void=> {
    hilog.info(domain, tag1, '%{public}s', 'describe start');
    beforeAll(() => {
      try {
        ndefTag = tag.getNdef(ndefTagInfo);
      } catch (error: BusinessError) {
        if (error.code == 801) {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0700 error is ' + error.code + " - " + error);
          expect(801).assertEqual(error.code);
        } else {
          hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0700 failed ');
          expect().assertFail();
        }
      }
      try {
        ndefFormatable = tag.getNdefFormatable(NdefFormatableTag);
      } catch (error: BusinessError) {
        if (error.code == 801) {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] beforeAll error is ' + error.code + " - " + error);
          expect(801).assertEqual(error.code)
        } else {
          hilog.info(domain,tag1,'%{public}s','[NFC_test] beforeAll failed ');
          expect().assertFail();
        }
      }
      hilog.info(domain, tag1, '%{public}s','beforeAll called');
    })
    beforeEach(() => {
      hilog.info(domain, tag1, '%{public}s','beforeEach called');
    })
    afterEach(() => {
      hilog.info(domain, tag1, '%{public}s','afterEach called');
    })
    afterAll(() => {
      hilog.info(domain,tag1, '%{public}s','afterAll called');
    })
    hilog.info(domain, tag1, '%{public}s', 'describe start11');

    /**
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_1100
     * @tc.name getNdefMessage
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_1100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (ndefTag != null && ndefTag != undefined) {
        try {
          let getMessage: tag.NdefMessage = ndefTag.getNdefMessage();
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1100 NdefMessage: ' + getMessage);
          expect(getMessage != null).assertTrue();
        } catch (error: BusinessError) {
          hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1100 ndefMessage error is ' + error + " - " + error.code);
          expect().assertFail();
        }
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_1200
     * @tc.name isNdefWritable
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_1200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (ndefTag != null && ndefTag != undefined) {
        let data: boolean = ndefTag.isNdefWritable();
        if (data == true) {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1200 data: ' + data);
          expect(data).assertTrue();
        } else {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1200 data: ' + data);
          expect(data).assertFalse();
        }
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_1300
     * @tc.name readNdef
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_1300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
        if (ndefTag != null && ndefTag != undefined) {
          try {
            await ndefTag.readNdef().then((data) => {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1300 readNdef:');
            });
          } catch (error: BusinessError) {
            if (error.code == 201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1300 isExtendedApduSupported error is ' + error.code + " - " + error);
              expect(201).assertEqual(error.code);
            } else if (error.code == 401) {
              console.info("[NFC_test]ndef7 readNdef1 err: " + error + error.code);
              expect(true).assertTrue();
            } else if (error.code == 3100201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1300 isExtendedApduSupported error is ' + error.code + " - " + error);
              expect(3100201).assertEqual(error.code);
            } else if (error.code == 3100204) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1300 isExtendedApduSupported error is ' + error.code + " - " + error);
              expect(3100204).assertEqual(error.code);
            } else {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1300 isExtendedApduSupported error is ' + error.code + " - " + error);
              expect().assertFail();
            }
          }
        } else {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
          expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_1400
     * @tc.name readNdef
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_1400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
        if (ndefTag != null && ndefTag != undefined) {
          let AsyncCallback:(error: BusinessError<void> | null, data: tag.NdefMessage | undefined) => void = (
            error:BusinessError<void> | null, data: tag.NdefMessage | undefined) => {
            hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1400 readNdef finish ');
          }
          try {
            ndefTag.readNdef(AsyncCallback);
          } catch (error: BusinessError) {
            if (error.code == 201) {
              hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1400 isExtendedApduSupported error is ' + error.code + " - " + error);
              expect(201).assertEqual(error.code);
            } else if (error.code == 401) {
              hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1400 isExtendedApduSupported error is ' + error.code + " - " + error);
              expect(401).assertEqual(error.code);
            } else if (error.code == 3100201) {
              hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1400 isExtendedApduSupported error is ' + error.code + " - " + error);
              expect(3100201).assertEqual(error.code);
            } else if (error.code == 3100204) {
              hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1400 isExtendedApduSupported error is ' + error.code + " - " + error);
              expect(3100204).assertEqual(error.code);
            } else {
              hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1400 isExtendedApduSupported error is ' + error.code + " - " + error);
              expect().assertFail();
            }
          }
        } else {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
            expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_1700
     * @tc.name canSetReadOnly
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_1700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (ndefTag != null && ndefTag != undefined) {
        try {
          let canSetReadOnly: boolean = ndefTag.canSetReadOnly();
          if (canSetReadOnly == true) {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1700 canSetReadOnly is ' + canSetReadOnly);
            expect(canSetReadOnly).assertTrue();
          } else {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1700 canSetReadOnly is ' + canSetReadOnly);
            expect(canSetReadOnly).assertFalse();
          }
        } catch (error: BusinessError) {
          if (error.code == 201) {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1700 canSetReadOnly error is ' + error + " - " + error.code);
            expect(201).assertEqual(error.code);
          } else if (error.code == 3100201) {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1700 canSetReadOnly error is ' + error + " - " + error.code);
            expect(3100201).assertEqual(error.code);
          } else {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1700 canSetReadOnly fail is ' + error + " - " + error.code);
            expect().assertFail();
          }
          done();
        }
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_1800
     * @tc.name setReadOnly
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_1800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
        if (ndefTag != null && ndefTag != undefined) {
          try {
            await ndefTag.setReadOnly().then((data) => {
              hilog.info(domain, tag1,'{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1800 :');
            });
          } catch (error: BusinessError) {
            if (error.code == 201) {
              hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1800  error is ' + error + " - " + error.code);
              expect(201).assertEqual(error.code);
            } else if (error.code == 401) {
              hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1800  error is ' + error + " - " + error.code);
              expect(401).assertEqual(error.code);
            } else if (error.code == 3100201) {
              hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1800 error is ' + error + " - " + error.code);
              expect(3100201).assertEqual(error.code);
            } else if (error.code == 3100204) {
              hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1800 error is ' + error + " - " + error.code);
              expect(3100204).assertEqual(error.code);
            } else {
              hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1800 fail is ' + error + " - " + error.code);
              expect().assertFail();
            }
            done();
          }
        } else {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
          expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_1900
     * @tc.name setReadOnly
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_1900', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
        if (ndefTag != null && ndefTag != undefined) {
          let AsyncCallback:(error: BusinessError<void> | null, data: undefined) => void = (error: BusinessError<void> | null, data: undefined) => {
            hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1900  ');
          }
          try {
            ndefTag.setReadOnly(AsyncCallback);
          }catch (error: BusinessError) {
            if (error.code == 201) {
              hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1900  error is ' + error + " - " + error.code);
              expect(201).assertEqual(error.code);
            } else if (error.code == 401) {
              hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1900  error is ' + error + " - " + error.code);
              expect(401).assertEqual(error.code);
            } else if (error.code == 3100201) {
              hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1900 error is ' + error + " - " + error.code);
              expect(3100201).assertEqual(error.code);
            } else if (error.code == 3100204) {
              hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1900 error is ' + error + " - " + error.code);
              expect(3100204).assertEqual(error.code);
            } else {
              hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1900  fail is ' + error + " - " + error.code);
              expect().assertFail();
            }
          }
        } else {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
          expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_2000
     * @tc.name getNdefTagTypeString
     * @tc.desc Converts the Nfc forum type to the byte array defined in the Nfc forum.
     * @tc.size since 9
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_2000', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (ndefTag != null && ndefTag != undefined) {
        let ndefTypeString: string = ndefTag.getNdefTagTypeString(tag.NfcForumType.NFC_FORUM_TYPE_1);
        hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_2000 ndefTypeString is :' + ndefTypeString);
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    console.info("*************[nfc_test] start nfc js unit test end*************");
  })
}