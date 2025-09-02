/*software
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import huks from '@ohos.security.huks';
import systemTime from '@ohos.systemTime';
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { logger } from './utils/common/logger';

let AAD = 'OH_authToken';
let NONCE = 'hahahahahaha';
let TAG = '0000000000000000';
let hks_default_auth_token_key = 'huks_default_user_auth_token_key';
const AUTH_TOKEN_CIPHERTEXT_LEN = 28; //sizeof(userID + secureUid + enrolledId + credentialId)
const authTokenSize = 148;
let authToken = new Uint8Array(authTokenSize);
let authTokenData = new Uint8Array(authTokenSize - 32); //去掉签名


let aes256Key = new Uint8Array([
    0x00, 0x00, 0x00, 0x00, 0x9c, 0xf6, 0x7a, 0x8d, 0xce, 0xc2, 0x7f, 0xa7, 0xd9, 0xfd, 0xf1, 0xad,
    0xac, 0xf0, 0xb3, 0x8c, 0xe8, 0x16, 0xa2, 0x65, 0xcc, 0x18, 0x55, 0x60, 0xcd, 0x2f, 0xf5, 0xe5
]);

function stringToUint8Array(str) {
    let arr = [];
    for (let i = 0, j = str.length; i < j; ++i) {
        arr.push(str.charCodeAt(i));
    }
    let tmpUint8Array = new Uint8Array(arr);
    return tmpUint8Array;
};

function makeEmptyOption() {
    let emptyOption = {
        properties: []
    };
    return emptyOption;
};

function uintXToBytes(value, Xbit, buffer, index) {
    let bytes = Xbit / 8;

    for (let i = 1; i <= bytes; i++) {
        buffer[index++] = (value >> ((i - 1) * 8)) & 0xFF;
    }
};

function copyBytes(bytesBuffer, byteLen, buffer, index) {
    for (let i = 0; i < byteLen; i++) {
        buffer[index++] = bytesBuffer[i];
    }
};

function copyByteTo(bytesBuffer, pos, start, end) {
    for (let i = start; i <= end; i++) {
        pos[i] = bytesBuffer[i];
    }
}

function makeAESKeyOptions() {
    let properties = new Array();
    properties[0] = {
        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
        value: huks.HuksKeyAlg.HUKS_ALG_AES
    };
    properties[1] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
        value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256
    };
    properties[2] = {
        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
    };
    properties[3] = {
        tag: huks.HuksTag.HUKS_TAG_PADDING,
        value: huks.HuksKeyPadding.HUKS_PADDING_NONE
    };
    properties[4] = {
        tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
        value: huks.HuksCipherMode.HUKS_MODE_CBC
    };
    properties[5] = {
        tag: huks.HuksTag.HUKS_TAG_IV,
        value: new Uint8Array(16)
    };
    let options = {
        properties: properties
    };
    return options;
};

function makeAESKeyOptionsWithAuthToken(authToken) {
    let properties = new Array();
    properties[0] = {
        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
        value: huks.HuksKeyAlg.HUKS_ALG_AES
    };
    properties[1] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
        value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256
    };
    properties[2] = {
        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
    };
    properties[3] = {
        tag: huks.HuksTag.HUKS_TAG_PADDING,
        value: huks.HuksKeyPadding.HUKS_PADDING_NONE
    };
    properties[4] = {
        tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
        value: huks.HuksCipherMode.HUKS_MODE_CBC
    };
    properties[5] = {
        tag: huks.HuksTag.HUKS_TAG_AUTH_TOKEN,
        value: authToken
    };
    let options = {
        properties: properties
    };
    return options;
};


async function generateAuthToken(importAliasHmac, importHmacOption, challenge, secureUid, authType, enrollId, time) {
    //2023/5/16 adjust the authTokenData struct
    uintXToBytes(0, 32, authTokenData, 0); // version
    uintXToBytes(0, 32 * 8, authTokenData, 4); // challenge 初始�?
    uintXToBytes(time, 32, authTokenData, 36); // time
    uintXToBytes(0, 32, authTokenData, 40); // time
    uintXToBytes(0, 32, authTokenData, 44); //authtrustLevel
    uintXToBytes(authType, 32, authTokenData, 48); // authtype
    uintXToBytes(0, 32, authTokenData, 52); //authmode
    uintXToBytes(0, 32, authTokenData, 56); //securityLevel
    //ID
    uintXToBytes(0, 32, authTokenData, 60); //userID
    uintXToBytes(secureUid, 32, authTokenData, 64); //secureUid 4个字�?
    uintXToBytes(0, 32, authTokenData, 68); // secureUid 4个字�?
    uintXToBytes(enrollId, 32, authTokenData, 72); //enrollId
    uintXToBytes(0, 32, authTokenData, 76); //enrollId
    uintXToBytes(0, 64, authTokenData, 80); //credential ID

    // 第一�?�?token中的userID等相关ID 进行加密，先导入密钥
    let importEncrptAlias = 'AuthToken_Encrypt_Decrypt_KeyAlias';
    let importEncrptOption = makeAuthTokenImportAesOptions(true, stringToUint8Array(hks_default_auth_token_key));
    // 先导入密�?
    try {
        await huks.importKeyItem(importEncrptAlias, importEncrptOption)
            .then((data) => {
                logger.error(`TokenUserData importKey data ${JSON.stringify(data)}`);
            })
            .catch((err) => {
                logger.error(`TokenUserData importKey err: " + ${JSON.stringify(err)}`);
            });
    } catch (error) {
        logger.error(`TokenUserData: importKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
    }

    //三段式初始化Token
    let handleToken;
    //获取AuthTokenID 给加密传�?把authTokenData 重点60~88 取出来放�?inData: inKey =TokenUserData //HksCiphertextData
    let authTokenIDArray = new Uint8Array(AUTH_TOKEN_CIPHERTEXT_LEN); //From 60 to 88
    for (let i = 60, j = 0; i <= 88; ) {
        authTokenIDArray[j++] = authTokenData[i++];
    }

    let initAesTokenOption = makeAuthTokenOptions(false, authTokenIDArray);
    await huks
        .init(importEncrptAlias, initAesTokenOption)
        .then((data) => {
            handleToken = data.handle;
        }).catch((err) => {
            logger.error(`TokenUserData test init err: " + ${JSON.stringify(err)}`);
        });

    // finish完成加密, 
    let finishAesTokenOption = makeAuthTokenOptions(true, authTokenIDArray);
    await huks.finish(handleToken, finishAesTokenOption).then((data) => {
        logger.error(`TokenUserData test finish data ${JSON.stringify(data)}`);
        copyBytes(data.outData, 44, authTokenData, 60); // 拷贝加密后的ID相关数据�?TAG加密数据, 长度 44 = 28 + 16
        copyBytes(stringToUint8Array(NONCE), 12, authTokenData, 104); // NONCE 也需要放在authTokenData�?地址�?04开始起
    }).catch((err) => {
        logger.error('generateAuthToken test finish err information: ' + err);
    });

    //搞完后删除导入的密钥
    let deleteKeyOption = makeEmptyOption();
    await huks.deleteKey(importEncrptAlias, deleteKeyOption).then(async (data) => {
        logger.error(`HuksTest_AlgCompletion_AccessControl deleteKey success ${JSON.stringify(data)}`);
    }).catch((err) => {
        logger.error(`deleteKey err: " + ${JSON.stringify(err)}`);
    });

    // 第二步：导入Hmac key
    await huks.importKey(importAliasHmac, importHmacOption).then(async (data) => {
        logger.error(`generateAuthToken importKey data ${JSON.stringify(data)}`);
    }).catch((err) => {
        logger.error(`generateAuthToken importKey err: " + ${JSON.stringify(err)}`);
    });

    // 使用三段式对Authtoken进行HMAC
    let handle;
    // HksInit初始化key
    let initHmacOption = makeHmacKeyOption(false, null);
    await huks.init(importAliasHmac, initHmacOption).then(async (data) => {
        handle = data.handle;
    }).catch((err) => {
        logger.error(`generateAuthToken test init err: " + ${JSON.stringify(err)}`);
    });
    copyBytes(challenge, 32, authTokenData, 4);

    // finish完成签名
    let finishHmacOption = makeHmacKeyOption(true, authTokenData);
    await huks.finish(handle, finishHmacOption).then((data) => {
        logger.error(`generateAuthToken test finish data ${JSON.stringify(data)}`);
        copyBytes(authTokenData, 116, authToken, 0); // copy authToken data to authToken
        copyBytes(data.outData, 32, authToken, 116); // copy sign to authToken
    }).catch((err) => {
        logger.error('generateAuthToken test finish err information: ' + err);
    });
};

//authToken 三段式init时加密TAG�?
function makeAuthTokenOptions(isImportKey, inKey) {
    let properties = new Array();
    properties[0] = {
        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
        value: huks.HuksKeyAlg.HUKS_ALG_AES
    };
    properties[1] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
        value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256
    };
    properties[2] = {
        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
    };
    properties[3] = {
        tag: huks.HuksTag.HUKS_TAG_PADDING,
        value: huks.HuksKeyPadding.HUKS_PADDING_NONE
    };
    properties[4] = {
        tag: huks.HuksTag.HUKS_TAG_DIGEST,
        value: huks.HuksKeyDigest.HUKS_DIGEST_NONE
    };
    properties[5] = {
        tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
        value: huks.HuksCipherMode.HUKS_MODE_GCM
    };
    properties[6] = {
        //AAD
        tag: huks.HuksTag.HUKS_TAG_ASSOCIATED_DATA,
        value: stringToUint8Array(AAD)
    };
    properties[7] = {
        //NONCE
        tag: huks.HuksTag.HUKS_TAG_NONCE,
        value: stringToUint8Array(NONCE)
    };
    properties[8] = {
        //TAG  AEAD
        tag: huks.HuksTag.HUKS_TAG_AE_TAG,
        value: stringToUint8Array(TAG)
    };

    if (isImportKey) {
        let optionsWithIndata = {
            properties: properties,
            inData: inKey
        };
        return optionsWithIndata;
    } else {
        let optionsWithoutIndata = {
            properties: properties,
        };
        return optionsWithoutIndata;
    }
}

// 对auth_token  导入AES密钥时的option
function makeAuthTokenImportAesOptions(isImportKey, inKey) {
    let properties = new Array();
    properties[0] = {
        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
        value: huks.HuksKeyAlg.HUKS_ALG_AES
    };
    properties[1] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
        value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256
    };
    properties[2] = {
        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
    };
    properties[3] = {
        tag: huks.HuksTag.HUKS_TAG_PADDING,
        value: huks.HuksKeyPadding.HUKS_PADDING_NONE
    };
    properties[4] = {
        tag: huks.HuksTag.HUKS_TAG_DIGEST,
        value: huks.HuksKeyDigest.HUKS_DIGEST_NONE
    };
    properties[5] = {
        tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
        value: huks.HuksCipherMode.HUKS_MODE_GCM
    };

    if (isImportKey) {
        let optionsWithIndata = {
            properties: properties,
            inData: inKey
        };
        return optionsWithIndata;
    } else {
        let optionsWithoutIndata = {
            properties: properties,
        };
        return optionsWithoutIndata;
    }
};

function makeHmacKeyOption(isImportKey, inKey) {
    let properties = new Array();
    properties[0] = {
        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
        value: huks.HuksKeyAlg.HUKS_ALG_HMAC
    };
    properties[1] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
        value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256
    };
    properties[2] = {
        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_MAC
    };
    properties[3] = {
        tag: huks.HuksTag.HUKS_TAG_DIGEST,
        value: huks.HuksKeyDigest.HUKS_DIGEST_SHA256
    };

    if (isImportKey) {
        let optionsWithIndata = {
            properties: properties,
            inData: inKey
        };
        return optionsWithIndata;
    } else {
        let optionsWithoutIndata = {
            properties: properties,
        };
        return optionsWithoutIndata;
    }
};

async function generateAndInit(mode, alias, aes256) {
    logger.error(`${alias} sudato!`);
    if (mode == 'generate') {
        await huks.generateKey(alias, aes256).then(async (data) => {
            logger.error(`generateKey success ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        }).catch((err) => {
            logger.error(`generateKey err: " + ${JSON.stringify(err)}`);
            expect(null).assertFail();
        });
    }
    ;
    if (mode == 'import') {
        await huks.importKey(alias, aes256).then(async (data) => {
            logger.error(`generateKey success ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        }).catch((err) => {
            logger.error(`generateKey err: " + ${JSON.stringify(err)}`);
            expect(null).assertFail();
        });
    }
    ;

    await huks.getKeyProperties(alias, makeEmptyOption()).then(async (data) => {
        logger.error(`test finish data ${JSON.stringify(data)}`);
        expect(data.errorCode == 0).assertTrue();
    }).catch((err) => {
        logger.error(`test init err: " + ${JSON.stringify(err)}`);
        expect(null).assertFail();
    });

    let initAesOption = makeAESKeyOptions();
    // HksInit初始化key
    let data = await huks.init(alias, initAesOption).then(async (data) => {
        logger.error(`HuksTest_AlgCompletion_AccessControl test init success ${JSON.stringify(data)}`);
        return data;
    }).catch((err) => {
        logger.error(`test init err: " + ${JSON.stringify(err)}`);
        return err;
    });
    logger.error(`${alias} doing!`);
    return data;
}

async function multiIdentify(
    importAliasHmac,
    importHmacOption,
    alias,
    aes256,
    authMode
) {
    await huks.generateKey(alias, aes256).then(async (data) => {
        logger.error(`generateKey success ${JSON.stringify(data)}`);
        expect(data.errorCode == 0).assertTrue();
    }).catch((err) => {
        logger.error(`generateKey err: " + ${JSON.stringify(err)}`);
        expect(null).assertFail();
    });
    let challengeAll = new Uint8Array(32);
    let handle1, challenge1;
    let handle2, challenge2;
    let handle3, challenge3;
    let handle4, challenge4;
    let initAesOption = makeAESKeyOptions();

    await huks.init(alias, initAesOption).then(async (data) => {
        handle1 = data.handle;
        challenge1 = data.token;
        copyByteTo(challenge1, challengeAll, 0, 7);
        logger.error(`HuksTest_AlgCompletion_AccessControl test init success ${JSON.stringify(data)}`);
    }).catch((err) => {
        logger.error(`test init err: " + ${JSON.stringify(err)}`);
        expect(null).assertFail();
    });
    await huks.init(alias, initAesOption).then(async (data) => {
        handle2 = data.handle;
        challenge2 = data.token;
        copyByteTo(challenge2, challengeAll, 8, 16);
        logger.error(`HuksTest_AlgCompletion_AccessControl test init success ${JSON.stringify(data)}`);
    }).catch((err) => {
        logger.error(`test init err: " + ${JSON.stringify(err)}`);
        expect(null).assertFail();
    });
    await huks.init(alias, initAesOption).then(async (data) => {
        handle3 = data.handle;
        challenge3 = data.token;
        copyByteTo(challenge3, challengeAll, 17, 24);
        logger.error(`HuksTest_AlgCompletion_AccessControl test init success ${JSON.stringify(data)}`);
    }).catch((err) => {
        logger.error(`test init err: " + ${JSON.stringify(err)}`);
        expect(null).assertFail();
    });
    await huks.init(alias, initAesOption).then(async (data) => {
        handle4 = data.handle;
        challenge4 = data.token;
        copyByteTo(challenge4, challengeAll, 25, 32);
        logger.error(`HuksTest_AlgCompletion_AccessControl test init success ${JSON.stringify(data)}`);
    }).catch((err) => {
        logger.error(`test init err: " + ${JSON.stringify(err)}`);
        expect(null).assertFail();
    });
    if (authMode == 'pin') {
        await generateAuthToken(importAliasHmac, importHmacOption, challengeAll, 1, 1, 1, 0);
    }
    if (authMode == 'face') {
        await generateAuthToken(importAliasHmac, importHmacOption, challengeAll, 1, 2, 3, 0);
    }
    if (authMode == 'finger') {
        await generateAuthToken(importAliasHmac, importHmacOption, challengeAll, 1, 4, 2, 0);
    }

    let finishOption = makeAESKeyOptionsWithAuthToken(authToken);
    await huks.finish(handle1, finishOption).then((data) => {
        logger.error(`HuksTest_AlgCompletion_AccessControl test finish data ${JSON.stringify(data)}`);
        expect(data.errorCode == 0).assertTrue();
    }).catch((err) => {
        logger.error('test finish err information: ' + err);
        expect(null).assertFail();
    });
    await huks.finish(handle2, finishOption).then((data) => {
        logger.error(`HuksTest_AlgCompletion_AccessControl test finish data ${JSON.stringify(data)}`);
        expect(data.errorCode == 0).assertTrue();
    }).catch((err) => {
        logger.error('test finish err information: ' + err);
        expect(null).assertFail();
    });
    await huks.finish(handle3, finishOption).then((data) => {
        logger.error(`HuksTest_AlgCompletion_AccessControl test finish data ${JSON.stringify(data)}`);
        expect(data.errorCode == 0).assertTrue();
    }).catch((err) => {
        logger.error('test finish err information: ' + err);
        expect(null).assertFail();
    });
    await huks.finish(handle4, finishOption).then((data) => {
        logger.error(`HuksTest_AlgCompletion_AccessControl test finish data ${JSON.stringify(data)}`);
        expect(data.errorCode == 0).assertTrue();
    }).catch((err) => {
        logger.error('test finish err information: ' + err);
        expect(null).assertFail();
    });
    let deleteKeyOption = makeEmptyOption();

    await huks.deleteKey(alias, deleteKeyOption).then(async (data) => {
        logger.error(`HuksTest_AlgCompletion_AccessControl deleteKey success ${JSON.stringify(data)}`);
    }).catch((err) => {
        logger.error(`deleteKey err: " + ${JSON.stringify(err)}`);
    });
}

async function finishStep(handle, alias, errCode) {
    let finishOption = makeAESKeyOptionsWithAuthToken(authToken);
    await huks.finish(handle, finishOption)
        .then((data) => {
            logger.error(`HuksTest_AlgCompletion_AccessControl test finish data ${JSON.stringify(data)}`);
            if (errCode != 0) {
                expect(data.errorCode != 0).assertTrue();
            } else {
                expect(data.errorCode == errCode).assertTrue();
            }
        })
        .catch((err) => {
            logger.error('test finish err information: ' + err);
            expect(err.code == errCode).assertTrue();
        });

    let deleteKeyOption = makeEmptyOption();

    await huks.deleteKey(alias, deleteKeyOption).then(async (data) => {
        logger.error(`HuksTest_AlgCompletion_AccessControl deleteKey success ${JSON.stringify(data)}`);
    }).catch((err) => {
        logger.error(`deleteKey err: " + ${JSON.stringify(err)}`);
    });
    logger.error(`${alias} end!`);
}

function usePinNormal(inData) {
    let propertiesWithPin = new Array();
    propertiesWithPin[0] = {
        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
        value: huks.HuksKeyAlg.HUKS_ALG_AES
    };
    propertiesWithPin[1] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
        value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256
    };
    propertiesWithPin[2] = {
        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
    };
    propertiesWithPin[3] = {
        tag: huks.HuksTag.HUKS_TAG_PADDING,
        value: huks.HuksKeyPadding.HUKS_PADDING_NONE
    };
    propertiesWithPin[4] = {
        tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
        value: huks.HuksCipherMode.HUKS_MODE_CBC
    };
    propertiesWithPin[5] = {
        tag: huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE,
        value: huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_PIN
    };
    propertiesWithPin[6] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
        value: huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD
    };
    propertiesWithPin[7] = {
        tag: huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE,
        value: huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_NORMAL
    };
    propertiesWithPin[8] = {
        tag: huks.HuksTag.HUKS_TAG_CHALLENGE_POS,
        value: 0
    };
    let aes256 = {
        properties: propertiesWithPin,
        inData: inData
    };
    return aes256;
}

function useFaceNormal(inData) {
    let propertiesWithPin = new Array();
    propertiesWithPin[0] = {
        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
        value: huks.HuksKeyAlg.HUKS_ALG_AES
    };
    propertiesWithPin[1] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
        value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256
    };
    propertiesWithPin[2] = {
        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
    };
    propertiesWithPin[3] = {
        tag: huks.HuksTag.HUKS_TAG_PADDING,
        value: huks.HuksKeyPadding.HUKS_PADDING_NONE
    };
    propertiesWithPin[4] = {
        tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
        value: huks.HuksCipherMode.HUKS_MODE_CBC
    };
    propertiesWithPin[5] = {
        tag: huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE,
        value: huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_FACE
    };
    propertiesWithPin[6] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
        value: huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL
    };
    propertiesWithPin[7] = {
        tag: huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE,
        value: huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_NORMAL
    };
    propertiesWithPin[8] = {
        tag: huks.HuksTag.HUKS_TAG_CHALLENGE_POS,
        value: 0
    };
    let aes256 = {
        properties: propertiesWithPin,
        inData: inData
    };
    return aes256;
}

function useFingerNormal(inData) {
    var propertiesWithPin = new Array();
    propertiesWithPin[0] = {
        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
        value: huks.HuksKeyAlg.HUKS_ALG_AES
    };
    propertiesWithPin[1] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
        value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256
    };
    propertiesWithPin[2] = {
        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
    };
    propertiesWithPin[3] = {
        tag: huks.HuksTag.HUKS_TAG_PADDING,
        value: huks.HuksKeyPadding.HUKS_PADDING_NONE
    };
    propertiesWithPin[4] = {
        tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
        value: huks.HuksCipherMode.HUKS_MODE_CBC
    };
    propertiesWithPin[5] = {
        tag: huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE,
        value: huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_FINGERPRINT
    };
    propertiesWithPin[6] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
        value: huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL
    };
    propertiesWithPin[7] = {
        tag: huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE,
        value: huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_NORMAL
    };
    propertiesWithPin[8] = {
        tag: huks.HuksTag.HUKS_TAG_CHALLENGE_POS,
        value: 0
    };
    var aes256 = {
        properties: propertiesWithPin,
        inData: inData
    }
    return aes256;
}

function usePinAndFaceNormal(inData) {
    let propertiesWithPin = new Array();
    propertiesWithPin[0] = {
        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
        value: huks.HuksKeyAlg.HUKS_ALG_AES
    };
    propertiesWithPin[1] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
        value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256
    };
    propertiesWithPin[2] = {
        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
    };
    propertiesWithPin[3] = {
        tag: huks.HuksTag.HUKS_TAG_PADDING,
        value: huks.HuksKeyPadding.HUKS_PADDING_NONE
    };
    propertiesWithPin[4] = {
        tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
        value: huks.HuksCipherMode.HUKS_MODE_CBC
    };
    propertiesWithPin[5] = {
        tag: huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE,
        value: huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_PIN |
        huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_FACE
    };
    propertiesWithPin[6] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
        value: huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD
    };
    propertiesWithPin[7] = {
        tag: huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE,
        value: huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_NORMAL
    };
    propertiesWithPin[8] = {
        tag: huks.HuksTag.HUKS_TAG_CHALLENGE_POS,
        value: 0
    };
    let aes256 = {
        properties: propertiesWithPin,
        inData: inData
    };
    return aes256;
}

function usePinAndFingerNormal(inData) {
    let propertiesWithPin = new Array();
    propertiesWithPin[0] = {
        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
        value: huks.HuksKeyAlg.HUKS_ALG_AES
    };
    propertiesWithPin[1] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
        value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256
    };
    propertiesWithPin[2] = {
        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
    };
    propertiesWithPin[3] = {
        tag: huks.HuksTag.HUKS_TAG_PADDING,
        value: huks.HuksKeyPadding.HUKS_PADDING_NONE
    };
    propertiesWithPin[4] = {
        tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
        value: huks.HuksCipherMode.HUKS_MODE_CBC
    };
    propertiesWithPin[5] = {
        tag: huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE,
        value:
        huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_PIN |
        huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_FINGERPRINT
    };
    propertiesWithPin[6] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
        value: huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD
    };
    propertiesWithPin[7] = {
        tag: huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE,
        value: huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_NORMAL
    };
    propertiesWithPin[8] = {
        tag: huks.HuksTag.HUKS_TAG_CHALLENGE_POS,
        value: 0
    };
    let aes256 = {
        properties: propertiesWithPin,
        inData: inData
    };
    return aes256;
}

function useFaceAndFingerNormal(inData) {
    let propertiesWithPin = new Array();
    propertiesWithPin[0] = {
        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
        value: huks.HuksKeyAlg.HUKS_ALG_AES
    };
    propertiesWithPin[1] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
        value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256
    };
    propertiesWithPin[2] = {
        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
    };
    propertiesWithPin[3] = {
        tag: huks.HuksTag.HUKS_TAG_PADDING,
        value: huks.HuksKeyPadding.HUKS_PADDING_NONE
    };
    propertiesWithPin[4] = {
        tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
        value: huks.HuksCipherMode.HUKS_MODE_CBC
    };
    propertiesWithPin[5] = {
        tag: huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE,
        value:
        huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_FACE |
        huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_FINGERPRINT
    };
    propertiesWithPin[6] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
        value: huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL
    };
    propertiesWithPin[7] = {
        tag: huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE,
        value: huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_NORMAL
    };
    propertiesWithPin[8] = {
        tag: huks.HuksTag.HUKS_TAG_CHALLENGE_POS,
        value: 0
    };
    let aes256 = {
        properties: propertiesWithPin,
        inData: inData
    };
    return aes256;
}

function usePinFaceFingerNormal(inData) {
    let propertiesWithPin = new Array();
    propertiesWithPin[0] = {
        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
        value: huks.HuksKeyAlg.HUKS_ALG_AES
    };
    propertiesWithPin[1] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
        value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256
    };
    propertiesWithPin[2] = {
        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
    };
    propertiesWithPin[3] = {
        tag: huks.HuksTag.HUKS_TAG_PADDING,
        value: huks.HuksKeyPadding.HUKS_PADDING_NONE
    };
    propertiesWithPin[4] = {
        tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
        value: huks.HuksCipherMode.HUKS_MODE_CBC
    };
    propertiesWithPin[5] = {
        tag: huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE,
        value:
        huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_PIN |
        huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_FACE |
        huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_FINGERPRINT
    };
    propertiesWithPin[6] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
        value: huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD
    };
    propertiesWithPin[7] = {
        tag: huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE,
        value: huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_NORMAL
    };
    propertiesWithPin[8] = {
        tag: huks.HuksTag.HUKS_TAG_CHALLENGE_POS,
        value: 0
    };
    let aes256 = {
        properties: propertiesWithPin,
        inData: inData
    };
    return aes256;
}

function usePinMulti(inData) {
    let propertiesWithPin = new Array();
    propertiesWithPin[0] = {
        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
        value: huks.HuksKeyAlg.HUKS_ALG_AES
    };
    propertiesWithPin[1] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
        value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256
    };
    propertiesWithPin[2] = {
        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
    };
    propertiesWithPin[3] = {
        tag: huks.HuksTag.HUKS_TAG_PADDING,
        value: huks.HuksKeyPadding.HUKS_PADDING_NONE
    };
    propertiesWithPin[4] = {
        tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
        value: huks.HuksCipherMode.HUKS_MODE_CBC
    };
    propertiesWithPin[5] = {
        tag: huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE,
        value: huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_PIN
    };
    propertiesWithPin[6] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
        value: huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD
    };
    propertiesWithPin[7] = {
        tag: huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE,
        value: huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_CUSTOM
    };
    propertiesWithPin[8] = {
        tag: huks.HuksTag.HUKS_TAG_CHALLENGE_POS,
        value: 0
    };
    let aes256 = {
        properties: propertiesWithPin,
        inData: inData
    };
    return aes256;
}

function useFaceMulti(inData) {
    let propertiesWithPin = new Array();
    propertiesWithPin[0] = {
        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
        value: huks.HuksKeyAlg.HUKS_ALG_AES
    };
    propertiesWithPin[1] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
        value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256
    };
    propertiesWithPin[2] = {
        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
    };
    propertiesWithPin[3] = {
        tag: huks.HuksTag.HUKS_TAG_PADDING,
        value: huks.HuksKeyPadding.HUKS_PADDING_NONE
    };
    propertiesWithPin[4] = {
        tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
        value: huks.HuksCipherMode.HUKS_MODE_CBC
    };
    propertiesWithPin[5] = {
        tag: huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE,
        value: huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_FACE
    };
    propertiesWithPin[6] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
        value: huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL
    };
    propertiesWithPin[7] = {
        tag: huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE,
        value: huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_CUSTOM
    };
    propertiesWithPin[8] = {
        tag: huks.HuksTag.HUKS_TAG_CHALLENGE_POS,
        value: 0
    };
    let aes256 = {
        properties: propertiesWithPin,
        inData: inData
    };
    return aes256;
}

/*一次认证，多次授权*/
function useFingerMulti(inData) {
    var propertiesWithPin = new Array();
    propertiesWithPin[0] = {
        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
        value: huks.HuksKeyAlg.HUKS_ALG_AES
    };
    propertiesWithPin[1] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
        value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256
    };
    propertiesWithPin[2] = {
        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
    };
    propertiesWithPin[3] = {
        tag: huks.HuksTag.HUKS_TAG_PADDING,
        value: huks.HuksKeyPadding.HUKS_PADDING_NONE
    };
    propertiesWithPin[4] = {
        tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
        value: huks.HuksCipherMode.HUKS_MODE_CBC
    };
    propertiesWithPin[5] = {
        tag: huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE,
        value: huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_FINGERPRINT
    };
    propertiesWithPin[6] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
        value: huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL
    };
    propertiesWithPin[7] = {
        tag: huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE,
        value: huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_CUSTOM
    };
    propertiesWithPin[8] = {
        tag: huks.HuksTag.HUKS_TAG_CHALLENGE_POS,
        value: 0
    };
    var aes256 = {
        properties: propertiesWithPin,
        inData: inData
    }
    return aes256;
}

