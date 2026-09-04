/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import uri from '@ohos.uri';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  testAddEncodedSegmentPara001,
  testAddQueryValuePara001,
  testAddQueryValuePara002,
  testAddSegmentPara001,
  testCreateFromPartsPara001,
  testCreateFromPartsPara002,
  testCreateFromPartsPara003,
  testEqualsTo006,
  testEqualsTo007,
  testGetBooleanQueryValuePara001,
  testGetBooleanQueryValuePara002,
  testGetQueryValuePara001,
  testGetQueryValuesPara001,
  testUriConstruction002
} from './UriResource';

export function UriFPTest() {
  describe('UriFPTest', () => {


    /**
     * @tc.name   testUriConstruction001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0010
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=1&bar=2');
        expect().assertFail();
      } catch (err) {
        expect(err.toString())
          .assertEqual("BusinessError: Syntax Error. Invalid Uri string: The #It can't be the first");
        expect(err.code).assertEqual(10200002)
        expect(err.message).assertEqual("Syntax Error. Invalid Uri string: The #It can't be the first");
      }
    })

    /**
     * @tc.name   testUriConstruction002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0020
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testUriConstruction002().split("|||");
      expect(parts[0]).assertEqual("BusinessError: Parameter error. The type of [object Object] must be string");
      expect(parts[1]).assertEqual("401");
      expect(parts[2]).assertEqual("Parameter error. The type of [object Object] must be string");
    })

    /**
     * @tc.name   testUriConstruction003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0030
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let that = new uri.URI('ht/tp://username:pas sword@host:8080/directory/file?foo=1&bar=2');
      expect(that.toString()).assertEqual("ht/tp://username:pas%20sword@host:8080/directory/file?foo=1&bar=2");
    })

    /**
     * @tc.name   testUriConstruction004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0040
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let that = new uri.URI('http://username:password@[::]:8080/directory/file?Query#gaogao faofao');
      expect(that.toString()).assertEqual("http://username:password@[::]:8080/directory/file?Query#gaogao%20faofao");
    })

    /**
     * @tc.name   testUriConstruction005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0050
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let that = new uri.URI('http://username:password@host:8080/directory/file?foo^=1&bar=2#gaogaofaofao');
        expect().assertFail();
      } catch (err) {
        expect(err.toString())
          .assertEqual("BusinessError: Syntax Error. Invalid Uri string: The Query does not conform to the rule");
        expect(err.code).assertEqual(10200002)
        expect(err.message).assertEqual("Syntax Error. Invalid Uri string: The Query does not conform to the rule");
      }
    })


    /**
     * @tc.name   testUriConstruction006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0060
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let that = new uri.URI('1http://username:password@host:8080/directory/file?foo=1&bar=2#gaogaofaofao');
        expect().assertFail();
      } catch (err) {
        expect(err.toString())
          .assertEqual(
            "BusinessError: Syntax Error. Invalid Uri string: The Scheme the first character must be a letter");
        expect(err.code).assertEqual(10200002)
        expect(err.message)
          .assertEqual("Syntax Error. Invalid Uri string: The Scheme the first character must be a letter");
      }
    })


    /**
     * @tc.name   testUriConstruction007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0070
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let that = new uri.URI('ht@tp://username:password@host:8080/directory/file?foo=1&bar=2#gaogaofaofao');
        expect().assertFail();
      } catch (err) {
        expect(err.toString())
          .assertEqual("BusinessError: Syntax Error. Invalid Uri string: The scheme does not conform to the rule");
        expect(err.code).assertEqual(10200002)
        expect(err.message).assertEqual("Syntax Error. Invalid Uri string: The scheme does not conform to the rule");
      }
    })


    /**
     * @tc.name   testUriConstruction008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0080
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let that = new uri.URI('http://username:password@[::]:80r80/directory/file?foo=1&bar=2#gaogaofaofao');
        expect().assertFail();
      } catch (err) {
        expect(err.toString())
          .assertEqual("BusinessError: Syntax Error. Invalid Uri string: The Prot does not conform to the rule");
        expect(err.code).assertEqual(10200002)
        expect(err.message).assertEqual("Syntax Error. Invalid Uri string: The Prot does not conform to the rule");
      }
    })


    /**
     * @tc.name   testUriConstruction009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0090
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let that = new uri.URI('http://username:password@[::12:55:8080/directory/file?foo=1&bar=2#gaogaofaofao');
        expect().assertFail();
      } catch (err) {
        expect(err.toString())
          .assertEqual("BusinessError: Syntax Error. Invalid Uri string: The IPv6 is missing a closing bracket");
        expect(err.code).assertEqual(10200002)
        expect(err.message).assertEqual("Syntax Error. Invalid Uri string: The IPv6 is missing a closing bracket");
      }
    })


    /**
     * @tc.name   testUriConstruction010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0100
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let that = new uri.URI('http://username:pa^ssword@[::12:55]:8080/directory/file?foo=1&bar=2#gaogaofaofao');
        expect().assertFail();
      } catch (err) {
        expect(err.toString())
          .assertEqual("BusinessError: Syntax Error. Invalid Uri string: The userInfo does not conform to the rule");
        expect(err.code).assertEqual(10200002)
        expect(err.message).assertEqual("Syntax Error. Invalid Uri string: The userInfo does not conform to the rule");
      }
    })


    /**
     * @tc.name   testUriConstruction011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0110
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let that = new uri.URI('http://username:password@[::1你2:55]:8080/directory/file?foo=1&bar=2#gaogaofaofao');
        expect().assertFail();
      } catch (err) {
        expect(err.toString())
          .assertEqual("BusinessError: Syntax Error. Invalid Uri string: The ipv6 does not conform to the rule");
        expect(err.code).assertEqual(10200002)
        expect(err.message).assertEqual("Syntax Error. Invalid Uri string: The ipv6 does not conform to the rule");
      }
    })


    /**
     * @tc.name   testUriConstruction012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0120
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://gg:gaogao@www.baidu.com:99/path/path?query#fagment');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("gg:gaogao@www.baidu.com:99");
      expect(gaogao.ssp).assertEqual("//gg:gaogao@www.baidu.com:99/path/path?query");
      expect(gaogao.userInfo).assertEqual("gg:gaogao");
      expect(gaogao.host).assertEqual("www.baidu.com");
      expect(gaogao.port).assertEqual("99");
      expect(gaogao.path).assertEqual("/path/path");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("fagment");
    })


    /**
     * @tc.name   testUriConstruction013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0130
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://gg:gaogao@[1080::8:800:200C:417A]:99/path/66path1?query#fagment');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("gg:gaogao@[1080::8:800:200C:417A]:99");
      expect(gaogao.ssp).assertEqual("//gg:gaogao@[1080::8:800:200C:417A]:99/path/66path1?query");
      expect(gaogao.userInfo).assertEqual("gg:gaogao");
      expect(gaogao.host).assertEqual("[1080::8:800:200C:417A]");
      expect(gaogao.port).assertEqual("99");
      expect(gaogao.path).assertEqual("/path/66path1");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("fagment");
    })


    /**
     * @tc.name   testUriConstruction014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0140
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://gg:gaogao@[::]:88/path/path66?foooo#gaogao');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("gg:gaogao@[::]:88");
      expect(gaogao.ssp).assertEqual("//gg:gaogao@[::]:88/path/path66?foooo");
      expect(gaogao.userInfo).assertEqual("gg:gaogao");
      expect(gaogao.host).assertEqual("[::]");
      expect(gaogao.port).assertEqual("88");
      expect(gaogao.path).assertEqual("/path/path66");
      expect(gaogao.query).assertEqual("foooo");
      expect(gaogao.fragment).assertEqual("gaogao");
    })


    /**
     * @tc.name   testUriConstruction015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0150
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path/66path1?query#fagment');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("gg:gaogao@[1:0:0:1:2:1:2:1]:99");
      expect(gaogao.ssp).assertEqual("//gg:gaogao@[1:0:0:1:2:1:2:1]:99/path/66path1?query");
      expect(gaogao.userInfo).assertEqual("gg:gaogao");
      expect(gaogao.host).assertEqual("[1:0:0:1:2:1:2:1]");
      expect(gaogao.port).assertEqual("99");
      expect(gaogao.path).assertEqual("/path/66path1");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("fagment");
    })


    /**
     * @tc.name   testUriConstruction016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0160
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://gg:gaogao@[::FFFF:129.144.52.38]:99/path/path?query#fagment');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("gg:gaogao@[::FFFF:129.144.52.38]:99");
      expect(gaogao.ssp).assertEqual("//gg:gaogao@[::FFFF:129.144.52.38]:99/path/path?query");
      expect(gaogao.userInfo).assertEqual("gg:gaogao");
      expect(gaogao.host).assertEqual("[::FFFF:129.144.52.38]");
      expect(gaogao.port).assertEqual("99");
      expect(gaogao.path).assertEqual("/path/path");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("fagment");
    })


    /**
     * @tc.name   testUriConstruction017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0170
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://gg:gaogao@[::192.9.5.5]:99/path/path?query#fagment');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("gg:gaogao@[::192.9.5.5]:99");
      expect(gaogao.ssp).assertEqual("//gg:gaogao@[::192.9.5.5]:99/path/path?query");
      expect(gaogao.userInfo).assertEqual("gg:gaogao");
      expect(gaogao.host).assertEqual("[::192.9.5.5]");
      expect(gaogao.port).assertEqual("99");
      expect(gaogao.path).assertEqual("/path/path");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("fagment");
    })


    /**
     * @tc.name   testUriConstruction018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0180
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://gg:gaogao@[22::22:2:2%ss]:99/path/path?query#fagment');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("gg:gaogao@[22::22:2:2%ss]:99");
      expect(gaogao.ssp).assertEqual("//gg:gaogao@[22::22:2:2%ss]:99/path/path?query");
      expect(gaogao.userInfo).assertEqual("gg:gaogao");
      expect(gaogao.host).assertEqual("[22::22:2:2%ss]");
      expect(gaogao.port).assertEqual("99");
      expect(gaogao.path).assertEqual("/path/path");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("fagment");
    })


    /**
     * @tc.name   testUriConstruction019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0190
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao =
        new uri.URI('http://gg:gaogao@[fe80:0000:0001:0000:0440:44ff:1233:5678]:99/path/path?query#fagment');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("gg:gaogao@[fe80:0000:0001:0000:0440:44ff:1233:5678]:99");
      expect(gaogao.ssp).assertEqual("//gg:gaogao@[fe80:0000:0001:0000:0440:44ff:1233:5678]:99/path/path?query");
      expect(gaogao.userInfo).assertEqual("gg:gaogao");
      expect(gaogao.host).assertEqual("[fe80:0000:0001:0000:0440:44ff:1233:5678]");
      expect(gaogao.port).assertEqual("99");
      expect(gaogao.path).assertEqual("/path/path");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("fagment");
    })


    /**
     * @tc.name   testUriConstruction020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0200
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://gg:gaogao@[fe80::0001:0000]:99/path/path?query#fagment');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("gg:gaogao@[fe80::0001:0000]:99");
      expect(gaogao.ssp).assertEqual("//gg:gaogao@[fe80::0001:0000]:99/path/path?query");
      expect(gaogao.userInfo).assertEqual("gg:gaogao");
      expect(gaogao.host).assertEqual("[fe80::0001:0000]");
      expect(gaogao.port).assertEqual("99");
      expect(gaogao.path).assertEqual("/path/path");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("fagment");
    })


    /**
     * @tc.name   testUriConstruction021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0210
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://gg:gaogao@199.98.55.44:99/path/path?query#fagment');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("gg:gaogao@199.98.55.44:99");
      expect(gaogao.ssp).assertEqual("//gg:gaogao@199.98.55.44:99/path/path?query");
      expect(gaogao.userInfo).assertEqual("gg:gaogao");
      expect(gaogao.host).assertEqual("199.98.55.44");
      expect(gaogao.port).assertEqual("99");
      expect(gaogao.path).assertEqual("/path/path");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("fagment");
    })


    /**
     * @tc.name   testUriConstruction022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0220
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://16.9.5.4:99/path/path?query#fagment');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("16.9.5.4:99");
      expect(gaogao.ssp).assertEqual("//16.9.5.4:99/path/path?query");
      expect(gaogao.userInfo).assertEqual(null);
      expect(gaogao.host).assertEqual("16.9.5.4");
      expect(gaogao.port).assertEqual("99");
      expect(gaogao.path).assertEqual("/path/path");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("fagment");
    })


    /**
     * @tc.name   testUriConstruction023
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0230
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://49.99.54.12:50/path/path23?query#fagment');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("49.99.54.12:50");
      expect(gaogao.ssp).assertEqual("//49.99.54.12:50/path/path23?query");
      expect(gaogao.userInfo).assertEqual(null);
      expect(gaogao.host).assertEqual("49.99.54.12");
      expect(gaogao.port).assertEqual("50");
      expect(gaogao.path).assertEqual("/path/path23");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("fagment");
    })


    /**
     * @tc.name   testUriConstruction024
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0240
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://user@49.10pe8.54.12:80/path/path23?query#qwer');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("user@49.10pe8.54.12:80");
      expect(gaogao.ssp).assertEqual("//user@49.10pe8.54.12:80/path/path23?query");
      expect(gaogao.userInfo).assertEqual(null);
      expect(gaogao.host).assertEqual(null);
      expect(gaogao.port).assertEqual("-1");
      expect(gaogao.path).assertEqual("/path/path23");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("qwer");
    })


    /**
     * @tc.name   testUriConstruction025
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0250
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://user@www.baidu.com/path/path23?query#qwer');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("user@www.baidu.com");
      expect(gaogao.ssp).assertEqual("//user@www.baidu.com/path/path23?query");
      expect(gaogao.userInfo).assertEqual("user");
      expect(gaogao.host).assertEqual("www.baidu.com");
      expect(gaogao.port).assertEqual("-1");
      expect(gaogao.path).assertEqual("/path/path23");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("qwer");
    })


    /**
     * @tc.name   testUriConstruction026
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0260
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://user@www.hw.com:77/path/path23?query#qwer');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("user@www.hw.com:77");
      expect(gaogao.ssp).assertEqual("//user@www.hw.com:77/path/path23?query");
      expect(gaogao.userInfo).assertEqual("user");
      expect(gaogao.host).assertEqual("www.hw.com");
      expect(gaogao.port).assertEqual("77");
      expect(gaogao.path).assertEqual("/path/path23");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("qwer");
    })


    /**
     * @tc.name   testUriConstruction027
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0270
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('ht2tp://user@www.h12343w.com:77/path/path23?query#qwer');
      expect(gaogao.scheme).assertEqual("ht2tp");
      expect(gaogao.authority).assertEqual("user@www.h12343w.com:77");
      expect(gaogao.ssp).assertEqual("//user@www.h12343w.com:77/path/path23?query");
      expect(gaogao.userInfo).assertEqual("user");
      expect(gaogao.host).assertEqual("www.h12343w.com");
      expect(gaogao.port).assertEqual("77");
      expect(gaogao.path).assertEqual("/path/path23");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("qwer");
    })


    /**
     * @tc.name   testUriConstruction028
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0280
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('ht2tp://user@www.1hw.1com:77/path/path23?query#qwer');
      expect(gaogao.scheme).assertEqual("ht2tp");
      expect(gaogao.authority).assertEqual("user@www.1hw.1com:77");
      expect(gaogao.ssp).assertEqual("//user@www.1hw.1com:77/path/path23?query");
      expect(gaogao.userInfo).assertEqual(null);
      expect(gaogao.host).assertEqual(null);
      expect(gaogao.port).assertEqual("-1");
      expect(gaogao.path).assertEqual("/path/path23");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("qwer");
    })


    /**
     * @tc.name   testUriConstruction029
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0290
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://user@hosthost/path/path23?query#qwer');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("user@hosthost");
      expect(gaogao.ssp).assertEqual("//user@hosthost/path/path23?query");
      expect(gaogao.userInfo).assertEqual("user");
      expect(gaogao.host).assertEqual("hosthost");
      expect(gaogao.port).assertEqual("-1");
      expect(gaogao.path).assertEqual("/path/path23");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("qwer");
    })


    /**
     * @tc.name   testUriConstruction030
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0300
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://user@[::]/path/path23?query#qwer');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("user@[::]");
      expect(gaogao.ssp).assertEqual("//user@[::]/path/path23?query");
      expect(gaogao.userInfo).assertEqual("user");
      expect(gaogao.host).assertEqual("[::]");
      expect(gaogao.port).assertEqual("-1");
      expect(gaogao.path).assertEqual("/path/path23");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("qwer");
    })


    /**
     * @tc.name   testUriConstruction031
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0310
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://[::192:0:5]/path/path23?query#qwer');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("[::192:0:5]");
      expect(gaogao.ssp).assertEqual("//[::192:0:5]/path/path23?query");
      expect(gaogao.userInfo).assertEqual(null);
      expect(gaogao.host).assertEqual("[::192:0:5]");
      expect(gaogao.port).assertEqual("-1");
      expect(gaogao.path).assertEqual("/path/path23");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("qwer");
    })

    /**
     * @tc.name   testEquals001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0320
     * @tc.desc   Tests this URI for equality with another object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEquals001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
      let gaogao1 = gaogao;
      let res = gaogao.equals(gaogao1);
      expect(res).assertEqual(true);
    })

    /**
     * @tc.name   testEquals002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0330
     * @tc.desc   Tests this URI for equality with another object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEquals002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
      let gaogao1 = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
      let res = gaogao.equals(gaogao1);
      expect(res).assertEqual(true);
    })

    /**
     * @tc.name   testEquals003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0340
     * @tc.desc   Tests this URI for equality with another object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEquals003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
      let gaogao1 = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment123');
      let res = gaogao.equals(gaogao1);
      expect(res).assertEqual(false);
    })

    /**
     * @tc.name   testEquals004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0350
     * @tc.desc   Tests this URI for equality with another object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEquals004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://gg:gaogao@wwwaaa:99/path1?query#fagment');
      let gaogao1 = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment123');
      let res = gaogao.equals(gaogao1);
      expect(res).assertEqual(false);
    })

    /**
     * @tc.name   testEquals005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0360
     * @tc.desc   Tests this URI for equality with another object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEquals005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
      let gaogao1 = new uri.URI('http://[1:0:0:1:2:1:2:1]/path1?query#fagment123');
      let res = gaogao.equals(gaogao1);
      expect(res).assertEqual(false);
    })

    /**
     * @tc.name   testEqualsTo001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0370
     * @tc.desc   Tests this URI for equality with another object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEqualsTo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
      let gaogao1 = gaogao;
      let res = gaogao.equalsTo(gaogao1);
      expect(res).assertEqual(true);
    })

    /**
     * @tc.name   testEqualsTo002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0380
     * @tc.desc   Tests this URI for equality with another object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEqualsTo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
      let gaogao1 = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
      let res = gaogao.equalsTo(gaogao1);
      expect(res).assertEqual(true);
    })

    /**
     * @tc.name   testEqualsTo003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0390
     * @tc.desc   Tests this URI for equality with another object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEqualsTo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
      let gaogao1 = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment123');
      let res = gaogao.equalsTo(gaogao1);
      expect(res).assertEqual(false);
    })

    /**
     * @tc.name   testEqualsTo004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0400
     * @tc.desc   Tests this URI for equality with another object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEqualsTo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://gg:gaogao@wwwaaa:99/path1?query#fagment');
      let gaogao1 = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment123');
      let res = gaogao.equalsTo(gaogao1);
      expect(res).assertEqual(false);
    })

    /**
     * @tc.name   testEqualsTo005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0410
     * @tc.desc   Tests this URI for equality with another object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEqualsTo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
      let gaogao1 = new uri.URI('http://[1:0:0:1:2:1:2:1]/path1?query#fagment123');
      let res = gaogao.equalsTo(gaogao1);
      expect(res).assertEqual(false);
    })

    /**
     * @tc.name   testEqualsTo006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0420
     * @tc.desc   Tests for wrong input parameter type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEqualsTo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testEqualsTo006().split("|||");
      expect(parts[0]).assertEqual("BusinessError: Parameter error. The type of 666 must be URI");
      expect(parts[1]).assertEqual("401");
      expect(parts[2]).assertEqual("Parameter error. The type of 666 must be URI");
    })


    /**
     * @tc.name   testEqualsTo007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0430
     * @tc.desc   Tests for wrong input parameter type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEqualsTo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testEqualsTo007().split("|||");
      expect(parts[0]).assertEqual("BusinessError: Parameter error. The type of [object Object] must be URI");
      expect(parts[1]).assertEqual("401");
      expect(parts[2]).assertEqual("Parameter error. The type of [object Object] must be URI");
    })

    /**
     * @tc.name   testNormalize001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0440
     * @tc.desc   Tests Normalizes this URI's path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNormalize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path/66./../././mm/.././path1?query#fagment');
      let res = gaogao.normalize();
      expect(res.path).assertEqual("/path/path1");
      expect(res.toString()).assertEqual("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path/path1?query#fagment");
    })

    /**
     * @tc.name   testNormalize002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0450
     * @tc.desc   Tests Normalizes this URI's path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNormalize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../path?query#fagment');
      let res = gaogao.normalize();
      expect(res.path).assertEqual("/../../path");
      expect(res.toString()).assertEqual("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../path?query#fagment");
    })

    /**
     * @tc.name   testNormalize003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0460
     * @tc.desc   Tests Normalizes this URI's path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNormalize003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../path/.././../aa/bb/cc?query#fagment');
      let res = gaogao.normalize();
      expect(res.path).assertEqual("/../../../aa/bb/cc");
      expect(res.toString()).assertEqual("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../../aa/bb/cc?query#fagment");
    })

    /**
     * @tc.name   testNormalize004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0470
     * @tc.desc   Tests Normalizes this URI's path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNormalize004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../path/.././../aa/bb/cc?query');
      let res = gaogao.normalize();
      expect(res.path).assertEqual("/../../aa/bb/cc");
      expect(res.toString()).assertEqual("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../aa/bb/cc?query");
    })

    /**
     * @tc.name   testNormalize005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0480
     * @tc.desc   Tests Normalizes this URI's path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNormalize005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/./path/./aa/bb/cc?query#fagment');
      let res = gaogao.normalize();
      expect(res.path).assertEqual("/path/aa/bb/cc");
      expect(res.toString()).assertEqual("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path/aa/bb/cc?query#fagment");
    })

    /**
     * @tc.name   testToString001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0490
     * @tc.desc   Returns the content of this URI as a US-ASCII string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../path/.././../aa/bb/cc?query#fagment');
      let res = gaogao.toString();
      expect(res).assertEqual('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../path/.././../aa/bb/cc?query#fagment');
    })

    /**
     * @tc.name   testToString002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0500
     * @tc.desc   Returns the content of this URI as a US-ASCII string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('htt1p://gg:gaogao@[::192.9.5.5]:99/path/66path1?query#fagment');
      let res = gaogao.toString();
      expect(res).assertEqual('htt1p://gg:gaogao@[::192.9.5.5]:99/path/66path1?query#fagment');
    })

    /**
     * @tc.name   testToString003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0510
     * @tc.desc   Returns the content of this URI as a US-ASCII string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('ftp://username:password@www.baidu.com:88/path?query#fagment');
      let res = gaogao.toString();
      expect(res).assertEqual('ftp://username:password@www.baidu.com:88/path?query#fagment');
    })

    /**
     * @tc.name   testToString004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0520
     * @tc.desc   Returns the content of this URI as a US-ASCII string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://gg:gao你好gao@199.98.55.44:99/path/p你好ath?qu你好ery#fag你好ment');
      let res = gaogao.toString();
      expect(res).assertEqual('http://gg:gao%E4%BD%A0%E5%A5%BDgao@199.98.55.44:99/path/' +
        'p%E4%BD%A0%E5%A5%BDath?qu%E4%BD%A0%E5%A5%BDery#fag%E4%BD%A0%E5%A5%BDment');
    })

    /**
     * @tc.name   testToString005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0530
     * @tc.desc   Returns the content of this URI as a US-ASCII string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http://gg:gaogao@199.98.55.44:99/path/path?query#fagment');
      let res = gaogao.toString();
      expect(res).assertEqual('http://gg:gaogao@199.98.55.44:99/path/path?query#fagment');
    })

    /**
     * @tc.name   testCheckIsAbsolute001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0540
     * @tc.desc   Tells whether or not this URI is absolute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCheckIsAbsolute001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('f/tp://username:password@www.baidu.com:88/path?query#fagment');
      let res = gaogao.checkIsAbsolute();
      expect(res).assertEqual(false);
    })

    /**
     * @tc.name   testCheckIsAbsolute002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0550
     * @tc.desc   Tells whether or not this URI is absolute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCheckIsAbsolute002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('ftp://username:password@www.baidu.com:88/path?query#fagment');
      let res = gaogao.checkIsAbsolute();
      expect(res).assertEqual(true);
    })

    /**
     * @tc.name   testCheckIsAbsolute003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0560
     * @tc.desc   Tells whether or not this URI is absolute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCheckIsAbsolute003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('htt/p://username:password@www.baidu.com:88/path?query#fagment');
      let res = gaogao.checkIsAbsolute();
      expect(res).assertEqual(false);
    })

    /**
     * @tc.name   testCheckIsAbsolute004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0570
     * @tc.desc   Tells whether or not this URI is absolute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCheckIsAbsolute004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('https://username:password@www.baidu.com:88/path?query#fagment');
      let res = gaogao.checkIsAbsolute();
      expect(res).assertEqual(true);
    })

    /**
     * @tc.name   testCheckIsAbsolute005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0580
     * @tc.desc   Tells whether or not this URI is absolute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCheckIsAbsolute005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let gaogao = new uri.URI('http1://username:password@www.baidu.com:88/path?query#fagment');
      let res = gaogao.checkIsAbsolute();
      expect(res).assertEqual(true);
    })

    /**
     * @tc.name   testCheckRelative001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0590
     * @tc.desc   Tells whether or not this URI is relative.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCheckRelative001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let route = new uri.URI('http://www.test.com/images/pic.jpg');
      let res = route.checkRelative();
      expect(res).assertEqual(false);
    })

    /**
     * @tc.name   testCheckRelative002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0600
     * @tc.desc   Tells whether or not this URI is relative.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCheckRelative002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let route = new uri.URI('/images/pic.jpg');
      let res = route.checkRelative();
      expect(res).assertEqual(true);
    })

    /**
     * @tc.name   testCheckRelative003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0610
     * @tc.desc   Tells whether or not this URI is relative.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckRelative003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com/images/logo.jpg');
      let res = route.checkRelative();
      expect(res).assertEqual(false);
    })

    /**
     * @tc.name   testCheckRelative004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0620
     * @tc.desc   Tells whether or not this URI is relative.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckRelative004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('aaa');
      let res = route.checkRelative();
      expect(res).assertEqual(true);
    })

    /**
     * @tc.name   testCheckRelative005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0630
     * @tc.desc   Tells whether or not this URI is relative.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckRelative005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mailtoRoute = new uri.URI('mailto:user@test.com');
      expect(mailtoRoute.checkRelative()).assertEqual(false);
    })

    /**
     * @tc.name   testCheckOpaque001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0640
     * @tc.desc   Tells whether or not this URI is opaque.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckOpaque001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('http://www.test.com/images/pic.jpg');
      let res = route.checkOpaque();
      expect(res).assertEqual(false);
    })

    /**
     * @tc.name   testCheckOpaque002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0650
     * @tc.desc   Tells whether or not this URI is Opaque.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckOpaque002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('images/pic.jpg');
      let res = route.checkOpaque();
      expect(res).assertEqual(false);
    })

    /**
     * @tc.name   testCheckOpaque003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0660
     * @tc.desc   Tells whether or not this URI is Opaque.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckOpaque003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('mailto:user@test.com');
      expect(route.checkOpaque()).assertEqual(true);
    })

    /**
     * @tc.name   testCheckOpaque004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0670
     * @tc.desc   Tells whether or not this URI is Opaque.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckOpaque004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('tel:1234567890');
      let res = route.checkOpaque();
      expect(res).assertEqual(true);
    })

    /**
     * @tc.name   testCheckHierarchical001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0680
     * @tc.desc   Tells whether or not this URI is Opaque.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckHierarchical001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('http://www.test.com/images/pic.jpg');
      let res = route.checkHierarchical();
      expect(res).assertEqual(true);
    })

    /**
     * @tc.name   testCheckHierarchical002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0690
     * @tc.desc   Tells whether or not this URI is Opaque.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckHierarchical002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('mailto:test@test.com');
      let res = route.checkHierarchical();
      expect(res).assertEqual(false);
    })

    /**
     * @tc.name   testCheckHierarchical003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0700
     * @tc.desc   Tells whether or not this URI is Opaque.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckHierarchical003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('images/pic.jpg');
      let res = route.checkHierarchical();
      expect(res).assertEqual(true);
    })

    /**
     * @tc.name   testCheckHierarchical004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0710
     * @tc.desc   Tells whether or not this URI is Opaque.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckHierarchical004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('path');
      expect(route.checkHierarchical()).assertEqual(true);
      let testUri = new uri.URI('path:');
      expect(testUri.checkHierarchical()).assertEqual(false);
    })

    /**
     * @tc.name   testUriGetQueryValue001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0720
     * @tc.desc   Get specific query parameters from URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValue001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com?param1=value1&param2=value2');
      let param1Value = route.getQueryValue("param1");
      let param2Value = route.getQueryValue("param2");
      expect(param1Value).assertEqual('value1');
      expect(param2Value).assertEqual('value2');
    })

    /**
     * @tc.name   testUriGetQueryValue002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0730
     * @tc.desc   Get specific query parameters from URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValue002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com');
      expect(route.getQueryValue("param1")).assertEqual(null);
      let include = new uri.URI('https://www.test.com?param1=value1');
      expect(include.getQueryValue("param")).assertEqual(null);
    })

    /**
     * @tc.name   testUriGetQueryValue003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0740
     * @tc.desc   Get specific query parameters from URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValue003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com?param1=value1&param1=value2&param1=value3');
      let param1Value = route.getQueryValue("param1");
      expect(param1Value).assertEqual("value1");
      expect(route.getQueryValues("param1")[0]).assertEqual("value1");
    })

    /**
     * @tc.name   testUriGetQueryValue004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0750
     * @tc.desc   Get specific query parameters from URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValue004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com?param1=hello%20world');
      expect(route.getQueryValue("param1")).assertEqual("hello world");
      let specialSymbol = new uri.URI('https://www.test.com?param1=hello+world');
      expect(specialSymbol.getQueryValue("param1")).assertEqual("hello world");
    })

    /**
     * @tc.name   testUriGetQueryValue005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0760
     * @tc.desc   Get specific query parameters from URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValue005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com?param%201=hello');
      expect(route.getQueryValue("param 1")).assertEqual("hello");
      expect(route.getQueryValue("1")).assertNull();
      expect(route.getQueryValue(" 1")).assertNull();
    })

    /**
     * @tc.name   testUriGetQueryValue006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0770
     * @tc.desc   Get specific query parameters from URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValue006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com?param1=&param2=');
      expect(route.getQueryValue("param1")).assertEqual("");
      expect(route.getQueryValue("param2")).assertEqual("");
      let noNameUri = new uri.URI('https://www.test.com?=value');
      expect(noNameUri.getQueryValue("")).assertEqual("value");
    })

    /**
     * @tc.name   testUriGetQueryValue007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0780
     * @tc.desc   Get specific query parameters from URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValue007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let emptyParameter1 = new uri.URI('https://www.test.com?param1=value1&&param3=value3');
      expect(emptyParameter1.getQueryValue("")).assertEqual("");
      let emptyParameter12 = new uri.URI('https://www.test.com?param1=value1&');
      expect(emptyParameter12.getQueryValue("")).assertEqual("");
      let router = new uri.URI('https://www.test.com?');
      expect(router.getQueryValue("")).assertEqual(null);
    })


    /**
     * @tc.name   testUriAddQueryValue001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0790
     * @tc.desc   Add query parameters for URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriAddQueryValue001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com');
      let newRoute = route.addQueryValue("param1", "value1");
      expect(newRoute.getQueryValue("param1")).assertEqual("value1");
      expect(newRoute.toString()).assertEqual("https://www.test.com?param1=value1");
      let clearRoute = newRoute.clearQuery();
      expect(clearRoute.toString()).assertEqual("https://www.test.com");
    })


    /**
     * @tc.name   testUriAddQueryValue002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0800
     * @tc.desc   Add query parameters for URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriAddQueryValue002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com');
      let newRoute = route.addQueryValue("param1", "value1").addQueryValue("param2", "value2");
      expect(newRoute.getQueryValue('param1')).assertEqual("value1");
      expect(newRoute.getQueryValue('param2')).assertEqual("value2");
      expect(newRoute.toString()).assertEqual("https://www.test.com?param1=value1&param2=value2");
    })


    /**
     * @tc.name   testUriAddQueryValue003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0810
     * @tc.desc   Add query parameters for URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriAddQueryValue003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com');
      let newRoute = route.addQueryValue("param1", "hello world");
      expect(newRoute.toString()).assertEqual("https://www.test.com?param1=hello%20world");
      expect(newRoute.getQueryValue("param1")).assertEqual("hello world");
      let paramNames = newRoute.getQueryNames();
      expect(paramNames.length).assertEqual(1);
      expect(paramNames.values().next().value).assertEqual("param1");
    })


    /**
     * @tc.name   testUriAddQueryValue004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0820
     * @tc.desc   Add query parameters for URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriAddQueryValue004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com');
      let newRoute = route.addQueryValue("param1", "value1").addQueryValue("param1", "value2");
      expect(newRoute.toString()).assertEqual("https://www.test.com?param1=value1&param1=value2");
    })


    /**
     * @tc.name   testUriAddQueryValue005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0830
     * @tc.desc   Add query parameters for URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriAddQueryValue005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com');
      let newRoute = route.addQueryValue("param1", "value1").addQueryValue("param2", "null");
      expect(newRoute.toString()).assertEqual("https://www.test.com?param1=value1&param2=null");
      let values = newRoute.getQueryValues("param1");
      expect(values[0]).assertEqual("value1");
    })


    /**
     * @tc.name   testUriAddQueryValue006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0840
     * @tc.desc   Add query parameters for URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriAddQueryValue006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value = "value";
      let testUri = new uri.URI('https://www.test.com');
      let addQuery = testUri.addQueryValue("param", value);
      expect(addQuery.getQueryValue("param")).assertEqual(value);
      expect(addQuery.getQueryValues("param")[0]).assertEqual(value);
      expect(addQuery.toString()).assertEqual("https://www.test.com?param=value");
      value = "value1";
      let valueChange = testUri.addQueryValue("param", value);
      expect(valueChange.toString()).assertEqual("https://www.test.com?param=value1");
      let newChange = addQuery.addQueryValue("param", value);
      expect(newChange.toString()).assertEqual("https://www.test.com?param=value&param=value1");
    })


    /**
     * @tc.name   testUriAddQueryValue007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0850
     * @tc.desc   Add query parameters for URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriAddQueryValue007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com');
      let newRoute = route.addQueryValue("param 1", "value 1");
      expect(newRoute.getQueryValue("param 1")).assertEqual("value 1");
    })

    /**
     * @tc.name   testUriGetQueryNames001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0860
     * @tc.desc   Get the names of all query parameters in the URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryNames001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com?param1=value1&param2=value2');
      let paramNames = route.getQueryNames();
      expect(paramNames.length).assertEqual(2);
      expect(paramNames.values().next().value).assertEqual("param1");
    })

    /**
     * @tc.name   testUriGetQueryNames002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0870
     * @tc.desc   Get the names of all query parameters in the URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryNames002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com');
      let paramNames = route.getQueryNames();
      expect(paramNames.length).assertEqual(0);
    })

    /**
     * @tc.name   testUriGetQueryNames003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0880
     * @tc.desc   Get the names of all query parameters in the URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryNames003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com?param1=value1&&param3=value3');
      let paramNames = route.getQueryNames();
      let values = paramNames.values();
      expect(paramNames.length).assertEqual(3);
      expect(values.next().value).assertEqual("param1");
      expect(values.next().value).assertEqual("");
      expect(values.next().value).assertEqual("param3");
    })

    /**
     * @tc.name   testUriGetQueryNames004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0890
     * @tc.desc   Get the names of all query parameters in the URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryNames004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com?param1=value1&=value2&param3=value3');
      let paramNames = route.getQueryNames();
      expect(paramNames.length).assertEqual(3);
      let values = paramNames.values();
      expect(values.next().value).assertEqual("param1");
      expect(values.next().value).assertEqual("");
      expect(values.next().value).assertEqual("param3");
    })

    /**
     * @tc.name   testUriGetQueryNames005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0900
     * @tc.desc   Get the names of all query parameters in the URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryNames005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com?param1=value1&&&a&b=v&param3');
      let paramNames = route.getQueryNames();
      expect(paramNames.length).assertEqual(5);
      let values = paramNames.values();
      expect(values.next().value).assertEqual("param1");
      expect(values.next().value).assertEqual("");
      expect(values.next().value).assertEqual("a");
      expect(values.next().value).assertEqual("b");
      expect(values.next().value).assertEqual("param3");
    })

    /**
     * @tc.name   testUriGetQueryNames006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0910
     * @tc.desc   Get the names of all query parameters in the URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryNames006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com?param%201=value1');
      let paramNames = route.getQueryNames();
      expect(paramNames.length).assertEqual(1);
      expect(paramNames.values().next().value).assertEqual("param 1");
      let route1 = new uri.URI('https://www.test.com?param+1=value1');
      let paramNames1 = route1.getQueryNames();
      expect(paramNames1.length).assertEqual(1);
      expect(paramNames1.values().next().value).assertEqual("param+1");
    })


    /**
     * @tc.name   testUriGetQueryValues001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0920
     * @tc.desc   Get all parameters and their corresponding values in the URI query string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValues001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com/search?query=name&sort=asc&filter=f');
      let values = route.getQueryValues("query");
      expect(values.length).assertEqual(1);
    })


    /**
     * @tc.name   testUriGetQueryValues002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0930
     * @tc.desc   Get all parameters and their corresponding values in the URI query string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValues002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com/search?query=name');
      let values = route.getQueryValues("query");
      expect(values[0]).assertEqual("name");
    })


    /**
     * @tc.name   testUriGetQueryValues003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0940
     * @tc.desc   Get all parameters and their corresponding values in the URI query string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValues003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let emptyParameter1 = new uri.URI('https://www.test.com/search?query=');
      let result1 = emptyParameter1.getQueryValues("query");
      expect(result1.length).assertEqual(1);
      expect(result1[0]).assertEqual("");
      let emptyParameter2 = new uri.URI('https://www.test.com/search?=value&');
      let result2 = emptyParameter2.getQueryValues("");
      expect(result2[0]).assertEqual("value");
      expect(result2[1]).assertEqual("");
      let emptyParameter3 = new uri.URI('https://www.test.com?');
      let result3 = emptyParameter3.getQueryValues("");
      expect(result3.length).assertEqual(0);
      let emptyParameter4 = new uri.URI('https://www.test.com?param');
      let result4 = emptyParameter4.getQueryValues("param");
      expect(result4.length).assertEqual(1);
      expect(result4[0]).assertEqual("");
      let emptyParameter5 = new uri.URI('https://www.test.com?param1=value1&&param3=value3');
      let result5 = emptyParameter5.getQueryValues("");
      expect(result5[0]).assertEqual("");
    })


    /**
     * @tc.name   testUriGetQueryValues004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0950
     * @tc.desc   Get all parameters and their corresponding values in the URI query string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValues004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com/search');
      let values = route.getQueryValues("query");
      expect(values.length).assertEqual(0);
    })


    /**
     * @tc.name   testUriGetQueryValues005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0960
     * @tc.desc   Get all parameters and their corresponding values in the URI query string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValues005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com/search?query=my%20query');
      let values = route.getQueryValues("query");
      expect(values[0]).assertEqual("my query");
    })


    /**
     * @tc.name   testUriGetQueryValues006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0970
     * @tc.desc   Get all parameters and their corresponding values in the URI query string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValues006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com/search?query=name&query=my');
      let values = route.getQueryValues("query");
      expect(values[0]).assertEqual("name");
      expect(values[1]).assertEqual("my");
    })


    /**
     * @tc.name   testUriGetQueryValues007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0980
     * @tc.desc   Get all parameters and their corresponding values in the URI query string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValues007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com?query=hello+world');
      let values = route.getQueryValues("query");
      expect(values[0]).assertEqual("hello+world");
    })


    /**
     * @tc.name   testUriGetQueryValues008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0990
     * @tc.desc   Get all parameters and their corresponding values in the URI query string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValues008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route1 = new uri.URI('https://www.test.com?param_g=value_1');
      let values1 = route1.getQueryValues("param_g");
      expect(values1[0]).assertEqual("value_1");
      expect(route1.getQueryValue('param_g')).assertEqual("value_1");
    })

    /**
     * @tc.name   testUriGetBooleanQueryValue001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1000
     * @tc.desc   Get the Boolean value of the URI query parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetBooleanQueryValue001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com/search?active=true');
      let isActive = route.getBooleanQueryValue("active", false);
      expect(isActive).assertEqual(true);
    })

    /**
     * @tc.name   testUriGetBooleanQueryValue002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1010
     * @tc.desc   Get the Boolean value of the URI query parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetBooleanQueryValue002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com/search');
      let isActive = route.getBooleanQueryValue("active", false);
      expect(isActive).assertEqual(false);
    })

    /**
     * @tc.name   testUriGetBooleanQueryValue003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1020
     * @tc.desc   Get the Boolean value of the URI query parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetBooleanQueryValue003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com/search?active=name');
      let isActive = route.getBooleanQueryValue("active", false);
      expect(isActive).assertEqual(true);
    })

    /**
     * @tc.name   testUriGetBooleanQueryValue004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1030
     * @tc.desc   Get the Boolean value of the URI query parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetBooleanQueryValue004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com/search');
      let isActive = route.getBooleanQueryValue("active", true);
      expect(isActive).assertEqual(true);
    })

    /**
     * @tc.name   testUriGetBooleanQueryValue005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1040
     * @tc.desc   Get the Boolean value of the URI query parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetBooleanQueryValue005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com/search?active=true&active=false');
      let isActive = route.getBooleanQueryValue("active", false);
      expect(isActive).assertEqual(true);
      let uriInstance1 = new uri.URI("https://www.test.com/search?active=aa&active=false");
      expect(uriInstance1.getBooleanQueryValue("active", false)).assertEqual(true);
      let uriInstance2 = new uri.URI("https://www.test.com/search?active=0");
      expect(uriInstance2.getBooleanQueryValue("active", true)).assertEqual(false);
    })

    /**
     * @tc.name   testUriClearQuery001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1050
     * @tc.desc   Clear URI query parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriClearQuery001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com');
      let newRoute = route.clearQuery();
      expect(newRoute.toString()).assertEqual("https://www.test.com");
    })

    /**
     * @tc.name   testUriClearQuery002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1060
     * @tc.desc   Clear URI query parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriClearQuery002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com?param1=value1');
      let newRoute = route.clearQuery();
      expect(newRoute.toString()).assertEqual("https://www.test.com");
    })

    /**
     * @tc.name   testUriClearQuery003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1070
     * @tc.desc   Clear URI query parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriClearQuery003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com?param1=value1%');
      let newRoute = route.clearQuery();
      expect(newRoute.toString()).assertEqual("https://www.test.com");
    })

    /**
     * @tc.name   testUriClearQuery004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1080
     * @tc.desc   Clear URI query parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriClearQuery004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com?param1=value1&param1=value2');
      let newRoute = route.clearQuery();
      expect(newRoute.toString()).assertEqual("https://www.test.com");
    })

    /**
     * @tc.name   testUriGetLastSegment001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1090
     * @tc.desc   Get the last segment of URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetLastSegment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('content://com.test.uri/files/image.jpg');
      let lastSegment = route.getLastSegment();
      expect(lastSegment).assertEqual("image.jpg");
    })

    /**
     * @tc.name   testUriGetLastSegment002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1100
     * @tc.desc   Get the last segment of URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetLastSegment002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('content://com.test.uri/');
      let lastSegment = route.getLastSegment();
      expect(lastSegment).assertEqual("");
    })

    /**
     * @tc.name   testUriGetLastSegment003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1110
     * @tc.desc   Get the last segment of URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetLastSegment003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('content://com.test.uri');
      let lastSegment = route.getLastSegment();
      expect(lastSegment).assertEqual("");
    })

    /**
     * @tc.name   testUriGetLastSegment004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1120
     * @tc.desc   Get the last segment of URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetLastSegment004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('content://com.test.uri/files/');
      let lastSegment = route.getLastSegment();
      expect(lastSegment).assertEqual("files");
    })

    /**
     * @tc.name   testUriGetLastSegment005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1130
     * @tc.desc   Get the last segment of URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetLastSegment005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('content://com.test.uri/files/my%20file.jpg');
      let lastSegment = route.getLastSegment();
      expect(lastSegment).assertEqual("my file.jpg");
    })

    /**
     * @tc.name   testUriGetLastSegment006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1140
     * @tc.desc   Get the last segment of URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetLastSegment006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('content://com.test.uri/files/my+file.jpg');
      let lastSegment = route.getLastSegment();
      expect(lastSegment).assertEqual("my+file.jpg");
    })

    /**
     * @tc.name   testUriGetSegment007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1150
     * @tc.desc   Get all segments in the URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetSegment007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('content://com.test.uri/files/a a');
      let segments = route.getSegment();
      expect(segments.toString()).assertEqual("files,a a")
    })

    /**
     * @tc.name   testUriGetSegment001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1160
     * @tc.desc   Get all segments in the URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetSegment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('content://com.test.uri/files/images');
      let segments = route.getSegment();
      expect(segments.length).assertEqual(2);
      expect(segments[0]).assertEqual("files");
      expect(segments[1]).assertEqual("images");
    })

    /**
     * @tc.name   testUriGetSegment002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1170
     * @tc.desc   Get all segments in the URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetSegment002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('content://com.test.uri/');
      let segments = route.getSegment();
      expect(segments.length).assertEqual(0);
    })

    /**
     * @tc.name   testUriGetSegment003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1180
     * @tc.desc   Get all segments in the URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetSegment003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('content://com.test.uri/files/');
      let segments = route.getSegment();
      expect(segments.length).assertEqual(1);
    })

    /**
     * @tc.name   testUriGetSegment004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1190
     * @tc.desc   Get all segments in the URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetSegment004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('content://com.test.uri');
      let segments = route.getSegment();
      expect(segments.length).assertEqual(0);
      let mailRoute = new uri.URI('mailto:people');
      expect(mailRoute.getSegment().length).assertEqual(0);
    })

    /**
     * @tc.name   testUriGetSegment005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1200
     * @tc.desc   Get all segments in the URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetSegment005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('content://com.test.uri/files/a%20a/b%20b');
      let segments = route.getSegment();
      expect(segments[0]).assertEqual("files");
      expect(segments[1]).assertEqual("a a");
      expect(segments[2]).assertEqual("b b");
    })

    /**
     * @tc.name   testUriGetSegment006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1210
     * @tc.desc   Get all segments in the URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetSegment006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('http://www.test.com/path/to/image.jpg');
      let segments = route.getSegment();
      expect(segments[2]).assertEqual("image.jpg");
    })

    /**
     * @tc.name   testUriAddSegment001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1220
     * @tc.desc   Add a path segment to the URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriAddSegment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('http://www.test.com/');
      let newRoute = route.addSegment("files").addSegment("image.jpg");
      expect(newRoute.toString()).assertEqual("http://www.test.com/files/image.jpg");
      expect(newRoute.getLastSegment()).assertEqual("image.jpg");
    })

    /**
     * @tc.name   testUriAddSegment002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1230
     * @tc.desc   Add a path segment to the URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriAddSegment002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route1 = new uri.URI('http://www.test.com');
      let newRoute1 = route1.addSegment("files").addSegment("my image.jpg");
      expect(newRoute1.toString()).assertEqual("http://www.test.com/files/my%20image.jpg");
      let route2 = new uri.URI('http://www.test.com');
      let newRoute2 = route2.addSegment("files").addSegment("my+image.jpg");
      expect(newRoute2.toString()).assertEqual("http://www.test.com/files/my%2Bimage.jpg");
      let route3 = new uri.URI('http://www.test.com');
      let newRoute3 = route3.addSegment("files").addSegment("my%20image.jpg");
      expect(newRoute3.toString()).assertEqual("http://www.test.com/files/my%2520image.jpg");
    })

    /**
     * @tc.name   testUriAddSegment003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1240
     * @tc.desc   Add a path segment to the URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriAddSegment003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('http://www.test.com');
      let newRoute = route.addSegment("files");
      expect(newRoute.getLastSegment()).assertEqual("files");
      expect(newRoute.getSegment().length).assertEqual(1);
    })

    /**
     * @tc.name   testUriAddEncodedSegment001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1250
     * @tc.desc   Encode the path segment and add it to the URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriAddEncodedSegment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('http://www.test.com');
      let newRoute = route.addEncodedSegment("files").addEncodedSegment("image.jpg");
      expect(newRoute.getSegment()[1]).assertEqual("image.jpg");
    })

    /**
     * @tc.name   testUriAddEncodedSegment002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1260
     * @tc.desc   Encode the path segment and add it to the URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriAddEncodedSegment002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route1 = new uri.URI('http://www.test.com?param%2B1=value1&param+2=value%202#fra+gemnt');
      let newRoute1 = route1.addSegment("my+files").addEncodedSegment("my+image.jpg");
      expect(newRoute1.toString())
        .assertEqual("http://www.test.com/my%2Bfiles/my+image.jpg?param%2B1=value1&param+2=value%202#fra+gemnt");
      expect(newRoute1.encodedUserInfo).assertEqual(null);
      expect(newRoute1.encodedPath).assertEqual("/my%2Bfiles/my+image.jpg");
      expect(newRoute1.encodedQuery).assertEqual('param%2B1=value1&param+2=value%202');
      expect(newRoute1.encodedFragment).assertEqual("fra+gemnt");
      expect(newRoute1.encodedAuthority).assertEqual("www.test.com");
      expect(newRoute1.encodedSSP)
        .assertEqual("//www.test.com/my%2Bfiles/my+image.jpg?param%2B1=value1&param+2=value%202");
      let route2 = new uri.URI('http://www.test.com/');
      let newRoute2 = route2.addSegment("my files").addEncodedSegment("my%20image.jpg");
      expect(newRoute2.toString()).assertEqual("http://www.test.com/my%20files/my%20image.jpg");
      expect(newRoute2.encodedUserInfo).assertEqual(null);
      expect(newRoute2.encodedPath).assertEqual("/my%20files/my%20image.jpg");
      expect(newRoute2.encodedQuery).assertEqual(null);
      expect(newRoute2.encodedFragment).assertEqual(null);
      expect(newRoute2.encodedAuthority).assertEqual("www.test.com");
      expect(newRoute2.encodedSSP).assertEqual("//www.test.com/my%20files/my%20image.jpg");
      let route3 = new uri.URI('http://username:my%20name@www.test.com/');
      let newRoute3 = route3.addSegment("my%2Bfiles").addEncodedSegment("my%2Bimage.jpg");
      expect(newRoute3.toString()).assertEqual("http://username:my%20name@www.test.com/my%252Bfiles/my%2Bimage.jpg");
      expect(newRoute3.encodedUserInfo).assertEqual("username:my%20name");
      expect(newRoute3.encodedPath).assertEqual("/my%252Bfiles/my%2Bimage.jpg");
      expect(newRoute3.encodedQuery).assertEqual(null);
      expect(newRoute3.encodedFragment).assertEqual(null);
      expect(newRoute3.encodedAuthority).assertEqual("username:my%20name@www.test.com");
      expect(newRoute3.encodedSSP).assertEqual("//username:my%20name@www.test.com/my%252Bfiles/my%2Bimage.jpg");
    })

    /**
     * @tc.name   testUriAddEncodedSegment003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1270
     * @tc.desc   Encode the path segment and add it to the URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriAddEncodedSegment003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('http://www.test.com/');
      let newRoute = route.addEncodedSegment("my files");
      expect(newRoute.toString()).assertEqual("http://www.test.com/my%20files");
    })

    /**
     * @tc.name   testUriCreateFromParts001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1280
     * @tc.desc   Build a new URI object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriCreateFromParts001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = uri.URI.createFromParts("http", "", "fragment");
      expect(route.toString()).assertEqual("http:#fragment");
    })

    /**
     * @tc.name   testUriCreateFromParts002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1290
     * @tc.desc   Build a new URI object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriCreateFromParts002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = uri.URI.createFromParts("mailto", "no body", "top");
      expect(route.toString()).assertEqual("mailto:no%20body#top");
    })

    /**
     * @tc.name   testUriCreateFromParts003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1300
     * @tc.desc   Build a new URI object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriCreateFromParts003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = uri.URI.createFromParts("foo", "", "");
      expect(route.toString()).assertEqual("foo:");
      try {
        uri.URI.createFromParts("", "", "");
        expect().assertFail();
      } catch (err) {
        expect(err.toString())
          .assertEqual(
            "BusinessError: Syntax Error. Invalid Uri string: The Scheme the first character must be a letter");
        expect(err.code).assertEqual(10200002);
        expect(err.message)
          .assertEqual("Syntax Error. Invalid Uri string: The Scheme the first character must be a letter");
      }
      try {
        uri.URI.createFromParts(null, null, null);
        expect().assertFail();
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of null must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of null must be string");
      }
      try {
        uri.URI.createFromParts("foo", null, "fragment");
        expect().assertFail();
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of null must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of null must be string");
      }
    })

    /**
     * @tc.name   testUriCreateFromParts004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1310
     * @tc.desc   Build a new URI object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriCreateFromParts004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let scheme = "https";
      let ssp = "www.test.com";
      let fragment = "fragment";
      let route = uri.URI.createFromParts(scheme, ssp, fragment);
      expect(route.toString()).assertEqual("https:www.test.com#fragment");
    })

    /**
     * @tc.name   testUriEncodedUserInfo001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1320
     * @tc.desc   Encoded URI user information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedUserInfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('http://username:name@www.test.com/');
      expect(route.encodedUserInfo).assertEqual("username:name");
    })

    /**
     * @tc.name   testUriEncodedUserInfo002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1330
     * @tc.desc   Encoded URI user information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedUserInfo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('http://username:@www.test.com/');
      expect(route.encodedUserInfo).assertEqual("username:");
    })

    /**
     * @tc.name   testUriEncodedUserInfo003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1340
     * @tc.desc   Encoded URI user information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedUserInfo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('http://username:my%20name@www.test.com/');
      expect(route.encodedUserInfo).assertEqual("username:my%20name");
    })

    /**
     * @tc.name   testUriEncodedUserInfo004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1350
     * @tc.desc   Encoded URI user information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedUserInfo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('http://www.test.com');
      expect(route.encodedUserInfo).assertEqual(null);
      let mailRoute = new uri.URI('mailto:body');
      expect(mailRoute.encodedUserInfo).assertEqual(null);
    })

    /**
     * @tc.name   testUriEncodedPath001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1360
     * @tc.desc   Encoded URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedPath001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('http://www.test.com/file/image.jpg');
      expect(route.encodedPath).assertEqual("/file/image.jpg");
    })

    /**
     * @tc.name   testUriEncodedPath002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1370
     * @tc.desc   Encoded URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedPath002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('http://www.test.com/');
      expect(route.encodedPath).assertEqual("/");
    })

    /**
     * @tc.name   testUriEncodedPath003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1380
     * @tc.desc   Encoded URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedPath003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('http://www.test.com');
      expect(route.encodedPath).assertEqual(null);
      let mailRoute = new uri.URI('mailto:body');
      expect(mailRoute.encodedPath).assertEqual(null);
    })

    /**
     * @tc.name   testUriEncodedPath004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1390
     * @tc.desc   Encoded URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedPath004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('http://www.test.com/my%20file');
      expect(route.encodedPath).assertEqual("/my%20file");
    })

    /**
     * @tc.name   testUriUriEncodedQuery001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1400
     * @tc.desc   Encoded URI parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriEncodedQuery001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com/search?query=name&query=my');
      expect(route.encodedQuery).assertEqual("query=name&query=my");
    })

    /**
     * @tc.name   testUriUriEncodedQuery002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1410
     * @tc.desc   Encoded URI parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriEncodedQuery002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com/search?');
      expect(route.encodedQuery).assertEqual(null);
    })

    /**
     * @tc.name   testUriUriEncodedQuery003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1420
     * @tc.desc   Encoded URI parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriEncodedQuery003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com/');
      expect(route.encodedQuery).assertEqual(null);
    })

    /**
     * @tc.name   testUriUriEncodedQuery004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1430
     * @tc.desc   Encoded URI parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriEncodedQuery004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com/search?query=my%20test');
      expect(route.encodedQuery).assertEqual("query=my%20test");
    })

    /**
     * @tc.name   testUriEncodedFragment001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1440
     * @tc.desc   Encoded URI fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedFragment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('mailto:body#top');
      expect(route.encodedFragment).assertEqual("top");
    })

    /**
     * @tc.name   testUriEncodedFragment002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1450
     * @tc.desc   Encoded URI fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedFragment002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('mailto:body#');
      expect(route.encodedFragment).assertEqual(null);
    })

    /**
     * @tc.name   testUriEncodedFragment003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1460
     * @tc.desc   Encoded URI fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedFragment003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('mailto:body#te%20st');
      expect(route.encodedFragment).assertEqual("te%20st");
    })

    /**
     * @tc.name   testUriEncodedFragment004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1470
     * @tc.desc   Encoded URI fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedFragment004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('mailto:body');
      expect(route.encodedFragment).assertEqual(null);
    })

    /**
     * @tc.name   testUriEncodedAuthority001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1480
     * @tc.desc   Encoded resource location information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedAuthority001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com/search?query=name&query=my');
      expect(route.encodedAuthority).assertEqual("www.test.com");
    })

    /**
     * @tc.name   testUriEncodedAuthority002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1490
     * @tc.desc   Encoded resource location information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedAuthority002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('http://username:my%20name@www.test.com/');
      expect(route.encodedAuthority).assertEqual("username:my%20name@www.test.com");
    })

    /**
     * @tc.name   testUriEncodedAuthority003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1500
     * @tc.desc   Encoded resource location information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedAuthority003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('mailto:body#top');
      expect(route.encodedAuthority).assertEqual(null);
    })

    /**
     * @tc.name   testUriEncodedAuthority004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1510
     * @tc.desc   Encoded resource location information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedAuthority004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com:8080/');
      expect(route.encodedAuthority).assertEqual("www.test.com:8080");
    })

    /**
     * @tc.name   testUriEncodedSSP001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1520
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedSSP001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('http://username:name@www.test.com/path?query=example');
      expect(route.encodedSSP).assertEqual("//username:name@www.test.com/path?query=example");
    })

    /**
     * @tc.name   testUriEncodedSSP002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1530
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedSSP002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('http://username:my%20name@www.test.com');
      expect(route.encodedSSP).assertEqual("//username:my%20name@www.test.com");
      let route1 = new uri.URI('http://username:my_20name@www.test.com');
      expect(route1.encodedSSP).assertEqual("//username:my_20name@www.test.com");
    })

    /**
     * @tc.name   testUriEncodedSSP003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1540
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedSSP003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let route = new uri.URI('https://www.test.com/');
      expect(route.encodedSSP).assertEqual("//www.test.com/");
    })

    /**
     * @tc.name   testCreateFromPartsPara001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1550
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateFromPartsPara001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testCreateFromPartsPara001().split("|||");
      expect(parts[0]).assertEqual("BusinessError: Parameter error. The type of 1 must be string");
      expect(parts[1]).assertEqual("401");
      expect(parts[2]).assertEqual("Parameter error. The type of 1 must be string");
    })

    /**
     * @tc.name   testCreateFromPartsPara002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1560
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateFromPartsPara002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testCreateFromPartsPara002().split("|||");
      expect(parts[0]).assertEqual("BusinessError: Parameter error. The type of 1 must be string");
      expect(parts[1]).assertEqual("401");
      expect(parts[2]).assertEqual("Parameter error. The type of 1 must be string");
    })

    /**
     * @tc.name   testCreateFromPartsPara003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1570
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateFromPartsPara003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testCreateFromPartsPara003().split("|||");
      expect(parts[0]).assertEqual("BusinessError: Parameter error. The type of 1 must be string");
      expect(parts[1]).assertEqual("401");
      expect(parts[2]).assertEqual("Parameter error. The type of 1 must be string");
    })

    /**
     * @tc.name   testAddQueryValuePara001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1580
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddQueryValuePara001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testAddQueryValuePara001().split("|||");
      expect(parts[0]).assertEqual("BusinessError: Parameter error. The type of 1 must be string");
      expect(parts[1]).assertEqual("401");
      expect(parts[2]).assertEqual("Parameter error. The type of 1 must be string");
    })

    /**
     * @tc.name   testAddQueryValuePara002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1590
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddQueryValuePara002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testAddQueryValuePara002().split("|||");
      expect(parts[0]).assertEqual("BusinessError: Parameter error. The type of 1 must be string");
      expect(parts[1]).assertEqual("401");
      expect(parts[2]).assertEqual("Parameter error. The type of 1 must be string");
    })

    /**
     * @tc.name   testAddEncodedSegmentPara001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1600
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddEncodedSegmentPara001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testAddEncodedSegmentPara001().split("|||");
      expect(parts[0]).assertEqual("BusinessError: Parameter error. The type of 1 must be string");
      expect(parts[1]).assertEqual("401");
      expect(parts[2]).assertEqual("Parameter error. The type of 1 must be string");
    })

    /**
     * @tc.name   testAddSegmentPara001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1610
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddSegmentPara001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testAddSegmentPara001().split("|||");
      expect(parts[0]).assertEqual("BusinessError: Parameter error. The type of 1 must be string");
      expect(parts[1]).assertEqual("401");
      expect(parts[2]).assertEqual("Parameter error. The type of 1 must be string");
    })

    /**
     * @tc.name   testGetQueryValuePara001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1620
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetQueryValuePara001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testGetQueryValuePara001().split("|||");
      expect(parts[0]).assertEqual("BusinessError: Parameter error. The type of 2 must be string");
      expect(parts[1]).assertEqual("401");
      expect(parts[2]).assertEqual("Parameter error. The type of 2 must be string");
    })

    /**
     * @tc.name   testGetQueryValuesPara001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1630
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetQueryValuesPara001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testGetQueryValuesPara001().split("|||");
      expect(parts[0]).assertEqual("BusinessError: Parameter error. The type of 2 must be string");
      expect(parts[1]).assertEqual("401");
      expect(parts[2]).assertEqual("Parameter error. The type of 2 must be string");
    })

    /**
     * @tc.name   testGetBooleanQueryValuePara001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1640
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetBooleanQueryValuePara001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testGetBooleanQueryValuePara001().split("|||");
      expect(parts[0]).assertEqual("BusinessError: Parameter error. The type of 2 must be string");
      expect(parts[1]).assertEqual("401");
      expect(parts[2]).assertEqual("Parameter error. The type of 2 must be string");
    })

    /**
     * @tc.name   testGetBooleanQueryValuePara002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1650
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetBooleanQueryValuePara002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testGetBooleanQueryValuePara002().split("|||");
      expect(parts[0]).assertEqual("BusinessError: Parameter error. The type of param_g must be boolean");
      expect(parts[1]).assertEqual("401");
      expect(parts[2]).assertEqual("Parameter error. The type of param_g must be boolean");
    })
    /**
     * @tc.name   testTildeUnderline001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1660
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTildeUnderline001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriTest = new uri.URI('http://www.bian~_cheng.net/inde~_x?param=10~_!*&para~_m1=20!-~_');
      expect(uriTest.host).assertEqual('www.bian~_cheng.net');
      expect(uriTest.path).assertEqual('/inde~_x');
      expect(uriTest.query).assertEqual('param=10~_!*&para~_m1=20!-~_');
      expect(uriTest.authority).assertEqual('www.bian~_cheng.net');
      expect(uriTest.ssp).assertEqual('//www.bian~_cheng.net/inde~_x?param=10~_!*&para~_m1=20!-~_');
      expect(uriTest.encodedPath).assertEqual('/inde~_x');
      expect(uriTest.encodedQuery).assertEqual('param=10~_!*&para~_m1=20!-~_');
      expect(uriTest.encodedAuthority).assertEqual('www.bian~_cheng.net');
      expect(uriTest.encodedSSP).assertEqual('//www.bian~_cheng.net/inde~_x?param=10~_!*&para~_m1=20!-~_');
    })
    /**
     * @tc.name   testTildeUnderline002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1670
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTildeUnderline002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriTest = new uri.URI('http://www.bian_cheng.net/inde_x?param=10_!*&para_m1=20!-_');
      expect(uriTest.host).assertEqual('www.bian_cheng.net');
      expect(uriTest.path).assertEqual('/inde_x');
      expect(uriTest.query).assertEqual('param=10_!*&para_m1=20!-_');
      expect(uriTest.authority).assertEqual('www.bian_cheng.net');
      expect(uriTest.ssp).assertEqual('//www.bian_cheng.net/inde_x?param=10_!*&para_m1=20!-_');
      expect(uriTest.encodedPath).assertEqual('/inde_x');
      expect(uriTest.encodedQuery).assertEqual('param=10_!*&para_m1=20!-_');
      expect(uriTest.encodedAuthority).assertEqual('www.bian_cheng.net');
      expect(uriTest.encodedSSP).assertEqual('//www.bian_cheng.net/inde_x?param=10_!*&para_m1=20!-_');
    })
    /**
     * @tc.name   testTildeUnderline003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1680
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTildeUnderline003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriTest = new uri.URI('http://www.bian~cheng.net/inde~x?param=10~!*&para~m1=20!-~');
      expect(uriTest.host).assertEqual('www.bian~cheng.net');
      expect(uriTest.path).assertEqual('/inde~x');
      expect(uriTest.query).assertEqual('param=10~!*&para~m1=20!-~');
      expect(uriTest.authority).assertEqual('www.bian~cheng.net');
      expect(uriTest.ssp).assertEqual('//www.bian~cheng.net/inde~x?param=10~!*&para~m1=20!-~');
      expect(uriTest.encodedPath).assertEqual('/inde~x');
      expect(uriTest.encodedQuery).assertEqual('param=10~!*&para~m1=20!-~');
      expect(uriTest.encodedAuthority).assertEqual('www.bian~cheng.net');
      expect(uriTest.encodedSSP).assertEqual('//www.bian~cheng.net/inde~x?param=10~!*&para~m1=20!-~');
    })

    /**
     * @tc.name   testAddQueryJson001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1690
     * @tc.desc   URI query add json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddQueryJson001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriTest = new uri.URI('aaa://drive/page?need=false&bbb=true');
      let newUri = uriTest.addQueryValue("data", '{"type": 0, "from": "from"}');
      expect(newUri.toString())
        .assertEqual(
          'aaa://drive/page?need=false&bbb=true&data=%7B%22type%22%3A%200%2C%20%22from%22%3A%20%22from%22%7D');
      expect(newUri.query).assertEqual('need=false&bbb=true&data={"type": 0, "from": "from"}');
      expect(newUri.getQueryValue('data')).assertEqual('{"type": 0, "from": "from"}');
      expect(newUri.encodedQuery)
        .assertEqual('need=false&bbb=true&data=%7B%22type%22%3A%200%2C%20%22from%22%3A%20%22from%22%7D');
    })

    /**
     * @tc.name   testCreateFromPartsPara004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1700
     * @tc.desc   Abnormal parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateFromPartsPara004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        uri.URI.createFromParts(null, "bbb", "ccc");
        expect().assertFail();
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of null must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of null must be string");
      }
      try {
        uri.URI.createFromParts("aaa", null, "ccc");
        expect().assertFail();
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of null must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of null must be string");
      }
      try {
        uri.URI.createFromParts("aaa", "bbb", null);
        expect().assertFail();
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of null must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of null must be string");
      }
    })

    /**
     * @tc.name   testAddQueryValuePara003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1710
     * @tc.desc   Abnormal parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddQueryValuePara003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let route = new uri.URI('https://www.test.com');
        route.addQueryValue("param", null);
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of null must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of null must be string");
      }
      try {
        let route = new uri.URI('https://www.test.com');
        route.addQueryValue(null, "value");
        expect().assertFail();
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of null must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of null must be string");
      }
    })

    /**
     * @tc.name   testAddEncodedSegmentPara002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1720
     * @tc.desc   Abnormal parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddEncodedSegmentPara002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let route = new uri.URI('https://www.test.com');
        route.addEncodedSegment(null);
        expect().assertFail();
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of null must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of null must be string");
      }
    })

    /**
     * @tc.name   testAddSegmentPara002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1730
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddSegmentPara002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let route = new uri.URI('https://www.test.com');
        route.addSegment(null);
        expect().assertFail();
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of null must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of null must be string");
      }
    })

    /**
     * @tc.name   testGetQueryValuePara002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1740
     * @tc.desc   Abnormal parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetQueryValuePara002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let route1 = new uri.URI('https://www.test.com?param_g=value_1');
        route1.getQueryValue(null);
        expect().assertFail();
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of null must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of null must be string");
      }
    })

    /**
     * @tc.name   testGetQueryValuesPara002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1750
     * @tc.desc   Abnormal parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetQueryValuesPara002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let route1 = new uri.URI('https://www.test.com?param_g=value_1');
        route1.getQueryValues(null);
        expect().assertFail();
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of null must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of null must be string");
      }
    })

    /**
     * @tc.name   testGetBooleanQueryValuePara003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1760
     * @tc.desc   Abnormal parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetBooleanQueryValuePara003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let route1 = new uri.URI('https://www.test.com?param_g=value_1');
        route1.getBooleanQueryValue("param_g", null);
        expect().assertFail();
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of param_g must be boolean");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of param_g must be boolean");
      }
      try {
        let route1 = new uri.URI('https://www.test.com?param_g=value_1');
        route1.getBooleanQueryValue(null, true);
        expect().assertFail();
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of null must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of null must be string");
      }
    })
    /**
     * @tc.name   testConstructorJson001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1770
     * @tc.desc   URI constructor json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstructorJson001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("testUri://testHost/testNumPage?need=false&bbb=true&data={\"aaa\":0,\"bbb\":\"ccc\"}");
      expect(uriObj.query).assertEqual('need=false&bbb=true&data={"aaa":0,"bbb":"ccc"}');
      expect(JSON.parse(uriObj.getQueryValue('data')).aaa).assertEqual(0);
      expect(JSON.parse(uriObj.getQueryValue('data')).bbb).assertEqual('ccc');
    })
    /**
     * @tc.name   testSpecialCharacters001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1780
     * @tc.desc   URI Special Characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpecialCharacters001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriStr =
        "hta{}_b- c|~d!a$b&c=d+e,;'()*vvtp://www.bi an'|{}()$~,;*!_-+:80/index?par(,;/) '_$:?+a{}|m=10-!*&pa ra~m1=20!-~#par(,;/) '_$:?+a{}|m=10-!*&para~m1=20!-~";
      let newUri = new uri.URI(uriStr);
      expect(newUri.scheme).assertEqual("hta{}_b- c|~d!a$b&c=d+e,;'()*vvtp");
      expect(newUri.getSegment()[0]).assertEqual("index");
      expect(newUri.query).assertEqual("par(,;/) '_$:?+a{}|m=10-!*&pa ra~m1=20!-~");
      expect(newUri.ssp).assertEqual("//www.bi an'|{}()$~,;*!_-+:80/index?par(,;/) '_$:?+a{}|m=10-!*&pa ra~m1=20!-~");
      expect(newUri.authority).assertEqual("www.bi an'|{}()$~,;*!_-+:80");
      expect(newUri.fragment).assertEqual("par(,;/) '_$:?+a{}|m=10-!*&para~m1=20!-~");
      expect(newUri.host).assertEqual("www.bi an'|{}()$~,;*!_-+");
      expect(newUri.userInfo).assertEqual(null);
      expect(newUri.port).assertEqual("80");
    })
    /**
     * @tc.name   testspecialPort001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1790
     * @tc.desc   URI Special Characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testspecialPort001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriStr = "http://publickinfo:-1";
      let newUri = new uri.URI(uriStr);
      expect(newUri.toString()).assertEqual("http://publickinfo:-1");
      expect(newUri.port).assertEqual("-1");
      expect(newUri.host).assertEqual(null);
      expect(newUri.authority).assertEqual("publickinfo:-1");
    })
    /**
     * @tc.name   testspecialPort002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1800
     * @tc.desc   URI Special Characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testspecialPort002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriStr = "http://publickinfo:2147483647";
      let newUri = new uri.URI(uriStr);
      expect(newUri.toString()).assertEqual("http://publickinfo:2147483647");
      expect(newUri.port).assertEqual("2147483647");
      expect(newUri.host).assertEqual('publickinfo');
      expect(newUri.authority).assertEqual("publickinfo:2147483647");
    })
    /**
     * @tc.name   testspecialPort003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1810
     * @tc.desc   URI Special Characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testspecialPort003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriStr = "http://publickinfo:600000000332";
      let newUri = new uri.URI(uriStr);
      expect(newUri.toString()).assertEqual("http://publickinfo:600000000332");
      expect(newUri.port).assertEqual("-1");
      expect(newUri.host).assertEqual(null);
      expect(newUri.authority).assertEqual("publickinfo:600000000332");
    })
    /**
     * @tc.name   testspecialPort004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1820
     * @tc.desc   URI Special Characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testspecialPort004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriStr = "http://publickinfo:0";
      let newUri = new uri.URI(uriStr);
      expect(newUri.toString()).assertEqual("http://publickinfo:0");
      expect(newUri.port).assertEqual("0");
      expect(newUri.host).assertEqual("publickinfo");
      expect(newUri.authority).assertEqual("publickinfo:0");
    })

    /**
     * @tc.name   testUriConstruction032
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1830
     * @tc.desc   URI Special Characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriConstruction032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let that = new uri.URI('ht/tp://username:pas sword@host:8080/di[rectory/file?foo=1&bar=2');
        expect().assertFail();
      } catch (err) {
        expect(err.toString())
          .assertEqual("BusinessError: Syntax Error. Invalid Uri string: The SpecialPath does not conform to the rule");
        expect(err.code).assertEqual(10200002)
        expect(err.message)
          .assertEqual("Syntax Error. Invalid Uri string: The SpecialPath does not conform to the rule");
      }
    })

    /**
     * @tc.name   testUriConstruction033
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1840
     * @tc.desc   URI Special Characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriConstruction033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let that = new uri.URI('http://username:password@[::]:8080/directory/file?Query#abc^de');
        expect().assertFail();
      } catch (err) {
        expect(err.toString())
          .assertEqual("BusinessError: Syntax Error. Invalid Uri string: The Fragment does not conform to the rule");
        expect(err.code).assertEqual(10200002)
        expect(err.message).assertEqual("Syntax Error. Invalid Uri string: The Fragment does not conform to the rule");
      }
    })

    /**
     * @tc.name   testUriConstruction034
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1850
     * @tc.desc   URI Special Characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriConstruction034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let route = new uri.URI('content://com.test.uri/files/a^a');
        let segments = route.getSegment();
        expect().assertFail();
      } catch (err) {
        expect(err.toString())
          .assertEqual("BusinessError: Syntax Error. Invalid Uri string: The path does not conform to the rule");
        expect(err.code).assertEqual(10200002);
        expect(err.message).assertEqual("Syntax Error. Invalid Uri string: The path does not conform to the rule");
      }
    })
    /**
     * @tc.name   testUriAddEncodedSegment004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1860
     * @tc.desc   Encode the path segment and add it to the URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriAddEncodedSegment004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let route = new uri.URI('http://www.test.com/');
        let newRoute = route.addEncodedSegment("my`files");
        expect().assertFail();
      } catch (err) {
        expect(err.toString())
          .assertEqual("BusinessError: Syntax Error. Invalid Uri string: The path does not conform to the rule");
        expect(err.code).assertEqual(10200002);
        expect(err.message).assertEqual("Syntax Error. Invalid Uri string: The path does not conform to the rule");
      }
    })
    /**
     * @tc.name   testUriUriSetScheme001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1870
     * @tc.desc   Encode Scheme and set it to the URI Scheme
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetScheme001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("ht2tp://user@www.1hw.1com:77/path/path23?query#qwer");
      uriObj.scheme = "https:"
      expect(uriObj.toString()).assertEqual('https://user@www.1hw.1com:77/path/path23?query#qwer');
    })
    /**
     * @tc.name   testUriUriSetScheme002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1880
     * @tc.desc   Encode Scheme and set it to the URI Scheme
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetScheme002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("ht2tp://user@www.1hw.1com:77/path/path23?query#qwer");
      uriObj.scheme = "3https:"
      expect(uriObj.toString()).assertEqual('ht2tp://user@www.1hw.1com:77/path/path23?query#qwer');
    })
    /**
     * @tc.name   testUriUriSetScheme003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1890
     * @tc.desc   Encode Scheme and set it to the URI Scheme
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetScheme003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("ht2tp://user@www.1hw.1com:77/path/path23?query#qwer");
      uriObj.scheme = "asffdsa"
      expect(uriObj.toString()).assertEqual('asffdsa://user@www.1hw.1com:77/path/path23?query#qwer');
    })
    /**
     * @tc.name   testUriUriSetScheme004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1900
     * @tc.desc   Encode Scheme and set it to the URI Scheme
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetScheme004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("ht2tp://user@www.1hw.1com:77/path/path23?query#qwer");
      uriObj.scheme = "%asffdsa"
      expect(uriObj.toString()).assertEqual('ht2tp://user@www.1hw.1com:77/path/path23?query#qwer');
    })
    /**
     * @tc.name   testUriUriSetScheme005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1910
     * @tc.desc   Encode Scheme and set it to the URI Scheme
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetScheme005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://user@www.1hw.1com:77/path/path23?query#qwer");
      uriObj.scheme = ""
      expect(uriObj.toString()).assertEqual('http://user@www.1hw.1com:77/path/path23?query#qwer');
    })
    /**
     * @tc.name   testUriUriSetScheme006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1920
     * @tc.desc   Encode Scheme and set it to the URI Scheme
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetScheme006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://user@www.1hw.1com:77?query#qwer");
      uriObj.scheme = "testuri006"
      expect(uriObj.scheme).assertEqual('testuri006');
    })
    /**
     * @tc.name   testUriUriSetUserInfo001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1930
     * @tc.desc   Encode UserInfo and set it to the URI UserInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetUserInfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://user@www.hw.com:77/path/path23?query#qwer");
      uriObj.userInfo = "testuri007"
      expect(uriObj.userInfo).assertEqual('testuri007');
      expect(uriObj.toString()).assertEqual('http://testuri007@www.hw.com:77/path/path23?query#qwer');
    })
    /**
     * @tc.name   testUriUriSetUserInfo002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1940
     * @tc.desc   Encode UserInfo and set it to the URI UserInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetUserInfo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://www.test.com:77/path/path23?query#qwer");
      uriObj.userInfo = "testuri008"
      expect(uriObj.userInfo).assertEqual('testuri008');
      expect(uriObj.toString()).assertEqual('http://testuri008@www.test.com:77/path/path23?query#qwer');
    })
    /**
     * @tc.name   testUriUriSetUserInfo003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1950
     * @tc.desc   Encode UserInfo and set it to the URI UserInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetUserInfo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/path/path23?query#qwer");
      uriObj.userInfo = "sji<+s大"
      expect(uriObj.userInfo).assertEqual('sji<+s大');
      expect(uriObj.toString()).assertEqual('http://sji%3C%2Bs%E5%A4%A7@www.test.com:77/path/path23?query#qwer');
    })
    /**
     * @tc.name   testUriUriSetUserInfo004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1960
     * @tc.desc   Encode UserInfo and set it to the URI UserInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetUserInfo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http:/userinfo@www.test.com:77/path/path23?query#qwer");
      uriObj.userInfo = "sji<+s大"
      expect(uriObj.userInfo).assertEqual(null);
      expect(uriObj.toString()).assertEqual('http:/userinfo@www.test.com:77/path/path23?query#qwer');
    })
    /**
     * @tc.name   testUriUriSetUserInfo005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1970
     * @tc.desc   Encode UserInfo and set it to the URI UserInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetUserInfo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/path/path23?query#qwer");
      uriObj.userInfo = ""
      expect(uriObj.userInfo).assertEqual(null);
      expect(uriObj.toString()).assertEqual('http://www.test.com:77/path/path23?query#qwer');
    })
    /**
     * @tc.name   testUriUriSetPath001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1980
     * @tc.desc   Encode Path and set it to the URI Path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetPath001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/path/path23?query#qwer");
      uriObj.path = ""
      expect(uriObj.path).assertEqual(null);
      expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77?query#qwer');
    })
    /**
     * @tc.name   testUriUriSetPath002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1990
     * @tc.desc   Encode Path and set it to the URI Path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetPath002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/path/path23?query#qwer");
      uriObj.path = "pathtest/pp"
      expect(uriObj.path).assertEqual('pathtest/pp');
      expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/pathtest/pp?query#qwer');
    })
    /**
     * @tc.name   testUriUriSetPath003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2000
     * @tc.desc   Encode Path and set it to the URI Path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetPath003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/path/path23?query#qwer");
      uriObj.path = "pathtest/p大p"
      expect(uriObj.path).assertEqual('pathtest/p大p');
      expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/pathtest/p%E5%A4%A7p?query#qwer');
    })
    /**
     * @tc.name   testUriUriSetPath004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2010
     * @tc.desc   Encode Path and set it to the URI Path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetPath004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77?query#qwer");
      uriObj.path = "/testuri015/p大p/"
      expect(uriObj.path).assertEqual('/testuri015/p大p/');
      expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/testuri015/p%E5%A4%A7p/?query#qwer');
    })
    /**
     * @tc.name   testUriUriSetPath005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2020
     * @tc.desc   Encode Path and set it to the URI Path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetPath005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77?query#qwer");
      uriObj.path = "/testuri016/p大p/"
      expect(uriObj.ssp).assertEqual('//userinfo@www.test.com:77/testuri016/p大p/?query');
      expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/testuri016/p%E5%A4%A7p/?query#qwer');
    })
    /**
     * @tc.name   testUriUriSetPath006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2030
     * @tc.desc   Encode Path and set it to the URI Path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetPath006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http:userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.path = "/testuri017/p大p/"
      expect(uriObj.path).assertEqual('/testuri017/p大p/');
      expect(uriObj.toString()).assertEqual('http:/testuri017/p%E5%A4%A7p/#qwer');
    })
    /**
     * @tc.name   testUriUriSetQuery001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2040
     * @tc.desc   Encode Query and set it to the URI Query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetQuery001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.query = "/testuri018/p大p/=sasf"
      expect(uriObj.query).assertEqual('/testuri018/p大p/=sasf');
      let res = 'http://userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?%2Ftesturi018%2Fp%E5%A4%A7p%2F%3Dsasf#qwer';
      expect(uriObj.toString()).assertEqual(res);
    })
    /**
     * @tc.name   testUriUriSetQuery002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2050
     * @tc.desc   Encode Query and set it to the URI Query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetQuery002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.query = "key=value&key1=value1"
      expect(uriObj.query).assertEqual('key=value&key1=value1');
      let res = 'http://userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?key%3Dvalue%26key1%3Dvalue1#qwer';
      expect(uriObj.toString()).assertEqual(res);
    })
    /**
     * @tc.name   testUriUriSetQuery003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2060
     * @tc.desc   Encode Query and set it to the URI Query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetQuery003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.query = '';
      expect(uriObj.query).assertEqual(null);
      expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/#qwer');
    })
    /**
     * @tc.name   testUriUriSetQuery004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2070
     * @tc.desc   Encode Query and set it to the URI Query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetQuery004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.query = 'kkey=sal';
      expect(uriObj.query).assertEqual("kkey=sal");
      expect(uriObj.ssp).assertEqual("//userinfo@www.test.com:77/testuri017/p大p/?kkey=sal");
      let res = 'http://userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?kkey%3Dsal#qwer';
      expect(uriObj.toString()).assertEqual(res);
    })
    /**
     * @tc.name   testUriUriSetQuery005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2080
     * @tc.desc   Encode Query and set it to the URI Query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetQuery005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http:/userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.query = 'kkey=sal&jj=oi';
      expect(uriObj.query).assertEqual("kkey=sal&jj=oi");
      expect(uriObj.ssp).assertEqual("/userinfo@www.test.com:77/testuri017/p大p/?kkey=sal&jj=oi");
      let res = 'http:/userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?kkey%3Dsal%26jj%3Doi#qwer';
      expect(uriObj.toString()).assertEqual(res);
    })
    /**
     * @tc.name   testUriUriSetFragment001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2090
     * @tc.desc   Encode Fragment and set it to the URI Fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetFragment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http:/userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.fragment = 'kkey=sal&jj=oi';
      expect(uriObj.fragment).assertEqual("kkey=sal&jj=oi");
      expect(uriObj.ssp).assertEqual("/userinfo@www.test.com:77/testuri017/p大p/?query");
      let res = 'http:/userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?query#kkey%3Dsal%26jj%3Doi';
      expect(uriObj.toString()).assertEqual(res);
    })
    /**
     * @tc.name   testUriUriSetFragment002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2100
     * @tc.desc   Encode Fragment and set it to the URI Fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetFragment002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http:/userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.fragment = '';
      expect(uriObj.fragment).assertEqual(null);
      expect(uriObj.toString()).assertEqual('http:/userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?query');
    })
    /**
     * @tc.name   testUriUriSetFragment003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2110
     * @tc.desc   Encode Fragment and set it to the URI Fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetFragment003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http:/userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.fragment = '#jia片段';
      expect(uriObj.fragment).assertEqual("#jia片段");
      let res = 'http:/userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?query#%23jia%E7%89%87%E6%AE%B5';
      expect(uriObj.toString()).assertEqual(res);
    })
    /**
     * @tc.name   testUriUriSetFragment004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2120
     * @tc.desc   Encode Fragment and set it to the URI Fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetFragment004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query");
      uriObj.fragment = '#jia片段f';
      expect(uriObj.fragment).assertEqual("#jia片段f");
      let res = 'http://userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?query#%23jia%E7%89%87%E6%AE%B5f';
      expect(uriObj.toString()).assertEqual(res);
    })
    /**
     * @tc.name   testUriUriSetFragment005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2130
     * @tc.desc   Encode Fragment and set it to the URI Fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetFragment005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http:userinfo@www.test.com:77/testuri017/p大p/?query");
      uriObj.fragment = 'jia片段f';
      expect(uriObj.fragment).assertEqual("jia片段f");
      let res = 'http:userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?query#jia%E7%89%87%E6%AE%B5f';
      expect(uriObj.toString()).assertEqual(res);
    })
    /**
     * @tc.name   testUriUriSetAuthority001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2140
     * @tc.desc   Encode Authority and set it to the URI Authority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetAuthority001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#asd");
      uriObj.authority = 'www.test11.cn:88';
      expect(uriObj.userInfo).assertEqual(null);
      expect(uriObj.host).assertEqual("www.test11.cn");
      expect(uriObj.port).assertEqual("88");
      expect(uriObj.toString()).assertEqual('http://www.test11.cn:88/testuri017/p%E5%A4%A7p/?query#asd');
    })
    /**
     * @tc.name   testUriUriSetAuthority002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2150
     * @tc.desc   Encode Authority and set it to the URI Authority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetAuthority002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#asd");
      uriObj.authority = 'uusc@www.testuc.com:741';
      expect(uriObj.userInfo).assertEqual("uusc");
      expect(uriObj.host).assertEqual("www.testuc.com");
      expect(uriObj.port).assertEqual("741");
      expect(uriObj.authority).assertEqual("uusc@www.testuc.com:741");
      expect(uriObj.toString()).assertEqual('http://uusc@www.testuc.com:741/testuri017/p%E5%A4%A7p/?query#asd');
    })
    /**
     * @tc.name   testUriUriSetAuthority003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2160
     * @tc.desc   Encode Authority and set it to the URI Authority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetAuthority003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#asd");
      uriObj.authority = '';
      expect(uriObj.userInfo).assertEqual(null);
      expect(uriObj.host).assertEqual(null);
      expect(uriObj.port).assertEqual("-1");
      expect(uriObj.authority).assertEqual(null);
      expect(uriObj.ssp).assertEqual('/testuri017/p大p/?query');
      expect(uriObj.toString()).assertEqual('http:/testuri017/p%E5%A4%A7p/?query#asd');
    })
    /**
     * @tc.name   testUriUriSetAuthority004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2170
     * @tc.desc   Encode Authority and set it to the URI Authority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetAuthority004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#asd");
      uriObj.authority = 'usc@';
      expect(uriObj.userInfo).assertEqual(null);
      expect(uriObj.host).assertEqual(null);
      expect(uriObj.port).assertEqual("-1");
      expect(uriObj.authority).assertEqual("usc@");
      expect(uriObj.ssp).assertEqual('//usc@/testuri017/p大p/?query');
      expect(uriObj.toString()).assertEqual('http://usc@/testuri017/p%E5%A4%A7p/?query#asd');
    })
    /**
     * @tc.name   testUriUriSetSsp001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2180
     * @tc.desc   Encode Ssp and set it to the URI Ssp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetSsp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#asd");
      uriObj.ssp = 'usc@asjf:99/path1/ss?key=1';
      expect(uriObj.userInfo).assertEqual(null);
      expect(uriObj.host).assertEqual(null);
      expect(uriObj.port).assertEqual("-1");
      expect(uriObj.authority).assertEqual(null);
      expect(uriObj.path).assertEqual(null);
      expect(uriObj.ssp).assertEqual('usc@asjf:99/path1/ss?key=1');
      expect(uriObj.toString()).assertEqual('http:usc@asjf:99/path1/ss?key=1#asd');
    })
    /**
     * @tc.name   testUriUriSetSsp002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2190
     * @tc.desc   Encode Ssp and set it to the URI Ssp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetSsp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#asd");
      uriObj.ssp = '/usc@asjf:99/path1/ss?key=1';
      expect(uriObj.userInfo).assertEqual(null);
      expect(uriObj.host).assertEqual(null);
      expect(uriObj.path).assertEqual("/usc@asjf:99/path1/ss");
      expect(uriObj.authority).assertEqual(null);
      expect(uriObj.ssp).assertEqual('/usc@asjf:99/path1/ss?key=1');
      expect(uriObj.toString()).assertEqual('http:/usc@asjf:99/path1/ss?key=1#asd');
    })
    /**
     * @tc.name   testUriUriSetSsp003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2200
     * @tc.desc   Encode Ssp and set it to the URI Ssp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetSsp003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("safdcas://userinfo@www.test.com:77/testuri017/p大p/?query#asd");
      uriObj.ssp = '//usc@www.test321.cn:996?key=1';
      expect(uriObj.userInfo).assertEqual("usc");
      expect(uriObj.host).assertEqual("www.test321.cn");
      expect(uriObj.path).assertEqual(null);
      expect(uriObj.authority).assertEqual('usc@www.test321.cn:996');
      expect(uriObj.ssp).assertEqual('//usc@www.test321.cn:996?key=1');
      expect(uriObj.toString()).assertEqual('safdcas://usc@www.test321.cn:996?key=1#asd');
    })
    /**
     * @tc.name   testUriUriSetSsp004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2210
     * @tc.desc   Encode Ssp and set it to the URI Ssp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetSsp004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("safdcas://userinfo@www.test.com:77/testuri017/p大p/?query#asdasf");
      uriObj.ssp = '//www.test321.cn';
      expect(uriObj.userInfo).assertEqual(null);
      expect(uriObj.host).assertEqual("www.test321.cn");
      expect(uriObj.path).assertEqual(null);
      expect(uriObj.authority).assertEqual('www.test321.cn');
      expect(uriObj.ssp).assertEqual('//www.test321.cn');
      expect(uriObj.toString()).assertEqual('safdcas://www.test321.cn#asdasf');
    })
    /**
     * @tc.name   testUriUriSetEncodedUserInfo001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2220
     * @tc.desc   set EncodedUserInfo to the URI UserInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedUserInfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://user@www.hw.com:77/path/path23?query#qwer");
      uriObj.encodedUserInfo = "testuri007"
      expect(uriObj.encodedUserInfo).assertEqual('testuri007');
      expect(uriObj.toString()).assertEqual('http://testuri007@www.hw.com:77/path/path23?query#qwer');
    })
    /**
     * @tc.name   testUriUriSetEncodedUserInfo002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2230
     * @tc.desc   set EncodedUserInfo to the URI UserInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedUserInfo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://www.test.com:77/path/path23?query#qwer");
      uriObj.encodedUserInfo = "testuri008"
      expect(uriObj.encodedUserInfo).assertEqual('testuri008');
      expect(uriObj.toString()).assertEqual('http://testuri008@www.test.com:77/path/path23?query#qwer');
    })
    /**
     * @tc.name   testUriUriSetEncodedUserInfo003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2240
     * @tc.desc   set EncodedUserInfo to the URI UserInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedUserInfo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/path/path23?query#qwer");
      uriObj.encodedUserInfo = "sji<+s大"
      expect(uriObj.encodedUserInfo).assertEqual('userinfo');
      expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/path/path23?query#qwer');
    })
    /**
     * @tc.name   testUriUriSetEncodedUserInfo004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2250
     * @tc.desc   set EncodedUserInfo to the URI UserInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedUserInfo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http:/userinfo@www.test.com:77/path/path23?query#qwer");
      uriObj.encodedUserInfo = "sji<+s大"
      expect(uriObj.encodedUserInfo).assertEqual(null);
      expect(uriObj.toString()).assertEqual('http:/userinfo@www.test.com:77/path/path23?query#qwer');
    })
    /**
     * @tc.name   testUriUriSetEncodedUserInfo005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2260
     * @tc.desc   set EncodedUserInfo to the URI UserInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedUserInfo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/path/path23?query#qwer");
      uriObj.encodedUserInfo = ""
      expect(uriObj.userInfo).assertEqual(null);
      expect(uriObj.toString()).assertEqual('http://www.test.com:77/path/path23?query#qwer');
    })
    /**
     * @tc.name   testUriUriSetEncodedPath001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2270
     * @tc.desc   set EncodedPath to the URI Path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedPath001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/path/path23?query#qwer");
      uriObj.encodedPath = ""
      expect(uriObj.encodedPath).assertEqual(null);
      expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77?query#qwer');
    })
    /**
     * @tc.name   testUriUriSetEncodedPath002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2280
     * @tc.desc   set EncodedPath to the URI Path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedPath002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/path/path23?query#qwer");
      uriObj.encodedPath = "pathtest/pp"
      expect(uriObj.encodedPath).assertEqual('pathtest/pp');
      expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/pathtest/pp?query#qwer');
    })
    /**
     * @tc.name   testUriUriSetEncodedPath003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2290
     * @tc.desc   set EncodedPath to the URI Path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedPath003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/path/path23?query#qwer");
      uriObj.encodedPath = "pathtest/p%E5%A4%A7p"
      expect(uriObj.encodedPath).assertEqual('pathtest/p%E5%A4%A7p');
      expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/pathtest/p%E5%A4%A7p?query#qwer');
    })
    /**
     * @tc.name   testUriUriSetEncodedPath004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2300
     * @tc.desc   set EncodedPath to the URI Path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedPath004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77?query#qwer");
      uriObj.encodedPath = "/testuri015/p大p/"
      expect(uriObj.encodedPath).assertEqual('/testuri015/p大p/');
      expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/testuri015/p%E5%A4%A7p/?query#qwer');
    })
    /**
     * @tc.name   testUriUriSetEncodedPath005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2310
     * @tc.desc   set EncodedPath to the URI Path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedPath005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77");
      uriObj.encodedPath = "testuri016/p%E5%A4%A7/"
      expect(uriObj.encodedPath).assertEqual('testuri016/p%E5%A4%A7/');
      expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/testuri016/p%E5%A4%A7/');
    })
    /**
     * @tc.name   testUriUriSetEncodedQuery001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2320
     * @tc.desc   set EncodedQuery to the URI Query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedQuery001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.encodedQuery = "/testuri018/p大p/=sasf"
      expect(uriObj.encodedQuery).assertEqual('/testuri018/p大p/=sasf');
      let res = 'http://userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?/testuri018/p%E5%A4%A7p/=sasf#qwer';
      expect(uriObj.toString()).assertEqual(res);
    })
    /**
     * @tc.name   testUriUriSetEncodedQuery002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2330
     * @tc.desc   set EncodedQuery to the URI Query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedQuery002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.encodedQuery = "key=value&key1=value1"
      expect(uriObj.encodedQuery).assertEqual('key=value&key1=value1');
      expect(uriObj.toString())
        .assertEqual('http://userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?key=value&key1=value1#qwer');
    })
    /**
     * @tc.name   testUriUriSetEncodedQuery003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2340
     * @tc.desc   set EncodedQuery to the URI Query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedQuery003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.encodedQuery = '';
      expect(uriObj.encodedQuery).assertEqual(null);
      expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/#qwer');
    })
    /**
     * @tc.name   testUriUriSetEncodedQuery004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2350
     * @tc.desc   set EncodedQuery to the URI Query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedQuery004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.encodedQuery = 'kkey=sal';
      expect(uriObj.encodedQuery).assertEqual("kkey=sal");
      expect(uriObj.ssp).assertEqual("//userinfo@www.test.com:77/testuri017/p大p/?kkey=sal");
      expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?kkey=sal#qwer');
    })
    /**
     * @tc.name   testUriUriSetEncodedQuery005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2360
     * @tc.desc   set EncodedQuery to the URI Query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedQuery005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http:/userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.encodedQuery = 'kkey=sal&jj=oi';
      expect(uriObj.encodedQuery).assertEqual("kkey=sal&jj=oi");
      expect(uriObj.ssp).assertEqual("/userinfo@www.test.com:77/testuri017/p大p/?kkey=sal&jj=oi");
      expect(uriObj.toString())
        .assertEqual('http:/userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?kkey=sal&jj=oi#qwer');
    })
    /**
     * @tc.name   testUriUriSetEncodedFragment001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2370
     * @tc.desc   set EncodedFragment to the URI Fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedFragment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http:/userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.encodedFragment = 'kkey=sal&jj=oi';
      expect(uriObj.encodedFragment).assertEqual("kkey=sal&jj=oi");
      expect(uriObj.ssp).assertEqual("/userinfo@www.test.com:77/testuri017/p大p/?query");
      expect(uriObj.toString())
        .assertEqual('http:/userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?query#kkey=sal&jj=oi');
    })
    /**
     * @tc.name   testUriUriSetEncodedFragment002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2380
     * @tc.desc   set EncodedFragment to the URI Fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedFragment002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http:/userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.encodedFragment = '';
      expect(uriObj.encodedFragment).assertEqual(null);
      expect(uriObj.toString()).assertEqual('http:/userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?query');
    })
    /**
     * @tc.name   testUriUriSetEncodedFragment003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2390
     * @tc.desc   set EncodedFragment to the URI Fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedFragment003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http:/userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.encodedFragment = '#jia片段';
      expect(uriObj.encodedFragment).assertEqual("qwer");
      expect(uriObj.toString()).assertEqual('http:/userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?query#qwer');
    })
    /**
     * @tc.name   testUriUriSetEncodedFragment004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2400
     * @tc.desc   set EncodedFragment to the URI Fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedFragment004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query");
      uriObj.encodedFragment = 'jia片段f';
      expect(uriObj.encodedFragment).assertEqual("jia片段f");
      expect(uriObj.toString())
        .assertEqual('http://userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?query#jia%E7%89%87%E6%AE%B5f');
    })
    /**
     * @tc.name   testUriUriSetEncodedFragment005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2410
     * @tc.desc   set EncodedFragment to the URI Fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedFragment005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http:userinfo@www.test.com:77/testuri017/p大p/?query");
      uriObj.encodedFragment = 'jia片段f';
      expect(uriObj.encodedFragment).assertEqual("jia片段f");
      expect(uriObj.toString())
        .assertEqual('http:userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?query#jia%E7%89%87%E6%AE%B5f');
    })
    /**
     * @tc.name   testUriUriSetEncodedAuthority001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2420
     * @tc.desc   set EncodedAuthority to the URI Authority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedAuthority001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#asd");
      uriObj.encodedAuthority = 'www.test11.cn:88';
      expect(uriObj.encodedUserInfo).assertEqual(null);
      expect(uriObj.host).assertEqual("www.test11.cn");
      expect(uriObj.port).assertEqual("88");
      expect(uriObj.toString()).assertEqual('http://www.test11.cn:88/testuri017/p%E5%A4%A7p/?query#asd');
    })
    /**
     * @tc.name   testUriUriSetEncodedAuthority002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2430
     * @tc.desc   set EncodedAuthority to the URI Authority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedAuthority002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#asd");
      uriObj.encodedAuthority = 'uusc@www.testuc.com:741';
      expect(uriObj.encodedUserInfo).assertEqual("uusc");
      expect(uriObj.host).assertEqual("www.testuc.com");
      expect(uriObj.port).assertEqual("741");
      expect(uriObj.encodedAuthority).assertEqual("uusc@www.testuc.com:741");
      expect(uriObj.toString()).assertEqual('http://uusc@www.testuc.com:741/testuri017/p%E5%A4%A7p/?query#asd');
    })
    /**
     * @tc.name   testUriUriSetEncodedAuthority003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2440
     * @tc.desc   set EncodedAuthority to the URI Authority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedAuthority003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#asd");
      uriObj.encodedAuthority = '';
      expect(uriObj.userInfo).assertEqual(null);
      expect(uriObj.host).assertEqual(null);
      expect(uriObj.port).assertEqual("-1");
      expect(uriObj.encodedAuthority).assertEqual(null);
      expect(uriObj.encodedSSP).assertEqual('/testuri017/p大p/?query');
      expect(uriObj.toString()).assertEqual('http:/testuri017/p%E5%A4%A7p/?query#asd');
    })
    /**
     * @tc.name   testUriUriSetEncodedAuthority004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2450
     * @tc.desc   set EncodedAuthority to the URI Authority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedAuthority004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#asd");
      uriObj.encodedAuthority = 'usc@';
      expect(uriObj.userInfo).assertEqual(null);
      expect(uriObj.host).assertEqual(null);
      expect(uriObj.port).assertEqual("-1");
      expect(uriObj.encodedAuthority).assertEqual("usc@");
      expect(uriObj.encodedSSP).assertEqual('//usc@/testuri017/p大p/?query');
      expect(uriObj.toString()).assertEqual('http://usc@/testuri017/p%E5%A4%A7p/?query#asd');
    })
    /**
     * @tc.name   testUriUriSetEncodedSsp001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2460
     * @tc.desc   set EncodedSsp to the URI Ssp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedSsp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#asd");
      uriObj.encodedSSP = 'usc@asjf:99/path1/ss?key=1';
      expect(uriObj.userInfo).assertEqual(null);
      expect(uriObj.host).assertEqual(null);
      expect(uriObj.port).assertEqual("-1");
      expect(uriObj.authority).assertEqual(null);
      expect(uriObj.path).assertEqual(null);
      expect(uriObj.encodedSSP).assertEqual('usc@asjf:99/path1/ss?key=1');
      expect(uriObj.toString()).assertEqual('http:usc@asjf:99/path1/ss?key=1#asd');
    })
    /**
     * @tc.name   testUriUriSetEncodedSsp002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2470
     * @tc.desc   set EncodedSsp to the URI Ssp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedSsp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#asd");
      uriObj.encodedSSP = '/usc@asjf:99/path1/ss?key=1';
      expect(uriObj.userInfo).assertEqual(null);
      expect(uriObj.host).assertEqual(null);
      expect(uriObj.path).assertEqual("/usc@asjf:99/path1/ss");
      expect(uriObj.authority).assertEqual(null);
      expect(uriObj.encodedSSP).assertEqual('/usc@asjf:99/path1/ss?key=1');
      expect(uriObj.toString()).assertEqual('http:/usc@asjf:99/path1/ss?key=1#asd');
    })
    /**
     * @tc.name   testUriUriSetEncodedSsp003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2480
     * @tc.desc   set EncodedSsp to the URI Ssp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedSsp003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("safdcas://userinfo@www.test.com:77/testuri017/p大p/?query#asd");
      uriObj.encodedSSP = '//usc@www.test321.cn:996?key=1';
      expect(uriObj.userInfo).assertEqual("usc");
      expect(uriObj.host).assertEqual("www.test321.cn");
      expect(uriObj.path).assertEqual(null);
      expect(uriObj.encodedAuthority).assertEqual('usc@www.test321.cn:996');
      expect(uriObj.encodedSSP).assertEqual('//usc@www.test321.cn:996?key=1');
      expect(uriObj.toString()).assertEqual('safdcas://usc@www.test321.cn:996?key=1#asd');
    })
    /**
     * @tc.name   testUriUriSetEncodedSsp004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2490
     * @tc.desc   set EncodedSsp to the URI Ssp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedSsp004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uriObj = new uri.URI("safdcas://userinfo@www.test.com:77/testuri017/p大p/?query#asdasf");
      uriObj.encodedSSP = '//www.test321.cn';
      expect(uriObj.userInfo).assertEqual(null);
      expect(uriObj.host).assertEqual("www.test321.cn");
      expect(uriObj.path).assertEqual(null);
      expect(uriObj.authority).assertEqual('www.test321.cn');
      expect(uriObj.encodedSSP).assertEqual('//www.test321.cn');
      expect(uriObj.toString()).assertEqual('safdcas://www.test321.cn#asdasf');
    })
  })
}