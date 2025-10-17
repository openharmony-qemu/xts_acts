import huks from '@ohos.security.huks';

export function isKeyItemExist(srcKeyAlias, HuksOptions) {
    return new Promise((resolve,reject) => {
        huks.isKeyItemExist(srcKeyAlias, HuksOptions, function (error, data) {
            if (error) {
                reject(error);
            } else {
                resolve(data);
            }
        });
    });
}

export function hasKeyItem(srcKeyAlias, HuksOptions) {
    return new Promise((resolve,reject) => {
        huks.hasKeyItemExist(srcKeyAlias, HuksOptions, function (error, data) {
            if (error) {
                reject(error);
            } else {
                resolve(data);
            }
        });
    });
}

export async function generateKeyItem(srcKeyAlias, HuksOptions) {
    return new Promise((resolve,reject) => {
        huks.generateKeyItem(srcKeyAlias, HuksOptions, function (error, data) {
            if (error) {
                reject(error);
            } else {
                resolve(data);
            }
        });
    });
}

export async function deleteKeyItem(srcKeyAlias, HuksOptions) {
    return new Promise((resolve,reject) => {
        huks.deleteKeyItem(srcKeyAlias,HuksOptions, function (error, data) {
            if (error) {
                reject(error);
            } else {
                resolve(data);
            }
        });
    });
}