function usePinTime(inData) {
    let propertiesWithPin = new Array();
    propertiesWithPin[0] = {
        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
        value: huks.HuksKeyAlg.HUKS_ALG_AES
    };
    propertiesWithPin[1] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
        value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256
    };
    propertiesWithPin[2] = {
        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
    };
    propertiesWithPin[3] = {
        tag: huks.HuksTag.HUKS_TAG_PADDING,
        value: huks.HuksKeyPadding.HUKS_PADDING_NONE
    };
    propertiesWithPin[4] = {
        tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
        value: huks.HuksCipherMode.HUKS_MODE_CBC
    };
    propertiesWithPin[5] = {
        tag: huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE,
        value: huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_PIN
    };
    propertiesWithPin[6] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
        value: huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD
    };
    propertiesWithPin[7] = {
        tag: huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE,
        value: huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_NONE
    };
    propertiesWithPin[8] = {
        tag: huks.HuksTag.HUKS_TAG_AUTH_TIMEOUT,
        value: 10
    };
    let aes256 = {
        properties: propertiesWithPin,
        inData: inData
    };
    return aes256;
}

function useFaceTime(inData) {
    let propertiesWithPin = new Array();
    propertiesWithPin[0] = {
        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
        value: huks.HuksKeyAlg.HUKS_ALG_AES
    };
    propertiesWithPin[1] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
        value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256
    };
    propertiesWithPin[2] = {
        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
    };
    propertiesWithPin[3] = {
        tag: huks.HuksTag.HUKS_TAG_PADDING,
        value: huks.HuksKeyPadding.HUKS_PADDING_NONE
    };
    propertiesWithPin[4] = {
        tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
        value: huks.HuksCipherMode.HUKS_MODE_CBC
    };
    propertiesWithPin[5] = {
        tag: huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE,
        value: huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_FACE
    };
    propertiesWithPin[6] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
        value: huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL
    };
    propertiesWithPin[7] = {
        tag: huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE,
        value: huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_NONE
    };
    propertiesWithPin[8] = {
        tag: huks.HuksTag.HUKS_TAG_AUTH_TIMEOUT,
        value: 10
    };
    let aes256 = {
        properties: propertiesWithPin,
        inData: inData
    };
    return aes256;
}

