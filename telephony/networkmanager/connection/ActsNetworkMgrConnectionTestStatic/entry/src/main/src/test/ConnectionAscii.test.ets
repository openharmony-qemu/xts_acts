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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "../../../hypium/index";
import connection from '@ohos.net.connection';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000;
let tag: string = 'ConnectionAsciiTestTag';

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

export default function ConnectionAsciiTest(): void {
  describe('ConnectionAsciiTest', () => {
    /**
     * @tc.name    testConnectiongetDnsAscii_static_0100
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_0100
     * @tc.desc    Test normal parameters, single parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_0100';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsAscii(SIMPLIFIED_CHINESE_DOMAIN);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        expect(result).assertEqual(SIMPLIFIED_CHINESE_ASCII_DOMAIN);
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
     * @tc.name    testConnectiongetDnsAscii_static_0200
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_0200
     * @tc.desc    Test normal parameters, single parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_0200';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsAscii(TRADITIONAL_CHINESE_DOMAIN);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        expect(result).assertEqual(TRADITIONAL_CHINESE_ASCII_DOMAIN);
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
     * @tc.name    testConnectiongetDnsAscii_static_0300
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_0300
     * @tc.desc    Test pure ASCII domain name, result should remain unchanged.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_0300';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsAscii(PURE_ASCII_DOMAIN);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        expect(result).assertEqual(PURE_ASCII_DOMAIN);
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
     * @tc.name    testConnectiongetDnsAscii_static_0400
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_0400
     * @tc.desc    Test "" parameters, single parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_0400';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsAscii("");
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        expect(result).assertEqual("");
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
     * @tc.name    testConnectiongetDnsAscii_static_0500
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_0500
     * @tc.desc    Test change parameters, single parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_0500';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        let hostStr = SIMPLIFIED_CHINESE_DOMAIN;
        hostStr = TRADITIONAL_CHINESE_DOMAIN;
        const result = connection.getDnsAscii(hostStr);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        expect(result).assertEqual(TRADITIONAL_CHINESE_ASCII_DOMAIN);
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
     * @tc.name    testConnectiongetDnsAscii_static_0600
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_0600
     * @tc.desc    Test change parameters, single parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_0600';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        let hostStr = TRADITIONAL_CHINESE_DOMAIN;
        hostStr = SIMPLIFIED_CHINESE_DOMAIN;
        const result = connection.getDnsAscii(hostStr);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        expect(result).assertEqual(SIMPLIFIED_CHINESE_ASCII_DOMAIN);
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
     * @tc.name    testConnectiongetDnsAscii_static_0700
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_0700
     * @tc.desc    Test change parameters, single parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_0700';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        let hostStr: null | string = null;
        hostStr = SIMPLIFIED_CHINESE_DOMAIN;
        const result = connection.getDnsAscii(hostStr);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        expect(result).assertEqual(SIMPLIFIED_CHINESE_ASCII_DOMAIN);
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
     * @tc.name    testConnectiongetDnsAscii_static_0800
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_0800
     * @tc.desc    Test normal parameters, NO_CONFIGURATIO.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_0800';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsAscii(SIMPLIFIED_CHINESE_DOMAIN, connection.ConversionProcess.NO_CONFIGURATION);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        expect(result).assertEqual(SIMPLIFIED_CHINESE_ASCII_DOMAIN);
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
     * @tc.name    testConnectiongetDnsAscii_static_0900
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_0900
     * @tc.desc    Test normal parameters, NO_CONFIGURATIO.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_0900';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsAscii(TRADITIONAL_CHINESE_DOMAIN, connection.ConversionProcess.NO_CONFIGURATION);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        expect(result).assertEqual(TRADITIONAL_CHINESE_ASCII_DOMAIN);
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
     * @tc.name    testConnectiongetDnsAscii_static_1000
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_1000
     * @tc.desc    Test "" parameters, NO_CONFIGURATIO.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_1000';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsAscii("", connection.ConversionProcess.NO_CONFIGURATION);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        expect(result).assertEqual("");
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
     * @tc.name    testConnectiongetDnsAscii_static_1100
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_1100
     * @tc.desc    Test normal parameters, ALLOW_UNASSIGNED.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_1100';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsAscii(SIMPLIFIED_CHINESE_DOMAIN, connection.ConversionProcess.ALLOW_UNASSIGNED);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        expect(result).assertEqual(SIMPLIFIED_CHINESE_ASCII_DOMAIN);
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
     * @tc.name    testConnectiongetDnsAscii_static_1200
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_1200
     * @tc.desc    Test normal parameters, ALLOW_UNASSIGNED.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_1200';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsAscii(TRADITIONAL_CHINESE_DOMAIN, connection.ConversionProcess.ALLOW_UNASSIGNED);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        expect(result).assertEqual(TRADITIONAL_CHINESE_ASCII_DOMAIN);
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
     * @tc.name    testConnectiongetDnsAscii_static_1300
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_1300
     * @tc.desc    Test "" parameters, ALLOW_UNASSIGNED.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_1300';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsAscii("", connection.ConversionProcess.ALLOW_UNASSIGNED);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        expect(result).assertEqual("");
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
     * @tc.name    testConnectiongetDnsAscii_static_1400
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_1400
     * @tc.desc    Test normal parameters, USE_STD3_ASCII_RULES.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_1400';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result =
          connection.getDnsAscii(SIMPLIFIED_CHINESE_DOMAIN, connection.ConversionProcess.USE_STD3_ASCII_RULES);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        expect(result).assertEqual(SIMPLIFIED_CHINESE_ASCII_DOMAIN);
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
     * @tc.name    testConnectiongetDnsAscii_static_1500
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_1500
     * @tc.desc    Test normal parameters, USE_STD3_ASCII_RULES.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_1500';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result =
          connection.getDnsAscii(TRADITIONAL_CHINESE_DOMAIN, connection.ConversionProcess.USE_STD3_ASCII_RULES);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        expect(result).assertEqual(TRADITIONAL_CHINESE_ASCII_DOMAIN);
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
     * @tc.name    testConnectiongetDnsAscii_static_1600
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_1600
     * @tc.desc    Test "" parameters, USE_STD3_ASCII_RULES.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_1600';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsAscii("", connection.ConversionProcess.USE_STD3_ASCII_RULES);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        expect(result).assertEqual("");
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
     * @tc.name    testConnectiongetDnsAscii_static_1700
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_1700
     * @tc.desc    Test normal parameters, 0.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_1700';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsAscii(SIMPLIFIED_CHINESE_DOMAIN, connection.ConversionProcess.NO_CONFIGURATION);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        expect(result).assertEqual(SIMPLIFIED_CHINESE_ASCII_DOMAIN);
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
     * @tc.name    testConnectiongetDnsAscii_static_1800
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_1800
     * @tc.desc    Test normal parameters, 0.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_1800';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsAscii(TRADITIONAL_CHINESE_DOMAIN, connection.ConversionProcess.NO_CONFIGURATION);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        expect(result).assertEqual(TRADITIONAL_CHINESE_ASCII_DOMAIN);
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
     * @tc.name    testConnectiongetDnsAscii_static_1900
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_1900
     * @tc.desc    Test "",0 parameters.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_1900';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsAscii("", connection.ConversionProcess.NO_CONFIGURATION);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        expect(result).assertEqual("");
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
     * @tc.name    testConnectiongetDnsAscii_static_2000
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_2000
     * @tc.desc    Test normal parameters, 1.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_2000';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsAscii(SIMPLIFIED_CHINESE_DOMAIN, connection.ConversionProcess.ALLOW_UNASSIGNED);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        expect(result).assertEqual(SIMPLIFIED_CHINESE_ASCII_DOMAIN);
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
     * @tc.name    testConnectiongetDnsAscii_static_2100
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_2100
     * @tc.desc    Test normal parameters, 1.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_2100';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsAscii(TRADITIONAL_CHINESE_DOMAIN, connection.ConversionProcess.ALLOW_UNASSIGNED);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        expect(result).assertEqual(TRADITIONAL_CHINESE_ASCII_DOMAIN);
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
     * @tc.name    testConnectiongetDnsAscii_static_2200
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_2200
     * @tc.desc    Test "",1 parameters.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_2200';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsAscii("", connection.ConversionProcess.ALLOW_UNASSIGNED);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        expect(result).assertEqual("");
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
     * @tc.name    testConnectiongetDnsAscii_static_2300
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_2300
     * @tc.desc    Test normal parameters, 2.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_2300';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsAscii(SIMPLIFIED_CHINESE_DOMAIN, connection.ConversionProcess.USE_STD3_ASCII_RULES);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        expect(result).assertEqual(SIMPLIFIED_CHINESE_ASCII_DOMAIN);
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
     * @tc.name    testConnectiongetDnsAscii_static_2400
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_2400
     * @tc.desc    Test normal parameters, 2.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_2400';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsAscii(TRADITIONAL_CHINESE_DOMAIN, connection.ConversionProcess.USE_STD3_ASCII_RULES);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        expect(result).assertEqual(TRADITIONAL_CHINESE_ASCII_DOMAIN);
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
     * @tc.name    testConnectiongetDnsAscii_static_2500
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_2500
     * @tc.desc    Test "",2 parameters.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_2500';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsAscii("", connection.ConversionProcess.USE_STD3_ASCII_RULES);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        expect(result).assertEqual("");
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
     * @tc.name    testConnectiongetDnsAscii_static_2900
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_2900
     * @tc.desc    Test special  parameters.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_2900';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsAscii("www.\u08A0.com", connection.ConversionProcess.NO_CONFIGURATION);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        expect(error.code).assertEqual(2100003);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectiongetDnsAscii_static_3000
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_3000
     * @tc.desc    Test special  parameters.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_3000';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsAscii("www.\u08A0.com", connection.ConversionProcess.ALLOW_UNASSIGNED);
        expect(result).assertEqual("www.xn--pyb.com");
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
     * @tc.name    testConnectiongetDnsAscii_static_3100
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_3100
     * @tc.desc    Test special  parameters.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_3100';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsAscii("www.\u08A0.com", connection.ConversionProcess.USE_STD3_ASCII_RULES);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        expect(result).assertEqual(SIMPLIFIED_CHINESE_ASCII_DOMAIN);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        expect(error.code).assertEqual(2100003);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectiongetDnsAscii_static_3200
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_3200
     * @tc.desc    Test special  parameters.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_3200';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsAscii("www.-hello.com", connection.ConversionProcess.USE_STD3_ASCII_RULES);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        expect(error.code).assertEqual(2100003);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectiongetDnsAscii_static_3300
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_3300
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_3300';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const TEST_COUNT = 500;
        for (let i = 0; i < TEST_COUNT; i++) {
          const startTime = Date.now();
          const result = connection.getDnsAscii("www.中国你好.com");
          const endTime = Date.now();
          const conversionTime = endTime - startTime;
          hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
          hilog.info(domain, tag, '%{public}s', `conversionTime: ${conversionTime}`);
          expect(conversionTime).assertLess(100);
          expect(result).assertEqual("www.xn--fiq02ab1ogvc.com");
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
     * @tc.name    testConnectiongetDnsAscii_static_3400
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_3400
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_3400';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const TEST_COUNT = 50;
        for (let i = 0; i < TEST_COUNT; i++) {
          const result = connection.getDnsAscii("www.台灣早安.com");
          hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
          expect(result).assertEqual("www.xn--kprs0pw9ir0k.com");
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
     * @tc.name    testConnectiongetDnsAscii_static_3500
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_3500
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_3500';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const TEST_COUNT = 50;
        for (let i = 0; i < TEST_COUNT; i++) {
          const result = connection.getDnsAscii("www.中国你好.com", connection.ConversionProcess.NO_CONFIGURATION);
          hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
          expect(result).assertEqual("www.xn--fiq02ab1ogvc.com");
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
     * @tc.name    testConnectiongetDnsAscii_static_3600
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_3600
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_3600';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const TEST_COUNT = 50;
        for (let i = 0; i < TEST_COUNT; i++) {
          const result = connection.getDnsAscii("www.台灣早安.com", connection.ConversionProcess.NO_CONFIGURATION);
          hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
          expect(result).assertEqual("www.xn--kprs0pw9ir0k.com");
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
     * @tc.name    testConnectiongetDnsAscii_static_3700
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_3700
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_3700';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const TEST_COUNT = 50;
        for (let i = 0; i < TEST_COUNT; i++) {
          const result = connection.getDnsAscii("www.中国你好.com", connection.ConversionProcess.ALLOW_UNASSIGNED);
          hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
          expect(result).assertEqual("www.xn--fiq02ab1ogvc.com");
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
     * @tc.name    testConnectiongetDnsAscii_static_3800
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_3800
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_3800';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const TEST_COUNT = 50;
        for (let i = 0; i < TEST_COUNT; i++) {
          const result = connection.getDnsAscii("www.台灣早安.com", connection.ConversionProcess.ALLOW_UNASSIGNED);
          hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
          expect(result).assertEqual("www.xn--kprs0pw9ir0k.com");
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
     * @tc.name    testConnectiongetDnsAscii_static_3900
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_3900
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_3900';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const TEST_COUNT = 50;
        for (let i = 0; i < TEST_COUNT; i++) {
          const result = connection.getDnsAscii("www.中国你好.com", connection.ConversionProcess.USE_STD3_ASCII_RULES);
          hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
          expect(result).assertEqual("www.xn--fiq02ab1ogvc.com");
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
     * @tc.name    testConnectiongetDnsAscii_static_4000
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_4000
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_4000';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const TEST_COUNT = 50;
        for (let i = 0; i < TEST_COUNT; i++) {
          const result = connection.getDnsAscii("www.台灣早安.com", connection.ConversionProcess.USE_STD3_ASCII_RULES);
          hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
          expect(result).assertEqual("www.xn--kprs0pw9ir0k.com");
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
     * @tc.name    testConnectiongetDnsAscii_static_4100
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_4100
     * @tc.desc    special param test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_4100';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsAscii("!@#$，。￥");
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        expect(result).assertEqual("!@#$,.xn--cba");
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
     * @tc.name    testConnectiongetDnsAscii_static_4200
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_4200
     * @tc.desc    special param test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_4200';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsAscii("😊", connection.ConversionProcess.NO_CONFIGURATION);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        expect(error.code).assertEqual(2100003);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectiongetDnsAscii_static_4300
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_4300
     * @tc.desc    special param test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_4300';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsAscii("😊", connection.ConversionProcess.ALLOW_UNASSIGNED);
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        expect(result).assertEqual("xn--o28h");
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
     * @tc.name    testConnectiongetDnsAscii_static_4400
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_4400
     * @tc.desc    special param test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_4400';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsAscii('www.' + 'b'.repeat(64) + '.com');
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', caseName+`error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        expect(error.code).assertEqual(2100003);
        hilog.info(domain, tag, '%{public}s', caseName + '---end');
        done();
      }
    });

    /**
     * @tc.name    testConnectiongetDnsAscii_static_4700
     * @tc.number  SUB_NetworkMgr_Connection_getDnsAscii_4700
     * @tc.desc    special param test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii_static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetDnsAscii_static_4700';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        const result = connection.getDnsAscii('www.' + 'b'.repeat(63) + '.com');
        hilog.info(domain, tag, '%{public}s', caseName+`result: ${result}`);
        expect(result).assertEqual("www.bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb.com");
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