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
import cryptoFramework from "@ohos.security.cryptoFramework";
import * as asyCallback from "./utils/asysmmetricspec/publicAsymmetricSpecCallback";
import * as asyPromise from "./utils/asysmmetricspec/publicAsymmetricSpecPromise";
import * as common from "./utils/common/publicDoSpec";

function genDsa2048CommonSpec(): cryptoFramework.DSACommonParamsSpec {
  return common.genDsa2048CommonSpecBigE();
}

function genDsa2048KeyPairSpec(): cryptoFramework.DSAKeyPairSpec {
  return common.genDsa2048KeyPairSpecBigE();
}

function genDsa2048PubKeySpec(): cryptoFramework.DSAPubKeySpec {
  return common.genDsa2048PubKeySpecBigE();
}

function genEccKeyTypeSpec(keyType: cryptoFramework.AsyKeySpecType): cryptoFramework.AsyKeySpec {
  return common.genEccKeySpec(keyType);
}

export default function AsyKeyGeneratorBySpecJsunit() {
  describe("AsyKeyGeneratorBySpecJsunit", () => {
    console.info("##########start AsyKeyGeneratorBySpecJsunit##########");
    beforeAll(async () => {
    });

    /**
     * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_0100
     * @tc.name DSA Key generation scenario by spec
     * @tc.desc the asyKeySpec is genDsa2048CommonSpec, Use the callback Style of Interface
     */
    it(
      "Security_CryptoFramework_GeneratorBySpec_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        asyCallback
          .generateByCommonSpec(genDsa2048CommonSpec(), "DSA")
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_GeneratorBySpec_Func_1900 catch err " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_0200
     * @tc.name DSA Key generation scenario by spec
     * @tc.desc the asyKeySpec is genDsa2048PubKeySpec, Use the promise Style of Interface
     */
    it(
      "Security_CryptoFramework_GeneratorBySpec_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        asyPromise
          .generateByPubKeySpec(genDsa2048PubKeySpec(), "DSA")
          .then((data: boolean) => {
            // expect(data == null).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_GeneratorBySpec_Func_0200 catch err " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_0300
     * @tc.name DSA Key generation scenario by spec
     * @tc.desc the asyKeySpec is genDsa2048KeyPairSpec, Use the promise Style of Interface
     */
    it(
      "Security_CryptoFramework_GeneratorBySpec_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        asyPromise
          .generateByKeyPairSpec(genDsa2048KeyPairSpec(), "DSA")
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_GenerateBySpec_Func_0300 catch err " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_0400
     * @tc.name DSA pubKey generate prikey failed
     * @tc.desc the asyKeySpec is genDsa2048PubKeySpec, Use the callback Style of Interface
     */
    it(
      "Security_CryptoFramework_GeneratorBySpec_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let asyKeyPairSpec: cryptoFramework.AsyKeyGeneratorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(
          genDsa2048PubKeySpec()
        );
        asyKeyPairSpec
          .generatePriKey()
          .then((priKey: cryptoFramework.PriKey) => {
            console.log("priKey" + priKey);
            expect(null).assertFail();
          })
          .catch((err: Error) => {
            console.error(
              "generatePubTopriSpecFailed Security_CryptoFramework_GeneratorBySpec_Func_0400" +
                " failed. error is " +
                err
            );
            expect(err.code).assertEqual(401);
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_0500
     * @tc.name ECC Key generation scenario by spec
     * @tc.desc the asyKeySpec is eccCommonSpec, Use the callback Style of Interface
     */
    it(
      "Security_CryptoFramework_GeneratorBySpec_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        asyCallback
          .generateByCommonSpec(
            genEccKeyTypeSpec(
              cryptoFramework.AsyKeySpecType.COMMON_PARAMS_SPEC
            ),
            "ECC"
          )
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_GeneratorBySpec_Func_0500 catch err " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_0600
     * @tc.name ECC Key generation scenario by spec
     * @tc.desc the asyKeySpec is eccPriKeySpec, Use the callback Style of Interface
     */
    it(
      "Security_CryptoFramework_GeneratorBySpec_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        asyCallback
          .generateByPriKeySpec(
            genEccKeyTypeSpec(cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC),
            "ECC"
          )
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_GeneratorBySpec_Func_0600 catch err " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_0700
     * @tc.name ECC Key generation scenario by spec
     * @tc.desc the asyKeySpec is eccPubKeySpec, Use the promise Style of Interface
     */
    it(
      "Security_CryptoFramework_GeneratorBySpec_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        asyPromise
          .generateByPubKeySpec(
            genEccKeyTypeSpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC),
            "ECC"
          )
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_GeneratorBySpec_Func_0700 catch err " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_0800
     * @tc.name ECC Key generation scenario by spec
     * @tc.desc the asyKeySpec is eccKeyPairSpec, Use the promise Style of Interface
     */
    it(
      "Security_CryptoFramework_GeneratorBySpec_Func_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        asyPromise
          .generateByKeyPairSpec(
            genEccKeyTypeSpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC),
            "ECC"
          )
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_GeneratorBySpec_Func_0800 catch err " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );
  });
}