function useFingerTime(inData) {
    var propertiesWithPin = new Array();
    propertiesWithPin[0] = {
        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
        value: huks.HuksKeyAlg.HUKS_ALG_AES
    };
    propertiesWithPin[1] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
        value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256
    };
    propertiesWithPin[2] = {
        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
    };
    propertiesWithPin[3] = {
        tag: huks.HuksTag.HUKS_TAG_PADDING,
        value: huks.HuksKeyPadding.HUKS_PADDING_NONE
    };
    propertiesWithPin[4] = {
        tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
        value: huks.HuksCipherMode.HUKS_MODE_CBC
    }
    propertiesWithPin[5] = {
        tag: huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE,
        value: huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_FINGERPRINT
    };
    propertiesWithPin[6] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
        value: huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL
    };
    propertiesWithPin[7] = {
        tag: huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE,
        value: huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_NONE
    };
    propertiesWithPin[8] = {
        tag: huks.HuksTag.HUKS_TAG_AUTH_TIMEOUT,
        value: 10
    };
    var aes256 = {
        properties: propertiesWithPin,
        inData: inData
    }
    return aes256;
}

export default function SecurityHuksFaceFingerNormalJsunit() {
    describe('SecurityHuksFaceFingerNormalJsunit', function () {

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_0100
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_0100.
         * @tc.desc Generate Key and verify with PIN,use pin.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_0100', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_0100';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_0100_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, usePinNormal(inData));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 1, 1, 0);
            await finishStep(data.handle, alias, 0);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_0200
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_0200.
         * @tc.desc Generate Key and verify with Face,use face.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_0200', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_0200';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_0200_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, useFaceNormal(inData));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 2, 3, 0);
            await finishStep(data.handle, alias, 0);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_0300
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_0300.
         * @tc.desc Generate Key and verify with Finger,use finger.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_0300', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_0300';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_0300_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, useFingerNormal(inData));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 4, 2, 0);
            await finishStep(data.handle, alias, 0);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_0400
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_0400.
         * @tc.desc Import Key and verify with PIN,use pin.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_0400', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_0400';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_0400_HMAC';
            let data = await generateAndInit('import', alias, usePinNormal(aes256Key));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 1, 1, 0);
            await finishStep(data.handle, alias, 0);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_0500
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_0500.
         * @tc.desc Import Key and verify with Face,use face.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_0500', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_0500';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_0500_HMAC';
            let data = await generateAndInit('import', alias, useFaceNormal(aes256Key));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 2, 3, 0);
            await finishStep(data.handle, alias, 0);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_0600
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_0600.
         * @tc.desc Import Key and verify with Finger,use finger.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_0600', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_0600';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_0600_HMAC';
            let data = await generateAndInit('import', alias, useFingerNormal(aes256Key));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 4, 2, 0);
            await finishStep(data.handle, alias, 0);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_0700
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_0700.
         * @tc.desc Generate Key with PIN,falsify while verifying.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_0700', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_0700';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_0700_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, usePinNormal(inData));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 1, 1, 0);
            uintXToBytes(1, 32, authToken, 76);

            await finishStep(data.handle, alias, huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_0900
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_0900.
         * @tc.desc Imput a wrong PIN and could not verify.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_0900', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_0900';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_0900_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, usePinNormal(inData));
            let importHmacOption = makeHmacKeyOption(true, aes256Key);
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 1, 1, 0);
            uintXToBytes(1, 32, authToken, 114);
            await finishStep(data.handle, alias, huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_1000
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_1000.
         * @tc.desc Set a PIN and use fingerprint, could not verify.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_1000', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_1000';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_1000_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, usePinNormal(inData));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 4, 2, 0);
            await finishStep(data.handle, alias, huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_1100
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_1100.
         * @tc.desc Clear Password,bio fail.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_1100', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_1100';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_1100_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, usePinNormal(inData));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 0, 1, 1, 0);
            await finishStep(data.handle, alias, huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_1200
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_1200.
         * @tc.desc Add a fingerprint,cound not verify.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_1200', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_1200';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_1200_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, usePinNormal(inData));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 2, 1, 0);
            await finishStep(data.handle, alias, huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_1600
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_1600.
         * @tc.desc timestap based access control with pin,accessable in specified time.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_1600', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_1600';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_1600_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, usePinTime(inData));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            let curTime = await systemTime.getRealTime(false);
            await generateAuthToken(aliasHMAC, importHmacOption, curTime, 1, 1, 1, curTime + 10);
            await finishStep(data.handle, alias, 0);
            done();
        });
        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_1700
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_1700.
         * @tc.desc timestap based access control with pin,unaccessable outside specified time.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_1700', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_1700';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_1700_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, usePinTime(inData));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            let curTime = await systemTime.getRealTime(false);
            await generateAuthToken(aliasHMAC, importHmacOption, curTime, 1, 1, 1, curTime + 12000);
            await finishStep(data.handle, alias, huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_2100
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_2100.
         * @tc.desc Generate Key and verify with PIN and face,use pin.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_2100', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_2100';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_2100_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, usePinAndFaceNormal(inData));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 1, 1, 0);
            await finishStep(data.handle, alias, 0);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_2200
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_2200.
         * @tc.desc Generate Key and verify with PIN and finger,use pin.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_2200', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_2200';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_2200_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, usePinAndFingerNormal(inData));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 1, 1, 0);
            await finishStep(data.handle, alias, 0);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_2300
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_2300.
         * @tc.desc Generate Key and verify with face and finger,use face.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_2300', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_2300';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_2300_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, useFaceAndFingerNormal(inData));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 2, 3, 0);
            await finishStep(data.handle, alias, 0);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_2400
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_2400.
         * @tc.desc Generate Key and verify with pin,face and finger,use pin.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_2400', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_2400';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_2400_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, usePinFaceFingerNormal(inData));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 1, 1, 0);
            await finishStep(data.handle, alias, 0);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_2500
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_2500.
         * @tc.desc Import Key and verify with pin and face,use pin.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_2500', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_2500';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_2500_HMAC';
            let data = await generateAndInit('import', alias, usePinAndFaceNormal(aes256Key));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 1, 1, 0);
            await finishStep(data.handle, alias, 0);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_2600
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_2600.
         * @tc.desc Import Key and verify with pin and finger,use pin.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_2600', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_2600';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_2600_HMAC';
            let data = await generateAndInit('import', alias, usePinAndFingerNormal(aes256Key));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 1, 1, 0);
            await finishStep(data.handle, alias, 0);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_2700
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_2700.
         * @tc.desc Import Key and verify with face and finger,use face.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_2700', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_2700';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_2700_HMAC';
            let data = await generateAndInit('import', alias, useFaceAndFingerNormal(aes256Key));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 2, 3, 0);
            await finishStep(data.handle, alias, 0);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_2800
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_2800.
         * @tc.desc Import Key and verify with pin,face and finger,use finger.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_2800', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_2800';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_2800_HMAC';
            let data = await generateAndInit('import', alias, usePinFaceFingerNormal(aes256Key));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 4, 2, 0);
            await finishStep(data.handle, alias, 0);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_2900
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_2900.
         * @tc.desc HUKS_TAG_USER_AUTH_TYPE invalid and generate.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_2900', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_2900';
            let inData = new Uint8Array(new Array());
            let option = usePinNormal(inData);
            let err = {
                tag: huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE,
                value: -1
            };
            option.properties.splice(5, 1, err);
            await huks.generateKey(alias, option).then(async (data) => {
                logger.error(`generateKey success ${JSON.stringify(data)}`);
                expect(data.errorCode != 0).assertTrue();
            }).catch((err) => {
                logger.error(`generateKey err: " + ${JSON.stringify(err)}`);
                expect(null).assertFail();
            });
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_3000
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_3000.
         * @tc.desc HUKS_TAG_KEY_AUTH_ACCESS_TYPE invalid and generate.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_3000', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_3000';
            let inData = new Uint8Array(new Array());
            let option = usePinNormal(inData);
            let err = {
                tag: huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
                value: -1
            };
            option.properties.splice(6, 1, err);
            await huks.generateKey(alias, option).then(async (data) => {
                logger.error(`generateKey success ${JSON.stringify(data)}`);
                expect(data.errorCode == 0).assertTrue();
            }).catch((err) => {
                logger.error(`generateKey err: " + ${JSON.stringify(err)}`);
                expect(null).assertFail();
            });
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_3100
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_3100.
         * @tc.desc HUKS_TAG_CHALLENGE_TYPE invalid and generate.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_3100', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_3100';
            let inData = new Uint8Array(new Array());
            let option = usePinNormal(inData);
            let err = {
                tag: huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE,
                value: -1
            };
            option.properties.splice(7, 1, err);
            await huks.generateKey(alias, option).then(async (data) => {
                logger.error(`generateKey success ${JSON.stringify(data)}`);
                expect(data.errorCode != 0).assertTrue();
            }).catch((err) => {
                logger.error(`generateKey err: " + ${JSON.stringify(err)}`);
                expect(null).assertFail();
            });
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_3200
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_3200.
         * @tc.desc HUKS_TAG_CHALLENGE_POS invalid and generate.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_3200', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_3200';
            let inData = new Uint8Array(new Array());
            let option = usePinNormal(inData);
            let err = {
                tag: huks.HuksTag.HUKS_TAG_CHALLENGE_POS,
                value: -1
            };
            option.properties.splice(8, 1, err);
            await huks.generateKey(alias, option).then(async (data) => {
                logger.error(`generateKey success ${JSON.stringify(data)}`);
                expect(data.errorCode == 0).assertTrue();
            }).catch((err) => {
                logger.error(`generateKey err: " + ${JSON.stringify(err)}`);
                expect(null).assertFail();
            });
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_3300
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_3300.
         * @tc.desc HUKS_TAG_AUTH_TIMEOUT invalid and generate.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_3300', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_3300';
            let inData = new Uint8Array(new Array());
            let option = usePinTime(inData);
            let err = {
                tag: huks.HuksTag.HUKS_TAG_AUTH_TIMEOUT,
                value: -1
            };
            option.properties.splice(8, 1, err);
            await huks.generateKey(alias, option).then(async (data) => {
                logger.error(`generateKey success ${JSON.stringify(data)}`);
                expect(data.errorCode != 0).assertTrue();
            }).catch((err) => {
                logger.error(`generateKey err: " + ${JSON.stringify(err)}`);
                expect(null).assertFail();
            });
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_3400
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_3400.
         * @tc.desc input wrong face and unaccessable.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_3400', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_3400';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_3400_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, useFaceNormal(inData));
            let importHmacOption = makeHmacKeyOption(true, aes256Key);
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 2, 3, 0);
            await finishStep(data.handle, alias, huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_3500
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_3500.
         * @tc.desc input wrong finger and unaccessable.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_3500', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_3500';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_3500_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, useFingerNormal(inData));
            let importHmacOption = makeHmacKeyOption(true, aes256Key);
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 4, 2, 0);
            await finishStep(data.handle, alias, huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_3600
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_3600.
         * @tc.desc input key with pin,falsify while verifying.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_3600', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_3600';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_3600_HMAC';
            let data = await generateAndInit('import', alias, useFingerNormal(aes256Key));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 4, 2, 0);
            uintXToBytes(1, 32, authToken, 76);
            await finishStep(data.handle, alias, huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED);
            done();

        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_4000
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_4000.
         * @tc.desc generate with pin,use face.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_4000', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_4000';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_4000_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, usePinNormal(inData));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 2, 3, 0);
            await finishStep(data.handle, alias, huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_4100
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_4100.
         * @tc.desc generate with face,use pin.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_4100', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_4100';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_4100_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, useFaceNormal(inData));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 1, 1, 0);
            await finishStep(data.handle, alias, huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_4200
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_4200.
         * @tc.desc generate with face,use finger.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_4200', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_4200';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_4200_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, useFaceNormal(inData));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 4, 2, 0);
            await finishStep(data.handle, alias, huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_4300
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_4300.
         * @tc.desc generate with finger,use pin.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_4300', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_4300';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_4300_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, useFingerNormal(inData));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 1, 1, 0);
            await finishStep(data.handle, alias, huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_4400
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_4400.
         * @tc.desc generate with finger,use face.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_4400', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_4400';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_4400_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, useFingerNormal(inData));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 2, 3, 0);
            await finishStep(data.handle, alias, huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_4500
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_4500.
         * @tc.desc generate with face and finger,use pin.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_4500', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_4500';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_4500_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, useFaceAndFingerNormal(inData));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 1, 1, 0);
            await finishStep(data.handle, alias, huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_4600
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_4600.
         * @tc.desc generate with face and finger,use finger
         */
        it('Security_HUKS_Cipher_API8_AuthToken_4600', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_4600';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_4600_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, useFaceAndFingerNormal(inData));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 4, 2, 0);
            await finishStep(data.handle, alias, 0);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_4700
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_4700.
         * @tc.desc generate with pin and face,use finger.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_4700', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_4700';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_4700_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, usePinAndFaceNormal(inData));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 4, 2, 0);
            await finishStep(data.handle, alias, huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_4800
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_4800.
         * @tc.desc generate with pin and face,use face.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_4800', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_4800';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_4800_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, usePinAndFaceNormal(inData));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 2, 3, 0);
            await finishStep(data.handle, alias, 0);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_4900
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_4900.
         * @tc.desc generate with pin and finger,use finger.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_4900', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_4900';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_4900_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, usePinAndFingerNormal(inData));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 4, 2, 0);
            await finishStep(data.handle, alias, 0);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_5000
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_5000.
         * @tc.desc generate with pin and finger,use face.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_5000', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_5000';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_5000_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, usePinAndFingerNormal(inData));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 2, 3, 0);
            await finishStep(data.handle, alias, huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_5100
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_5100.
         * @tc.desc generate with pin face and finger,use finger.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_5100', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_5100';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_5100_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, usePinFaceFingerNormal(inData));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 4, 2, 0);
            await finishStep(data.handle, alias, 0);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_5200
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_5200.
         * @tc.desc generate with pin face and finger,use face.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_5200', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_5200';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_5200_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, usePinFaceFingerNormal(inData));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 2, 3, 0);
            await finishStep(data.handle, alias, 0);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_5300
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_5300.
         * @tc.desc add face ,could not verify.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_5300', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_5300';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_5300_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, usePinNormal(inData));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            await generateAuthToken(aliasHMAC, importHmacOption, data.token, 1, 4, 1, 0);
            await finishStep(data.handle, alias, huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_5400
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_5400.
         * @tc.desc timebased access,time before generate.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_5400', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_5400';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_5400_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, usePinTime(inData));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            let curTime = await systemTime.getRealTime(false).then(data => {
                return data;
            });
            await generateAuthToken(aliasHMAC, importHmacOption, curTime, 1, 1, 1, curTime - 100000);
            await finishStep(data.handle, alias, huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_5500
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_5500.
         * @tc.desc use pin access type is HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_5500', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_5500';
            let inData = new Uint8Array(new Array());
            let option = usePinNormal(inData);
            let err = {
                tag: huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
                value: huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL
            };
            option.properties.splice(6, 1, err);
            await huks.generateKey(alias, option).then(async (data) => {
                logger.error(`generateKey success ${JSON.stringify(data)}`);
                expect(data.errorCode == -3).assertTrue();
            }).catch((err) => {
                logger.error(`generateKey err: " + ${JSON.stringify(err)}`);
                expect(null).assertFail();
            });
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_5600
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_5600.
         * @tc.desc use finger access type is HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_5600', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_5600';
            let inData = new Uint8Array(new Array());
            let option = useFaceNormal(inData);
            let err = {
                tag: huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
                value: huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD
            };
            option.properties.splice(6, 1, err);
            await huks.generateKey(alias, option).then(async (data) => {
                logger.error(`generateKey success ${JSON.stringify(data)}`);
                expect(data.errorCode == 0).assertTrue();
            }).catch((err) => {
                logger.error(`generateKey err: " + ${JSON.stringify(err)}`);
                expect(null).assertFail();
            });
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_5700
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_5700.
         * @tc.desc time based access finger,accessable in specified time.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_5700', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_5700';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_5700_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, useFingerTime(inData));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            let curTime = await systemTime.getRealTime(false);
            await generateAuthToken(aliasHMAC, importHmacOption, curTime, 1, 4, 2, curTime + 10);
            await finishStep(data.handle, alias, 0);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_5800
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_5800.
         * @tc.desc time based access face,accessable in specified time.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_5800', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_5800';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_5800_HMAC';
            let inData = new Uint8Array(new Array());
            let data = await generateAndInit('generate', alias, useFaceTime(inData));
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            let curTime = await systemTime.getRealTime(false);
            await generateAuthToken(aliasHMAC, importHmacOption, curTime, 1, 2, 3, curTime + 10);
            await finishStep(data.handle, alias, 0);
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_1300
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_1300.
         * @tc.desc verify once and multi authorize with PIN.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_1300', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_1300';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_1300_HMAC';
            let inData = new Uint8Array(new Array());
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            multiIdentify(aliasHMAC, importHmacOption, alias, usePinMulti(inData), 'pin');
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_1400
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_1400.
         * @tc.desc verify once and multi authorize with finger.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_1400', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_1400';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_1400_HMAC';
            let inData = new Uint8Array(new Array());
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            multiIdentify(aliasHMAC, importHmacOption, alias, useFingerMulti(inData), 'finger');
            done();
        });

        /**
         * @tc.number Security_HUKS_Cipher_API8_AuthToken_1500
         * @tc.name Security_HUKS_Cipher_API8_AuthToken_1500.
         * @tc.desc verify once and multi authorize with face.
         */
        it('Security_HUKS_Cipher_API8_AuthToken_1500', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let alias = 'Security_HUKS_Cipher_API8_AuthToken_1500';
            let aliasHMAC = 'Security_HUKS_Cipher_API8_AuthToken_1500_HMAC';
            let inData = new Uint8Array(new Array());
            let importHmacOption = makeHmacKeyOption(true, stringToUint8Array(hks_default_auth_token_key));
            multiIdentify(aliasHMAC, importHmacOption, alias, useFaceMulti(inData), 'face');
            done();
        });
    });
}
