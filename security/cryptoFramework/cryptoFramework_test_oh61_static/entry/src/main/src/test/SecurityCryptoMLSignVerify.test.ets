/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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
import { describe, it, expect, TestType, Size, Level} from "../../../hypium/index";
import { cryptoFramework } from '@kit.CryptoArchitectureKit';
import { compareDataBlob } from './utils/common/commonUtils';
import { BusinessError } from '@ohos.base';

export default function SecurityCryptoMLSignVerifyTestUnit() {
  describe('SecurityCryptoMLSignVerifyTestUnit', () => {

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_SignVerify_Func_0100
     * @tc.number SUB_Security_CryptoFramework_MLDSA_SignVerify_Func_0100
     * @tc.desc   ML-DSA-65 sign and verify functional test (Sync interface).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MLDSA_SignVerify_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          expect(sign.algName).assertEqual("ML-DSA");
          sign.initSync(keyPair.priKey);
          let message: cryptoFramework.DataBlob = { data: new Uint8Array([0x68, 0x65, 0x6C, 0x6C, 0x6F, 0x20, 0x77, 0x6F, 0x72, 0x6C, 0x64]) };
          let signature: cryptoFramework.DataBlob = await sign.sign(message);
          expect(signature.data.length).assertEqual(3309);
          let verify: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          verify.initSync(keyPair.pubKey);
          let result: boolean = verify.verifySync(message, signature);
          expect(result).assertTrue();
        } catch (error) {
          console.error(`[XTS] MLDSA_SignVerify_Func_0100 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_SignVerify_Func_0200
     * @tc.number SUB_Security_CryptoFramework_MLDSA_SignVerify_Func_0200
     * @tc.desc   ML-DSA-44 sign and verify functional test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MLDSA_SignVerify_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-44");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.initSync(keyPair.priKey);
          let message: cryptoFramework.DataBlob = { data: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05]) };
          let signature: cryptoFramework.DataBlob = sign.signSync(message);
          expect(signature.data.length).assertEqual(2420);
          let verify: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          verify.initSync(keyPair.pubKey);
          let result: boolean = await verify.verify(message, signature);
          expect(result).assertTrue();
        } catch (error) {
          console.error(`[XTS] MLDSA_SignVerify_Func_0200 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_SignVerify_Func_0300
     * @tc.number SUB_Security_CryptoFramework_MLDSA_SignVerify_Func_0300
     * @tc.desc   ML-DSA-87 sign and verify functional test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MLDSA_SignVerify_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-87");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          await sign.init(keyPair.priKey);
          let message: cryptoFramework.DataBlob = { data: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05]) };
          let signature: cryptoFramework.DataBlob = await sign.sign(message);
          expect(signature.data.length).assertEqual(4627);
          let verify: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          await verify.init(keyPair.pubKey);
          let result: boolean = await verify.verify(message, signature);
          expect(result).assertTrue();
        } catch (error) {
          console.error(`[XTS] MLDSA_SignVerify_Func_0300 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Spec_Func_0500
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Spec_Func_0500
     * @tc.desc   Set deterministic before init - functional test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MLDSA_Spec_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_DETERMINISTIC_BOOL, true);
          sign.initSync(keyPair.priKey);
          let message1: cryptoFramework.DataBlob = { data: new Uint8Array([0x01, 0x02, 0x03]) };
          let signature1: cryptoFramework.DataBlob = sign.signSync(message1);
          let sign2: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign2.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_DETERMINISTIC_BOOL, true);
          sign2.initSync(keyPair.priKey);
          let signature2: cryptoFramework.DataBlob = sign2.signSync(message1);
          expect(signature1.data.length).assertEqual(signature2.data.length);
          let ret: boolean = compareDataBlob(signature1, signature2);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`[XTS] MLDSA_Spec_Func_0500 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Spec_Func_0600
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Spec_Func_0600
     * @tc.desc   Set mu before init - functional test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MLDSA_Spec_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_MU_BOOL, true);
          sign.initSync(keyPair.priKey);
          let message: cryptoFramework.DataBlob = { data: new Uint8Array([
            0x30, 0x82, 0x01, 0x3d, 0x30, 0x81, 0xe4, 0x02, 0x01, 0x01, 0x30, 0x0a, 0x06, 0x08, 0x2a, 0x81,
            0x1c, 0xcf, 0x55, 0x01, 0x83, 0x75, 0x30, 0x7c, 0x31, 0x0b, 0x30, 0x09, 0x06, 0x03, 0x55, 0x04,
            0x06, 0x13, 0x02, 0x43, 0x4e, 0x31, 0x10, 0x30, 0x0e, 0x06, 0x03, 0x55, 0x04, 0x08, 0x0c, 0x07,
            0x42, 0x65, 0x69, 0x6a, 0x69, 0x6e, 0x67, 0x31, 0x10, 0x30, 0x0e, 0x06, 0x03, 0x55, 0x04, 0x07
          ]) };
          let signature: cryptoFramework.DataBlob = sign.signSync(message);
          expect(signature.data.length).assertEqual(3309);
          let verify: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          verify.setVerifySpec(cryptoFramework.SignSpecItem.ML_DSA_MU_BOOL, true);
          verify.initSync(keyPair.pubKey);
          let result: boolean = verify.verifySync(message, signature);
          expect(result).assertTrue();
        } catch (error) {
          console.error(`[XTS] MLDSA_Spec_Func_0600 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Spec_Func_0700
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Spec_Func_0700
     * @tc.desc   Set context before init - functional test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MLDSA_Spec_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          let context: cryptoFramework.DataBlob = { data: new Uint8Array([
            0x30, 0x82, 0x01, 0x3d, 0x30, 0x81, 0xe4, 0x02, 0x01, 0x01
          ]) };
          sign.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_CONTEXT_UINT8ARR, context.data);
          sign.initSync(keyPair.priKey);
          let message: cryptoFramework.DataBlob = { data: new Uint8Array([
            0x42, 0x65, 0x69, 0x6a, 0x69, 0x6e, 0x67, 0x31, 0x10, 0x30
          ]) };
          let signature: cryptoFramework.DataBlob = sign.signSync(message);
          let verify: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          verify.setVerifySpec(cryptoFramework.SignSpecItem.ML_DSA_CONTEXT_UINT8ARR, context.data);
          verify.initSync(keyPair.pubKey);
          let result: boolean = verify.verifySync(message, signature);
          expect(result).assertTrue();
        } catch (error) {
          console.error(`[XTS] MLDSA_Spec_Func_0700 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Spec_Func_0800
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Spec_Func_0800
     * @tc.desc   Set deterministic after init - exception test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MLDSA_Spec_Func_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.initSync(keyPair.priKey);
          try {
            sign.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_DETERMINISTIC_BOOL, true);
            expect(null).assertFail();
          } catch (e) {
            console.error(`[XTS] setSignSpec ${e}, error code: ${(e as BusinessError).code}`);
            expect((e as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_INVALID_CALL);
          }
        } catch (error) {
          console.error(`[XTS] MLDSA_Spec_Func_0800 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Spec_Func_0900
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Spec_Func_0900
     * @tc.desc   Set mu after init - exception test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MLDSA_Spec_Func_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.initSync(keyPair.priKey);
          try {
            sign.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_MU_BOOL, true);
            expect(null).assertFail();
          } catch (e) {
            console.error(`[XTS] setSignSpec ${e}, error code: ${(e as BusinessError).code}`);
            expect((e as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_INVALID_CALL);
          }
        } catch (error) {
          console.error(`[XTS] MLDSA_Spec_Func_0900 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Spec_Func_1000
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Spec_Func_1000
     * @tc.desc   Set context after init - exception test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MLDSA_Spec_Func_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.initSync(keyPair.priKey);
          let context: cryptoFramework.DataBlob = { data: new Uint8Array([0x01, 0x02, 0x03]) };
          try {
            sign.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_CONTEXT_UINT8ARR, context.data);
            expect(null).assertFail();
          } catch (e) {
            console.error(`[XTS] setSignSpec ${e}, error code: ${(e as BusinessError).code}`);
            expect((e as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_INVALID_CALL);
          }
        } catch (error) {
          console.error(`[XTS] MLDSA_Spec_Func_1000 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Spec_Func_1100
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Spec_Func_1100
     * @tc.desc   Verify set mu after init - exception test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_MLDSA_Spec_Func_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_MU_BOOL, true);
          sign.initSync(keyPair.priKey);
          let message: cryptoFramework.DataBlob = { data: new Uint8Array([
            0x30, 0x82, 0x01, 0x3d, 0x30, 0x81, 0xe4, 0x02, 0x01, 0x01, 0x30, 0x0a, 0x06, 0x08, 0x2a, 0x81,
            0x1c, 0xcf, 0x55, 0x01, 0x83, 0x75, 0x30, 0x7c, 0x31, 0x0b, 0x30, 0x09, 0x06, 0x03, 0x55, 0x04,
            0x06, 0x13, 0x02, 0x43, 0x4e, 0x31, 0x10, 0x30, 0x0e, 0x06, 0x03, 0x55, 0x04, 0x08, 0x0c, 0x07,
            0x42, 0x65, 0x69, 0x6a, 0x69, 0x6e, 0x67, 0x31, 0x10, 0x30, 0x0e, 0x06, 0x03, 0x55, 0x04, 0x07
          ]) };
          sign.signSync(message);
          let verify: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          verify.initSync(keyPair.pubKey);
          try {
            verify.setVerifySpec(cryptoFramework.SignSpecItem.ML_DSA_MU_BOOL, true); // 验签不容许设置预哈希
            expect(null).assertFail();
          } catch (e) {
            expect((e as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_INVALID_CALL);
          }
        } catch (error) {
          console.error(`[XTS] MLDSA_Spec_Func_1100 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Spec_Func_1200
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Spec_Func_1200
     * @tc.desc   Verify set context after init - exception test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_MLDSA_Spec_Func_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          let context: cryptoFramework.DataBlob = { data: new Uint8Array([0x01, 0x02, 0x03]) };
          sign.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_CONTEXT_UINT8ARR, context.data);
          sign.initSync(keyPair.priKey);
          let message: cryptoFramework.DataBlob = { data: new Uint8Array([0x01, 0x02, 0x03]) };
          sign.signSync(message);
          let verify: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          verify.initSync(keyPair.pubKey);
          try {
            verify.setVerifySpec(cryptoFramework.SignSpecItem.ML_DSA_CONTEXT_UINT8ARR, context.data);
            expect(null).assertFail();
          } catch (e) {
            expect((e as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_INVALID_CALL);
          }
        } catch (error) {
          console.error(`[XTS] MLDSA_Spec_Func_1200 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Mu_Func_1300
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Mu_Func_1300
     * @tc.desc   Pre-hash mode - 64 byte message sign and verify (mu=true).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MLDSA_Mu_Func_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_MU_BOOL, true);
          sign.initSync(keyPair.priKey);
          let message: cryptoFramework.DataBlob = { data: new Uint8Array(64).fill(0x41) };
          let signature: cryptoFramework.DataBlob = sign.signSync(message);
          expect(signature.data.length).assertEqual(3309);
          let verify: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          verify.setVerifySpec(cryptoFramework.SignSpecItem.ML_DSA_MU_BOOL, true);
          verify.initSync(keyPair.pubKey);
          let result: boolean = verify.verifySync(message, signature);
          expect(result).assertTrue();
        } catch (error) {
          console.error(`[XTS] MLDSA_Mu_Func_1300 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Mu_Func_1400
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Mu_Func_1400
     * @tc.desc   Pre-hash mode - non-64 byte message sign and verify (mu=true).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_MLDSA_Mu_Func_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_MU_BOOL, true);
          sign.initSync(keyPair.priKey);
          let message63: cryptoFramework.DataBlob = { data: new Uint8Array(63).fill(0x42) };
          try {
            sign.signSync(message63);
          } catch (e) {
            expect((e as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
          let sign2: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign2.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_MU_BOOL, true);
          sign2.initSync(keyPair.priKey);
          let message65: cryptoFramework.DataBlob = { data: new Uint8Array(65).fill(0x43) };
          try {
            sign2.signSync(message65);
          } catch (e) {
            expect((e as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
          let sign3: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign3.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_MU_BOOL, true);
          sign3.initSync(keyPair.priKey);
          let message128: cryptoFramework.DataBlob = { data: new Uint8Array(128).fill(0x44) };
          try {
            sign3.signSync(message128);
          } catch (e) {
            expect((e as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
        } catch (error) {
          console.error(`[XTS] MLDSA_Mu_Func_1400 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Mu_Func_4400
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Mu_Func_4400
     * @tc.desc   Pre-hash mode with context - sign with 255 byte context (mu=true).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_MLDSA_Mu_Func_4400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_MU_BOOL, true);
          let context255: Uint8Array = new Uint8Array(255).fill(0x61);
          sign.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_CONTEXT_UINT8ARR, context255);
          sign.initSync(keyPair.priKey);
          let message64: cryptoFramework.DataBlob = { data: new Uint8Array(64).fill(0x42) };
          let signature: cryptoFramework.DataBlob = sign.signSync(message64);
          expect(signature.data.length).assertEqual(3309);
          let verify: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          verify.setVerifySpec(cryptoFramework.SignSpecItem.ML_DSA_MU_BOOL, true);
          verify.setVerifySpec(cryptoFramework.SignSpecItem.ML_DSA_CONTEXT_UINT8ARR, context255);
          verify.initSync(keyPair.pubKey);
          let result: boolean = verify.verifySync(message64, signature);
          expect(result).assertTrue();
        } catch (error) {
          console.error(`[XTS] MLDSA_Mu_Func_4400 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Mu_Func_1500
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Mu_Func_1500
     * @tc.desc   Pre-hash mode - mu mismatch verify failure.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MLDSA_Mu_Func_1500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_MU_BOOL, true);
          sign.initSync(keyPair.priKey);
          let message: cryptoFramework.DataBlob = { data: new Uint8Array([
            0x30, 0x82, 0x01, 0x3d, 0x30, 0x81, 0xe4, 0x02, 0x01, 0x01, 0x30, 0x0a, 0x06, 0x08, 0x2a, 0x81,
            0x1c, 0xcf, 0x55, 0x01, 0x83, 0x75, 0x30, 0x7c, 0x31, 0x0b, 0x30, 0x09, 0x06, 0x03, 0x55, 0x04,
            0x06, 0x13, 0x02, 0x43, 0x4e, 0x31, 0x10, 0x30, 0x0e, 0x06, 0x03, 0x55, 0x04, 0x08, 0x0c, 0x07,
            0x42, 0x65, 0x69, 0x6a, 0x69, 0x6e, 0x67, 0x31, 0x10, 0x30, 0x0e, 0x06, 0x03, 0x55, 0x04, 0x07
          ]) };
          let signature: cryptoFramework.DataBlob = sign.signSync(message);
          let verify: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          verify.initSync(keyPair.pubKey);
          let result: boolean = verify.verifySync(message, signature);
          expect(result).assertFalse();
        } catch (error) {
          console.error(`[XTS] MLDSA_Mu_Func_1500 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Mu_Func_1600
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Mu_Func_1600
     * @tc.desc   Pre-hash mode - deterministic + mu combined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_MLDSA_Mu_Func_1600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_DETERMINISTIC_BOOL, true);
          sign.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_MU_BOOL, true);
          sign.initSync(keyPair.priKey);
          let message: cryptoFramework.DataBlob = { data: new Uint8Array(64).fill(0x41) };
          let sig1: cryptoFramework.DataBlob = sign.signSync(message);
          let sign2: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign2.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_DETERMINISTIC_BOOL, true);
          sign2.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_MU_BOOL, true);
          sign2.initSync(keyPair.priKey);
          let sig2: cryptoFramework.DataBlob = sign2.signSync(message);
          expect(sig1.data.length).assertEqual(sig2.data.length);
          let ret: boolean = compareDataBlob(sig1, sig2);
          expect(ret).assertTrue();
          let verify: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          verify.setVerifySpec(cryptoFramework.SignSpecItem.ML_DSA_MU_BOOL, true);
          verify.initSync(keyPair.pubKey);
          let result: boolean = verify.verifySync(message, sig1);
          expect(result).assertTrue();
        } catch (error) {
          console.error(`[XTS] MLDSA_Mu_Func_1600 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Context_Func_1700
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Context_Func_1700
     * @tc.desc   Context parameter - max length 255 bytes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_MLDSA_Context_Func_1700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          let context255: Uint8Array = new Uint8Array(255).fill(0x61);
          sign.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_CONTEXT_UINT8ARR, context255);
          sign.initSync(keyPair.priKey);
          let message: cryptoFramework.DataBlob = { data: new Uint8Array([0x01, 0x02, 0x03]) };
          let signature: cryptoFramework.DataBlob = sign.signSync(message);
          let verify: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          verify.setVerifySpec(cryptoFramework.SignSpecItem.ML_DSA_CONTEXT_UINT8ARR, context255);
          verify.initSync(keyPair.pubKey);
          let result: boolean = verify.verifySync(message, signature);
          expect(result).assertTrue();
        } catch (error) {
          console.error(`[XTS] MLDSA_Context_Func_1700 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Context_Func_1800
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Context_Func_1800
     * @tc.desc   Context parameter - over 256 bytes failure.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_MLDSA_Context_Func_1800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          let context256: Uint8Array = new Uint8Array(256).fill(0x62);
          try {
            sign.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_CONTEXT_UINT8ARR, context256);
            expect(null).assertFail();
          } catch (e) {
            expect((e as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
          }
          let context: Uint8Array = new Uint8Array([]);
          try {
            sign.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_CONTEXT_UINT8ARR, context);
            expect(null).assertFail();
          } catch (e) {
            expect((e as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
          }
        } catch (error) {
          console.error(`[XTS] MLDSA_Context_Func_1800 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Context_Func_1900
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Context_Func_1900
     * @tc.desc   Context parameter - empty value test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_MLDSA_Context_Func_1900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.initSync(keyPair.priKey);
          let message: cryptoFramework.DataBlob = { data: new Uint8Array([0x01, 0x02, 0x03]) };
          let signature: cryptoFramework.DataBlob = sign.signSync(message);
          let verify: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          verify.initSync(keyPair.pubKey);
          let result: boolean = verify.verifySync(message, signature);
          expect(result).assertTrue();
        } catch (error) {
          console.error(`[XTS] MLDSA_Context_Func_1900 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Context_Func_2000
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Context_Func_2000
     * @tc.desc   Context parameter mismatch verify failure.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MLDSA_Context_Func_2000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          let context1: Uint8Array = new Uint8Array([0x61, 0x70, 0x70, 0x31]);
          sign.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_CONTEXT_UINT8ARR, context1);
          sign.initSync(keyPair.priKey);
          let message: cryptoFramework.DataBlob = { data: new Uint8Array([0x01, 0x02, 0x03]) };
          let signature: cryptoFramework.DataBlob = sign.signSync(message);
          let verify: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          let context2: Uint8Array = new Uint8Array([0x61, 0x70, 0x70, 0x32]);
          verify.setVerifySpec(cryptoFramework.SignSpecItem.ML_DSA_CONTEXT_UINT8ARR, context2);
          verify.initSync(keyPair.pubKey);
          let result: boolean = verify.verifySync(message, signature);
          expect(result).assertFalse();
        } catch (error) {
          console.error(`[XTS] MLDSA_Context_Func_2000 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_InvalidSpec_Func_2100
     * @tc.number SUB_Security_CryptoFramework_MLDSA_InvalidSpec_Func_2100
     * @tc.desc   Set unsupported SpecItem - exception test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MLDSA_InvalidSpec_Func_2100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          let invalidItem = cryptoFramework.SignSpecItem.SM2_USER_ID_UINT8ARR;
          try {
            sign.setSignSpec(invalidItem, new Uint8Array([0x01]));
            expect(null).assertFail();
          } catch (e) {
            expect((e as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
          }
          let verify: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          try {
            verify.setVerifySpec(invalidItem, new Uint8Array([0x01]));
            expect(null).assertFail();
          } catch (e) {
            expect((e as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
          }
        } catch (error) {
          console.error(`[XTS] MLDSA_InvalidSpec_Func_2100 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Limit_Func_2200
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Limit_Func_2200
     * @tc.desc   updateSync unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MLDSA_Limit_Func_2200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.initSync(keyPair.priKey);
          let dataBlob: cryptoFramework.DataBlob = { data: new Uint8Array([0x01, 0x02, 0x03]) };
          try {
            sign.updateSync(dataBlob);
            expect(null).assertFail();
          } catch (e) {
            expect((e as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_INVALID_CALL);
          }
        } catch (error) {
          console.error(`[XTS] MLDSA_Limit_Func_2200 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Limit_Func_2300
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Limit_Func_2300
     * @tc.desc   recoverSync unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MLDSA_Limit_Func_2300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let verify: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          verify.initSync(keyPair.pubKey);
          let signatureBlob: cryptoFramework.DataBlob = { data: new Uint8Array(3309) };
          try {
            verify.recoverSync(signatureBlob);
            expect(null).assertFail();
          } catch (e) {
            expect((e as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_INVALID_CALL);
          }
        } catch (error) {
          console.error(`[XTS] MLDSA_Limit_Func_2300 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Limit_Func_2400
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Limit_Func_2400
     * @tc.desc   getVerifySpec unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_MLDSA_Limit_Func_2400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let verify: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          verify.initSync(keyPair.pubKey);
          try {
            verify.getVerifySpec(cryptoFramework.SignSpecItem.ML_DSA_MU_BOOL);
            expect(null).assertFail();
          } catch (e) {
            expect((e as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_INVALID_CALL);
          }
        } catch (error) {
          console.error(`[XTS] MLDSA_Limit_Func_2400 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Vector_Func_2500
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Vector_Func_2500
     * @tc.desc   NIST ACVP ML-DSA-65 sign vector test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_MLDSA_Vector_Func_2500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let priKeyRaw: Uint8Array = keyPair.priKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_DSA_PRIVATE_RAW);
          let priKeyBlob: cryptoFramework.DataBlob = { data: priKeyRaw };
          let convertKeyPair: cryptoFramework.KeyPair = keyGenerator.convertKeySync(null, priKeyBlob);
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.initSync(convertKeyPair.priKey);
          let message: cryptoFramework.DataBlob = { data: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05]) };
          let signature: cryptoFramework.DataBlob = sign.signSync(message);
          expect(signature.data.length).assertEqual(3309);
        } catch (error) {
          console.error(`[XTS] MLDSA_Vector_Func_2500 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Vector_Func_2600
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Vector_Func_2600
     * @tc.desc   NIST ACVP ML-DSA-65 verify vector test - valid signature.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_MLDSA_Vector_Func_2600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let pubKeyRaw: Uint8Array = keyPair.pubKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_DSA_PUBLIC_RAW);
          let pubKeyBlob: cryptoFramework.DataBlob = { data: pubKeyRaw };
          let convertKeyPair: cryptoFramework.KeyPair = keyGenerator.convertKeySync(pubKeyBlob, null);
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.initSync(keyPair.priKey);
          let message: cryptoFramework.DataBlob = { data: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05]) };
          let signature: cryptoFramework.DataBlob = sign.signSync(message);
          let verify: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          verify.initSync(convertKeyPair.pubKey);
          let result: boolean = verify.verifySync(message, signature);
          expect(result).assertTrue();
        } catch (error) {
          console.error(`[XTS] MLDSA_Vector_Func_2600 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Vector_Func_2700
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Vector_Func_2700
     * @tc.desc   NIST ACVP ML-DSA-65 verify vector test - tampered signature.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_MLDSA_Vector_Func_2700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.initSync(keyPair.priKey);
          let message: cryptoFramework.DataBlob = { data: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05]) };
          let signature: cryptoFramework.DataBlob = sign.signSync(message);
          let tamperedSig: Uint8Array = new Uint8Array(signature.data);
          tamperedSig[0] = tamperedSig[0] ^ 0xFF;
          let tamperedSigBlob: cryptoFramework.DataBlob = { data: tamperedSig };
          let verify: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          verify.initSync(keyPair.pubKey);
          let result: boolean = verify.verifySync(message, tamperedSigBlob);
          expect(result).assertFalse();
        } catch (error) {
          console.error(`[XTS] MLDSA_Vector_Func_2700 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Vector_Func_2800
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Vector_Func_2800
     * @tc.desc   NIST ACVP ML-DSA-44 sign vector test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_MLDSA_Vector_Func_2800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-44");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.initSync(keyPair.priKey);
          let message: cryptoFramework.DataBlob = { data: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05]) };
          let signature: cryptoFramework.DataBlob = sign.signSync(message);
          expect(signature.data.length).assertEqual(2420);
        } catch (error) {
          console.error(`[XTS] MLDSA_Vector_Func_2800 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Vector_Func_2900
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Vector_Func_2900
     * @tc.desc   NIST ACVP ML-DSA-87 sign vector test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_MLDSA_Vector_Func_2900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-87");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.initSync(keyPair.priKey);
          let message: cryptoFramework.DataBlob = { data: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05]) };
          let signature: cryptoFramework.DataBlob = sign.signSync(message);
          expect(signature.data.length).assertEqual(4627);
        } catch (error) {
          console.error(`[XTS] MLDSA_Vector_Func_2900 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Err_Func_3000
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Err_Func_3000
     * @tc.desc   Use incorrect algorithm name - exception test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MLDSA_Err_Func_3000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          try {
            cryptoFramework.createSign("ML-DSA-44");
            expect(null).assertFail();
          } catch (e) {
            expect((e as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
          }
          try {
            cryptoFramework.createSign("ML-DSA-65");
            expect(null).assertFail();
          } catch (e) {
            expect((e as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
          }
          try {
            cryptoFramework.createSign("ML-DSA-87");
            expect(null).assertFail();
          } catch (e) {
            expect((e as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
          }
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          expect(sign.algName).assertEqual("ML-DSA");
        } catch (error) {
          console.error(`[XTS] MLDSA_Err_Func_3000 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Err_Func_3100
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Err_Func_3100
     * @tc.desc   Sign without init - exception test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MLDSA_Err_Func_3100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          let message: cryptoFramework.DataBlob = { data: new Uint8Array([0x01, 0x02, 0x03]) };
          try {
            sign.signSync(message);
            expect(null).assertFail();
          } catch (e) {
            expect((e as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
          }
        } catch (error) {
          console.error(`[XTS] MLDSA_Err_Func_3100 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Err_Func_3200
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Err_Func_3200
     * @tc.desc   Repeated init - exception test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_MLDSA_Err_Func_3200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.initSync(keyPair.priKey);
          try {
            sign.initSync(keyPair.priKey);
            expect(null).assertFail();
          } catch (e) {
            expect((e as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_INVALID_CALL);
          }
        } catch (error) {
          console.error(`[XTS] MLDSA_Err_Func_3200 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Err_Func_3300
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Err_Func_3300
     * @tc.desc   Tampered message verify test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MLDSA_Err_Func_3300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.initSync(keyPair.priKey);
          let m1: cryptoFramework.DataBlob = { data: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05]) };
          let signature: cryptoFramework.DataBlob = sign.signSync(m1);
          let verify: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          verify.initSync(keyPair.pubKey);
          let m2: cryptoFramework.DataBlob = { data: new Uint8Array([0x05, 0x04, 0x03, 0x02, 0x01]) };
          let result: boolean = verify.verifySync(m2, signature);
          expect(result).assertFalse();
        } catch (error) {
          console.error(`[XTS] MLDSA_Err_Func_3300 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Err_Func_3400
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Err_Func_3400
     * @tc.desc   Tampered signature verify test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MLDSA_Err_Func_3400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.initSync(keyPair.priKey);
          let message: cryptoFramework.DataBlob = { data: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05]) };
          let signature: cryptoFramework.DataBlob = sign.signSync(message);
          let tamperedSig: Uint8Array = new Uint8Array(signature.data);
          tamperedSig[0]++;
          let tamperedSigBlob: cryptoFramework.DataBlob = { data: tamperedSig };
          let verify: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          verify.initSync(keyPair.pubKey);
          let result: boolean = verify.verifySync(message, tamperedSigBlob);
          expect(result).assertFalse();
        } catch (error) {
          console.error(`[XTS] MLDSA_Err_Func_3400 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Err_Func_3500
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Err_Func_3500
     * @tc.desc   Use mismatched key pair verify test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MLDSA_Err_Func_3500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let keyGeneratorA: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPairA: cryptoFramework.KeyPair = keyGeneratorA.generateKeyPairSync();
          let keyGeneratorB: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPairB: cryptoFramework.KeyPair = keyGeneratorB.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.initSync(keyPairA.priKey);
          let message: cryptoFramework.DataBlob = { data: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05]) };
          let signature: cryptoFramework.DataBlob = sign.signSync(message);
          let verify: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          verify.initSync(keyPairB.pubKey);
          let result: boolean = verify.verifySync(message, signature);
          expect(result).assertFalse();
        } catch (error) {
          console.error(`[XTS] MLDSA_Err_Func_3500 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Err_Func_3600
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Err_Func_3600
     * @tc.desc   Same sign object repeated sign - exception test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_MLDSA_Err_Func_3600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.initSync(keyPair.priKey);
          let m1: cryptoFramework.DataBlob = { data: new Uint8Array([0x01, 0x02, 0x03]) };
          let sig1: cryptoFramework.DataBlob = sign.signSync(m1);
          let sig2: cryptoFramework.DataBlob = await sign.sign(m1);
          let ret: boolean = compareDataBlob(sig1, sig2);
          expect(ret).assertFalse();
        } catch (error) {
          console.error(`[XTS] MLDSA_Err_Func_3600 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Complex_Func_3800
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Complex_Func_3800
     * @tc.desc   Multiple security level sign and verify test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MLDSA_Complex_Func_3800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator44: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-44");
          let keyPair44: cryptoFramework.KeyPair = keyGenerator44.generateKeyPairSync();
          let sign44: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign44.initSync(keyPair44.priKey);
          let message: cryptoFramework.DataBlob = { data: new Uint8Array([
            0x74, 0x65, 0x73, 0x74, 0x20, 0x6D, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65
          ]) };
          let sig44: cryptoFramework.DataBlob = sign44.signSync(message);
          expect(sig44.data.length).assertEqual(2420);
          let verify44: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          verify44.initSync(keyPair44.pubKey);
          expect(verify44.verifySync(message, sig44)).assertTrue();
          let keyGenerator65: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair65: cryptoFramework.KeyPair = keyGenerator65.generateKeyPairSync();
          let sign65: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign65.initSync(keyPair65.priKey);
          let sig65: cryptoFramework.DataBlob = sign65.signSync(message);
          expect(sig65.data.length).assertEqual(3309);
          let verify65: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          verify65.initSync(keyPair65.pubKey);
          expect(verify65.verifySync(message, sig65)).assertTrue();
          let keyGenerator87: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-87");
          let keyPair87: cryptoFramework.KeyPair = keyGenerator87.generateKeyPairSync();
          let sign87: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign87.initSync(keyPair87.priKey);
          let sig87: cryptoFramework.DataBlob = sign87.signSync(message);
          expect(sig87.data.length).assertEqual(4627);
          let verify87: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          verify87.initSync(keyPair87.pubKey);
          expect(verify87.verifySync(message, sig87)).assertTrue();
        } catch (error) {
          console.error(`[XTS] MLDSA_Complex_Func_3800 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Complex_Func_3900
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Complex_Func_3900
     * @tc.desc   Different length message sign and verify test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_MLDSA_Complex_Func_3900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let msg1: cryptoFramework.DataBlob = { data: new Uint8Array(1) };
          let sign1: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign1.initSync(keyPair.priKey);
          let sig1: cryptoFramework.DataBlob = sign1.signSync(msg1);
          expect(sig1.data.length).assertEqual(3309);
          let verify1: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          verify1.initSync(keyPair.pubKey);
          expect(verify1.verifySync(msg1, sig1)).assertTrue();
          let msg1k: cryptoFramework.DataBlob = { data: new Uint8Array(1024).fill(0x55) };
          let sign1k: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign1k.initSync(keyPair.priKey);
          let sig1k: cryptoFramework.DataBlob = sign1k.signSync(msg1k);
          expect(sig1k.data.length).assertEqual(3309);
          let verify1k: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          verify1k.initSync(keyPair.pubKey);
          expect(verify1k.verifySync(msg1k, sig1k)).assertTrue();
          let msg10k: cryptoFramework.DataBlob = { data: new Uint8Array(10240).fill(0xAA) };
          let sign10k: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign10k.initSync(keyPair.priKey);
          let sig10k: cryptoFramework.DataBlob = sign10k.signSync(msg10k);
          expect(sig10k.data.length).assertEqual(3309);
          let verify10k: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          verify10k.initSync(keyPair.pubKey);
          expect(verify10k.verifySync(msg10k, sig10k)).assertTrue();
        } catch (error) {
          console.error(`[XTS] MLDSA_Complex_Func_3900 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Complex_Func_4000
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Complex_Func_4000
     * @tc.desc   deterministic + mu + context combined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_MLDSA_Complex_Func_4000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_DETERMINISTIC_BOOL, true);
          sign.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_MU_BOOL, true);
          let contextData: Uint8Array = new Uint8Array([0x01, 0x02, 0x03]);
          sign.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_CONTEXT_UINT8ARR, contextData);
          sign.initSync(keyPair.priKey);
          let message: cryptoFramework.DataBlob = { data: new Uint8Array(64).fill(0x41) };
          let sig1: cryptoFramework.DataBlob = sign.signSync(message);
          let sign2: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign2.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_DETERMINISTIC_BOOL, true);
          sign2.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_MU_BOOL, true);
          sign2.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_CONTEXT_UINT8ARR, contextData);
          sign2.initSync(keyPair.priKey);
          let sig2: cryptoFramework.DataBlob = sign2.signSync(message);
          expect(sig1.data.length).assertEqual(sig2.data.length);
          let ret: boolean = compareDataBlob(sig1, sig2);
          expect(ret).assertTrue();
          let verify: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          verify.setVerifySpec(cryptoFramework.SignSpecItem.ML_DSA_MU_BOOL, true);
          verify.setVerifySpec(cryptoFramework.SignSpecItem.ML_DSA_CONTEXT_UINT8ARR, contextData);
          verify.initSync(keyPair.pubKey);
          let result: boolean = verify.verifySync(message, sig1);
          expect(result).assertTrue();
        } catch (error) {
          console.error(`[XTS] MLDSA_Complex_Func_4000 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Boundary_Func_4100
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Boundary_Func_4100
     * @tc.desc   Empty message sign and verify test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_MLDSA_Boundary_Func_4100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.initSync(keyPair.priKey);
          let emptyMsg: cryptoFramework.DataBlob = { data: new Uint8Array(0) };
          sign.signSync(emptyMsg);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] MLDSA_Boundary_Func_4100 ${error}, error code: ${(error as BusinessError).code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Boundary_Func_4200
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Boundary_Func_4200
     * @tc.desc   Large message sign and verify test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_MLDSA_Boundary_Func_4200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.initSync(keyPair.priKey);
          let largeMsg: cryptoFramework.DataBlob = { data: new Uint8Array(1048576).fill(0x42) };
          let signature: cryptoFramework.DataBlob = sign.signSync(largeMsg);
          expect(signature.data.length).assertEqual(3309);
          let verify: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          verify.initSync(keyPair.pubKey);
          let result: boolean = verify.verifySync(largeMsg, signature);
          expect(result).assertTrue();
        } catch (error) {
          console.error(`[XTS] MLDSA_Boundary_Func_4200 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Async_Func_4300
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Async_Func_4300
     * @tc.desc   Promise async sign test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_MLDSA_Async_Func_4300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          await sign.init(keyPair.priKey);
          let message: cryptoFramework.DataBlob = { data: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05]) };
          let signature: cryptoFramework.DataBlob = await sign.sign(message);
          expect(signature.data.length).assertEqual(3309);
        } catch (error) {
          console.error(`[XTS] MLDSA_Async_Func_4300 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Async_Func_4400
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Async_Func_4400
     * @tc.desc   Promise async verify test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_MLDSA_Async_Func_4400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.initSync(keyPair.priKey);
          let message: cryptoFramework.DataBlob = { data: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05]) };
          let signature: cryptoFramework.DataBlob = sign.signSync(message);
          let verify: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          await verify.init(keyPair.pubKey);
          let result: boolean = await verify.verify(message, signature);
          expect(result).assertTrue();
        } catch (error) {
          console.error(`[XTS] MLDSA_Async_Func_4400 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Callback_Func_4500
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Callback_Func_4500
     * @tc.desc   Callback sign test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_MLDSA_Callback_Func_4500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          await new Promise<void>((resolve, reject) => {
            sign.init(keyPair.priKey, (err: BusinessError<void>|null) => {
              if (err) {
                reject(err as Error);
              } else {
                resolve(undefined);
              }
            });
          });
          let message: cryptoFramework.DataBlob = { data: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05]) };
          let signature: cryptoFramework.DataBlob = await new Promise<cryptoFramework.DataBlob>((resolve, reject) => {
            sign.sign(message, (err: BusinessError<void>|null, data: cryptoFramework.DataBlob|undefined) => {
              if (err || data === undefined) {
                reject(err as Error);
              } else {
                resolve(data as cryptoFramework.DataBlob);
              }
            });
          });
          expect(signature.data.length).assertEqual(3309);
        } catch (error) {
          console.error(`[XTS] MLDSA_Callback_Func_4500 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Callback_Func_4600
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Callback_Func_4600
     * @tc.desc   Callback verify test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_MLDSA_Callback_Func_4600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.initSync(keyPair.priKey);
          let message: cryptoFramework.DataBlob = { data: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05]) };
          let signature: cryptoFramework.DataBlob = sign.signSync(message);
          let verify: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          await new Promise<void>((resolve, reject) => {
            verify.init(keyPair.pubKey, (err: BusinessError<void>|null) => {
              if (err) {
                reject(err as Error);
              } else {
                resolve(undefined);
              }
            });
          });
          let result: boolean = await new Promise<boolean>((resolve, reject) => {
            verify.verify(message, signature, (err: BusinessError<void>|null, res: boolean|undefined) => {
              if (err || res === undefined) {
                reject(err as Error);
              } else {
                resolve(res as boolean);
              }
            });
          });
          expect(result).assertTrue();
        } catch (error) {
          console.error(`[XTS] MLDSA_Callback_Func_4600 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Func_4700
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Func_4700
     * @tc.desc   Same sign object repeated sign - exception test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_MLDSA_Func_4700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_DETERMINISTIC_BOOL, true);
          sign.initSync(keyPair.priKey);
          let m1: cryptoFramework.DataBlob = { data: new Uint8Array([0x01, 0x02, 0x03]) };
          let sig1: cryptoFramework.DataBlob = sign.signSync(m1);
          let sig2: cryptoFramework.DataBlob = await sign.sign(m1);
          let ret: boolean = compareDataBlob(sig1, sig2);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`[XTS] MLDSA_Func_4700 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Boundary_Func_4300
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Boundary_Func_4300
     * @tc.desc   Empty message sign and verify test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_MLDSA_Boundary_Func_4300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.initSync(keyPair.priKey);
          sign.signSync(null);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] MLDSA_Boundary_Func_4300 ${error}, error code: ${(error as BusinessError).code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Boundary_Func_4400
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Boundary_Func_4400
     * @tc.desc   Empty message sign and verify test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_MLDSA_Boundary_Func_4400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          keyPair.priKey.clearMem();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          sign.initSync(keyPair.priKey);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] MLDSA_Boundary_Func_4400 ${error}, error code: ${(error as BusinessError).code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MLDSA_Spec_Func_3200
     * @tc.number SUB_Security_CryptoFramework_MLDSA_Spec_Func_3200
     * @tc.desc   预哈希设置context，预哈希场景下context不生效
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MLDSA_Spec_Func_3200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("ML-DSA");
          let context1: cryptoFramework.DataBlob = { data: new Uint8Array([
            0x30, 0x82, 0x01, 0x3d, 0x30, 0x81, 0xe4, 0x02, 0x01, 0x01
          ]) };
          let context2: cryptoFramework.DataBlob = { data: new Uint8Array([
            0x31, 0x83, 0x02, 0x3e, 0x31, 0x82, 0xe5, 0x03, 0x02, 0x02
          ]) };
          sign.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_CONTEXT_UINT8ARR, context1.data);
          sign.setSignSpec(cryptoFramework.SignSpecItem.ML_DSA_MU_BOOL, true);
          sign.initSync(keyPair.priKey);
          let message: cryptoFramework.DataBlob = { data: new Uint8Array([
            0x30, 0x82, 0x01, 0x3d, 0x30, 0x81, 0xe4, 0x02, 0x01, 0x01, 0x30, 0x0a, 0x06, 0x08, 0x2a, 0x81,
            0x1c, 0xcf, 0x55, 0x01, 0x83, 0x75, 0x30, 0x7c, 0x31, 0x0b, 0x30, 0x09, 0x06, 0x03, 0x55, 0x04,
            0x06, 0x13, 0x02, 0x43, 0x4e, 0x31, 0x10, 0x30, 0x0e, 0x06, 0x03, 0x55, 0x04, 0x08, 0x0c, 0x07,
            0x42, 0x65, 0x69, 0x6a, 0x69, 0x6e, 0x67, 0x31, 0x10, 0x30, 0x0e, 0x06, 0x03, 0x55, 0x04, 0x07
          ]) };
          let signature: cryptoFramework.DataBlob = sign.signSync(message);
          let verify: cryptoFramework.Verify = cryptoFramework.createVerify("ML-DSA");
          verify.setVerifySpec(cryptoFramework.SignSpecItem.ML_DSA_CONTEXT_UINT8ARR, context2.data);
          verify.setVerifySpec(cryptoFramework.SignSpecItem.ML_DSA_MU_BOOL, true);
          verify.initSync(keyPair.pubKey);
          let result: boolean = verify.verifySync(message, signature);
          expect(result).assertTrue();
        } catch (error) {
          console.error(`[XTS] MLDSA_Spec_Func_3200 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

  });
}
