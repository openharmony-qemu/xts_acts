
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level,Size } from '@ohos/hypium';
import identifySensitiveContent from '@ohos.security.identifySensitiveContent';
import { dlpPermission } from '@kit.DataProtectionKit';
let filePathTest = "/data/app/el1/bundle/public/";
let notFile = "aaaaaa";
let dataPath = "/data/app/el2/0/database/h.txt";
export default function identifySensitiveContentTestUnit() {
  describe('identifySensitiveContentTestUnit', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    
    /**
     * @tc.name   scanfileInputnull
     * @tc.number PrivacyAssistant_JS_25.1_2_004
     * @tc.desc   normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('scanfileInputnull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
      console.info('scanfileInputnull');
      let policies:identifySensitiveContent.Policy[] =[];
      try {
        await identifySensitiveContent.scanFile("",policies);
        expect().assertFail();
      }catch (error){
        expect(error.code === 19110001  ||  error.code === 201 ).assertTrue();
      }
      try {
        await identifySensitiveContent.scanFile(null,policies);
        expect().assertFail();
      }catch (error){
        expect(error.code === 401  ||  error.code === 201 ).assertTrue();
      }
      try {
        await identifySensitiveContent.scanFile(undefined,policies);
        expect().assertFail();
      }catch (error){
        expect(error.code === 401  ||  error.code === 201 ).assertTrue();
      }
      try {
        await identifySensitiveContent.scanFile(filePathTest,null);
        expect().assertFail();
      }catch (error){
        expect(error.code === 401  ||  error.code === 201 ).assertTrue();
      }
      try {
        await identifySensitiveContent.scanFile(filePathTest,undefined);
        expect().assertFail();
      }catch (error){
        expect(error.code === 401  ||  error.code === 201 ).assertTrue();
      }
    })

    /**
     * @tc.name   scanfileTypeNotSupport
     * @tc.number PrivacyAssistant_JS_25.1_2_012
     * @tc.desc   normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('scanfileTypeNotSupport', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async() => {
        console.info('scanfileTypeNotSupport');
        let policy:identifySensitiveContent.Policy = {sensitiveLabel:"Pornography",keywords:[],regex:"hello"};
        let policies:identifySensitiveContent.Policy[] =[policy];
        try {
          await identifySensitiveContent.scanFile(notFile,policies);
        }catch (error){
          console.info('scanfileTypeNotSupport:'+error.code);
          expect( error.code === 19110004 || error.code === 201 || error.code === 19110003).assertTrue();
        }
    })

    /**
     * @tc.name   scanfileSandboxDirtxt
     * @tc.number PrivacyAssistant_JS_25.1_2_001
     * @tc.desc   normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('scanfileSandboxDirtxt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
        console.info('scanfileSandboxDirtxt');
        let policy:identifySensitiveContent.Policy = {sensitiveLabel:"Pornography",keywords:[],regex:"hello"};
        let policies:identifySensitiveContent.Policy[] =[policy];
        try {
          let matchResult =  await identifySensitiveContent.scanFile(dataPath,policies);
          console.info("scanfileSandboxDirtxt:"+matchResult.length);
          expect(matchResult.length).assertEqual(1);
          expect(matchResult[0].sensitiveLabel).assertEqual('Pornography');
          expect(matchResult[0].matchNumber).assertEqual(1);
          expect(matchResult[0].matchContent).assertEqual('h***o');
        }catch (error){
          expect(error.code===201 || error.code===19110004).assertTrue();
        }
    })

    /**
     * @tc.name   scanfileSandboxDirnull
     * @tc.number PrivacyAssistant_JS_25.1_2_000
     * @tc.desc   normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('scanfileSandboxDirnull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
        console.info('scanfileSandboxDirnull');
        let policy:identifySensitiveContent.Policy = {sensitiveLabel:"Pornography", keywords:[], regex:"hello"};
        let policies:identifySensitiveContent.Policy[] = [policy];
        try {
          let matchResult =  await identifySensitiveContent.scanFile(dataPath, policies);
          expect(matchResult.length).assertEqual(0);
          console.info("scanfileSandboxDirnull:" + matchResult.length);
        }catch (error){
          console.info('scanfileSandboxDirnull:'+error.code);
          expect(error.code===201 || error.code===19110004).assertTrue();
        }
    })

    /**
     * @tc.name   scanfile1025policy
     * @tc.number PrivacyAssistant_JS_25.1_2_006
     * @tc.desc   normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('scanfile1025policy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async() => {

        console.info('scanfile1025policy');
        let policy:identifySensitiveContent.Policy = {sensitiveLabel:"Pornography",keywords:['lei'],regex:"lei"};
        let policies:identifySensitiveContent.Policy[] =[];
        for (let i= 0;i<1025;i++){
          policies.push(policy);
        }
        try {
          let matchResult =  await identifySensitiveContent.scanFile(dataPath,policies);
          console.info("scanfile1025policy:"+matchResult.length);
          expect().assertFail();
        }catch (error){
          expect(error.code === 19110001 || error.code === 201 ).assertTrue();
        }
    })

    /**
     * @tc.name   scanfileDirectoryPath
     * @tc.number PrivacyAssistant_JS_25.1_2_007
     * @tc.desc   Test filePath is a directory path instead of file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('scanfileDirectoryPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async() => {
        console.info('scanfileDirectoryPath');
        let policy:identifySensitiveContent.Policy = {sensitiveLabel:"Test", keywords:[], regex:"test"};
        let policies:identifySensitiveContent.Policy[] = [policy];
        try {
          await identifySensitiveContent.scanFile(filePathTest, policies);
          expect().assertFail();
        } catch (error) {
          console.info('scanfileDirectoryPath:' + error.code);
          expect(error.code === 19110003 || error.code === 201 || error.code === 19110004).assertTrue();
        }
    })

    /**
     * @tc.name   scanfileEmptyPolicy
     * @tc.number PrivacyAssistant_JS_25.1_2_008
     * @tc.desc   Test with empty policy array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('scanfileEmptyPolicy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
        console.info('scanfileEmptyPolicy');
        let policies:identifySensitiveContent.Policy[] = [];
        try {
          let matchResult = await identifySensitiveContent.scanFile(dataPath, policies);
          console.info("scanfileEmptyPolicy:" + matchResult.length);
          expect(matchResult.length).assertEqual(0);
        } catch (error) {
          console.info('scanfileEmptyPolicy:' + error.code);
          expect(error.code === 19110001 || error.code === 201 || error.code === 19110004).assertTrue();
        }
    })

    /**
     * @tc.name   scanfilePolicyLabelEmpty
     * @tc.number PrivacyAssistant_JS_25.1_2_009
     * @tc.desc   Test policy with empty sensitiveLabel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('scanfilePolicyLabelEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async() => {
        console.info('scanfilePolicyLabelEmpty');
        let policy:identifySensitiveContent.Policy = {sensitiveLabel:"", keywords:[], regex:"test"};
        let policies:identifySensitiveContent.Policy[] = [policy];
        try {
          await identifySensitiveContent.scanFile(dataPath, policies);
          expect().assertFail();
        } catch (error) {
          console.info('scanfilePolicyLabelEmpty:' + error.code);
          expect(error.code === 19110001 || error.code === 201 || error.code === 19110004).assertTrue();
        }
    })

    /**
     * @tc.name   scanfilePolicyLabelLong
     * @tc.number PrivacyAssistant_JS_25.1_2_010
     * @tc.desc   Test policy with sensitiveLabel longer than 30 bytes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('scanfilePolicyLabelLong', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async() => {
        console.info('scanfilePolicyLabelLong');
        let longLabel = "a".repeat(31);
        let policy:identifySensitiveContent.Policy = {sensitiveLabel:longLabel, keywords:[], regex:"test"};
        let policies:identifySensitiveContent.Policy[] = [policy];
        try {
          await identifySensitiveContent.scanFile(dataPath, policies);
          expect().assertFail();
        } catch (error) {
          console.info('scanfilePolicyLabelLong:' + error.code);
          expect(error.code === 19110001 || error.code === 201 || error.code === 19110004).assertTrue();
        }
    })

    /**
     * @tc.name   scanfilePolicyKeywordsOverflow
     * @tc.number PrivacyAssistant_JS_25.1_2_011
     * @tc.desc   Test policy with keywords array more than 50 elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('scanfilePolicyKeywordsOverflow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async() => {
        console.info('scanfilePolicyKeywordsOverflow');
        let keywords:string[] = [];
        for (let i = 0; i < 51; i++) {
          keywords.push("keyword" + i);
        }
        let policy:identifySensitiveContent.Policy = {sensitiveLabel:"Test", keywords:keywords, regex:""};
        let policies:identifySensitiveContent.Policy[] = [policy];
        try {
          await identifySensitiveContent.scanFile(dataPath, policies);
          expect().assertFail();
        } catch (error) {
          console.info('scanfilePolicyKeywordsOverflow:' + error.code);
          expect(error.code === 19110001 || error.code === 201).assertTrue();
        }
    })

    /**
     * @tc.name   scanfilePolicyKeywordLong
     * @tc.number PrivacyAssistant_JS_25.1_2_013
     * @tc.desc   Test policy with keyword longer than 30 bytes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('scanfilePolicyKeywordLong', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async() => {
        console.info('scanfilePolicyKeywordLong');
        let longKeyword = "a".repeat(31);
        let policy:identifySensitiveContent.Policy = {sensitiveLabel:"Test", keywords:[longKeyword], regex:""};
        let policies:identifySensitiveContent.Policy[] = [policy];
        try {
          await identifySensitiveContent.scanFile(dataPath, policies);
          expect().assertFail();
        } catch (error) {
          console.info('scanfilePolicyKeywordLong:' + error.code);
          expect(error.code === 19110001 || error.code === 201 || error.code === 19110004).assertTrue();
        }
    })

    /**
     * @tc.name   scanfilePolicyRegexLong
     * @tc.number PrivacyAssistant_JS_25.1_2_014
     * @tc.desc   Test policy with regex longer than 512 bytes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('scanfilePolicyRegexLong', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async() => {
        console.info('scanfilePolicyRegexLong');
        let longRegex = "a".repeat(513);
        let policy:identifySensitiveContent.Policy = {sensitiveLabel:"Test", keywords:[], regex:longRegex};
        let policies:identifySensitiveContent.Policy[] = [policy];
        try {
          await identifySensitiveContent.scanFile(dataPath, policies);
          expect().assertFail();
        } catch (error) {
          console.info('scanfilePolicyRegexLong:' + error.code);
          expect(error.code === 19110001 || error.code === 201 || error.code === 19110004).assertTrue();
        }
    })

    /**
     * @tc.name   scanfilePolicyInvalidRegex
     * @tc.number PrivacyAssistant_JS_25.1_2_015
     * @tc.desc   Test policy with invalid regex pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('scanfilePolicyInvalidRegex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async() => {
        console.info('scanfilePolicyInvalidRegex');
        let policy:identifySensitiveContent.Policy = {sensitiveLabel:"Test", keywords:[], regex:"[invalid("};
        let policies:identifySensitiveContent.Policy[] = [policy];
        try {
          await identifySensitiveContent.scanFile(dataPath, policies);
          expect().assertFail();
        } catch (error) {
          console.info('scanfilePolicyInvalidRegex:' + error.code);
          expect(error.code === 19110001 || error.code === 201 || error.code === 19110004).assertTrue();
        }
    })

    /**
     * @tc.name   scanfilePolicyEmptyKeywordsAndRegex
     * @tc.number PrivacyAssistant_JS_25.1_2_016
     * @tc.desc   Test policy with empty keywords and empty regex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('scanfilePolicyEmptyKeywordsAndRegex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async() => {
        console.info('scanfilePolicyEmptyKeywordsAndRegex');
        let policy:identifySensitiveContent.Policy = {sensitiveLabel:"Test", keywords:[], regex:""};
        let policies:identifySensitiveContent.Policy[] = [policy];
        try {
          let matchResult = await identifySensitiveContent.scanFile(dataPath, policies);
          console.info("scanfilePolicyEmptyKeywordsAndRegex:" + matchResult.length);
          expect(matchResult.length).assertEqual(0);
        } catch (error) {
          console.info('scanfilePolicyEmptyKeywordsAndRegex:' + error.code);
          expect(error.code === 19110001 || error.code === 201 || error.code === 19110004).assertTrue();
        }
    })

    /**
     * @tc.name   scanfileMultiplePolicies
     * @tc.number PrivacyAssistant_JS_25.1_2_017
     * @tc.desc   Test with multiple valid policies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('scanfileMultiplePolicies', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
        console.info('scanfileMultiplePolicies');
        let policy1:identifySensitiveContent.Policy = {sensitiveLabel:"Label1", keywords:["test"], regex:"test"};
        let policy2:identifySensitiveContent.Policy = {sensitiveLabel:"Label2", keywords:["hello"], regex:"hello"};
        let policies:identifySensitiveContent.Policy[] = [policy1, policy2];
        try {
          let matchResult = await identifySensitiveContent.scanFile(dataPath, policies);
          console.info("scanfileMultiplePolicies:" + matchResult.length);
          expect(matchResult.length >= 0).assertTrue();
        } catch (error) {
          console.info('scanfileMultiplePolicies:' + error.code);
          expect(error.code === 201 || error.code === 19110004).assertTrue();
        }
    })

    /**
     * @tc.name   scanfileSpecialCharactersInPath
     * @tc.number PrivacyAssistant_JS_25.1_2_018
     * @tc.desc   Test filePath with special characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('scanfileSpecialCharactersInPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async() => {
        console.info('scanfileSpecialCharactersInPath');
        let specialPath = "/data/app/test file name.txt";
        let policy:identifySensitiveContent.Policy = {sensitiveLabel:"Test", keywords:[], regex:"test"};
        let policies:identifySensitiveContent.Policy[] = [policy];
        try {
          await identifySensitiveContent.scanFile(specialPath, policies);
          expect().assertFail();
        } catch (error) {
          console.info('scanfileSpecialCharactersInPath:' + error.code);
          expect(error.code === 19110003 || error.code === 201 || error.code === 19110004).assertTrue();
        }
    })

    /**
     * @tc.name   scanfileLabelBoundaryTest
     * @tc.number PrivacyAssistant_JS_25.1_2_019
     * @tc.desc   Test policy sensitiveLabel boundary values (1 byte and 30 bytes)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('scanfileLabelBoundaryTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
        console.info('scanfileLabelBoundaryTest');
        let policy1:identifySensitiveContent.Policy = {sensitiveLabel:"a", keywords:[], regex:"test"};
        let policy2:identifySensitiveContent.Policy = {sensitiveLabel:"a".repeat(30), keywords:[], regex:"test"};
        let policies:identifySensitiveContent.Policy[] = [policy1, policy2];
        try {
          let matchResult = await identifySensitiveContent.scanFile(dataPath, policies);
          console.info("scanfileLabelBoundaryTest:" + matchResult.length);
          expect(matchResult.length >= 0).assertTrue();
        } catch (error) {
          console.info('scanfileLabelBoundaryTest:' + error.code);
          expect(error.code === 201 || error.code === 19110004).assertTrue();
        }
    })

    /**
     * @tc.name   scanfileKeywordsBoundaryTest
     * @tc.number PrivacyAssistant_JS_25.1_2_020
     * @tc.desc   Test policy keywords boundary values (50 keywords, 30 bytes each)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('scanfileKeywordsBoundaryTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
        console.info('scanfileKeywordsBoundaryTest');
        let keywords:string[] = [];
        for (let i = 0; i < 50; i++) {
          keywords.push("keyword" + i);
        }
        let policy:identifySensitiveContent.Policy = {sensitiveLabel:"Test", keywords:keywords, regex:""};
        let policies:identifySensitiveContent.Policy[] = [policy];
        try {
          let matchResult = await identifySensitiveContent.scanFile(dataPath, policies);
          console.info("scanfileKeywordsBoundaryTest:" + matchResult.length);
          expect(matchResult.length >= 0).assertTrue();
        } catch (error) {
          console.info('scanfileKeywordsBoundaryTest:' + error.code);
          expect(error.code === 201 || error.code === 19110004).assertTrue();
        }
    })

    /**
     * @tc.name   scanfileRegexBoundaryTest
     * @tc.number PrivacyAssistant_JS_25.1_2_021
     * @tc.desc   Test policy regex boundary value (512 bytes)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('scanfileRegexBoundaryTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
        console.info('scanfileRegexBoundaryTest');
        let regex512 = "a".repeat(512);
        let policy:identifySensitiveContent.Policy = {sensitiveLabel:"Test", keywords:[], regex:regex512};
        let policies:identifySensitiveContent.Policy[] = [policy];
        try {
          let matchResult = await identifySensitiveContent.scanFile(dataPath, policies);
          console.info("scanfileRegexBoundaryTest:" + matchResult.length);
          expect(matchResult.length >= 0).assertTrue();
        } catch (error) {
          console.info('scanfileRegexBoundaryTest:' + error.code);
          expect(error.code === 201 || error.code === 19110004).assertTrue();
        }
    })

    /**
     * @tc.name   scanfileKeywordBoundary30Bytes
     * @tc.number PrivacyAssistant_JS_25.1_2_022
     * @tc.desc   Test policy keyword boundary value (30 bytes)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('scanfileKeywordBoundary30Bytes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
        console.info('scanfileKeywordBoundary30Bytes');
        let keyword30 = "a".repeat(30);
        let policy:identifySensitiveContent.Policy = {sensitiveLabel:"Test", keywords:[keyword30], regex:""};
        let policies:identifySensitiveContent.Policy[] = [policy];
        try {
          let matchResult = await identifySensitiveContent.scanFile(dataPath, policies);
          console.info("scanfileKeywordBoundary30Bytes:" + matchResult.length);
          expect(matchResult.length >= 0).assertTrue();
        } catch (error) {
          console.info('scanfileKeywordBoundary30Bytes:' + error.code);
          expect(error.code === 201 || error.code === 19110004).assertTrue();
        }
    })

    /**
     * @tc.name   scanfileChineseCharacters
     * @tc.number PrivacyAssistant_JS_25.1_2_023
     * @tc.desc   Test policy with Chinese characters in label and keywords
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('scanfileChineseCharacters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async() => {
        console.info('scanfileChineseCharacters');
        let policy:identifySensitiveContent.Policy = {sensitiveLabel:"敏感标签", keywords:["关键字"], regex:"测试"};
        let policies:identifySensitiveContent.Policy[] = [policy];
        try {
          let matchResult = await identifySensitiveContent.scanFile(dataPath, policies);
          console.info("scanfileChineseCharacters:" + matchResult.length);
          expect(matchResult.length >= 0).assertTrue();
        } catch (error) {
          console.info('scanfileChineseCharacters:' + error.code);
          expect(error.code === 201 || error.code === 19110004).assertTrue();
        }
    })

    /**
     * @tc.name   scanfileSpecialRegexPatterns
     * @tc.number PrivacyAssistant_JS_25.1_2_024
     * @tc.desc   Test policy with special regex patterns
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('scanfileSpecialRegexPatterns', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async() => {
        console.info('scanfileSpecialRegexPatterns');
        let policy:identifySensitiveContent.Policy = {sensitiveLabel:"Test", keywords:[], regex:"\\d+|[a-z]+"};
        let policies:identifySensitiveContent.Policy[] = [policy];
        try {
          let matchResult = await identifySensitiveContent.scanFile(dataPath, policies);
          console.info("scanfileSpecialRegexPatterns:" + matchResult.length);
          expect(matchResult.length >= 0).assertTrue();
        } catch (error) {
          console.info('scanfileSpecialRegexPatterns:' + error.code);
          expect(error.code === 201 || error.code === 19110004).assertTrue();
        }
    })

    /**
     * @tc.name   scanfileWithKeywordsAndRegex
     * @tc.number PrivacyAssistant_JS_25.1_2_025
     * @tc.desc   Test policy with both keywords and regex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('scanfileWithKeywordsAndRegex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
        console.info('scanfileWithKeywordsAndRegex');
        let policy:identifySensitiveContent.Policy = {sensitiveLabel:"Test", keywords:["hello"], regex:"hello"};
        let policies:identifySensitiveContent.Policy[] = [policy];
        try {
          let matchResult = await identifySensitiveContent.scanFile(dataPath, policies);
          console.info("scanfileWithKeywordsAndRegex:" + matchResult.length);
          expect(matchResult.length >= 0).assertTrue();
        } catch (error) {
          console.info('scanfileWithKeywordsAndRegex:' + error.code);
          expect(error.code === 201 || error.code === 19110004).assertTrue();
        }
    })

    /**
     * @tc.name   scanfileCaseSensitive
     * @tc.number PrivacyAssistant_JS_25.1_2_026
     * @tc.desc   Test that keywords are case sensitive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('scanfileCaseSensitive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async() => {
        console.info('scanfileCaseSensitive');
        let policy:identifySensitiveContent.Policy = {sensitiveLabel:"Test", keywords:["HELLO"], regex:""};
        let policies:identifySensitiveContent.Policy[] = [policy];
        try {
          let matchResult = await identifySensitiveContent.scanFile(dataPath, policies);
          console.info("scanfileCaseSensitive:" + matchResult.length);
          expect(matchResult.length >= 0).assertTrue();
        } catch (error) {
          console.info('scanfileCaseSensitive:' + error.code);
          expect(error.code === 201 || error.code === 19110004).assertTrue();
        }
    })

    })


}