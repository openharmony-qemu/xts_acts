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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import * as asyPromise from "./utils/asymmetric/publicAsymmetricPromise";
import * as asyCallback from "./utils/asymmetric/publicAsymmetricCallback";
import cryptoFramework from "@ohos.security.cryptoFramework";

export default function AsymmetricCryptographyJsSecondunit() {
  describe("AsymmetricCryptographyJsSecondunit", () => {
    console.info("##########start AsymmetricCryptographyJsunit##########");
    beforeAll(async () => {
    });

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_1200
     * @tc.name Test RSA2048|PSS|SHA1|MGF1_SHA1 normal sign and verify
     * @tc.desc Use the Promise Style of Interface
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_RSA_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        asyPromise
          .signAndVerifyNormalProcess("RSA512", "RSA512|PSS|SHA384|MGF1_SHA384")
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_SignVerify_RSA_1200 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_1300
     * @tc.name Test createAsyKeyGenerator interface with invalid input
     * @tc.desc First input  RSA256, Second input  NULL
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_RSA_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          cryptoFramework.createAsyKeyGenerator("RSA256");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          console.error("err is:" + err.code);
          expect(err.code).assertEqual(401);
        }

        try {
          cryptoFramework.createAsyKeyGenerator("NULL");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          console.error("err is:" + err.code);
          expect(err.code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_1400
     * @tc.name Test createSign interface with invalid input
     * @tc.desc First input  RSA4096|NULL|SHA256, Second input  RSA4096|PKCS1|NULL
     * @tc.desc Third input  RSA4096|PKCS1|SHA122, Fourth input  RSA4096|PKCS5|SHA256
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_RSA_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          cryptoFramework.createSign("RSA4096|NULL|SHA256");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }

        try {
          cryptoFramework.createSign("RSA4096|PKCS1|NULL");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }

        try {
          cryptoFramework.createSign("RSA4096|PKCS1|SHA122");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }

        try {
          cryptoFramework.createSign("RSA4096|PKCS5|SHA256");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_2000
     * @tc.name Test RSA4096|PKCS1 normal encryption and decryption
     * @tc.desc Use the Callback Style of Interface
     */
    it(
      "Security_crypto_framework_ASymmetric_Encryption_RSA_2000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        asyCallback
          .encryptAndDecryptNormalProcessSuperdata(
            "RSA4096",
            "RSA4096|PKCS1",
            490
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_Encryption_RSA_2000 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_2100
     * @tc.name Test RSA3072|PKCS1|SHA224 normal sign and verify
     * @tc.desc Use the Callback Style of Interface
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_RSA_2100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        asyCallback
          .signAndVerifyNormalProcessSuperdata(
            "RSA3072",
            "RSA3072|PKCS1|SHA224",
            350
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_SignVerify_RSA_2100 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_1500
     * @tc.name Test createVerify interface with invalid input
     * @tc.desc First input  RSA4096|NULL|SHA256, Second input  RSA4096|PKCS1|NULL
     * @tc.desc Third input  RSA4096|PKCS1|SHA122, Fourth input  RSA4096|PKCS5|SHA256
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_RSA_1500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          cryptoFramework.createVerify("RSA4096|NULL|SHA256");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }

        try {
          cryptoFramework.createVerify("RSA4096|PKCS1|NULL");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }

        try {
          cryptoFramework.createVerify("RSA4096|PKCS1|SHA122");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }

        try {
          cryptoFramework.createVerify("RSA4096|PKCS5|SHA256");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0100
     * @tc.name Test ECC224|SHA256 normal sign and verify
     * @tc.desc Use the Callback Style of Interface
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        asyCallback
          .signAndVerifyNormalProcess("ECC224", "ECC224|SHA256")
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0100 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0200
     * @tc.name Test ECC256|SHA1 normal sign and verify
     * @tc.desc Use the Promise Style of Interface
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        asyPromise
          .signAndVerifyNormalProcess("ECC256", "ECC256|SHA1")
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0200 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0300
     * @tc.name Test ECC224|SHA256 normal sign and verify
     * @tc.desc Use the Callback Style of Interface
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        asyCallback
          .signAndVerifyNormalProcess("ECC384", "ECC384|SHA224")
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0300 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0400
     * @tc.name Test ECC521|SHA384 normal sign and verify
     * @tc.desc Use the Callback Style of Interface
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        asyPromise
          .signAndVerifyNormalProcess("ECC521", "ECC521|SHA384")
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0400 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0500
     * @tc.name Test ECC224|SHA512 normal sign and verify
     * @tc.desc Use the Callback Style of Interface
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        asyPromise
          .signAndVerifyNormalProcess("ECC224", "ECC224|SHA512")
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0500 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0600
     * @tc.name Test createAsyKeyGenerator interface with invalid input
     * @tc.desc First input  ECC1, Second input null character string
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          cryptoFramework.createAsyKeyGenerator("ECC1");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          console.error("err is:" + err.code);
          expect(err.code).assertEqual(401);
        }

        try {
          cryptoFramework.createAsyKeyGenerator("");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          console.error("err is:" + err.code);
          expect(err.code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0700
     * @tc.name Test createSign with invalid input
     * @tc.desc First input ECC224|SHA257, Second input ECC224|NULL
     * @tc.desc Third input NULL|SHA1, Fourth input ECC1|SHA1
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          cryptoFramework.createSign("ECC224|SHA257");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }
        try {
          cryptoFramework.createSign("ECC224|NULL");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }
        try {
          cryptoFramework.createSign("NULL|SHA1");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }
        try {
          cryptoFramework.createSign("ECC1|SHA1");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0800
     * @tc.name Test createVerify with invalid input
     * @tc.desc First input ECC1|SHA256, Second input NULL|SHA256
     * @tc.desc Third input ECC224|SHA122, Fourth input ECC224|NULL
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          cryptoFramework.createAsyKeyGenerator("RSA3072");
          cryptoFramework.createVerify("ECC1|SHA256");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }
        try {
          cryptoFramework.createVerify("NULL|SHA256");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }
        try {
          cryptoFramework.createVerify("ECC224|SHA122");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }
        try {
          cryptoFramework.createVerify("ECC224|NULL");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0900
     * @tc.name Test ECC224|SHA512 normal sign and verify
     * @tc.desc Use the Callback Style of Interface
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        asyCallback
          .signAndVerifyNormalProcessSuperdata(
            "ECC224",
            "ECC224|SHA512",
            350
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0900 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDH_0100
     * @tc.name Test ECC224 SignVerify ECDH
     * @tc.desc Use the Promise Style of Interface
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_ECDH_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        asyPromise
          .keyAgreementProcess("ECC224")
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_SignVerify_ECDH_0100 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDH_0200
     * @tc.name Test ECC256 SignVerify ECDH
     * @tc.desc Use the Callback Style of Interface
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_ECDH_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        asyCallback
          .keyAgreementProcess("ECC256")
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_SignVerify_ECDH_0200 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDH_0300
     * @tc.name Test ECC384 SignVerify ECDH
     * @tc.desc Use the Promise Style of Interface
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_ECDH_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        asyPromise
          .keyAgreementProcess("ECC384")
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_SignVerify_ECDH_0300 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDH_0400
     * @tc.name Test ECC521 SignVerify ECDH
     * @tc.desc Use the Callback Style of Interface
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_ECDH_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        asyCallback
          .keyAgreementProcess("ECC521")
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_SignVerify_ECDH_0400 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDH_0500
     * @tc.name Test createKeyAgreement with invalid input
     * @tc.desc First input ECC5, Second input NULL
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_ECDH_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          cryptoFramework.createKeyAgreement("ECC5");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDH_0600
     * @tc.name Test generateSecret of KeyAgreement with invalid input 1
     * @tc.desc First input invalid pubkey, Second input invalide prikey
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_ECDH_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let rsaGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ECC256");
          let keyPair1: cryptoFramework.KeyPair = await rsaGenerator.generateKeyPair();
          expect(keyPair1 != null).assertTrue();
          let keyPair2: cryptoFramework.KeyPair = await new Promise<cryptoFramework.KeyPair>((resolve, reject) => {
            rsaGenerator.generateKeyPair((err: BusinessError<void>|null, keyPair: cryptoFramework.KeyPair|undefined) => {
              if (err || keyPair === undefined) { // success: error is null, failed: data is undefined
                reject(err as Error);
              } else {
                resolve(keyPair as cryptoFramework.KeyPair);
              }
            })
          })
          expect(keyPair2 != null).assertTrue();
        } catch (err: BusinessError) {
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDH_0700
     * @tc.name Test generateSecret of KeyAgreement with invalid input 2
     * @tc.desc The public key and private key do not match
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_ECDH_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let rsaGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA512");
          let keyPair1: cryptoFramework.KeyPair = await rsaGenerator.generateKeyPair();
          expect(keyPair1 != null).assertTrue();
          let keyPair2: cryptoFramework.KeyPair = await new Promise<cryptoFramework.KeyPair>((resolve, reject) => {
            rsaGenerator.generateKeyPair((err: BusinessError<void>|null, keyPair: cryptoFramework.KeyPair|undefined) => {
              if (err || keyPair === undefined) { // success: error is null, failed: data is undefined
                reject(err as Error);
              } else {
                resolve(keyPair as cryptoFramework.KeyPair);
              }
            })
          })
          expect(keyPair2 != null).assertTrue();
          let keyAgrementGenerator: cryptoFramework.KeyAgreement = cryptoFramework.createKeyAgreement("ECC521");
          await keyAgrementGenerator.generateSecret(keyPair1.priKey, keyPair2.pubKey)
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_3300
     * @tc.name Test convertKey
     * @tc.desc Use RSA3072|PRIMES_2 algorithm
     */
    it(
      "Security_crypto_framework_ASymmetric_Encryption_RSA_3300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        asyPromise
          .convertKeyEncryptAndDecryptProcess("RSA3072|PRIMES_2")
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_Encryption_RSA_3300 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_3100
     * @tc.name Test convertKey
     * @tc.desc Use RSA1024|PRIMES_2 algorithm
     */
    it(
      "Security_crypto_framework_ASymmetric_Encryption_RSA_3100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        asyPromise
          .AsyPriKeyClearProcess("RSA1024|PRIMES_2")
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_Encryption_RSA_3100 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_1100
     * @tc.name Test RSA2048|PSS|SHA1|MGF1_SHA1 normal sign and verify
     * @tc.desc Use the Promise Style of Interface
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_RSA_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        asyPromise
          .signAndVerifyNormalProcess("RSA8192", "RSA8192|PSS|SHA512|MGF1_SHA512")
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_SignVerify_RSA_1100 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );
  });
}
