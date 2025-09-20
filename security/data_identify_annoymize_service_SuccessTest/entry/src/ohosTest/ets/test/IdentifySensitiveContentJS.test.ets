
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level,Size } from '@ohos/hypium';
import identifySensitiveContent from '@ohos.security.identifySensitiveContent';
import { dlpPermission } from '@kit.DataProtectionKit';
let filePathTest = "/data/app/el1/bundle/public/";
let notFile = "/data/storage/a.txt";
let dataPath = "/data/app/el2/100/base/com.huawei.fileencryptionmanage/files/grs_files/ge_sys_commonUI/version.txt";
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
     * @tc.number PrivacyAssistant_JS_25.1_2_004
     * @tc.name scanfileInputnull
     * @tc.desc normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('scanfileInputnull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
      if (await dlpPermission.isDLPFeatureProvided() === true) {
        console.info('scanfileInputnull');
        let policies:identifySensitiveContent.Policy[] =[];
        try {
          await identifySensitiveContent.scanFile(null,policies);
          expect().assertFail();
        }catch (error){
          console.info('scanfileInputnull:'+error.code);
          expect(401).assertEqual(error.code);
        }
        try {
          await identifySensitiveContent.scanFile(filePathTest,null);
          expect().assertFail();
        }catch (error){
          console.info('scanfileInputnull:'+error.code);
          expect(401).assertEqual(error.code);
        }
      }
      if(await dlpPermission.isDLPFeatureProvided() === false){
        console.info('scanfileInputnull');
        let policies:identifySensitiveContent.Policy[] =[];
        try {
          await identifySensitiveContent.scanFile(null,policies);
          expect().assertFail();
        }catch (error){
          console.info('scanfileInputnull:'+error.code);
          expect(201).assertEqual(error.code);
        }
        try {
          await identifySensitiveContent.scanFile(filePathTest,null);
          expect().assertFail();
        }catch (error){
          console.info('scanfileInputnull:'+error.code);
          expect(201).assertEqual(error.code);
        }
      }

    })

  /**
     * @tc.number PrivacyAssistant_JS_25.1_2_012
     * @tc.name scanfileTypeNotSupport
     * @tc.desc normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('scanfileTypeNotSupport', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async() => {
      if (await dlpPermission.isDLPFeatureProvided() === true) {
        console.info('scanfileTypeNotSupport');
        let policy:identifySensitiveContent.Policy = {sensitiveLabel:"Pornography",keywords:[],regex:"hello"};
        let policies:identifySensitiveContent.Policy[] =[policy];
        try {
          await identifySensitiveContent.scanFile(notFile,policies);
          expect().assertFail();
        }catch (error){
          console.info('scanfileTypeNotSupport:'+error.code);
          expect(19110003).assertEqual(error.code);
        }
      }
      if (await dlpPermission.isDLPFeatureProvided() === false) {
        console.info('scanfileTypeNotSupport');
        let policy:identifySensitiveContent.Policy = {sensitiveLabel:"Pornography",keywords:[],regex:"hello"};
        let policies:identifySensitiveContent.Policy[] =[policy];
        try {
          await identifySensitiveContent.scanFile(notFile,policies);expect().assertFail();
        }catch (error){
          console.info('scanfileTypeNotSupport:'+error.code);
          expect(201).assertEqual(error.code);
        }
      }

    })

     /**
     * @tc.number PrivacyAssistant_JS_25.1_2_001
     * @tc.name scanfileSandboxDirtxt
     * @tc.desc normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('scanfileSandboxDirtxt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
      if (await dlpPermission.isDLPFeatureProvided() === true) {
        console.info('scanfileSandboxDirtxt');
        let policy:identifySensitiveContent.Policy = {sensitiveLabel:"Pornography",keywords:[],regex:"hello"};
        let policies:identifySensitiveContent.Policy[] =[policy];
        try {
          let matchResult =  await identifySensitiveContent.scanFile(dataPath,policies);
          console.info("scanfileSandboxDirtxt:"+matchResult.length);
          expect(0).assertEqual(matchResult.length);
        }catch (error){
          expect().assertFail();
        }
      }
      if (await dlpPermission.isDLPFeatureProvided() === false) {
        console.info('scanfileSandboxDirtxt');
        let policy:identifySensitiveContent.Policy = {sensitiveLabel:"Pornography",keywords:[],regex:"hello"};
        let policies:identifySensitiveContent.Policy[] =[policy];
        try {
          let matchResult =  await identifySensitiveContent.scanFile(dataPath,policies);
          console.info("scanfileSandboxDirtxt:"+matchResult.length);
          expect(0).assertEqual(matchResult.length);
        }catch (error){
          console.info('scanfileSandboxDirtxt:'+error.code);
          expect(201).assertEqual(error.code);
        }
      }

    })

/**
     * @tc.number PrivacyAssistant_JS_25.1_2_006
     * @tc.name scanfile1025policy
     * @tc.desc normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('scanfile1025policy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async() => {
      if(await dlpPermission.isDLPFeatureProvided() === true){
        console.info('scanfile1025policy');
        let policy:identifySensitiveContent.Policy = {sensitiveLabel:"Pornography",keywords:['lei'],regex:"lei"};
        let policies:identifySensitiveContent.Policy[] =[];
        for (let i= 0;i<1024;i++){
          policies.push(policy);
        }
        try {
          let matchResult =  await identifySensitiveContent.scanFile(dataPath,policies);
          console.info("scanfile1025policy:"+matchResult.length);
          expect().assertFail();
        }catch (error){
          expect(19110001).assertEqual(error.code);
        }
      }
      if (await dlpPermission.isDLPFeatureProvided() === false) {
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
          console.info('scanfileTypeNotSupport:'+error.code);
          expect(201).assertEqual(error.code);
        }
      }

    })

    })


}