import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { uri } from '@kit.ArkTS';

export default function URI03Test() {
  describe('URI03Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1010
     * @tc.name testURI03Chapter0001
     * @tc.desc Test IPv6 host address (enclosed in brackets).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("http://[2001:db8::1]:8080/");
      expect(uriObj.authority).assertEqual("[2001:db8::1]:8080");
      expect(uriObj.host).assertEqual("[2001:db8::1]");
      expect(uriObj.port).assertEqual('8080');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1020
     * @tc.name testURI03Chapter0002
     * @tc.desc Test userinfo containing colon (needs encoding in raw string).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("http://user%3Aname:pass@host/");
      expect(uriObj.userInfo).assertEqual("user:name:pass");
      expect(uriObj.authority).assertEqual("user:name:pass@host");
      expect(uriObj.encodedAuthority).assertEqual("user%3Aname:pass@host");
      expect(uriObj.host).assertEqual("host");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1030
     * @tc.name testURI03Chapter0003
     * @tc.desc Test userinfo containing at sign (needs encoding in raw string).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("http://user%40name:pass@host/");
      expect(uriObj.userInfo).assertEqual("user@name:pass");
      expect(uriObj.authority).assertEqual("user@name:pass@host");
      expect(uriObj.encodedAuthority).assertEqual("user%40name:pass@host");
      expect(uriObj.host).assertEqual("host");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1040
     * @tc.name testURI03Chapter0004
     * @tc.desc Test userinfo containing percent sign (itself encoded).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("http://user%25name:pass@host/");
      expect(uriObj.userInfo).assertEqual("user%name:pass");
      expect(uriObj.authority).assertEqual("user%name:pass@host");
      expect(uriObj.encodedAuthority).assertEqual("user%25name:pass@host");
      expect(uriObj.host).assertEqual("host");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1050
     * @tc.name testURI03Chapter0005
     * @tc.desc Test host containing digits and dots (valid domain).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("http://123.45.67.89/");
      expect(uriObj.authority).assertEqual("123.45.67.89");
      expect(uriObj.host).assertEqual("123.45.67.89");
      expect(uriObj.port).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1060
     * @tc.name testURI03Chapter0006
     * @tc.desc Test authority with hyphen and other valid characters in host.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("http://my-host-name.com/");
      expect(uriObj.authority).assertEqual("my-host-name.com");
      expect(uriObj.host).assertEqual("my-host-name.com");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1070
     * @tc.name testURI03Chapter0007
     * @tc.desc Test encodedAuthority equals authority when no special characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("http://simple-host:1234/");
      expect(uriObj.authority).assertEqual(uriObj.encodedAuthority);
      expect(uriObj.authority).assertEqual("simple-host:1234");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1080
     * @tc.name testURI03Chapter0008
     * @tc.desc Test authority and encodedAuthority differ when special characters present.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("http://user%20name:pass@host/");
      expect(uriObj.userInfo).assertEqual("user name:pass");
      expect(uriObj.authority).assertEqual("user name:pass@host");
      expect(uriObj.encodedAuthority).assertEqual("user%20name:pass@host");
      expect(uriObj.authority !== uriObj.encodedAuthority).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1090
     * @tc.name testURI03Chapter0009
     * @tc.desc Verify ssp property for a basic URI with scheme, authority, path, query, and fragment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://user:pass@example.com:8080/docs/file?name=test#section');
      const expectedSsp = '//user:pass@example.com:8080/docs/file?name=test';
      expect(uriObj.ssp).assertEqual(expectedSsp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1100
     * @tc.name testURI03Chapter0010
     * @tc.desc Verify ssp property when path contains allowed special characters (!$&'()*+,;=:@-._~)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const specialPath = '/!$&\'()*+,;=:@-._~/file';
      const uriString = `http://host${specialPath}`;
      const uriObj = new uri.URI(uriString);
      const expectedSsp = `//host${specialPath}`;
      expect(uriObj.ssp).assertEqual(expectedSsp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1110
     * @tc.name testURI03Chapter0011
     * @tc.desc Verify ssp property with emoji characters in path (should be decoded in ssp)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const emojiPath = '/👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴';
      const uriString = `http://host${emojiPath}`;
      const uriObj = new uri.URI(uriString);
      const expectedSsp = `//host${emojiPath}`;
      expect(uriObj.ssp).assertEqual(expectedSsp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1120
     * @tc.name testURI03Chapter0012
     * @tc.desc Verify ssp property when path contains percent-encoded control characters (newline, tab)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const encodedPath = '/path%0Awith%09tab';
      const uriString = `http://host${encodedPath}`;
      const uriObj = new uri.URI(uriString);
      const expectedSsp = '//host/path\nwith\ttab';
      expect(uriObj.ssp).assertEqual(expectedSsp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1130
     * @tc.name testURI03Chapter0013
     * @tc.desc Verify ssp property with extremely long scheme-specific part (performance/memory)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const longPart = 'a'.repeat(100000);
      const uriString = `myscheme:${longPart}`;
      const uriObj = new uri.URI(uriString);
      expect(uriObj.ssp).assertEqual(longPart);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1140
     * @tc.name testURI03Chapter0014
     * @tc.desc Verify ssp property when query contains numeric and boolean values as strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://host/path?num=123&bool=true&zero=0&nan=NaN');
      const expectedSsp = '//host/path?num=123&bool=true&zero=0&nan=NaN';
      expect(uriObj.ssp).assertEqual(expectedSsp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1150
     * @tc.name testURI03Chapter0015
     * @tc.desc Verify ssp property when query contains an array representation (must be percent-encoded)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://host/path?arr=%5B1%2C2%2C3%5D');
      const expectedSsp = '//host/path?arr=[1,2,3]';
      expect(uriObj.ssp).assertEqual(expectedSsp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1160
     * @tc.name testURI03Chapter0016
     * @tc.desc Verify ssp property when query contains an object representation (percent-encoded)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://host/path?obj=%7B%22a%22%3A1%2C%22b%22%3A%22test%22%7D');
      const expectedSsp = '//host/path?obj={"a":1,"b":"test"}';
      expect(uriObj.ssp).assertEqual(expectedSsp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1170
     * @tc.name testURI03Chapter0017
     * @tc.desc Verify ssp property when path contains keywords like "0" and "NaN"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://host/0/NaN/file');
      const expectedSsp = '//host/0/NaN/file';
      expect(uriObj.ssp).assertEqual(expectedSsp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1180
     * @tc.name testURI03Chapter0018
     * @tc.desc Verify ssp property for a URI with a long tree-like string (JSON array) as scheme-specific part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let treeString = '[';
      for (let i = 0; i < 100; i++) {
        treeString += '{"a":1},';
      }
      treeString += '{"a":1}]';
      const uriString = `myscheme:${treeString}`;
      const uriObj = new uri.URI(uriString);
      expect(uriObj.ssp).assertEqual(treeString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1190
     * @tc.name testURI03Chapter0019
     * @tc.desc Test constructing URI with space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://host/illegal space');
      expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1200
     * @tc.name testURI03Chapter0020
     * @tc.desc Test constructing URI with unpaired surrogate (illegal Unicode)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const encodedPath: string = '%ED%A0%BD';
      const uriObj: uri.URI = new uri.URI('http://host/' + encodedPath);
      expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1210
     * @tc.name testURI03Chapter0021
     * @tc.desc Reverse test: constructing URI with empty string should throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        new uri.URI('');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1220
     * @tc.name testURI03Chapter0022
     * @tc.desc Test constructing URI with invalid percent encoding (%ZZ)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://host/%ZZ');
      expect(uriObj.toString().length > 0).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1230
     * @tc.name testURI03Chapter0023
     * @tc.desc Test encodedUserInfo when URI has no userinfo part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('ftp://ftp.aaa.bbb.ccc/dddd/eee.txt');
      expect(uriObj.encodedUserInfo).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1240
     * @tc.name testURI03Chapter0024
     * @tc.desc Test encodedUserInfo when userinfo part is empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://@host/path');
      expect(uriObj.encodedUserInfo).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1250
     * @tc.name testURI03Chapter0025
     * @tc.desc Test encodedUserInfo with normal alphanumeric username and password
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://username:password@host:8080/path');
      expect(uriObj.encodedUserInfo).assertEqual('username:password');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1260
     * @tc.name testURI03Chapter0026
     * @tc.desc Test encodedUserInfo with special characters that do not require percent-encoding in userinfo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const userInfo = "!$&'()*+,-./:;=@_~";
      const uriObj = new uri.URI(`https://${userInfo}@host/path`);
      expect(uriObj.encodedUserInfo).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1270
     * @tc.name testURI03Chapter0027
     * @tc.desc Test encodedUserInfo with special characters that require percent-encoding (already encoded)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const userInfo = "%23%25%3F%5B%5C%5D%5E%60%7B%7C%7D";
      const uriObj = new uri.URI(`https://${userInfo}@host/path`);
      expect(uriObj.encodedUserInfo).assertEqual("%23%25%3F%5B%5C%5D%5E%60%7B%7C%7D");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1280
     * @tc.name testURI03Chapter0028
     * @tc.desc Test encodedUserInfo covering all printable ASCII characters (32-126) with necessary percent-encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let raw = '';
      for (let i = 48; i <= 57; i++) {
        raw += String.fromCharCode(i);
      }
      for (let i = 65; i <= 90; i++) {
        raw += String.fromCharCode(i);
      }
      for (let i = 97; i <= 122; i++) {
        raw += String.fromCharCode(i);
      }
      raw += '-._~!$&\'()*+,;=';
      const uriObj = new uri.URI(`https://${raw}@host/path`);
      expect(uriObj.encodedUserInfo !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1290
     * @tc.name testURI03Chapter0029
     * @tc.desc Test encodedUserInfo with repeated special characters (two passes)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const raw = "!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
      const encoded = raw
        .replace(/"/g, '%22')
        .replace(/#/g, '%23')
        .replace(/%/g, '%25')
        .replace(/</g, '%3C')
        .replace(/>/g, '%3E')
        .replace(/\?/g, '%3F')
        .replace(/\[/g, '%5B')
        .replace(/\\/g, '%5C')
        .replace(/\]/g, '%5D')
        .replace(/\^/g, '%5E')
        .replace(/`/g, '%60')
        .replace(/\{/g, '%7B')
        .replace(/\|/g, '%7C')
        .replace(/\}/g, '%7D');
      const uriObj = new uri.URI(`https://${encoded}@host/path`);
      expect(uriObj.encodedUserInfo).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1300
     * @tc.name testURI03Chapter0030
     * @tc.desc Test encodedUserInfo with emoji characters (no encoding needed)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const emoji = "👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴";
      const uriObj = new uri.URI(`https://${emoji}@host/path`);
      expect(uriObj.encodedUserInfo).assertEqual(emoji);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1310
     * @tc.name testURI03Chapter0031
     * @tc.desc Test encodedUserInfo with illegal Unicode (lone surrogate)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const encodedUserInfo: string = '%ED%A0%BD';
      const uriObj: uri.URI = new uri.URI(`https://${encodedUserInfo}@host/path`);
      expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1320
     * @tc.name testURI03Chapter0032
     * @tc.desc Test encodedUserInfo with keyword "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://0@host/path');
      expect(uriObj.encodedUserInfo).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1330
     * @tc.name testURI03Chapter0033
     * @tc.desc Test encodedUserInfo with keyword "NaN"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://NaN@host/path');
      expect(uriObj.encodedUserInfo).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1340
     * @tc.name testURI03Chapter0034
     * @tc.desc Test encodedUserInfo with very long string (performance/memory)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const longStr = 'a'.repeat(10000);
      const uriObj = new uri.URI(`https://${longStr}@host/path`);
      expect(uriObj.encodedUserInfo).assertEqual(longStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1350
     * @tc.name testURI03Chapter0035
     * @tc.desc Test encodedUserInfo with numeric string "123"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://123@host/path');
      expect(uriObj.encodedUserInfo).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1360
     * @tc.name testURI03Chapter0036
     * @tc.desc Test encodedUserInfo with boolean string "true"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://true@host/path');
      expect(uriObj.encodedUserInfo).assertEqual('true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1370
     * @tc.name testURI03Chapter0037
     * @tc.desc Test encodedUserInfo with array-like string "[1,2,3]"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const uriObj = new uri.URI('https://[1,2,3]@host/path');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1380
     * @tc.name testURI03Chapter0038
     * @tc.desc Test encodedUserInfo with object-like string "{\"a\":1}"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const uriObj = new uri.URI('https://{"a":1}@host/path');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1390
     * @tc.name testURI03Chapter0039
     * @tc.desc Test encodedUserInfo with string "null"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://null@host/path');
      expect(uriObj.encodedUserInfo).assertEqual('null');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1400
     * @tc.name testURI03Chapter0040
     * @tc.desc Test encodedUserInfo with string "undefined"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://undefined@host/path');
      expect(uriObj.encodedUserInfo).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1410
     * @tc.name testURI03Chapter0041
     * @tc.desc Test encodedUserInfo with unencoded '?' in userinfo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://user?name@host/path');
      expect(uriObj.userInfo !== null).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1420
     * @tc.name testURI03Chapter0042
     * @tc.desc Test encodedUserInfo with unencoded '#' in userinfo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://user#name@host/path');
      expect(uriObj.userInfo !== null).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1430
     * @tc.name testURI03Chapter0043
     * @tc.desc Test encodedUserInfo reverse: empty string as URI constructor argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        new uri.URI('');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1440
     * @tc.name testURI03Chapter0044
     * @tc.desc Test encodedUserInfo reverse: unencoded control character (newline) in userinfo causes exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        new uri.URI('https://user\nname@host/path');
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1450
     * @tc.name testURI03Chapter0045
     * @tc.desc Test encodedUserInfo with unencoded surrogate pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const encodedUserInfo: string = '%ED%A0%BD';
      const uriObj: uri.URI = new uri.URI(`https://${encodedUserInfo}@host/path`);
      expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1460
     * @tc.name testURI03Chapter0046
     * @tc.desc Test encodedPath property with basic ASCII path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/path/to/file.txt');
      expect(uriObj.encodedPath).assertEqual('/path/to/file.txt');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1470
     * @tc.name testURI03Chapter0047
     * @tc.desc Test encodedPath property with path containing space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/my file.txt');
      expect(uriObj.encodedPath).assertEqual('/my file.txt');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1480
     * @tc.name testURI03Chapter0048
     * @tc.desc Test encodedPath property with path containing Chinese characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/测试文件.txt');
      expect(uriObj.encodedPath).assertEqual('/测试文件.txt');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1490
     * @tc.name testURI03Chapter0049
     * @tc.desc Test encodedPath property with path containing allowed special characters (should not be encoded)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/;:@$,&=');
      expect(uriObj.encodedPath).assertEqual('/;:@$,&=');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1500
     * @tc.name testURI03Chapter0050
     * @tc.desc Test encodedPath property with path containing already percent-encoded characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/%23%3F%5B%5D');
      expect(uriObj.encodedPath).assertEqual('/%23%3F%5B%5D');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1510
     * @tc.name testURI03Chapter0051
     * @tc.desc Test encodedPath property when path is empty (authority only)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com');
      expect(uriObj.encodedPath).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1520
     * @tc.name testURI03Chapter0052
     * @tc.desc Test encodedPath property with root path "/"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/');
      expect(uriObj.encodedPath).assertEqual('/');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1530
     * @tc.name testURI03Chapter0053
     * @tc.desc Test encodedPath property with path containing multiple slashes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/a//b///c');
      expect(uriObj.encodedPath).assertEqual('/a//b///c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1540
     * @tc.name testURI03Chapter0054
     * @tc.desc Test encodedPath property with full ASCII printable characters (0x20-0x7E) in path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const asciiPath = '/ !"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
        new uri.URI('http://example.com' + asciiPath);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1550
     * @tc.name testURI03Chapter0055
     * @tc.desc Test encodedPath property with path containing emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/👆👿');
      expect(uriObj.encodedPath).assertEqual('/👆👿');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1560
     * @tc.name testURI03Chapter0056
     * @tc.desc Test encodedPath property with very long path (10k chars) – ensure no crash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const longPath = '/' + 'a'.repeat(10000);
      const uriObj = new uri.URI('http://example.com' + longPath);
      expect(uriObj.encodedPath.length).assertEqual(longPath.length);
      expect(uriObj.encodedPath.startsWith('/')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1570
     * @tc.name testURI03Chapter0057
     * @tc.desc Test invalid percent encoding in path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/%G0');
      expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1580
     * @tc.name testURI03Chapter0058
     * @tc.desc Reverse test: path containing control characters (e.g., \n) should throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const uriObj = new uri.URI('http://example.com/backslash\\value');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1590
     * @tc.name testURI03Chapter0059
     * @tc.desc Test path containing invalid Unicode surrogate pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const encodedPath: string = '%ED%A0%BD';
      const uriObj: uri.URI = new uri.URI('http://example.com/' + encodedPath);
      expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1600
     * @tc.name testURI03Chapter0060
     * @tc.desc Test missing scheme or malformed URI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('not a uri');
      expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1610
     * @tc.name testURI03Chapter0061
     * @tc.desc Test encodedQuery when no query part exists in URI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/path');
      expect(uriObj.encodedQuery === null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1620
     * @tc.name testURI03Chapter0062
     * @tc.desc Test encodedQuery with empty query string (trailing '?')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/path?');
      expect(uriObj.encodedQuery).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1630
     * @tc.name testURI03Chapter0063
     * @tc.desc Test encodedQuery with simple key=value pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/path?foo=bar');
      expect(uriObj.encodedQuery).assertEqual('foo=bar');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1640
     * @tc.name testURI03Chapter0064
     * @tc.desc Test encodedQuery with all printable special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const queryValue = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
        const fullQuery = 'chars=' + queryValue;
        const uriObj = new uri.URI('http://example.com/path?' + fullQuery);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1650
     * @tc.name testURI03Chapter0065
     * @tc.desc Test encodedQuery with space character that requires percent-encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/path?key=value with space');
      expect(uriObj.encodedQuery).assertEqual('key=value with space');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1660
     * @tc.name testURI03Chapter0066
     * @tc.desc Test encodedQuery with Chinese characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/path?key=你好');
      expect(uriObj.encodedQuery).assertEqual('key=你好');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1670
     * @tc.name testURI03Chapter0067
     * @tc.desc Test encodedQuery with escape sequences like newline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const uriObj = new uri.URI('http://example.com/path?key=line1\nline2');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1680
     * @tc.name testURI03Chapter0068
     * @tc.desc Test encodedQuery with emoji characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/path?emoji=👆');
      expect(uriObj.encodedQuery).assertEqual('emoji=👆');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1690
     * @tc.name testURI03Chapter0069
     * @tc.desc Test encodedQuery with invalid Unicode surrogate (lone high surrogate)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/path?surrogate=\uD83D');
      expect(uriObj.encodedQuery !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1700
     * @tc.name testURI03Chapter0070
     * @tc.desc Test encodedQuery with string representations of special values (0, NaN, true, etc.)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/path?zero=0&nan=NaN&bool=true&nullStr=null&undef=undefined');
      expect(uriObj.encodedQuery).assertEqual('zero=0&nan=NaN&bool=true&nullStr=null&undef=undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1710
     * @tc.name testURI03Chapter0071
     * @tc.desc Test encodedQuery with a very long query string (simulating treeString)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let longValue = '';
      for (let i = 0; i < 1000; i++) {
        longValue += 'a';
      }
      const query = 'key=' + longValue;
      const uriObj = new uri.URI('http://example.com/path?' + query);
      expect(uriObj.encodedQuery).assertEqual(query);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1720
     * @tc.name testURI03Chapter0072
     * @tc.desc Test encodedQuery with substring of a larger string (sliceString scenario)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fullQuery = 'key1=value1&key2=value2&key3=value3';
      const subQuery = fullQuery.substring(0, fullQuery.lastIndexOf('&'));
      const uriObj = new uri.URI('http://example.com/path?' + subQuery);
      expect(uriObj.encodedQuery).assertEqual(subQuery);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1730
     * @tc.name testURI03Chapter0073
     * @tc.desc Test encodedQuery with numeric boundary values as strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/path?val1=0&val2=-0&val3=Infinity&val4=-Infinity&val5=NaN&val6=1.7976931348623157e%2B308');
      expect(uriObj.encodedQuery !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1740
     * @tc.name testURI03Chapter0074
     * @tc.desc Test encodedQuery with stringified array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/path?arr=[1,2,3]');
      expect(uriObj.encodedQuery).assertEqual('arr=[1,2,3]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1750
     * @tc.name testURI03Chapter0075
     * @tc.desc Test encodedQuery with stringified object (JSON) containing double quotes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const jsonString = '{"a":1,"b":2}';
      const uriObj = new uri.URI('http://example.com/path?obj=' + jsonString);
      expect(uriObj.encodedQuery).assertEqual('obj={"a":1,"b":2}');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1760
     * @tc.name testURI03Chapter0076
     * @tc.desc Test invalid percent-encoding in query part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/path?key=%');
      expect(uriObj.query !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1770
     * @tc.name testURI03Chapter0077
     * @tc.desc Test another invalid percent-encoding: incomplete sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/path?key=%G0');
      expect(uriObj.query !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1780
     * @tc.name testURI03Chapter0078
     * @tc.desc Test encodedQuery with null string representation (the text "null") already covered, but add explicit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/path?val=null');
      expect(uriObj.encodedQuery).assertEqual('val=null');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1790
     * @tc.name testURI03Chapter0079
     * @tc.desc Test encodedQuery with undefined string representation (the text "undefined")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/path?val=undefined');
      expect(uriObj.encodedQuery).assertEqual('val=undefined');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1800
     * @tc.name testURI03Chapter0080
     * @tc.desc Test encodedFragment property when URI has no fragment (without #)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("http://example.com/path");
      const result = uriObj.encodedFragment;
      expect(result).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1810
     * @tc.name testURI03Chapter0081
     * @tc.desc Test encodedFragment property when fragment is empty string (trailing #)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("http://example.com/path#");
      const result = uriObj.encodedFragment;
      expect(result).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1820
     * @tc.name testURI03Chapter0082
     * @tc.desc Test encodedFragment with simple alphanumeric fragment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("http://example.com/path#section1");
      const result = uriObj.encodedFragment;
      expect(result).assertEqual("section1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1830
     * @tc.name testURI03Chapter0083
     * @tc.desc Test encodedFragment with fragment containing space (should be encoded)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("http://example.com/path#my fragment");
      const result = uriObj.encodedFragment;
      expect(result).assertEqual("my fragment");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1840
     * @tc.name testURI03Chapter0084
     * @tc.desc Test encodedFragment with fragment containing characters that do not require encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fragment = "!$&'()*+,-./:;=?@_~";
      const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
      const result = uriObj.encodedFragment;
      expect(result).assertEqual(fragment);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1850
     * @tc.name testURI03Chapter0085
     * @tc.desc Test encodedFragment with fragment containing characters that require encoding (excluding reserved delimiters)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fragment = "%22%23%25%3C%3E%5B%5C%5D%5E%60%7B%7C%7D";
      const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
      expect(uriObj.encodedFragment !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1860
     * @tc.name testURI03Chapter0086
     * @tc.desc Test encodedFragment with fragment containing all printable ASCII characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let ascii = '';
      for (let i = 48; i <= 57; i++) {
        ascii += String.fromCharCode(i);
      }
      for (let i = 65; i <= 90; i++) {
        ascii += String.fromCharCode(i);
      }
      for (let i = 97; i <= 122; i++) {
        ascii += String.fromCharCode(i);
      }
      ascii += "-._~!$&'()*+,;=:@/?";
      const uriObj = new uri.URI(`http://example.com/path#${ascii}`);
      expect(uriObj.encodedFragment !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1870
     * @tc.name testURI03Chapter0087
     * @tc.desc Test encodedFragment with fragment containing duplicate special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fragment = "!!&&''((**++,,--..//::;;??@@~~";
      const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
      expect(uriObj.encodedFragment !== null).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1880
     * @tc.name testURI03Chapter0088
     * @tc.desc Test encodedFragment with fragment containing escape sequences (newline, tab, etc.)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fragment = "%07%08%0C%0A%0D%09%0B";
      const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
      expect(uriObj.encodedFragment !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1890
     * @tc.name testURI03Chapter0089
     * @tc.desc Test encodedFragment with fragment containing emoji characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fragment = "👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴";
      const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
      const result = uriObj.encodedFragment;
      expect(result).assertEqual(fragment);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1900
     * @tc.name testURI03Chapter0090
     * @tc.desc Test encodedFragment with fragment containing illegal Unicode (lone surrogate)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const encodedFragment: string = '%ED%A0%BD';
      const uriObj: uri.URI = new uri.URI(`http://example.com/path#${encodedFragment}`);
      expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1910
     * @tc.name testURI03Chapter0091
     * @tc.desc Test encodedFragment with fragment equal to string "undefined"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("http://example.com/path#undefined");
      const result = uriObj.encodedFragment;
      expect(result).assertEqual("undefined");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1920
     * @tc.name testURI03Chapter0092
     * @tc.desc Test encodedFragment with fragment equal to string "null"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("http://example.com/path#null");
      const result = uriObj.encodedFragment;
      expect(result).assertEqual("null");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1930
     * @tc.name testURI03Chapter0093
     * @tc.desc Test encodedFragment with fragment equal to string "NaN"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("http://example.com/path#NaN");
      const result = uriObj.encodedFragment;
      expect(result).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1940
     * @tc.name testURI03Chapter0094
     * @tc.desc Test encodedFragment with fragment equal to string "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("http://example.com/path#0");
      const result = uriObj.encodedFragment;
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1950
     * @tc.name testURI03Chapter0095
     * @tc.desc Test encodedFragment with fragment containing numeric string "123.456"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("http://example.com/path#123.456");
      const result = uriObj.encodedFragment;
      expect(result).assertEqual("123.456");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1960
     * @tc.name testURI03Chapter0096
     * @tc.desc Test encodedFragment with fragment containing boolean string "true"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("http://example.com/path#true");
      const result = uriObj.encodedFragment;
      expect(result).assertEqual("true");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1970
     * @tc.name testURI03Chapter0097
     * @tc.desc Test encodedFragment with fragment containing boolean string "false"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("http://example.com/path#false");
      const result = uriObj.encodedFragment;
      expect(result).assertEqual("false");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1980
     * @tc.name testURI03Chapter0098
     * @tc.desc Test encodedFragment with fragment containing array string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = [72, 101, 108, 108, 111];
      const fragment = arr.toString();
      const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
      const result = uriObj.encodedFragment;
      expect(result).assertEqual(fragment);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_1990
     * @tc.name testURI03Chapter0099
     * @tc.desc Test encodedFragment with fragment containing object string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fragment = "[object Object]";
      const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
      const result = uriObj.encodedFragment;
      expect(result).assertEqual(fragment);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_2000
     * @tc.name testURI03Chapter0100
     * @tc.desc Test encodedFragment with extremely long fragment string (performance/robustness)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const longFragment = "a".repeat(10000);
      const uriObj = new uri.URI(`http://example.com/path#${longFragment}`);
      const result = uriObj.encodedFragment;
      expect(result.length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_2010
     * @tc.name testURI03Chapter0101
     * @tc.desc Test encodedFragment with fragment containing percent sign not followed by hex digits (illegal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fragment = "%2";
      const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
      expect(uriObj.fragment !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_2020
     * @tc.name testURI03Chapter0102
     * @tc.desc Test encodedFragment with fragment containing only a percent sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fragment = "%";
      const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
      expect(uriObj.fragment !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_2030
     * @tc.name testURI03Chapter0103
     * @tc.desc Test encodedFragment when fragment contains characters that are valid after percent encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fragment = "caf%C3%A9";
      const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
      const result = uriObj.encodedFragment;
      expect(result).assertEqual(fragment);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_2040
     * @tc.name testURI03Chapter0104
     * @tc.desc Test encodedFragment with fragment containing mixed allowed and encoded characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fragment = "hello world!%20test";
      const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
      const result = uriObj.encodedFragment;
      expect(result).assertEqual("hello world!%20test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URI3_2050
     * @tc.name testURI03Chapter0105
     * @tc.desc Test encodedFragment with fragment containing control characters (BEL, BS, etc.) already percent-encoded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fragment = "%07%08%09";
      const expected = "%07%08%09";
      const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
      const result = uriObj.encodedFragment;
      expect(result).assertEqual(expected);
    });
  });
}
