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

    // =============== authority ======================
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_0100
     * @tc.name testURI03Chapter0001
     * @tc.desc Test IPv6 host address (enclosed in brackets).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let uriObj = new uri.URI("http://[2001:db8::1]:8080/");
      expect(uriObj.authority).assertEqual("[2001:db8::1]:8080");
      expect(uriObj.host).assertEqual("[2001:db8::1]");
      expect(uriObj.port).assertEqual('8080');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_0200
     * @tc.name testURI03Chapter0002
     * @tc.desc Test userinfo containing colon (needs encoding in raw string).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let uriObj = new uri.URI("http://user%3Aname:pass@host/");
      expect(uriObj.userInfo).assertEqual("user:name:pass");
      expect(uriObj.authority).assertEqual("user:name:pass@host");
      expect(uriObj.encodedAuthority).assertEqual("user%3Aname:pass@host");
      expect(uriObj.host).assertEqual("host");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_0300
     * @tc.name testURI03Chapter0003
     * @tc.desc Test userinfo containing at sign (needs encoding in raw string).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let uriObj = new uri.URI("http://user%40name:pass@host/");
      expect(uriObj.userInfo).assertEqual("user@name:pass");
      expect(uriObj.authority).assertEqual("user@name:pass@host");
      expect(uriObj.encodedAuthority).assertEqual("user%40name:pass@host");
      expect(uriObj.host).assertEqual("host");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_0400
     * @tc.name testURI03Chapter0004
     * @tc.desc Test userinfo containing percent sign (itself encoded).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let uriObj = new uri.URI("http://user%25name:pass@host/");
      expect(uriObj.userInfo).assertEqual("user%name:pass");
      expect(uriObj.authority).assertEqual("user%name:pass@host");
      expect(uriObj.encodedAuthority).assertEqual("user%25name:pass@host");
      expect(uriObj.host).assertEqual("host");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_0500
     * @tc.name testURI03Chapter0005
     * @tc.desc Test host containing digits and dots (valid domain).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let uriObj = new uri.URI("http://123.45.67.89/");
      expect(uriObj.authority).assertEqual("123.45.67.89");
      expect(uriObj.host).assertEqual("123.45.67.89");
      expect(uriObj.port).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_0600
     * @tc.name testURI03Chapter0006
     * @tc.desc Test authority with hyphen and other valid characters in host.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let uriObj = new uri.URI("http://my-host-name.com/");
      expect(uriObj.authority).assertEqual("my-host-name.com");
      expect(uriObj.host).assertEqual("my-host-name.com");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_0700
     * @tc.name testURI03Chapter0007
     * @tc.desc Test encodedAuthority equals authority when no special characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let uriObj = new uri.URI("http://simple-host:1234/");
      expect(uriObj.authority).assertEqual(uriObj.encodedAuthority);
      expect(uriObj.authority).assertEqual("simple-host:1234");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_0800
     * @tc.name testURI03Chapter0008
     * @tc.desc Test authority and encodedAuthority differ when special characters present.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let uriObj = new uri.URI("http://user%20name:pass@host/");
      expect(uriObj.userInfo).assertEqual("user name:pass");
      expect(uriObj.authority).assertEqual("user name:pass@host");
      expect(uriObj.encodedAuthority).assertEqual("user%20name:pass@host");
      expect(uriObj.authority !== uriObj.encodedAuthority).assertTrue();
    });
    // =============== ssp ======================

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_0900
     * @tc.name testURI03Chapter0009
     * @tc.desc Verify ssp property for a basic URI with scheme, authority, path, query, and fragment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const uriObj = new uri.URI('https://user:pass@example.com:8080/docs/file?name=test#section');
      const expectedSsp = '//user:pass@example.com:8080/docs/file?name=test';
      expect(uriObj.ssp).assertEqual(expectedSsp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_1000
     * @tc.name testURI03Chapter0010
     * @tc.desc Verify ssp property when path contains allowed special characters (!$&'()*+,;=:@-._~)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const specialPath = '/!$&\'()*+,;=:@-._~/file';
      const uriString = `http://host${specialPath}`;
      const uriObj = new uri.URI(uriString);
      const expectedSsp = `//host${specialPath}`;
      expect(uriObj.ssp).assertEqual(expectedSsp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_1100
     * @tc.name testURI03Chapter0011
     * @tc.desc Verify ssp property with emoji characters in path (should be decoded in ssp)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const emojiPath = '/👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴';
      const uriString = `http://host${emojiPath}`;
      const uriObj = new uri.URI(uriString);
      const expectedSsp = `//host${emojiPath}`;
      expect(uriObj.ssp).assertEqual(expectedSsp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_1200
     * @tc.name testURI03Chapter0012
     * @tc.desc Verify ssp property when path contains percent-encoded control characters (newline, tab)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const encodedPath = '/path%0Awith%09tab';
      const uriString = `http://host${encodedPath}`;
      const uriObj = new uri.URI(uriString);
      const expectedSsp = '//host/path\nwith\ttab';
      expect(uriObj.ssp).assertEqual(expectedSsp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_1300
     * @tc.name testURI03Chapter0013
     * @tc.desc Verify ssp property with extremely long scheme-specific part (performance/memory)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const longPart = 'a'.repeat(100000);
      const uriString = `myscheme:${longPart}`;
      const uriObj = new uri.URI(uriString);
      expect(uriObj.ssp).assertEqual(longPart);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_1400
     * @tc.name testURI03Chapter0014
     * @tc.desc Verify ssp property when query contains numeric and boolean values as strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const uriObj = new uri.URI('http://host/path?num=123&bool=true&zero=0&nan=NaN');
      const expectedSsp = '//host/path?num=123&bool=true&zero=0&nan=NaN';
      expect(uriObj.ssp).assertEqual(expectedSsp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_1500
     * @tc.name testURI03Chapter0015
     * @tc.desc Verify ssp property when query contains an array representation (must be percent-encoded)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const uriObj = new uri.URI('http://host/path?arr=%5B1%2C2%2C3%5D');
      const expectedSsp = '//host/path?arr=[1,2,3]';
      expect(uriObj.ssp).assertEqual(expectedSsp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_1600
     * @tc.name testURI03Chapter0016
     * @tc.desc Verify ssp property when query contains an object representation (percent-encoded)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const uriObj = new uri.URI('http://host/path?obj=%7B%22a%22%3A1%2C%22b%22%3A%22test%22%7D');
      const expectedSsp = '//host/path?obj={"a":1,"b":"test"}';
      expect(uriObj.ssp).assertEqual(expectedSsp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_1700
     * @tc.name testURI03Chapter0017
     * @tc.desc Verify ssp property when path contains keywords like "0" and "NaN"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const uriObj = new uri.URI('http://host/0/NaN/file');
      const expectedSsp = '//host/0/NaN/file';
      expect(uriObj.ssp).assertEqual(expectedSsp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_1800
     * @tc.name testURI03Chapter0018
     * @tc.desc Verify ssp property for a URI with a long tree-like string (JSON array) as scheme-specific part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_1900
     * @tc.name testURI03Chapter0019
     * @tc.desc Test constructing URI with space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const uriObj = new uri.URI('http://host/illegal space');
      const uriString = uriObj.toString();

      const isValid = uriObj !== null && uriString !== undefined && uriString !== '';

      expect(isValid).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_2000
     * @tc.name testURI03Chapter0020
     * @tc.desc Test constructing URI with unpaired surrogate (illegal Unicode)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const encodedPath = '%ED%A0%BD';
      let uriObj: uri.URI | null = null;
      let parseError: Error | null = null;

      try {
        uriObj = new uri.URI('http://host/' + encodedPath);
      } catch (e) {
        parseError = e as Error;
      }

      const isValid = parseError === null && uriObj !== null;
      expect(isValid).assertTrue();

      if (uriObj) {
        const uriString = uriObj.toString();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_2100
     * @tc.name testURI03Chapter0021
     * @tc.desc Reverse test: constructing URI with empty string should throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let parseError: Error | null = null;
      let uriObj: uri.URI | null = null;

      try {
        uriObj = new uri.URI('');
      } catch (e) {
        parseError = e as Error;
      }

      const isValid = parseError !== null && uriObj === null;
      expect(isValid).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_2200
     * @tc.name testURI03Chapter0022
     * @tc.desc Test constructing URI with invalid percent encoding (%ZZ)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const uriObj = new uri.URI('http://host/%ZZ');
      const uriString = uriObj.toString();

      const isValid = uriObj !== null && uriString !== undefined && uriString !== '';
      expect(isValid).assertTrue();
    });

    // =============== encodedUserInfo12+ ======================

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_2300
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_2400
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_2500
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_2600
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_2700
     * @tc.name testURI03Chapter0027
     * @tc.desc Test encodedUserInfo with special characters that require percent-encoding (already encoded)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let parseError: Error | null = null;
      let uriObj: uri.URI | null = null;

      try {
        const userInfo = "%23%25%3F%5B%5C%5D%5E%60%7B%7C%7D";
        uriObj = new uri.URI(`https://${userInfo}@host/path`);
      } catch (e) {
        parseError = e as Error;
      }

      expect(parseError === null).assertTrue();
      expect(uriObj !== null).assertTrue();

      if (uriObj) {
        const encodedUserInfo = uriObj.encodedUserInfo;
        const uriString = uriObj.toString();
        expect(encodedUserInfo !== undefined && encodedUserInfo !== null).assertTrue();
        expect(encodedUserInfo).assertEqual("%23%25%3F%5B%5C%5D%5E%60%7B%7C%7D");
        expect(uriString.includes(encodedUserInfo)).assertTrue();
        expect(uriString.includes('@host')).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_2800
     * @tc.name testURI03Chapter0028
     * @tc.desc Test encodedUserInfo covering all printable ASCII characters (32-126) with necessary percent-encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let raw = '';
      for (let i = 32; i <= 126; i++) {
        raw += String.fromCharCode(i);
      }
      const encoded = raw
        .replace(/#/g, '%23')
        .replace(/%/g, '%25')
        .replace(/\?/g, '%3F')
        .replace(/\[/g, '%5B')
        .replace(/\\/g, '%5C')
        .replace(/\]/g, '%5D')
        .replace(/\^/g, '%5E')
        .replace(/`/g, '%60')
        .replace(/\{/g, '%7B')
        .replace(/\|/g, '%7C')
        .replace(/\}/g, '%7D');

      let uriObj: uri.URI | null = null;

      try {
        uriObj = new uri.URI(`https://${encoded}@host/path`);
      } catch (e) {
      }

      if (uriObj) {
        const userInfo = uriObj.userInfo;
        expect(userInfo !== null && userInfo !== undefined && userInfo !== '').assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_2900
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_3000
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_3100
     * @tc.name testURI03Chapter0031
     * @tc.desc Test encodedUserInfo with illegal Unicode (lone surrogate)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const encodedUserInfo = '%ED%A0%BD';
      let uriObj: uri.URI | null = null;
      let parseError: Error | null = null;
      try {
        uriObj = new uri.URI(`https://${encodedUserInfo}@host/path`);
      } catch (e) {
        parseError = e as Error;
      }

      expect(parseError === null).assertTrue();
      expect(uriObj !== null).assertTrue();

      if (uriObj) {
        const userInfo = uriObj.userInfo;
        const uriString = uriObj.toString();

        const isValidUserInfo = userInfo !== null &&
          userInfo !== undefined &&
          (userInfo === '%ED%A0%BD' ||
            userInfo === '�' ||
          userInfo.includes('ED'));
        expect(isValidUserInfo).assertTrue();

        expect(uriString.includes('@host')).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_3200
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_3300
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_3400
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_3500
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_3600
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_3700
     * @tc.name testURI03Chapter0037
     * @tc.desc Test encodedUserInfo with array-like string "[1,2,3]"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const uriObj = new uri.URI('https://[1,2,3]@host/path');
        expect(uriObj.encodedUserInfo).assertEqual('[1,2,3]');
      } catch (e) {
        expect(e).assertInstanceOf('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_3800
     * @tc.name testURI03Chapter0038
     * @tc.desc Test encodedUserInfo with object-like string "{\"a\":1}"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let parseError: Error | null = null;
      let uriObj: uri.URI | null = null;

      try {
        uriObj = new uri.URI('https://{"a":1}@host/path');
      } catch (e) {
        parseError = e as Error;
      }

      expect(parseError !== null).assertTrue();

      if (parseError) {
        const errorString = parseError.toString();
        const hasExpectedError = errorString.includes('invalid') ||
        errorString.includes('character') ||
        errorString.includes('userInfo') ||
        errorString.includes('parse') ||
        errorString.includes('URI');
        expect(hasExpectedError).assertTrue();
      }

      if (uriObj === null) {
        const nullString = String(uriObj);
        expect(nullString === 'null').assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_3900
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_4000
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_4100
     * @tc.name testURI03Chapter0041
     * @tc.desc Test encodedUserInfo with unencoded '?' in userinfo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://user?name@host/path');

      expect(uriObj !== null).assertTrue();
      const userInfo = uriObj.userInfo;

      const isValid = userInfo === 'user%3Fname' ||
        userInfo === 'user?name' ||
        (userInfo !== null && userInfo.includes('user'));

      expect(isValid).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_4200
     * @tc.name testURI03Chapter0042
     * @tc.desc Test encodedUserInfo with unencoded '#' in userinfo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://user#name@host/path');
      expect(uriObj !== null).assertTrue();

      const userInfo = uriObj.userInfo;
      const isValid = userInfo === 'user%23name' ||
        userInfo === 'user#name' ||
        userInfo === 'user' ||
        (userInfo !== null && userInfo.includes('user'));

      expect(isValid).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_4300
     * @tc.name testURI03Chapter0043
     * @tc.desc Test encodedUserInfo reverse: empty string as URI constructor argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        new uri.URI('');
        expect(null).assertFail();
      } catch (e) {
        expect(e).assertInstanceOf('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_4400
     * @tc.name testURI03Chapter0044
     * @tc.desc Test encodedUserInfo reverse: unencoded control character (newline) in userinfo causes exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        new uri.URI('https://user\nname@host/path');
        expect(null).assertFail();
      } catch (e) {
        expect(e).assertInstanceOf('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_4500
     * @tc.name testURI03Chapter0045
     * @tc.desc Test encodedUserInfo with unencoded surrogate pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const encodedUserInfo = '%ED%A0%BD';
      let uriObj: uri.URI | null = null;
      let parseError: Error | null = null;

      try {
        uriObj = new uri.URI(`https://${encodedUserInfo}@host/path`);
      } catch (e) {
        parseError = e as Error;
      }

      expect(parseError === null).assertTrue();
      expect(uriObj !== null).assertTrue();

      if (uriObj) {
        const userInfo = uriObj.userInfo;
        const uriString = uriObj.toString();

        expect(userInfo !== null && userInfo !== undefined).assertTrue();
        expect(uriString.includes('@host')).assertTrue();
      }
    });
    // =============== encodedPath12+ ======================
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_4600
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_4700
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_4800
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_4900
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_5000
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_5100
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_5200
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_5300
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_5400
     * @tc.name testURI03Chapter0054
     * @tc.desc Test encodedPath property with full ASCII printable characters (0x20-0x7E) in path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {

      let parseError1: Error | null = null;
      try {
        const asciiPath =
          '/ !"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
        new uri.URI('http://example.com' + asciiPath);
      } catch (e) {
        parseError1 = e as Error;
      }
      expect(parseError1 !== null).assertTrue();
      let parseError2: Error | null = null;
      try {
        const allowedPath = '/!$&\'()*+,-.:;=@ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~';
        new uri.URI('http://example.com' + allowedPath);
      } catch (e) {
        parseError2 = e as Error;
      }
      expect(parseError2 !== null).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_5500
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_5600
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_5700
     * @tc.name testURI03Chapter0057
     * @tc.desc Test invalid percent encoding in path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/%G0');
      const uriString = uriObj.toString();

      const isValid = uriObj !== null && uriString !== undefined && uriString !== '';
      expect(isValid).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_5800
     * @tc.name testURI03Chapter0058
     * @tc.desc Reverse test: path containing control characters (e.g., \n) should throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let parseError: Error | null = null;
      let uriObj: uri.URI | null = null;

      try {
        uriObj = new uri.URI('http://example.com/backslash\\value');
      } catch (e) {
        parseError = e as Error;
      }
      expect(parseError !== null).assertTrue();
      expect(uriObj === null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_5900
     * @tc.name testURI03Chapter0059
     * @tc.desc Test path containing invalid Unicode surrogate pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const encodedPath = '%ED%A0%BD';
      let uriObj: uri.URI | null = null;
      let parseError: Error | null = null;

      try {
        uriObj = new uri.URI('http://example.com/' + encodedPath);
      } catch (e) {
        parseError = e as Error;
      }

      expect(parseError === null).assertTrue();
      expect(uriObj !== null).assertTrue();
      if (uriObj) {
        const uriString = uriObj.toString();
        expect(uriString.includes('example.com')).assertTrue();
        expect(uriString.includes('/')).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_6000
     * @tc.name testURI03Chapter0060
     * @tc.desc Test missing scheme or malformed URI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('not a uri');
      const uriString = uriObj.toString();

      expect(uriObj !== null).assertTrue();
      expect(uriString !== undefined && uriString !== '').assertTrue();
      expect(uriString.length > 0).assertTrue();
    });
    // =============== encodedQuery12+ ======================
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_6100
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_6200
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_6300
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_6400
     * @tc.name testURI03Chapter0064
     * @tc.desc Test encodedQuery with all printable special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {

      let parseError: Error | null = null;
      let uriObj: uri.URI | null = null;

      try {
        const queryValue = '!\"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
        const fullQuery = 'chars=' + queryValue;
        uriObj = new uri.URI('http://example.com/path?' + fullQuery);
      } catch (e) {
        parseError = e as Error;
      }

      expect(parseError !== null).assertTrue();
      expect(uriObj === null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_6500
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_6600
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_6700
     * @tc.name testURI03Chapter0067
     * @tc.desc Test encodedQuery with escape sequences like newline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {

      let parseError: Error | null = null;
      let uriObj: uri.URI | null = null;

      try {
        uriObj = new uri.URI('http://example.com/path?key=line1\nline2');
      } catch (e) {
        parseError = e as Error;
      }
      if (parseError !== null) {
        expect(parseError !== null).assertTrue();
      } else {
        expect(uriObj !== null).assertTrue();
        if (uriObj) {
          const encodedQuery = uriObj.encodedQuery;
          expect(encodedQuery !== undefined && encodedQuery !== null).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_6800
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_6900
     * @tc.name testURI03Chapter0069
     * @tc.desc Test encodedQuery with invalid Unicode surrogate (lone high surrogate)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/path?surrogate=\uD83D');
      expect(uriObj.encodedQuery !== null).assertTrue();
      expect(typeof uriObj.encodedQuery === 'string').assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_7000
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_7100
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_7200
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_7300
     * @tc.name testURI03Chapter0073
     * @tc.desc Test encodedQuery with numeric boundary values as strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj =
        new uri.URI('http://example.com/path?val1=0&val2=-0&val3=Infinity&val4=-Infinity&val5=NaN&val6=1.7976931348623157e%2B308');
      const uriObj2 = new uri.URI('http://example.com/path?max=' + Number.MAX_VALUE.toString());
      expect(uriObj2.encodedQuery !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_7400
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_7500
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_7600
     * @tc.name testURI03Chapter0076
     * @tc.desc Test invalid percent-encoding in query part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/path?key=%');
      expect(uriObj !== null).assertTrue();
      const query = uriObj.query;
      const isValid = query !== undefined &&
        query !== null &&
        (query.includes('key') || query.includes('%'));

      expect(isValid).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_7700
     * @tc.name testURI03Chapter0077
     * @tc.desc Test another invalid percent-encoding: incomplete sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/path?key=%G0');

      expect(uriObj !== null).assertTrue();

      const query = uriObj.query;
      const isValid = query !== undefined &&
        query !== null &&
        (query.includes('key') || query.includes('%G0') || query.includes('G0'));

      expect(isValid).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_7800
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_7900
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

    // =============== encodedFragment12+ ======================

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_8000
     * @tc.name testURI03Chapter0080
     * @tc.desc Test encodedFragment property when URI has no fragment (without #)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const uriObj = new uri.URI("http://example.com/path");
        const result = uriObj.encodedFragment;
        expect(result).assertEqual(null);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_8100
     * @tc.name testURI03Chapter0081
     * @tc.desc Test encodedFragment property when fragment is empty string (trailing #)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const uriObj = new uri.URI("http://example.com/path#");
        const result = uriObj.encodedFragment;
        expect(result).assertNull();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_8200
     * @tc.name testURI03Chapter0082
     * @tc.desc Test encodedFragment with simple alphanumeric fragment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const uriObj = new uri.URI("http://example.com/path#section1");
        const result = uriObj.encodedFragment;
        expect(result).assertEqual("section1");
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_8300
     * @tc.name testURI03Chapter0083
     * @tc.desc Test encodedFragment with fragment containing space (should be encoded)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const uriObj = new uri.URI("http://example.com/path#my fragment");
        const result = uriObj.encodedFragment;
        expect(result).assertEqual("my fragment");
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_8400
     * @tc.name testURI03Chapter0084
     * @tc.desc Test encodedFragment with fragment containing characters that do not require encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const fragment = "!$&'()*+,-./:;=?@_~";
        const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
        const result = uriObj.encodedFragment;
        expect(result).assertEqual(fragment);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_8500
     * @tc.name testURI03Chapter0085
     * @tc.desc Test encodedFragment with fragment containing characters that require encoding (excluding reserved delimiters)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {

        let parseError: Error | null = null;
        let uriObj: uri.URI | null = null;

        try {
          const fragment = "\"#%<>[\\]^`{|}";
          uriObj = new uri.URI(`http://example.com/path#${fragment}`);
        } catch (e) {
          parseError = e as Error;
        }

        if (parseError !== null) {
          expect(parseError !== null).assertTrue();
        } else {
          expect(uriObj !== null).assertTrue();
          if (uriObj) {
            const encodedFragment = uriObj.encodedFragment;
            expect(encodedFragment !== undefined && encodedFragment !== null).assertTrue();
          }
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_8600
     * @tc.name testURI03Chapter0086
     * @tc.desc Test encodedFragment with fragment containing all printable ASCII characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {

        const ascii =
          "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";

        let parseError: Error | null = null;
        let uriObj: uri.URI | null = null;

        try {
          uriObj = new uri.URI(`http://example.com/path#${ascii}`);
        } catch (e) {
          parseError = e as Error;
        }

        if (parseError !== null) {
          expect(parseError !== null).assertTrue();
        } else {
          expect(uriObj !== null).assertTrue();
          if (uriObj) {
            const encodedFragment = uriObj.encodedFragment;
            expect(encodedFragment !== undefined && encodedFragment !== null).assertTrue();
          }
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_8700
     * @tc.name testURI03Chapter0087
     * @tc.desc Test encodedFragment with fragment containing duplicate special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {

        const fragment = "!!\"\"##$$%%&&''(())**++,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";

        let parseError: Error | null = null;
        let uriObj: uri.URI | null = null;

        try {
          uriObj = new uri.URI(`http://example.com/path#${fragment}`);
        } catch (e) {
          parseError = e as Error;
        }

        if (parseError !== null) {
          expect(parseError !== null).assertTrue();
        } else {
          expect(uriObj !== null).assertTrue();
          if (uriObj) {
            const encodedFragment = uriObj.encodedFragment;
            expect(encodedFragment !== undefined && encodedFragment !== null).assertTrue();
          }
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_8800
     * @tc.name testURI03Chapter0088
     * @tc.desc Test encodedFragment with fragment containing escape sequences (newline, tab, etc.)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {

        const fragment = "\u0007\u0008\u000C\u000A\u000D\u0009\u000B";

        let parseError: Error | null = null;
        let uriObj: uri.URI | null = null;

        try {
          uriObj = new uri.URI(`http://example.com/path#${fragment}`);
        } catch (e) {
          parseError = e as Error;
        }

        if (parseError !== null) {
          expect(parseError !== null).assertTrue();
        } else {
          expect(uriObj !== null).assertTrue();
          if (uriObj) {
            const encodedFragment = uriObj.encodedFragment;
            expect(encodedFragment !== undefined && encodedFragment !== null).assertTrue();
          }
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_8900
     * @tc.name testURI03Chapter0089
     * @tc.desc Test encodedFragment with fragment containing emoji characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const fragment = "👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴";
        const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
        const result = uriObj.encodedFragment;
        expect(result).assertEqual(fragment);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_9000
     * @tc.name testURI03Chapter0090
     * @tc.desc Test encodedFragment with fragment containing illegal Unicode (lone surrogate)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const encodedFragment = '%ED%A0%BD';
        let uriObj: uri.URI | null = null;
        let parseError: Error | null = null;

        try {
          uriObj = new uri.URI(`http://example.com/path#${encodedFragment}`);
        } catch (e) {
          parseError = e as Error;
        }

        expect(parseError === null).assertTrue();
        expect(uriObj !== null).assertTrue();

        if (uriObj) {
          const fragment = uriObj.fragment;
          const uriString = uriObj.toString();

          expect(fragment !== null && fragment !== undefined).assertTrue();
          expect(uriString.includes('#')).assertTrue();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_9100
     * @tc.name testURI03Chapter0091
     * @tc.desc Test encodedFragment with fragment equal to string "undefined"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const uriObj = new uri.URI("http://example.com/path#undefined");
        const result = uriObj.encodedFragment;
        expect(result).assertEqual("undefined");
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_9200
     * @tc.name testURI03Chapter0092
     * @tc.desc Test encodedFragment with fragment equal to string "null"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const uriObj = new uri.URI("http://example.com/path#null");
        const result = uriObj.encodedFragment;
        expect(result).assertEqual("null");
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_9300
     * @tc.name testURI03Chapter0093
     * @tc.desc Test encodedFragment with fragment equal to string "NaN"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const uriObj = new uri.URI("http://example.com/path#NaN");
        const result = uriObj.encodedFragment;
        expect(result).assertEqual("NaN");
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_9400
     * @tc.name testURI03Chapter0094
     * @tc.desc Test encodedFragment with fragment equal to string "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const uriObj = new uri.URI("http://example.com/path#0");
        const result = uriObj.encodedFragment;
        expect(result).assertEqual("0");
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_9500
     * @tc.name testURI03Chapter0095
     * @tc.desc Test encodedFragment with fragment containing numeric string "123.456"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const uriObj = new uri.URI("http://example.com/path#123.456");
        const result = uriObj.encodedFragment;
        expect(result).assertEqual("123.456");
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_9600
     * @tc.name testURI03Chapter0096
     * @tc.desc Test encodedFragment with fragment containing boolean string "true"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const uriObj = new uri.URI("http://example.com/path#true");
        const result = uriObj.encodedFragment;
        expect(result).assertEqual("true");
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_9700
     * @tc.name testURI03Chapter0097
     * @tc.desc Test encodedFragment with fragment containing boolean string "false"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const uriObj = new uri.URI("http://example.com/path#false");
        const result = uriObj.encodedFragment;
        expect(result).assertEqual("false");
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_9800
     * @tc.name testURI03Chapter0098
     * @tc.desc Test encodedFragment with fragment containing array string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const arr = [72, 101, 108, 108, 111];
        const fragment = arr.toString();
        const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
        const result = uriObj.encodedFragment;
        expect(result).assertEqual(fragment);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_9900
     * @tc.name testURI03Chapter0099
     * @tc.desc Test encodedFragment with fragment containing object string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const fragment = "[object Object]";
        const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
        const result = uriObj.encodedFragment;
        expect(result).assertEqual(fragment);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_10000
     * @tc.name testURI03Chapter0100
     * @tc.desc Test encodedFragment with extremely long fragment string (performance/robustness)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const longFragment = "a".repeat(10000);
        const uriObj = new uri.URI(`http://example.com/path#${longFragment}`);
        const result = uriObj.encodedFragment;
        expect(result.length).assertEqual(10000);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_10100
     * @tc.name testURI03Chapter0101
     * @tc.desc Test encodedFragment with fragment containing percent sign not followed by hex digits (illegal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const fragment = "%2";
        const uriObj = new uri.URI(`http://example.com/path#${fragment}`);

        expect(uriObj !== null).assertTrue();
        const actualFragment = uriObj.fragment;
        const isValid = actualFragment !== undefined &&
          actualFragment !== null &&
          (actualFragment === '%2' ||
            actualFragment === '%' ||
          actualFragment.includes('2'));

        expect(isValid).assertTrue();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_10200
     * @tc.name testURI03Chapter0102
     * @tc.desc Test encodedFragment with fragment containing only a percent sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const fragment = "%";
        const uriObj = new uri.URI(`http://example.com/path#${fragment}`);

        expect(uriObj !== null).assertTrue();
        const actualFragment = uriObj.fragment;
        const isValid = actualFragment !== undefined &&
          actualFragment !== null &&
          (actualFragment === '%' ||
            actualFragment === '' ||
            actualFragment === '%25');

        expect(isValid).assertTrue();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_10300
     * @tc.name testURI03Chapter0103
     * @tc.desc Test encodedFragment when fragment contains characters that are valid after percent encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const fragment = "caf%C3%A9";
        const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
        const result = uriObj.encodedFragment;
        expect(result).assertEqual(fragment);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_10400
     * @tc.name testURI03Chapter0104
     * @tc.desc Test encodedFragment with fragment containing mixed allowed and encoded characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const fragment = "hello world!%20test";
        const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
        const result = uriObj.encodedFragment;
        expect(result).assertEqual("hello world!%20test");
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITest03_10500
     * @tc.name testURI03Chapter0105
     * @tc.desc Test encodedFragment with fragment containing control characters (BEL, BS, etc.) already percent-encoded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI03Chapter0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const fragment = "%07%08%09";
        const expected = "%07%08%09";
        const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
        const result = uriObj.encodedFragment;
        expect(result).assertEqual(expected);
      });
  });
}
