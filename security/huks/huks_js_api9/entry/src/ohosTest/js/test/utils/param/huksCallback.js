/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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