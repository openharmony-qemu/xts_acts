'use static';
/*
 *  Copyright (c) 2026 Huawei Device Co., Ltd.
 *  Licensed under the Apache License, Version 2.0 (the "License")
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";
import connection from '@ohos.net.connection';
import hilog from '@ohos.hilog';

let domain: int = 0x0000;
let tag: string = 'ConnectionUnicodeTestTag';

const SIMPLIFIED_CHINESE_DOMAIN = "www.中国你好.com"
const SIMPLIFIED_CHINESE_ASCII_DOMAIN = "www.xn--fiq02ab1ogvc.com"
const TRADITIONAL_CHINESE_DOMAIN = "www.台灣早安.com"
const TRADITIONAL_CHINESE_ASCII_DOMAIN = "www.xn--kprs0pw9ir0k.com"
const PURE_ASCII_DOMAIN = "www.example.com"

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}
const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}

export default function ConnectionUnicodeTest(): void {
  describe('ConnectionUnicodeTest', () => {
    /**
     * @tc.name    testConnectionGetDnsUnicode_static_0100
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_0100
     * @tc.desc    Test normal parameters, single parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_0100';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsUnicode(SIMPLIFIED_CHINESE_ASCII_DOMAIN);
        expect(result).assertEqual(SIMPLIFIED_CHINESE_DOMAIN);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_0200
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_0200
     * @tc.desc    Test normal parameters, single parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_0200';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsUnicode(TRADITIONAL_CHINESE_ASCII_DOMAIN);
        expect(result).assertEqual(TRADITIONAL_CHINESE_DOMAIN);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_0300
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_0300
     * @tc.desc    Test pure ASCII domain name, result should remain unchanged.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_0300';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsUnicode(PURE_ASCII_DOMAIN);
        expect(result).assertEqual(PURE_ASCII_DOMAIN);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_0400
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_0400
     * @tc.desc    Test "" parameters, single parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_0400';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsUnicode("");
        expect(result).assertEqual("");
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_0500
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_0500
     * @tc.desc    Test change parameters, single parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_0500';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        let hostStr = SIMPLIFIED_CHINESE_ASCII_DOMAIN;
        hostStr = TRADITIONAL_CHINESE_ASCII_DOMAIN;
        const result = connection.getDnsUnicode(hostStr);
        expect(result).assertEqual(TRADITIONAL_CHINESE_DOMAIN);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_0600
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_0600
     * @tc.desc    Test change parameters, single parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_0600';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        let hostStr = TRADITIONAL_CHINESE_ASCII_DOMAIN;
        hostStr = SIMPLIFIED_CHINESE_ASCII_DOMAIN;
        const result = connection.getDnsUnicode(hostStr);
        expect(result).assertEqual(SIMPLIFIED_CHINESE_DOMAIN);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_0700
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_0700
     * @tc.desc    Test change parameters, single parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_0700';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        let hostStr: null | string = null;
        hostStr = SIMPLIFIED_CHINESE_ASCII_DOMAIN;
        const result = connection.getDnsUnicode(hostStr);
        expect(result).assertEqual(SIMPLIFIED_CHINESE_DOMAIN);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_0800
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_0800
     * @tc.desc    Test normal parameters, NO_CONFIGURATIO.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_0800';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result =
          connection.getDnsUnicode(SIMPLIFIED_CHINESE_ASCII_DOMAIN, connection.ConversionProcess.NO_CONFIGURATION);
        expect(result).assertEqual(SIMPLIFIED_CHINESE_DOMAIN);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_0900
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_0900
     * @tc.desc    Test normal parameters, NO_CONFIGURATIO.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_0900';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result =
          connection.getDnsUnicode(TRADITIONAL_CHINESE_ASCII_DOMAIN, connection.ConversionProcess.NO_CONFIGURATION);
        expect(result).assertEqual(TRADITIONAL_CHINESE_DOMAIN);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_1000
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_1000
     * @tc.desc    Test "" parameters, NO_CONFIGURATIO.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_1000';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsUnicode("", connection.ConversionProcess.NO_CONFIGURATION);
        expect(result).assertEqual("");
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_1100
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_1100
     * @tc.desc    Test normal parameters, ALLOW_UNASSIGNED.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_1100';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result =
          connection.getDnsUnicode(SIMPLIFIED_CHINESE_ASCII_DOMAIN, connection.ConversionProcess.ALLOW_UNASSIGNED);
        expect(result).assertEqual(SIMPLIFIED_CHINESE_DOMAIN);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_1200
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_1200
     * @tc.desc    Test normal parameters, ALLOW_UNASSIGNED.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_1200';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result =
          connection.getDnsUnicode(TRADITIONAL_CHINESE_ASCII_DOMAIN, connection.ConversionProcess.ALLOW_UNASSIGNED);
        expect(result).assertEqual(TRADITIONAL_CHINESE_DOMAIN);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_1300
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_1300
     * @tc.desc    Test "" parameters, ALLOW_UNASSIGNED.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_1300';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsUnicode("", connection.ConversionProcess.ALLOW_UNASSIGNED);
        expect(result).assertEqual("");
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_1400
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_1400
     * @tc.desc    Test normal parameters, USE_STD3_ASCII_RULES.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_1400';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result =
          connection.getDnsUnicode(SIMPLIFIED_CHINESE_ASCII_DOMAIN, connection.ConversionProcess.USE_STD3_ASCII_RULES);
        expect(result).assertEqual(SIMPLIFIED_CHINESE_DOMAIN);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_1500
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_1500
     * @tc.desc    Test normal parameters, USE_STD3_ASCII_RULES.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_1500';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result =
          connection.getDnsUnicode(TRADITIONAL_CHINESE_ASCII_DOMAIN, connection.ConversionProcess.USE_STD3_ASCII_RULES);
        expect(result).assertEqual(TRADITIONAL_CHINESE_DOMAIN);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_1600
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_1600
     * @tc.desc    Test "" parameters, USE_STD3_ASCII_RULES.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_1600';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsUnicode("", connection.ConversionProcess.USE_STD3_ASCII_RULES);
        expect(result).assertEqual("");
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_1700
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_1700
     * @tc.desc    Test normal parameters, 0.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_1700';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsUnicode(SIMPLIFIED_CHINESE_ASCII_DOMAIN, connection.ConversionProcess.NO_CONFIGURATION);
        expect(result).assertEqual(SIMPLIFIED_CHINESE_DOMAIN);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_1800
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_1800
     * @tc.desc    Test normal parameters, 0.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_1800';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsUnicode(TRADITIONAL_CHINESE_ASCII_DOMAIN, connection.ConversionProcess.NO_CONFIGURATION);
        expect(result).assertEqual(TRADITIONAL_CHINESE_DOMAIN);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_1900
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_1900
     * @tc.desc    Test "",0 parameters.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_1900';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsUnicode("", connection.ConversionProcess.NO_CONFIGURATION);
        expect(result).assertEqual("");
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_2000
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_2000
     * @tc.desc    Test normal parameters, 1.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_2000';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsUnicode(SIMPLIFIED_CHINESE_ASCII_DOMAIN, connection.ConversionProcess.ALLOW_UNASSIGNED);
        expect(result).assertEqual(SIMPLIFIED_CHINESE_DOMAIN);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_2100
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_2100
     * @tc.desc    Test normal parameters, 1.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_2100';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsUnicode(TRADITIONAL_CHINESE_ASCII_DOMAIN, connection.ConversionProcess.ALLOW_UNASSIGNED);
        expect(result).assertEqual(TRADITIONAL_CHINESE_DOMAIN);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_2200
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_2200
     * @tc.desc    Test "",1 parameters.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_2200';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsUnicode("", connection.ConversionProcess.ALLOW_UNASSIGNED);
        expect(result).assertEqual("");
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_2300
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_2300
     * @tc.desc    Test normal parameters, 2.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_2300';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsUnicode(SIMPLIFIED_CHINESE_ASCII_DOMAIN, connection.ConversionProcess.USE_STD3_ASCII_RULES);
        expect(result).assertEqual(SIMPLIFIED_CHINESE_DOMAIN);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_2400
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_2400
     * @tc.desc    Test normal parameters, 2.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_2400';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsUnicode(TRADITIONAL_CHINESE_ASCII_DOMAIN, connection.ConversionProcess.USE_STD3_ASCII_RULES);
        expect(result).assertEqual(TRADITIONAL_CHINESE_DOMAIN);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_2500
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_2500
     * @tc.desc    Test "",2 parameters.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_2500';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsUnicode("", connection.ConversionProcess.USE_STD3_ASCII_RULES);
        expect(result).assertEqual("");
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_2900
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_2900
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_2900';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const TEST_COUNT = 500;
        for (let i = 0; i < TEST_COUNT; i++) {
          const startTime = Date.now();
          const result = connection.getDnsUnicode("www.xn--fiq02ab1ogvc.com");
          const endTime = Date.now();
          const conversionTime = endTime - startTime;
          expect(conversionTime).assertLess(100);
          expect(result).assertEqual("www.中国你好.com");
          hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
          hilog.info(domain, tag, '%{public}s', caseName+`conversionTime: ${conversionTime}`);
        }
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_3000
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_3000
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_3000';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const TEST_COUNT = 50;
        for (let i = 0; i < TEST_COUNT; i++) {
          const result = connection.getDnsUnicode("www.xn--kprs0pw9ir0k.com");
          expect(result).assertEqual("www.台灣早安.com");
          hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        }
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_3100
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_3100
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_3100';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const TEST_COUNT = 50;
        for (let i = 0; i < TEST_COUNT; i++) {
          const result =
            connection.getDnsUnicode("www.xn--fiq02ab1ogvc.com", connection.ConversionProcess.NO_CONFIGURATION);
          expect(result).assertEqual("www.中国你好.com");
          hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        }
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_3200
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_3200
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_3200';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const TEST_COUNT = 50;
        for (let i = 0; i < TEST_COUNT; i++) {
          const result =
            connection.getDnsUnicode("www.xn--kprs0pw9ir0k.com", connection.ConversionProcess.NO_CONFIGURATION);
          expect(result).assertEqual("www.台灣早安.com");
          hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        }
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_3300
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_3300
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_3300';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const TEST_COUNT = 50;
        for (let i = 0; i < TEST_COUNT; i++) {
          const result =
            connection.getDnsUnicode("www.xn--fiq02ab1ogvc.com", connection.ConversionProcess.ALLOW_UNASSIGNED);
          expect(result).assertEqual("www.中国你好.com");
          hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        }
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_3400
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_3400
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_3400';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const TEST_COUNT = 50;
        for (let i = 0; i < TEST_COUNT; i++) {
          const result =
            connection.getDnsUnicode("www.xn--kprs0pw9ir0k.com", connection.ConversionProcess.ALLOW_UNASSIGNED);
          expect(result).assertEqual("www.台灣早安.com");
          hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        }
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_3500
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_3500
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_3500';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const TEST_COUNT = 50;
        for (let i = 0; i < TEST_COUNT; i++) {
          const result =
            connection.getDnsUnicode("www.xn--fiq02ab1ogvc.com", connection.ConversionProcess.USE_STD3_ASCII_RULES);
          expect(result).assertEqual("www.中国你好.com");
          hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        }
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_3600
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_3600
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_3600';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const TEST_COUNT = 50;
        for (let i = 0; i < TEST_COUNT; i++) {
          const result =
            connection.getDnsUnicode("www.xn--kprs0pw9ir0k.com", connection.ConversionProcess.USE_STD3_ASCII_RULES);
          expect(result).assertEqual("www.台灣早安.com");
          hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        }
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_3700
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_3700
     * @tc.desc    special param test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_3700';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsUnicode("!@#$, .xn--cba");
        expect(result).assertEqual("!@#$, .\u00a5");
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_3800
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_3800
     * @tc.desc    special param test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_3800';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsUnicode("xn--o28h", connection.ConversionProcess.NO_CONFIGURATION);
        expect(result).assertEqual("xn--o28h");
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_3900
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_3900
     * @tc.desc    special param test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_3900';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsUnicode("xn--o28h", connection.ConversionProcess.ALLOW_UNASSIGNED);
        expect(result).assertEqual("😊");
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_4000
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_4000
     * @tc.desc    special param test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_4000';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsUnicode('www.' + 'b'.repeat(300) + '.com');
        expect(result)
          .assertEqual("www.bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode_static_4200
     * @tc.number  SUB_NetworkMgr_Connection_GETUNICODE_4200
     * @tc.desc    special param test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode_static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetDnsUnicode_static_4200';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsUnicode(TRADITIONAL_CHINESE_ASCII_DOMAIN, undefined);
        expect(result).assertEqual(TRADITIONAL_CHINESE_DOMAIN);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });
  });
}
