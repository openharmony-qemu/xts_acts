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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { cryptoFramework } from '@kit.CryptoArchitectureKit';
import { compareUint8Array } from './utils/common/commonUtils';

export default function SecurityCryptoMLEncapAndDecapTestUnit() {
  describe('SecurityCryptoMLEncapAndDecapTestUnit', () => {

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Create_Sync_Func_0100
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Create_Sync_Func_0100
     * @tc.desc   ML-KEM-512 KEM create test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Create_Sync_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-512");
        expect(keyGenerator.algName).assertEqual("ML-KEM-512");
        let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
        expect(keyPair.pubKey).not().assertNull();
        expect(keyPair.priKey).not().assertNull();
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_512);
        expect(kem).not().assertNull();
        let encapResult: cryptoFramework.KemEncapResult = kem.encapsulateSync(keyPair.pubKey, null);
        expect(encapResult).not().assertNull();
        let decapSecret: Uint8Array = kem.decapsulateSync(keyPair.priKey, encapResult.wrappedKey);
        expect(decapSecret).not().assertNull();
        let ret: boolean = compareUint8Array(encapResult.sharedSecret, decapSecret);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`[XTS] ML_KEM_CREATE_0100 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Create_Sync_Func_0200
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Create_Sync_Func_0200
     * @tc.desc   ML-KEM-768 KEM create test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Create_Sync_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        expect(keyGenerator.algName).assertEqual("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
        expect(keyPair.pubKey).not().assertNull();
        expect(keyPair.priKey).not().assertNull();
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_768);
        expect(kem).not().assertNull();
        let encapResult: cryptoFramework.KemEncapResult = kem.encapsulateSync(keyPair.pubKey, null);
        expect(encapResult).not().assertNull();
        let decapSecret: Uint8Array = kem.decapsulateSync(keyPair.priKey, encapResult.wrappedKey);
        expect(decapSecret).not().assertNull();
        let ret: boolean = compareUint8Array(encapResult.sharedSecret, decapSecret);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`[XTS] ML_KEM_CREATE_0200 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Create_Sync_Func_0300
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Create_Sync_Func_0300
     * @tc.desc   ML-KEM-1024 KEM create test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Create_Sync_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-1024");
        expect(keyGenerator.algName).assertEqual("ML-KEM-1024");
        let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
        expect(keyPair.pubKey).not().assertNull();
        expect(keyPair.priKey).not().assertNull();
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_1024);
        expect(kem).not().assertNull();
        let encapResult: cryptoFramework.KemEncapResult = kem.encapsulateSync(keyPair.pubKey, null);
        expect(encapResult).not().assertNull();
        let decapSecret: Uint8Array = kem.decapsulateSync(keyPair.priKey, encapResult.wrappedKey);
        expect(decapSecret).not().assertNull();
        let ret: boolean = compareUint8Array(encapResult.sharedSecret, decapSecret);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`[XTS] ML_KEM_CREATE_0300 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Create_Error_0100
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Create_Error_0100
     * @tc.desc   KEM create invalid algorithm name test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Create_Error_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        cryptoFramework.createKem(999);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] ML_KEM_Create_Error_0100 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_EncapDecap_Sync_Func_0100
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_EncapDecap_Sync_Func_0100
     * @tc.desc   ML-KEM-512 encap/decap test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_EncapDecap_Sync_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-512");
        expect(keyGenerator.algName).assertEqual("ML-KEM-512");
        let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
        expect(keyPair.pubKey).not().assertNull();
        expect(keyPair.priKey).not().assertNull();
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_512);
        expect(kem).not().assertNull();
        let encapResult: cryptoFramework.KemEncapResult = kem.encapsulateSync(keyPair.pubKey, null);
        expect(encapResult.sharedSecret.length).assertEqual(32);
        expect(encapResult.wrappedKey).not().assertNull();
        expect(encapResult.wrappedKey.length).assertEqual(768);
        let decapSecret: Uint8Array = kem.decapsulateSync(keyPair.priKey, encapResult.wrappedKey);
        expect(decapSecret.length).assertEqual(32);
        expect(compareUint8Array(decapSecret, encapResult.sharedSecret)).assertTrue();
      } catch (error) {
        console.error(`[XTS] ML_KEM_ENCAP_DECAP_0100 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_EncapDecap_Sync_Func_0200
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_EncapDecap_Sync_Func_0200
     * @tc.desc   ML-KEM-768 encap/decap test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_EncapDecap_Sync_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        expect(keyGenerator.algName).assertEqual("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
        expect(keyPair.pubKey).not().assertNull();
        expect(keyPair.priKey).not().assertNull();
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_768);
        expect(kem).not().assertNull();
        let encapResult: cryptoFramework.KemEncapResult = kem.encapsulateSync(keyPair.pubKey, null);
        expect(encapResult.sharedSecret.length).assertEqual(32);
        expect(encapResult.wrappedKey.length).assertEqual(1088);
        let decapSecret: Uint8Array = kem.decapsulateSync(keyPair.priKey, encapResult.wrappedKey);
        expect(decapSecret.length).assertEqual(32);
        expect(compareUint8Array(decapSecret, encapResult.sharedSecret)).assertTrue();
      } catch (error) {
        console.error(`[XTS] ML_KEM_ENCAP_DECAP_0200 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_EncapDecap_Sync_Func_0300
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_EncapDecap_Sync_Func_0300
     * @tc.desc   ML-KEM-1024 encap/decap test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_EncapDecap_Sync_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-1024");
        expect(keyGenerator.algName).assertEqual("ML-KEM-1024");
        let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
        expect(keyPair.pubKey).not().assertNull();
        expect(keyPair.priKey).not().assertNull();
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_1024);
        expect(kem).not().assertNull();
        let encapResult: cryptoFramework.KemEncapResult = kem.encapsulateSync(keyPair.pubKey, null);
        expect(encapResult.sharedSecret.length).assertEqual(32);
        expect(encapResult.wrappedKey.length).assertEqual(1568);
        let decapSecret: Uint8Array = kem.decapsulateSync(keyPair.priKey, encapResult.wrappedKey);
        expect(decapSecret.length).assertEqual(32);
        expect(compareUint8Array(decapSecret, encapResult.sharedSecret)).assertTrue();
      } catch (error) {
        console.error(`[XTS] ML_KEM_ENCAP_DECAP_0300 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_EncapDecap_Sync_Func_0400
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_EncapDecap_Sync_Func_0400
     * @tc.desc   ML-KEM-768 multiple encap produce different keys test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_EncapDecap_Sync_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
        expect(keyPair).not().assertNull();
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_768);
        expect(kem).not().assertNull();
        let result1: cryptoFramework.KemEncapResult = kem.encapsulateSync(keyPair.pubKey, null);
        expect(result1).not().assertNull();
        let result2: cryptoFramework.KemEncapResult = kem.encapsulateSync(keyPair.pubKey, null);
        expect(result2).not().assertNull();
        let ikme: Uint8Array = new Uint8Array(32).fill(0xAB);
        let result3: cryptoFramework.KemEncapResult = kem.encapsulateSync(keyPair.pubKey, ikme);
        expect(result3).not().assertNull();
        let allDifferent1: boolean = !compareUint8Array(result1.sharedSecret, result2.sharedSecret) &&
          !compareUint8Array(result1.sharedSecret, result3.sharedSecret) &&
          !compareUint8Array(result2.sharedSecret, result3.sharedSecret);
        expect(allDifferent1).assertTrue();
        let keysDifferent: boolean = !compareUint8Array(result1.wrappedKey, result2.wrappedKey);
        expect(keysDifferent).assertTrue();
      } catch (error) {
        console.error(`[XTS] ML_KEM_ENCAP_DECAP_0400 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_EncapDecap_Async_Func_0100
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_EncapDecap_Async_Func_0100
     * @tc.desc   ML-KEM-768 async encap/decap test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_EncapDecap_Async_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        expect(keyGenerator.algName).assertEqual("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = await keyGenerator.generateKeyPair();
        expect(keyPair).not().assertNull();
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_768);
        expect(kem).not().assertNull();
        let encapResult: cryptoFramework.KemEncapResult = await kem.encapsulate(keyPair.pubKey, null);
        expect(encapResult).not().assertNull();
        expect(encapResult.sharedSecret.length).assertEqual(32);
        expect(encapResult.wrappedKey.length).assertEqual(1088);
        let decapSecret: Uint8Array = await kem.decapsulate(keyPair.priKey, encapResult.wrappedKey);
        expect(decapSecret).not().assertNull();
        expect(compareUint8Array(decapSecret, encapResult.sharedSecret)).assertTrue();
      } catch (error) {
        console.error(`[XTS] ML_KEM_ENCAP_DECAP_0500 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Ikme_Sync_Func_0100
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Ikme_Sync_Func_0100
     * @tc.desc   ML-KEM-768 same ikme deterministic encap test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Ikme_Sync_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
        expect(keyPair).not().assertNull();
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_768);
        expect(kem).not().assertNull();
        let ikme: Uint8Array = new Uint8Array(32).fill(0xAB);
        expect(ikme.length).assertEqual(32);
        let result1: cryptoFramework.KemEncapResult = kem.encapsulateSync(keyPair.pubKey, ikme);
        expect(result1).not().assertNull();
        let result2: cryptoFramework.KemEncapResult = kem.encapsulateSync(keyPair.pubKey, ikme);
        expect(result2).not().assertNull();
        expect(compareUint8Array(result1.sharedSecret, result2.sharedSecret)).assertTrue();
        expect(compareUint8Array(result1.wrappedKey, result2.wrappedKey)).assertTrue();
        let decapSecret1: Uint8Array = kem.decapsulateSync(keyPair.priKey, result1.wrappedKey);
        expect(decapSecret1).not().assertNull();
        let decapSecret2: Uint8Array = kem.decapsulateSync(keyPair.priKey, result2.wrappedKey);
        expect(decapSecret2).not().assertNull();
        expect(compareUint8Array(decapSecret1, decapSecret2)).assertTrue();
      } catch (error) {
        console.error(`[XTS] ML_KEM_IKME_0100 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Ikme_Sync_Func_0200
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Ikme_Sync_Func_0200
     * @tc.desc   ML-KEM-768 different ikme produce different results test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Ikme_Sync_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
        expect(keyPair).not().assertNull();
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_768);
        expect(kem).not().assertNull();
        let ikme1: Uint8Array = new Uint8Array(32).fill(0xAB);
        let ikme2: Uint8Array = new Uint8Array(32).fill(0xCD);
        let result1: cryptoFramework.KemEncapResult = kem.encapsulateSync(keyPair.pubKey, ikme1);
        expect(result1).not().assertNull();
        let result2: cryptoFramework.KemEncapResult = kem.encapsulateSync(keyPair.pubKey, ikme2);
        expect(result2).not().assertNull();
        expect(!compareUint8Array(result1.sharedSecret, result2.sharedSecret)).assertTrue();
        expect(!compareUint8Array(result1.wrappedKey, result2.wrappedKey)).assertTrue();
      } catch (error) {
        console.error(`[XTS] ML_KEM_IKME_0200 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Ikme_Sync_Func_0300
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Ikme_Sync_Func_0300
     * @tc.desc   ML-KEM-768 all-0 vs all-F ikme test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Ikme_Sync_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
        expect(keyPair).not().assertNull();
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_768);
        expect(kem).not().assertNull();
        let ikme1: Uint8Array = new Uint8Array(32).fill(0x00);
        let ikme2: Uint8Array = new Uint8Array(32).fill(0xFF);
        let result1: cryptoFramework.KemEncapResult = kem.encapsulateSync(keyPair.pubKey, ikme1);
        expect(result1).not().assertNull();
        let result2: cryptoFramework.KemEncapResult = kem.encapsulateSync(keyPair.pubKey, ikme2);
        expect(result2).not().assertNull();
        expect(!compareUint8Array(result1.sharedSecret, result2.sharedSecret)).assertTrue();
        expect(!compareUint8Array(result1.wrappedKey, result2.wrappedKey)).assertTrue();
      } catch (error) {
        console.error(`[XTS] ML_KEM_IKME_0300 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Ikme_Error_0100
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Ikme_Error_0100
     * @tc.desc   ML-KEM-768 wrong ikme length test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Ikme_Error_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
        expect(keyPair).not().assertNull();
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_768);
        expect(kem).not().assertNull();
        let ikme: Uint8Array = new Uint8Array(31).fill(0xAB);
        kem.encapsulateSync(keyPair.pubKey, ikme);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] ML_KEM_Ikme_Error_0100 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Encap_Error_0100
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Encap_Error_0100
     * @tc.desc   ML-KEM-768 encap with null public key test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Encap_Error_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_768);
        expect(kem).not().assertNull();
        kem.encapsulateSync(null, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] ML_KEM_Encap_Error_0100 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Encap_Error_0200
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Encap_Error_0200
     * @tc.desc   ML-KEM-768 encap with mismatched key algorithm test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Encap_Error_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-512");
        expect(keyGenerator).not().assertNull();
        let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
        expect(keyPair).not().assertNull();
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_768);
        expect(kem).not().assertNull();
        kem.encapsulateSync(keyPair.pubKey, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] ML_KEM_Encap_Error_0200 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Decap_Error_0100
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Decap_Error_0100
     * @tc.desc   ML-KEM-768 decap with null private key test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Decap_Error_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
        expect(keyPair).not().assertNull();
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_768);
        expect(kem).not().assertNull();
        let encapResult: cryptoFramework.KemEncapResult = kem.encapsulateSync(keyPair.pubKey, null);
        expect(encapResult).not().assertNull();
        kem.decapsulateSync(null, encapResult.wrappedKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] ML_KEM_Encap_Error_0100 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Decap_Error_0200
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Decap_Error_0200
     * @tc.desc   ML-KEM-768 decap with null wrappedKey test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Decap_Error_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
        expect(keyPair).not().assertNull();
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_768);
        expect(kem).not().assertNull();
        kem.decapsulateSync(keyPair.priKey, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] ML_KEM_Decap_Error_0200 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Decap_Error_0300
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Decap_Error_0300
     * @tc.desc   ML-KEM-768 decap with wrong wrappedKey length test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Decap_Error_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
        expect(keyPair).not().assertNull();
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_768);
        expect(kem).not().assertNull();
        let wrappedKey: Uint8Array = new Uint8Array(100).fill(0);
        kem.decapsulateSync(keyPair.priKey, wrappedKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] ML_KEM_Decap_Error_0300 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Decap_Error_0400
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Decap_Error_0400
     * @tc.desc   ML-KEM-768 decap with mismatched private key algorithm test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Decap_Error_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyGenerator512: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-512");
        expect(keyGenerator512).not().assertNull();
        let keyPair512: cryptoFramework.KeyPair = keyGenerator512.generateKeyPairSync();
        expect(keyPair512).not().assertNull();
        let keyGenerator768: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        expect(keyGenerator768).not().assertNull();
        let keyPair768: cryptoFramework.KeyPair = keyGenerator768.generateKeyPairSync();
        expect(keyPair768).not().assertNull();
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_768);
        expect(kem).not().assertNull();
        let encapResult: cryptoFramework.KemEncapResult = kem.encapsulateSync(keyPair768.pubKey, null);
        expect(encapResult).not().assertNull();
        kem.decapsulateSync(keyPair512.priKey, encapResult.wrappedKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] ML_KEM_Decap_Error_0400 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Decap_Error_0500
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Decap_Error_0500
     * @tc.desc   ML-KEM-768 decap with wrong private key test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Decap_Error_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair1: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
        expect(keyPair1).not().assertNull();
        let keyPair2: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
        expect(keyPair2).not().assertNull();
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_768);
        expect(kem).not().assertNull();
        let encapResult: cryptoFramework.KemEncapResult = kem.encapsulateSync(keyPair1.pubKey, null);
        expect(encapResult).not().assertNull();
        let decapSecret: Uint8Array = kem.decapsulateSync(keyPair2.priKey, encapResult.wrappedKey);
        expect(decapSecret).not().assertNull();
        expect(!compareUint8Array(decapSecret, encapResult.sharedSecret)).assertTrue();
      } catch (error) {
        console.error(`[XTS] ML_KEM_DECAP_ERROR_0500 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Decap_Error_0600
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Decap_Error_0600
     * @tc.desc   ML-KEM-768 decap with tampered wrappedKey test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Decap_Error_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
        expect(keyPair).not().assertNull();
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_768);
        expect(kem).not().assertNull();
        let encapResult: cryptoFramework.KemEncapResult = kem.encapsulateSync(keyPair.pubKey, null);
        expect(encapResult).not().assertNull();
        let tamperedKey: Uint8Array = new Uint8Array(encapResult.wrappedKey);
        for (let i = 0; i < 100; i++) {
          tamperedKey[i] = (i + 1) & 0xFF;
        }
        let decapSecret: Uint8Array = kem.decapsulateSync(keyPair.priKey, tamperedKey);
        expect(decapSecret).not().assertNull();
        expect(!compareUint8Array(decapSecret, encapResult.sharedSecret)).assertTrue();
      } catch (error) {
        console.error(`[XTS] ML_KEM_DECAP_ERROR_0600 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Decap_Error_0700
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Decap_Error_0700
     * @tc.desc   ML-KEM-768 decap with all-zero wrappedKey test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Decap_Error_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
        expect(keyPair).not().assertNull();
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_768);
        expect(kem).not().assertNull();
        let wrappedKey: Uint8Array = new Uint8Array(1088).fill(0);
        let decapSecret: Uint8Array = kem.decapsulateSync(keyPair.priKey, wrappedKey);
        expect(decapSecret.length).assertEqual(32);
      } catch (error) {
        console.error(`[XTS] ML_KEM_DECAP_ERROR_0700 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Length_Sync_Func_0100
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Length_Sync_Func_0100
     * @tc.desc   ML-KEM-512 length verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Length_Sync_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-512");
        expect(keyGenerator).not().assertNull();
        let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
        expect(keyPair).not().assertNull();
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_512);
        expect(kem).not().assertNull();
        let encapResult: cryptoFramework.KemEncapResult = kem.encapsulateSync(keyPair.pubKey, null);
        expect(encapResult).not().assertNull();
        expect(encapResult.sharedSecret.length).assertEqual(32);
        expect(encapResult.wrappedKey.length).assertEqual(768);
        let decapSecret: Uint8Array = kem.decapsulateSync(keyPair.priKey, encapResult.wrappedKey);
        expect(decapSecret).not().assertNull();
        expect(decapSecret.length).assertEqual(32);
      } catch (error) {
        console.error(`[XTS] ML_KEM_LENGTH_0100 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Length_Sync_Func_0200
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Length_Sync_Func_0200
     * @tc.desc   ML-KEM-768 length verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Length_Sync_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        expect(keyGenerator).not().assertNull();
        let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
        expect(keyPair).not().assertNull();
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_768);
        expect(kem).not().assertNull();
        let encapResult: cryptoFramework.KemEncapResult = kem.encapsulateSync(keyPair.pubKey, null);
        expect(encapResult).not().assertNull();
        expect(encapResult.sharedSecret.length).assertEqual(32);
        expect(encapResult.wrappedKey.length).assertEqual(1088);
        let decapSecret: Uint8Array = kem.decapsulateSync(keyPair.priKey, encapResult.wrappedKey);
        expect(decapSecret).not().assertNull();
        expect(decapSecret.length).assertEqual(32);
      } catch (error) {
        console.error(`[XTS] ML_KEM_LENGTH_0200 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Length_Sync_Func_0300
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Length_Sync_Func_0300
     * @tc.desc   ML-KEM-1024 length verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Length_Sync_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-1024");
        expect(keyGenerator).not().assertNull();
        let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
        expect(keyPair).not().assertNull();
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_1024);
        expect(kem).not().assertNull();
        let encapResult: cryptoFramework.KemEncapResult = kem.encapsulateSync(keyPair.pubKey, null);
        expect(encapResult).not().assertNull();
        expect(encapResult.sharedSecret.length).assertEqual(32);
        expect(encapResult.wrappedKey.length).assertEqual(1568);
        let decapSecret: Uint8Array = kem.decapsulateSync(keyPair.priKey, encapResult.wrappedKey);
        expect(decapSecret).not().assertNull();
        expect(decapSecret.length).assertEqual(32);
      } catch (error) {
        console.error(`[XTS] ML_KEM_LENGTH_0300 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Stress_Sync_Rel_0100
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Stress_Sync_Rel_0100
     * @tc.desc   ML-KEM-768 sequential encap/decap stability test.
     * @tc.type   RELIABILITY
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Stress_Sync_Rel_0100",
      TestType.RELIABILITY | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
        expect(keyPair).not().assertNull();
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_768);
        expect(kem).not().assertNull();
        for (let i = 0; i < 10; i++) {
          let encapResult: cryptoFramework.KemEncapResult = kem.encapsulateSync(keyPair.pubKey, null);
          expect(encapResult).not().assertNull();
          expect(encapResult.sharedSecret.length).assertEqual(32);
          expect(encapResult.wrappedKey.length).assertEqual(1088);
          let decapSecret: Uint8Array = kem.decapsulateSync(keyPair.priKey, encapResult.wrappedKey);
          expect(decapSecret).not().assertNull();
          expect(compareUint8Array(decapSecret, encapResult.sharedSecret)).assertTrue();
        }
      } catch (error) {
        console.error(`[XTS] ML_KEM_STRESS_0100 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Stress_Async_Rel_0100
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Stress_Async_Rel_0100
     * @tc.desc   ML-KEM-768 concurrent encap/decap test.
     * @tc.type   RELIABILITY
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Stress_Async_Rel_0100",
      TestType.RELIABILITY | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
        expect(keyPair).not().assertNull();
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_768);
        expect(kem).not().assertNull();
        let promises: Promise<cryptoFramework.KemEncapResult>[] = [];
        for (let i = 0; i < 5; i++) {
          promises.push(kem.encapsulate(keyPair.pubKey, null));
        }
        let encapResults: cryptoFramework.KemEncapResult[] = await Promise.all(promises);
        for (let i = 0; i < encapResults.length; i++) {
          expect(encapResults[i]).not().assertNull();
          let decapSecret: Uint8Array = await kem.decapsulate(keyPair.priKey, encapResults[i].wrappedKey);
          expect(decapSecret).not().assertNull();
          expect(compareUint8Array(decapSecret, encapResults[i].sharedSecret)).assertTrue();
        }
      } catch (error) {
        console.error(`[XTS] ML_KEM_STRESS_0200 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Destroy_Sync_Func_0100
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Destroy_Sync_Func_0100
     * @tc.desc   ML-KEM-768 KEM Key destroy test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Destroy_Sync_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_768);
        expect(kem).not().assertNull();
        let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        expect(keyGenerator).not().assertNull();
        let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
        expect(keyPair).not().assertNull();
        let encapResult: cryptoFramework.KemEncapResult = kem.encapsulateSync(keyPair.pubKey, null);
        expect(encapResult).not().assertNull();
        keyPair.priKey.clearMem();
        kem.decapsulateSync(keyPair.priKey, encapResult.wrappedKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] ML_KEM_DESTROY_0100 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Encap_Error_0300
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Encap_Error_0300
     * @tc.desc   ML-KEM-512 key with ML-KEM-768 KEM encap test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Encap_Error_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-512");
        expect(keyGenerator).not().assertNull();
        let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
        expect(keyPair).not().assertNull();
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_768);
        expect(kem).not().assertNull();
        kem.encapsulateSync(keyPair.pubKey, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] ML_KEM_Encap_Error_0300 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Decap_Error_0800
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Decap_Error_0800
     * @tc.desc   ML-KEM-1024 private key with ML-KEM-768 KEM decap test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Decap_Error_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyGenerator768: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        expect(keyGenerator768).not().assertNull();
        let keyPair768: cryptoFramework.KeyPair = keyGenerator768.generateKeyPairSync();
        expect(keyPair768).not().assertNull();
        let keyGenerator1024: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-1024");
        expect(keyGenerator1024).not().assertNull();
        let keyPair1024: cryptoFramework.KeyPair = keyGenerator1024.generateKeyPairSync();
        expect(keyPair1024).not().assertNull();
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_768);
        expect(kem).not().assertNull();
        let encapResult: cryptoFramework.KemEncapResult = kem.encapsulateSync(keyPair768.pubKey, null);
        expect(encapResult).not().assertNull();
        kem.decapsulateSync(keyPair1024.priKey, encapResult.wrappedKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] ML_KEM_Decap_Error_0800 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Decap_Boundary_0100
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Decap_Boundary_0100
     * @tc.desc   ML-KEM-768 wrappedKey length -1 boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Decap_Boundary_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
        expect(keyPair).not().assertNull();
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_768);
        expect(kem).not().assertNull();
        let wrappedKey: Uint8Array = new Uint8Array(1087).fill(0);
        kem.decapsulateSync(keyPair.priKey, wrappedKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] ML_KEM_Decap_Boundary_0100 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Decap_Boundary_0200
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Decap_Boundary_0200
     * @tc.desc   ML-KEM-768 wrappedKey length +1 boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Decap_Boundary_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
        expect(keyPair).not().assertNull();
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_768);
        expect(kem).not().assertNull();
        let wrappedKey: Uint8Array = new Uint8Array(1089).fill(0);
        kem.decapsulateSync(keyPair.priKey, wrappedKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] ML_KEM_Decap_Boundary_0200 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Encap_Security_0100
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Encap_Security_0100
     * @tc.desc   ML-KEM-768 non-deterministic shared key randomness test.
     * @tc.type   SECURITY
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Encap_Security_0100",
      TestType.SECURITY | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
        expect(keyPair).not().assertNull();
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_768);
        expect(kem).not().assertNull();
        let secrets: Uint8Array[] = [];
        for (let i = 0; i < 100; i++) {
          let encapResult: cryptoFramework.KemEncapResult = kem.encapsulateSync(keyPair.pubKey, null);
          expect(encapResult).not().assertNull();
          secrets.push(encapResult.sharedSecret);
        }
        let allDifferent: boolean = true;
        for (let i = 0; i < secrets.length; i++) {
          for (let j = i + 1; j < secrets.length; j++) {
            if (compareUint8Array(secrets[i], secrets[j])) {
              allDifferent = false;
              break;
            }
          }
          if (!allDifferent) {
            break;
          }
        }
        expect(allDifferent).assertTrue();
      } catch (error) {
        console.error(`[XTS] ML_KEM_SECURITY_0100 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_EncapDecap_Security_0100
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_EncapDecap_Security_0100
     * @tc.desc   ML-KEM-768 shared secret not all-0 not all-FF test.
     * @tc.type   SECURITY
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_EncapDecap_Security_0100",
      TestType.SECURITY | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = keyGenerator.generateKeyPairSync();
        expect(keyPair).not().assertNull();
        let kem: cryptoFramework.Kem = cryptoFramework.createKem(cryptoFramework.KemAlgNameId.ML_KEM_768);
        expect(kem).not().assertNull();
        let encapResult: cryptoFramework.KemEncapResult = kem.encapsulateSync(keyPair.pubKey, null);
        expect(encapResult).not().assertNull();
        let allZero: boolean = true;
        for (let i = 0; i < encapResult.sharedSecret.length; i++) {
          if (encapResult.sharedSecret[i] !== 0x00) {
            allZero = false;
            break;
          }
        }
        expect(!allZero).assertTrue();
        let allFF: boolean = true;
        for (let i = 0; i < encapResult.sharedSecret.length; i++) {
          if (encapResult.sharedSecret[i] !== 0xFF) {
            allFF = false;
            break;
          }
        }
        expect(!allFF).assertTrue();
      } catch (error) {
        console.error(`[XTS] ML_KEM_SECURITY_0200 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

  });
}
